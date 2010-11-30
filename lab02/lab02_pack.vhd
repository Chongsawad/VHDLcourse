--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package lab02_pack is

-- Declare constants

  constant zero_seg		:std_logic_vector( 7 downto 0 ) := "00000011" ;
  constant one_seg		:std_logic_vector( 7 downto 0 ) := "10011111" ;
  constant two_seg		:std_logic_vector( 7 downto 0 ) := "00100101" ;
  constant three_seg		:std_logic_vector( 7 downto 0 ) := "00001101" ;
  constant four_seg		:std_logic_vector( 7 downto 0 ) := "10011001" ;
  constant five_seg		:std_logic_vector( 7 downto 0 ) := "01001001" ;
  constant six_seg		:std_logic_vector( 7 downto 0 ) := "01000001" ;
  constant seven_seg		:std_logic_vector( 7 downto 0 ) := "00011111" ;
  constant eight_seg		:std_logic_vector( 7 downto 0 ) := "00000001" ;
  constant nine_seg		:std_logic_vector( 7 downto 0 ) := "00001001" ;
  constant off_seg		:std_logic_vector( 7 downto 0 ) := "11111110" ;
  
end lab02_pack;
