----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:50:59 05/23/2009 
-- Design Name: 
-- Module Name:    template - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity keyboard is
	port (
	kbclk: in std_logic;
	kbdata: in std_logic;
	clk: in std_logic;
	keysout : out std_logic_vector(12 downto 0)
	);
	
end keyboard;

architecture Behavioral of keyboard is
signal fullcode: std_logic_vector(10 downto 0);
signal scancode: std_logic_vector(7 downto 0);
signal ready: std_logic;
signal qclk: std_logic_vector (1 downto 0);
signal X: std_logic;
signal break_set: std_logic;
begin

	ausgabe: process (clk)
	begin	
		if clk'event and clk = '1' and ready ='1' then
			if (break_set='1')then
				case scancode is
					when x"1D" => keysout(0) <= '0'; break_set <='0'; -- lup
					when x"1B" => keysout(1) <= '0'; break_set <='0'; -- ldown
					when x"75" => keysout(2) <= '0'; break_set <='0'; -- rup
					when x"73" => keysout(3) <= '0'; break_set <='0'; -- rdown
					when x"76" => keysout(4) <= '0'; break_set <='0'; -- esc
					when x"29" => keysout(5) <= '0'; break_set <='0'; -- space
					when x"4D" => keysout(6) <= '0'; break_set <='0'; -- p
					when x"43" => keysout(7) <= '0'; break_set <='0'; -- i
					when x"5A" => keysout(8) <= '0'; break_set <='0'; -- enter
					when x"16" => keysout(9) <= '0'; break_set <='0'; -- 1
					when x"1E" => keysout(10) <= '0'; break_set <='0'; -- 2
					when x"26" => keysout(11) <= '0'; break_set <='0'; -- 3
					when x"25" => keysout(12) <= '0'; break_set <='0'; -- 4
					when x"F0" => break_set <= '1'; break_set <='0';
					when others => break_set <='0'; 
				end case;		
			else
				case scancode  is
					when x"F0" => break_set <= '1';
					when x"1D" => keysout(0) <= '1';
					when x"1B" => keysout(1) <= '1';
					when x"75" => keysout(2) <= '1';
					when x"73" => keysout(3) <= '1';
					when x"76" => keysout(4) <= '1';
					when x"29" => keysout(5) <= '1';
					when x"4D" => keysout(6) <= '1';
					when x"43" => keysout(7) <= '1';
					when x"5A" => keysout(8) <= '1';
					when x"16" => keysout(9) <= '1';
					when x"1E" => keysout(10) <= '1';
					when x"26" => keysout(11) <= '1';
					when x"25" => keysout(12) <= '1';
					when others =>
				end case;
			end if;
		end if;
	end process;

sreg10: process (clk)
begin
	if clk'event and clk = '1' then
		if ready='1' then fullcode <= (others => '1'); end if;
			if X = '1' then 
				fullcode <= kbdata & fullcode (10 downto 1);
			end if;
	end if;
end process sreg10;

sreg2: process (clk)
begin
	if clk'event and clk = '1' then 
		qclk <= kbclk & qclk(1);
	end if;
end process sreg2;

X <= not(qclk(1)) and qclk(0);

scancode <= fullcode(8 downto 1);

ready <= not (fullcode(0));
	
end Behavioral;