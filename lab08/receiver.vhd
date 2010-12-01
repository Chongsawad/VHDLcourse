-- -----------------------------------
--   UART receiver
-- File name: receiver.vhd
-- -----------------------------------
-- designer : Janwit Sriharuksa
-- Date     : 9th/May/2003
-- -----------------------------------
-- 
library ieee;
use ieee.std_logic_1164.all;
Entity receiver is
	generic(Bconst :natural;
	        Bconst_div2 : natural );
	port(clk   : in std_logic;
	     rst   : in std_logic;
		 RxD   : in std_logic;
		 Baud_Div 	: in std_logic;     -- Baudrate control signal
		 Data_out   : out std_logic_vector(7 downto 0);
		 int_Rx     : out std_logic	);
end;
architecture RTL of receiver is
type Rxstate_type is (idle_st,sampling_st,cnt_st);
signal Rx_state : Rxstate_type;
signal bit_cnt :integer range  0 to 9;
signal samp_cnt :integer range 0 to Bconst;
signal samp_en :std_logic;
signal detect_reg :std_logic_vector(3 downto 0);
signal zero_detect :Boolean;
signal Rx_reg :std_logic_vector(9 downto 0);
	
begin
--============ high to low trainsition detector ============
process(rst,clk)	
begin
	if rst = '1' then
		detect_reg <= (others => '0');
	elsif rising_edge(clk) then
		for i in 0 to 2 loop
			detect_reg(i) <= detect_reg(i+1);
		end loop;		
		detect_reg(3) <= RxD;
		
		if detect_reg = "0011" then
			zero_detect <= true;
		else
			zero_detect <= false;
		end if;
	end if;	
end process;

-- Rx shift register 
process(rst,clk)	
begin
	if rst = '1' then
		Rx_reg <= (others => '0');
	elsif rising_edge(clk) then
		if samp_en = '1' then
			for i in 0 to 8 loop
				Rx_reg(i) <=  Rx_reg(i + 1);
			end loop;
			Rx_reg(9) <= RxD;
		end if;
	end if;	
end process;
Data_out <= Rx_reg(8 downto 1);

process (rst,clk)	
begin
	if rst = '1' then
		samp_cnt <= 0;
		samp_en  <= '0';
		bit_cnt  <= 0;
		int_Rx   <= '0';
		Rx_state <= idle_st;
	elsif rising_edge(clk) then
		case Rx_state is
			when  idle_st => 
				samp_en <= '0';
				bit_cnt <= 0;
				int_Rx  <= '0';
				if zero_detect = true then
					samp_cnt <= 0;
					Rx_state <= sampling_st;
				end if;				
			when  sampling_st =>
				if samp_cnt = Bconst then
					samp_cnt <= 0 ;
					Rx_state <= cnt_st;										
				else
					samp_cnt <= samp_cnt + 1;
				end if;				
				
				if samp_cnt = Bconst_Div2 then
					samp_en <= '1';
				else
					samp_en <= '0';
				end if;
			when  cnt_st =>
				samp_en <= '0';
				if bit_cnt = 9 then
					Rx_state <= idle_st;
					if Rx_reg(0) = '0' and Rx_reg(9) = '1' then	  -- check start and stop bit
						int_Rx <= '1';
					else
						int_Rx <= '0';
					end if;
				else
					bit_cnt <= bit_cnt + 1;
					Rx_state <= sampling_st;
				end if;			
			when others  => Rx_state <= idle_st ;
		end case;
		
	end if;	
end process;

end;