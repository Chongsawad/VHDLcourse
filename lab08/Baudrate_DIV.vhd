-- -----------------------------------
--     Baudrate divider
-- File name: baudrate_div.vhd
-- -----------------------------------
-- designer : Janwit Sriharuksa
-- Date     : 9th/May/2002
-- -----------------------------------
--
library ieee;
use ieee.std_logic_1164.all;
Entity Baudrate_div is
	generic(Bconst :natural:= 5208 );  -- Bconst =   osc frequency/Baurdate
	port(clk 		:in std_logic;
	     rst 		:in std_logic;
		 Baud_Div   :out std_logic);
end;
architecture RTL of Baudrate_div is
	signal Bdr_cnt : integer range 0 to Bconst;
begin	
process(rst,clk)	
begin
	if rst = '1' then
		Bdr_cnt <= 0;
		Baud_Div <= '0';		
	elsif rising_edge(clk) then
		if Bdr_cnt = Bconst then
			Bdr_cnt <= 0;
			Baud_Div <= '1';
		else
			Bdr_cnt <= Bdr_cnt + 1;
			Baud_DIv <= '0';
		end if;
	end if;	
end process;
end;
