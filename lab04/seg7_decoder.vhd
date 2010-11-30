----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:08:26 11/29/2010 
-- Design Name: 
-- Module Name:    seg7_decoder - Behavioral 
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

entity seg7_decoder is
    Port ( Bin_in : in  STD_LOGIC_VECTOR ( 3 downto 0);
           Seg7_out : out  STD_LOGIC_VECTOR ( 7 downto 0);
			  in_en : in STD_LOGIC;
			  rst : in STD_LOGIC;
			  clk : in STD_LOGIC
			  );
end seg7_decoder;

architecture seg7_arch of seg7_decoder is
	signal seg7_tmp	: std_logic_vector (7 downto 0);
	signal reg_d	: std_logic_vector (3 downto 0);
begin

-- Register
	process(clk, rst)
	begin
	
		if rst = '1' then
			reg_d <= "0000";
		elsif clk'event and clk = '1' then
			if in_en = '1' then
				reg_d <= bin_in;
			end if;
		end if;
		
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
	
end seg7_arch;

