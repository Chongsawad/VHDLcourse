----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:44:55 11/30/2010 
-- Design Name: 
-- Module Name:    seg7_3digit - Behavioral 
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

entity seg7_3digit is
    Port ( bin_in : in  STD_LOGIC_VECTOR (3 downto 0);
           reg_inen : in  STD_LOGIC_VECTOR (2 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           seg7_out : out  STD_LOGIC_VECTOR (7 downto 0);
           digit_scan : out  STD_LOGIC_VECTOR (2 downto 0));
end seg7_3digit;

architecture Behavioral of seg7_3digit is
	signal scan_en	:	std_logic;
	signal delay_cnt	:	integer range 0 to 10000;
	signal digit_cnt	:	integer range 0 to 3;
	
	type REG_ARR is array(2 downto 0) of std_logic_vector(3 downto 0);
	signal din_reg	:	reg_arr;  
begin
	-- Scan Delay --
	process(clk, rst)
	begin
		if rst = '1' then
			delay_cnt <= 0;
			scan_en <= '0';
		elsif clk'event and clk = '1' then
			if delay_cnt = 10000 then
				delay_cnt <= 0;
				scan_en <= '1';
			else
				delay_cnt <= delay_cnt + 1;
				scan_en <= '0';
			end if;
		end if;
	end process;

	-- Digit Scan --
	process(clk, rst)
	begin
		if rst = '1' then
			digit_cnt <= 0;
			digit_scan <= "111";
		elsif clk'event and clk = '1' then
			if scan_en = '1' then
				if digit_cnt = 3 then
					digit_cnt <= 1;
				else
					digit_cnt <= digit_cnt + 1;
				end if;
				
				case digit_cnt is
					when 1 => digit_scan <= "110";
					when 2 => digit_scan <= "101";
					when 3 => digit_scan <= "100";
					when others => digit_scan <= "111";
				end case;
			end if;
		end if;
	end process;
	
	-- Din Reg --
	process(clk, rst)
	begin
		
	end process;
end Behavioral;

