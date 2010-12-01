----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:29:03 12/01/2010 
-- Design Name: 
-- Module Name:    light_pattern - Behavioral 
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

entity light_pattern is
    Port ( sw1 : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           seg7_disp : out  STD_LOGIC_VECTOR (7 downto 0));
end light_pattern;

architecture Behavioral of light_pattern is
	type stateTYPE is (P1_1st, P1_2st, P1_3st, P1_4st, P1_5st, P1_6st,
								P2_1st, P2_2st, P2_3st, P2_4st, P2_5st, P2_6st,
								P3_1st, P3_2st, P3_3st, P3_4st, P3_5st, P3_6st, P3_7st, P3_8st);
	
	signal cur_state	:	stateTYPE;
	signal disp_en		:	STD_LOGIC;
	signal delay_cnt	:	integer range 0 to 5000000;
begin
	
	-- FSM proc --
	process(rst, clk)
	begin
		if rst = '1' then
			cur_state <= P1_1st;
		elsif clk'event and clk = '1' then
			case cur_state is
			---------------------------------- P1 FSM --------------------------------- {
				-- P1_1st
				when P1_1st =>
					-- Output --
					seg7_disp <= "01111111";
					-- State change --
					if sw1 = '1' then
						cur_state <= P2_1st;
					elsif disp_en = '1' then
						cur_state <= P1_2st;
					end if;
				
				-- P1_2st
				when P1_2st =>
					-- Output --
					seg7_disp <= "10111111";
					-- State change --
					if disp_en = '1' then
						cur_state <= P1_3st;
					end if;
					
				-- P1_3st
				when P1_3st =>
					-- Output --
					seg7_disp <= "11011111";
					-- State change --
					if disp_en = '1' then
						cur_state <= P1_4st;
					end if;
					
				-- P1_4st
				when P1_4st =>
					-- Output --
					seg7_disp <= "11101111";
					-- State change --
					if disp_en = '1' then
						cur_state <= P1_5st;
					end if;
					
				-- P1_5st
				when P1_5st =>
					-- Output --
					seg7_disp <= "11110111";
					-- State change --
					if disp_en = '1' then
						cur_state <= P1_6st;
					end if;
					
				-- P1_6st
				when P1_6st =>
					-- Output --
					seg7_disp <= "11111011";
					-- State change --
					if disp_en = '1' then
						cur_state <= P1_1st;
					end if;
			---------------------------------- P1 FSM --------------------------------- }
			
			---------------------------------- P2 FSM --------------------------------- {
				-- P2_1st
				when P2_1st =>
					-- Output --
					seg7_disp <= "01111111";
					-- State change --
					if sw1 = '1' then
						cur_state <= P3_1st;
					elsif disp_en = '1' then
						cur_state <= P2_2st;
					end if;
				
				-- P2_2st
				when P2_2st =>
					-- Output --
					seg7_disp <= "10111111";
					-- State change --
					if disp_en = '1' then
						cur_state <= P2_3st;
					end if;
					
				-- P2_3st
				when P2_3st =>
					-- Output --
					seg7_disp <= "11011111";
					-- State change --
					if disp_en = '1' then
						cur_state <= P2_4st;
					end if;
					
				-- P2_4st
				when P2_4st =>
					-- Output --
					seg7_disp <= "11101111";
					-- State change --
					if disp_en = '1' then
						cur_state <= P2_5st;
					end if;
					
				-- P2_5st
				when P2_5st =>
					-- Output --
					seg7_disp <= "11101111";
					-- State change --
					if disp_en = '1' then
						cur_state <= P2_6st;
					end if;
					
				-- P2_6st
				when P2_6st =>
					-- Output --
					seg7_disp <= "11011111";
					-- State change --
					if disp_en = '1' then
						cur_state <= P2_1st;
					end if;
			---------------------------------- P2 FSM --------------------------------- }
					
			---------------------------------- P3 FSM --------------------------------- {
				-- P3_1st
				when P3_1st =>
					-- Output --
					seg7_disp <= "01111111";
					-- State change --
					if sw1 = '1' then
						cur_state <= P1_1st;
					elsif disp_en = '1' then
						cur_state <= P3_2st;
					end if;
				
				-- P3_2st
				when P3_2st =>
					-- Output --
					seg7_disp <= "10111111";
					-- State change --
					if disp_en = '1' then
						cur_state <= P3_3st;
					end if;
					
				-- P3_3st
				when P3_3st =>
					-- Output --
					seg7_disp <= "11111101";
					-- State change --
					if disp_en = '1' then
						cur_state <= P3_4st;
					end if;
					
				-- P3_4st
				when P3_4st =>
					-- Output --
					seg7_disp <= "11110111";
					-- State change --
					if disp_en = '1' then
						cur_state <= P3_5st;
					end if;
					
				-- P3_5st
				when P3_5st =>
					-- Output --
					seg7_disp <= "11101111";
					-- State change --
					if disp_en = '1' then
						cur_state <= P3_6st;
					end if;
					
				-- P3_6st
				when P3_6st =>
					-- Output --
					seg7_disp <= "11011111";
					-- State change --
					if disp_en = '1' then
						cur_state <= P3_7st;
					end if;
					
				-- P3_7st
				when P3_7st =>
					-- Output --
					seg7_disp <= "11111101";
					-- State change --
					if disp_en = '1' then
						cur_state <= P3_8st;
					end if;
					
				-- P3_8st
				when P3_8st =>
					-- Output --
					seg7_disp <= "11111011";
					-- State change --
					if disp_en = '1' then
						cur_state <= P3_1st;
					end if;
			---------------------------------- P3 FSM --------------------------------- }
					
				
				when others => seg7_disp <= "11111111";
			end case;
		end if;
	end process;
	
	-- Display enable proc --
	process(rst, clk)
	begin
		if rst = '1' then
			delay_cnt <= 0;
			disp_en <= '0';
		elsif clk'event and clk = '1' then
			if delay_cnt = 5000000 then
				delay_cnt <= 0;
				disp_en <= '1';
			else
				delay_cnt <= delay_cnt + 1;
				disp_en <= '0';
			end if;
		end if;
	end process;

end Behavioral;

