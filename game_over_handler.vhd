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
	signal count_up : integer range 0 to 10250000 := 0;
	signal got_game_over : bit := '0';
begin
	
	process
	begin
		if clk25'event and clk25 = '1' then
			if game_over = '1' then
				got_game_over <= '1';
			end if;
			count_up <= count_up + 1;
			if count_up = 10250000 then
				if got_game_over = '1' then
					got_game_over <= '0';
				end if;
				count_up <= 0;
			end if;
		end if;
		
		case got_game_over is    
			when '0' => rgb_out <= rgb_in; -- spielfeld
			when '1' => rgb_out <= (not rgb_in(2) & not rgb_in(1) & not rgb_in(0)); --farbwechsel
		end case;
	end process;

end Behavioral;

