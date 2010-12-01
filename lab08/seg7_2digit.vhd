------------------------------------------------------------
-- File Name:  seg7_2digit.vhd
-- Create Date:    10:00:10 04/03/06
-- Design Name:    
-- Module Name:    seg7_4digit - Behavioral
-- Project Name:   
-- Target Device:  
-- Tool versions:  
-- Description:
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
---------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seg7_2digit is
	port( clk :in std_logic;
		  rst :in std_logic;
		  Din :in std_logic_vector(7 downto 0);
		  digit_scan :out std_logic_vector(3 downto 0);
		  seg7_out :out std_logic_vector(7 downto 0)
		);
end seg7_2digit;

Architecture   rtl  of seg7_2digit is

  constant zero_seg		: std_logic_vector(7 downto 0) := "11111100";-- a b c d e f g
  constant one_seg		: std_logic_vector(7 downto 0) := "01100000";
  constant two_seg		: std_logic_vector(7 downto 0) := "11011010";
  constant three_seg	: std_logic_vector(7 downto 0) := "11110010";
  constant four_seg		: std_logic_vector(7 downto 0) := "01100110";
  constant five_seg		: std_logic_vector(7 downto 0) := "10110110";
  constant six_seg		: std_logic_vector(7 downto 0) := "10111110";
  constant seven_seg	: std_logic_vector(7 downto 0) := "11100000";
  constant eight_seg	: std_logic_vector(7 downto 0) := "11111110";
  constant nine_seg		: std_logic_vector(7 downto 0) := "11110110";
  
  constant A_seg		: std_logic_vector(7 downto 0) := "11101110";
  constant B_seg		: std_logic_vector(7 downto 0) := "00111110";
  constant C_seg		: std_logic_vector(7 downto 0) := "10011100";
  constant D_seg		: std_logic_vector(7 downto 0) := "01111010";
  constant E_seg		: std_logic_vector(7 downto 0) := "10011110";
  constant F_seg		: std_logic_vector(7 downto 0) := "10001110";
  
  
  
  
  
  constant off_seg		: std_logic_vector(7 downto 0) := "00000000";
  
  



	signal scan_en :std_logic;	
	signal delay_cnt :integer range 0 to 10000;
	signal digit_cnt :integer range 0 to 3;
	
	type Din_type is array(0 to 2) of std_logic_vector(3 downto 0);
	signal Din_reg :Din_type;
	
	signal digit_scan_tmp :std_logic_vector(3 downto 0);
	signal reg_mux:std_logic_vector(3 downto 0);
	signal seg7_tmp :std_logic_vector(7 downto 0);

begin
	
------------- SCAN DELAY ---------------	
	process(rst,clk)		
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
------------ digit scan -----------------
	process(rst,clk)		
	begin
		if rst = '1' then
		   digit_cnt <= 0;
		   digit_scan_tmp <= "1111";	
		elsif clk'event and clk = '1' then
			if scan_en = '1' then 
			   ---- digit cnt ---------
				if digit_cnt = 3 then
					digit_cnt <= 1;
				else
					digit_cnt <= digit_cnt + 1;
				end if;
			   ---- digit scan --------	
			   	case digit_cnt is
			   		when 1 => digit_scan_tmp <= "1110";
			   		when 2 => digit_scan_tmp <= "1101";
		   			when 3 => digit_scan_tmp <= "1111";								
		   			when others  => digit_scan_tmp <= "1111";
			   	end case;  							
			end if;
		end if;		
	end process;
   ---- assigne digit_scan_tmp to digit_scan port
   digit_scan <= digit_scan_tmp;	
	
   ----------- Din register ------------------
	 	Din_reg(0) <= Din(3 downto 0);
		Din_reg(1) <= Din(7 downto 4);

   
   ----------- multiplexer ---------------
   process (Din_reg,digit_scan_tmp)   	
   begin
   		case digit_scan_tmp is
   			when "1110" => reg_mux <= Din_reg(0);
			when "1101" => reg_mux <= Din_reg(1);
			when "1011" => reg_mux <= Din_reg(2); 			
   			when others  =>reg_mux <= "0000";
   		end case; 	
   end process;

   ---------- 7 segment decoder -------------
	process(reg_mux)
	begin
		case reg_mux is
			when "0000" => seg7_tmp <= zero_seg;				
			when "0001" => seg7_tmp <= one_seg;				
			when "0010" => seg7_tmp <= two_seg;				
			when "0011" => seg7_tmp <= three_seg;				
			when "0100" => seg7_tmp <= four_seg;				
			when "0101" => seg7_tmp <= five_seg;				
			when "0110" => seg7_tmp <= six_seg;				
			when "0111" => seg7_tmp <= seven_seg;				
			when "1000" => seg7_tmp <= eight_seg;				
			when "1001" => seg7_tmp <= nine_seg;
			
			when "1010" => seg7_tmp	<=   A_seg	;
			when "1011" => seg7_tmp	<=   B_seg ;	
			when "1100" => seg7_tmp	<=   C_seg ;	
			when "1101" => seg7_tmp	<=   D_seg ;	
			when "1110" => seg7_tmp	<=   E_seg ;	
			when "1111" => seg7_tmp	<=   F_seg ;
			
 			when others => seg7_tmp <= off_seg;			
		end case;
	end process;
   seg7_out <= not  seg7_tmp;
	    
end ;