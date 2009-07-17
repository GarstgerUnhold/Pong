----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:06:38 07/10/2009 
-- Design Name: 
-- Module Name:    farbwechsel - Behavioral 
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

entity farbwechsel is
    Port (
		X : in integer range 0 to 640;
		Y : in integer range 0 to 480;
		rgb_out : out STD_LOGIC_VECTOR (2 downto 0);
		clk25 : in bit);
end farbwechsel;

architecture Behavioral of farbwechsel is
	signal countUp : integer range 0 to 2500;
	signal my_rgb : STD_LOGIC_VECTOR (2 downto 0);
begin

	process (clk25, countUp)
	begin
		if clk25'event and clk25='1' then
			countUp <= countUp + 1;
			if countUp = 2500 then
				countUp <= 0;
				my_rgb <= my_rgb + "001";
				if my_rgb = "111" then
					my_rgb <= "000";
				end if;
			end if;
			
			rgb_out <= my_rgb;
		end if;
	end process;

end Behavioral;

