--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:06:36 11/30/2010
-- Design Name:   
-- Module Name:   D:/VHDL/lab05/tb_seg7_scan_delay.vhd
-- Project Name:  lab05
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: seg7_3digit
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
 
ENTITY tb_seg7_scan_delay IS
END tb_seg7_scan_delay;
 
ARCHITECTURE behavior OF tb_seg7_scan_delay IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seg7_3digit
    PORT(
         bin_in : IN  std_logic_vector(3 downto 0);
         reg_inen : IN  std_logic_vector(2 downto 0);
         rst : IN  std_logic;
         clk : IN  std_logic;
         seg7_out : OUT  std_logic_vector(7 downto 0);
         digit_scan : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    
	signal scan_en	:	std_logic;
	signal delay_cnt	:	integer range 0 to 10000;
	signal digit_cnt	:	integer range 0 to 3;

   --Inputs
   signal bin_in : std_logic_vector(3 downto 0) := (others => '0');
   signal reg_inen : std_logic_vector(2 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal seg7_out : std_logic_vector(7 downto 0);
   signal digit_scan : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seg7_3digit PORT MAP (
          bin_in => bin_in,
          reg_inen => reg_inen,
          rst => rst,
          clk => clk,
          seg7_out => seg7_out,
          digit_scan => digit_scan
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
      -- insert stimulus here 
		
		rst <= '1';
		wait for clk_period;
		rst <= '0';

      wait;
   end process;
	
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

END;
