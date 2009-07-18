library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ausgabe is
    Port ( X : in integer range 0 to 640;
           Y : in integer range 0 to 480;
			  rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			  rgb_out: out STD_LOGIC_VECTOR (2 downto 0)
			  );
end ausgabe;

architecture Behavioral of ausgabe is
	
begin

   process (X, Y, rgb_in)
	begin
		if X < 640 and X > 0 then
			if Y < 480 and Y >= 0 then
				rgb_out <= rgb_in(0) & rgb_in(1) & rgb_in(2); -- just make it, so that 
			else															 -- R,G,B comes in that order
				rgb_out <= "000";
			end if;
		else
			rgb_out <= "000";
		end if;
	end process;
	
end Behavioral;

