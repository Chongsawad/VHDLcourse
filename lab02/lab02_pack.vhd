--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package lab02_pack is

-- Declare constants

  constant zero_seg		:std_logic_vector( 7 downto 0 ) := "11111110" ;
  constant one_seg		:std_logic_vector( 7 downto 0 ) := "01100000" ;
  constant two_seg		:std_logic_vector( 7 downto 0 ) := "11011010" ;
  constant three_seg		:std_logic_vector( 7 downto 0 ) := "11110010" ;
  constant four_seg		:std_logic_vector( 7 downto 0 ) := "01100110" ;
  constant five_seg		:std_logic_vector( 7 downto 0 ) := "10110110" ;
  constant six_seg		:std_logic_vector( 7 downto 0 ) := "10111110" ;
  constant seven_seg		:std_logic_vector( 7 downto 0 ) := "11100000" ;
  constant eight_seg		:std_logic_vector( 7 downto 0 ) := "11111110" ;
  constant nine_seg		:std_logic_vector( 7 downto 0 ) := "11110110" ;
  constant off_seg		:std_logic_vector( 7 downto 0 ) := "00000000" ;
  
end lab02_pack;
