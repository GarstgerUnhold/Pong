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

entity template is
	port (
	kbclk: in std_logic;
	kbdata: in std_logic;
	clk: in std_logic;
	tout : out std_logic_vector(3 downto 0);
	rst: in std_logic
	);
	
end template;

architecture Behavioral of template is
signal fullcode: std_logic_vector(10 downto 0);
signal scancode: std_logic_vector(7 downto 0);
signal ready: std_logic;
signal qclk: std_logic_vector (1 downto 0);
signal X: std_logic;

signal rup, rdown, lup, ldown, break_set: std_logic;
begin

	ausgabe: process (fullcode, ready, clk, rst)
	begin	
		if (ready = '1') then
			if (break_set='1')then
				case scancode is
					when x"1D" => rup <= '0'; break_set <='0';
					when x"1B" => rdown <= '0'; break_set <='0';
					when x"44" => lup <= '0'; break_set <='0';
					when x"4B" => ldown <= '0'; break_set <='0';
					when x"F0" => break_set <= '1'; break_set <='0';
					when others => break_set <='0'; 
				end case;		
			else
				case scancode  is
					when x"F0" => break_set <= '1';
					when x"1D" => rup <= '1';
					when x"1B" => rdown <= '1';
					when x"44" => lup <= '1';
					when x"4B" => ldown <= '1';
					when others => rup <=rup;
				end case;
			end if;
		end if;
	end process;

tout(0) <= rup;
tout(1) <= rdown;
tout(2) <= lup;
tout(3) <= ldown;

sreg10: process (clk,rst,X)
begin
	if rst='1' then fullcode <= (others => '1');
	elsif clk'event and clk = '1' then
	if ready='1' then fullcode <= (others => '1'); end if;
		if X = '1' then 
			fullcode <= kbdata & fullcode (10 downto 1);
		end if;
	end if;
end process sreg10;

sreg2: process (clk, rst)
begin
	if rst='1' then qclk <= "00";
	elsif clk'event and clk = '1' then 
		qclk <= kbclk & qclk(1);
	end if;
end process sreg2;

X <= not(qclk(1)) and qclk(0);

scancode <= fullcode(8 downto 1);

ready <= not (fullcode(0));


	
end Behavioral;