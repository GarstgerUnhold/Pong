library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity farbwechsel is
    Port (
		rgb_out : out STD_LOGIC_VECTOR (2 downto 0);
		clk25 : in bit);
end farbwechsel;

architecture Behavioral of farbwechsel is
	signal countUp : integer range 0 to 2500;
	signal my_rgb : STD_LOGIC_VECTOR (2 downto 0);
begin

	process (clk25)
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

