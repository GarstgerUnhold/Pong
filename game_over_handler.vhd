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
	signal flashtime : integer range 0 to 5000000 := 0;
	signal flashcount : integer range 0 to 15 := 0;
	signal save_game_over : bit;
	signal rgb : STD_LOGIC_VECTOR (2 downto 0);
begin
	
	process
	begin
		if game_over = '1' then
			save_game_over <= '1';
		end if;
	
		if save_game_over = '1' then
			if clk25'event and clk25 = '1' then
				rgb <= rgb_in;
				flashtime <= flashtime + 1;
				
				if flashtime = 500000 then
					flashcount <= flashcount + 1;
					rgb <= "111";
					flashtime <= 0;
				end if;
			end if;
			rgb <= "111";
		end if;
		
		if flashcount = 15 then
			save_game_over <= '0';
		end if;
		
		rgb_out <= rgb;
	end process;

end Behavioral;

