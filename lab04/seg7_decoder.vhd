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

begin
	process(Bin_in)
		begin
		case Bin_in is
			when "0000" =>
				Seg7_out <= zero_seg;			
			when "0001" =>
				Seg7_out <= one_seg;
			when "0010" =>
				Seg7_out <= two_seg;
			when "0011" =>
				Seg7_out <= three_seg;
			when "0100" =>
				Seg7_out <= four_seg;
			when "0101" =>
				Seg7_out <= five_seg;		
			when "0110" =>
				Seg7_out <= six_seg;	
			when "0111" =>
				Seg7_out <= seven_seg;	
			when "1000" =>
				Seg7_out <= eight_seg;	
			when "1001" =>
				Seg7_out <= nine_seg;	
			when others =>
				Seg7_out <= off_seg;
		end case;
		
	end process;
	
end seg7_arch;

