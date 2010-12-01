-- ----------------------------------
--  UART Transmitter 
-- File name: transmitter.vhd 
-- ---------------------------------
-- designer : Janwit Sriharuksa
-- Date     : 9th/May/2003
-- ---------------------------------

library ieee;
use ieee.std_logic_1164.all;
Entity Transmitter is
	port(clk		: in std_logic;		 -- system clock
		 rst  	: in std_logic;			 -- active 'low' reset
		 Baud_Div 	: in std_logic;      -- Baudrate control signal
		 WE_n   	: in std_logic;		 -- active 'low' write enable
		 Data_in	: in std_logic_vector(7 downto 0); -- 8 bit input data
		 TxD    	: out std_logic;				   -- Transmit serial data
		 Int_Tx 	: out std_logic);				   -- Transmit interrupt 
end;

architecture RTL of Transmitter is
	type TxState_type is (Idle_st, load_st, shift_st, intrpt_st,db_st);
	signal Tx_state : TxState_type;
	signal Tx_reg :std_logic_vector(9 downto 0);
	constant start_bit :std_logic := '0';
	constant stop_bit :std_logic := '1';
	signal TxBit_cnt :integer range 0 to 10;
begin
process(clk,rst)	
	variable db_cnt :integer range 0 to 1000000;
begin
	if rst = '1' then
		TxD 	<= '1';
		Tx_reg  <= (others => '0');
		TxBit_cnt <= 0;
		int_Tx  <= '0';
		Tx_state<= Idle_st;				
	elsif rising_edge(clk) then
		case Tx_state is
			when idle_st   => 	-- idle state
				TxD <= '1';
				Int_Tx <= '0';
				if WE_n = '1' then
					Tx_state <= db_st;
					db_cnt := 0;
				end if;
			----debuncing
			when db_st =>
			    TxD <= '1';
				if db_cnt = 1000000 and WE_n = '1' then
					Tx_state <= load_st;
					db_cnt := 0;
				else
					Tx_state <= db_st;
					db_cnt := db_cnt + 1;
				end if;	
				
			when load_st   =>   -- load data from data_in to Tx_reg when WE_n is activate
				Tx_reg	 <= stop_bit & Data_in & start_bit;
				if WE_n = '0' then
					Tx_state <= shift_st;
				end if;
				TxBit_cnt <= 0;
			when shift_st  =>			-- shift data from Tx_reg to TxD
				if Baud_Div = '1' then
					-- shift register 
					TxD <= Tx_reg(0);					
					for i in 0 to 8 loop
						Tx_reg(i) <= Tx_reg(i+1);
					end loop;
					-- bit counter
					  
					if TxBit_cnt = 10 then 
						Tx_state <= intrpt_st;
					else
						TxBit_cnt <= TxBit_cnt + 1;
					end if;					
				end if;				
			when intrpt_st =>	-- active intrrupt signal(int_Tx)
				Int_Tx <= '1' ;
 				if WE_n = '0' then
					Tx_state <= idle_st;	 -- back idle state				
				end if;
			when others  => 
				Tx_state <= idle_st;
		end case; 	
	end if;	
end process;

end;