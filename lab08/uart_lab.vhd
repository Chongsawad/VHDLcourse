----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:40:38 12/01/2010 
-- Design Name: 
-- Module Name:    uart_lab - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart_lab is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           we_n : in  STD_LOGIC;
           RxD : in  STD_LOGIC;
           int_Tx : out  STD_LOGIC;
           TxD : out  STD_LOGIC;
           digit_scan : out  STD_LOGIC_VECTOR (3 downto 0);
           seg7_out : out  STD_LOGIC_VECTOR (7 downto 0);
           int_Rx : out  STD_LOGIC);
end uart_lab;

architecture Behavioral of uart_lab is

	component Baudrate_div
		generic(Bconst :natural:= 5208 );  -- Bconst =   osc frequency/Baurdate
		port(	clk 		:in std_logic;
				rst 		:in std_logic;
				Baud_Div   :out std_logic);
	end component;
	
	component Transmitter
		port(	clk		: in std_logic;		 -- system clock
				rst  	: in std_logic;			 -- active 'low' reset
				Baud_Div 	: in std_logic;      -- Baudrate control signal
				WE_n   	: in std_logic;		 -- active 'low' write enable
				Data_in	: in std_logic_vector(7 downto 0); -- 8 bit input data
				TxD    	: out std_logic;				   -- Transmit serial data
				Int_Tx 	: out std_logic);				   -- Transmit interrupt 
	end component;
	
	component receiver
		generic(	Bconst : natural := 5208;
					Bconst_div2 : natural := 5208/2 );
		port(	clk   : in std_logic;
				rst   : in std_logic;
				RxD   : in std_logic;
				Baud_Div 	: in std_logic;     -- Baudrate control signal
				Data_out   : out std_logic_vector(7 downto 0);
				int_Rx     : out std_logic	);
	end component;
	
	component seg7_2digit
		port(	clk :in std_logic;
				rst :in std_logic;
				Din :in std_logic_vector(7 downto 0);
				digit_scan :out std_logic_vector(3 downto 0);
				seg7_out :out std_logic_vector(7 downto 0));
	end component;
	
	signal sig_baud_div	:	std_logic;
	signal sig_data_out	:	std_logic_vector(7 downto 0);
	
begin

	u1	:	Baudrate_div port map(	clk => clk,
											rst => rst,
											Baud_div => sig_baud_div
											);
											
	u2	:	Transmitter port map(	Data_in => data_in,
											Baud_div => sig_baud_div,
											clk => clk,
											rst => rst,
											we_n => we_n,
											int_tx => int_tx,
											TxD => TxD
											);

	u3	:	receiver port map(	Baud_div => sig_baud_div,
										clk => clk,
										rst => rst,
										RxD => RxD,
										data_out => sig_data_out,
										int_Rx => int_Rx
										);
										
	u4	:	seg7_2digit port map(	din => sig_data_out,
											clk => clk,
											rst => rst,
											digit_scan => digit_scan,
											seg7_out => seg7_out
											);
end Behavioral;

