--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:17:50 11/29/2010
-- Design Name:   
-- Module Name:   C:/Documents and Settings/lab01/tb_mux2.vhd
-- Project Name:  lab01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux2
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
 
ENTITY tb_mux2 IS
END tb_mux2;
 
ARCHITECTURE behavior OF tb_mux2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux2
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         sel : IN  std_logic;
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal sel : std_logic := '0';

 	--Outputs
   signal c : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux2 PORT MAP (
          a => a,
          b => b,
          sel => sel,
          c => c
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		a <= '0';
		b <= '0';
		sel <= '0';
		wait for 150 ns;	
		
		a <= '0';
		b <= '1';
		sel <= '0';
		wait for 200 ns;	
		
		a <= '1';
		b <= '0';
		sel <= '0';
		wait for 250 ns;	
		
		a <= '1';
		b <= '1';
		sel <= '0';
		wait for 300 ns;	
		
		
		
      wait;
   end process;

END;
