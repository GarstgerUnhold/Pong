----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:26:01 07/15/2009 
-- Design Name: 
-- Module Name:    game_over_handler - Behavioral 
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

entity game_over_handler is
	Port ( game_over : in bit;
			 X : in integer range 0 to 640;
          Y : in integer range 0 to 480;
			 rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			 rgb_out: out STD_LOGIC_VECTOR (2 downto 0);
			 clk25 : in bit);
end game_over_handler;

architecture Behavioral of game_over_handler is
	signal flashtime : integer range 0 to 12500000 := 0;
	signal flashcount : bit := '0';
	signal rgb : STD_LOGIC_VECTOR (2 downto 0);
begin
	
	process
	begin
		if game_over = '1' then
			flashcount <= '1';
		end if;
	
		if flashcount = '0' then
			if clk25'event and clk25 = '1' then
				flashtime <= flashtime + 1;
					
				if flashtime > 0 and flashtime < 12500000 then
					rgb <= (not rgb(0) & not rgb(1) & not rgb(2));
				else
					flashtime <= 0;
				end if;
			end if;
			rgb_out <= rgb;
		else
			rgb_out <= rgb_in;
		end if;
		
		if flashtime = 12500000 then
			flashcount <= '0';
		end if;
	end process;

end Behavioral;

