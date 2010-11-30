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
use work.lab02_pack.ALL;

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
           digit_scan : out  STD_LOGIC_VECTOR (3 downto 0));
end seg7_3digit;

architecture Behavioral of seg7_3digit is
	signal scan_en	:	std_logic;
	signal delay_cnt	:	integer range 0 to 10000;
	signal digit_cnt	:	integer range 0 to 3;
	signal reg_d	: std_logic_vector (3 downto 0);
	signal seg7_tmp	: std_logic_vector (7 downto 0);
	
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
			digit_scan <= "1111";
		elsif clk'event and clk = '1' then
			if scan_en = '1' then
				if digit_cnt = 3 then
					digit_cnt <= 1;
				else
					digit_cnt <= digit_cnt + 1;
				end if;
				
				case digit_cnt is
					when 1 => digit_scan <= "1110";
					when 2 => digit_scan <= "1101";
					when 3 => digit_scan <= "1011";
					when others => digit_scan <= "1111";
				end case;
			end if;
		end if;
	end process;
	
	-- Din Reg --
	process(clk, rst)
	begin
		for i in 0 to 2 loop
			if rst = '1' then
				din_reg(i) <= "0000";
			elsif clk'event and clk = '1' then
				if reg_inen(i) = '1' then
					din_reg(i) <= bin_in;
				end if;
			end if;
		end loop;
	end process;
	
	-- Multiplexer --
	process(digit_cnt)
	begin
		case digit_cnt is
			when 1 =>
				reg_d <= din_reg(0);			
			when 2 =>
				reg_d <= din_reg(1);
			when 3 =>
				reg_d <= din_reg(2);
			when others =>
				reg_d <= "1111";
		end case;
	end process;
	
	-- 7 Segment decoder
	process(reg_d)
	begin
		case reg_d is
			when "0000" =>
				seg7_tmp <= zero_seg;			
			when "0001" =>
				seg7_tmp <= one_seg;
			when "0010" =>
				seg7_tmp <= two_seg;
			when "0011" =>
				seg7_tmp <= three_seg;
			when "0100" =>
				seg7_tmp <= four_seg;
			when "0101" =>
				seg7_tmp <= five_seg;		
			when "0110" =>
				seg7_tmp <= six_seg;	
			when "0111" =>
				seg7_tmp <= seven_seg;	
			when "1000" =>
				seg7_tmp <= eight_seg;	
			when "1001" =>
				seg7_tmp <= nine_seg;	
			when others =>
				seg7_tmp <= off_seg;
		end case;
	end process;
	
	seg7_out <= seg7_tmp;
	
end Behavioral;

