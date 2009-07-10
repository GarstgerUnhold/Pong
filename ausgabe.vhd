----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:58:04 07/10/2009 
-- Design Name: 
-- Module Name:    ausgabe - Behavioral 
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

entity ausgabe is
    Port ( X : in integer range 0 to 640;
           Y : in integer range 0 to 480;
			  rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			  rgb_out: out STD_LOGIC_VECTOR (2 downto 0);
			  clk25 : in bit);
end ausgabe;

architecture Behavioral of ausgabe is
	
begin

   process
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

