--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:18:37 11/29/2010
-- Design Name:   
-- Module Name:   C:/Documents and Settings/lab02/tb_lab02.vhd
-- Project Name:  lab02
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: seg7_decoder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_lab02 IS
END tb_lab02;
 
ARCHITECTURE behavior OF tb_lab02 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seg7_decoder
    PORT(
         Bin_in : IN  std_logic_vector(3 downto 0);
         Seg7_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Bin_in : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Seg7_out : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seg7_decoder PORT MAP (
          Bin_in => Bin_in,
          Seg7_out => Seg7_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
		Bin_in <= "0000";
				wait for 50 ns; 
		Bin_in <= "0001";
				wait for 50 ns; 
		Bin_in <= "0010";
				wait for 50 ns; 
		Bin_in <= "0011";
				wait for 50 ns; 
		Bin_in <= "0100";
				wait for 50 ns; 
		Bin_in <= "0101";
				wait for 50 ns; 
		Bin_in <= "0110";
				wait for 50 ns; 
		Bin_in <= "0111";
				wait for 50 ns; 
		Bin_in <= "1000";
				wait for 50 ns; 
		Bin_in <= "1001";
				wait for 50 ns;
		wait;
   end process;

END;
