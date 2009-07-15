----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:45:00 07/10/2009 
-- Design Name: 
-- Module Name:    balken - Behavioral 
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

entity ball is
    Port ( hold : in bit;
			  bar_left : in integer range 0 to 430;
			  bar_right : in integer range 0 to 430;
			  X : in  integer range 0 to 640;
           Y : in  integer range 0 to 480;
			  game_over : out bit;
			  rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			  rgb_out : out STD_LOGIC_VECTOR (2 downto 0);
           clk25 : in  bit;
			  reset : in bit);
end ball;

architecture Behavioral of ball is
	signal lr : bit := '0'; --left/right
	signal ud : bit := '1'; --up/down
	signal x_pos : integer range 0 to 640 := 320;
	signal y_pos : integer range 0 to 480 := 240;
	signal deltaX, deltaY : integer range 0 to 640;
	signal countUp : integer range 0 to 208000 := 0;
	signal gameOver : bit;
begin

	process 
	begin
		rgb_out <= rgb_in;
		
		if (x_pos > X) then
			deltaX <= x_pos - X;
		else
			deltaX <= X - x_pos;
		end if;
		if (y_pos > Y) then
			deltaY <= y_pos - Y;
		else
			deltaY <= Y - y_pos;
		end if;
	
		if ((deltaY * deltaY) + (deltaX * deltaX)) < 16 then
			rgb_out <= "001";
		end if;
		
		if clk25'event and clk25='1' then --for movement
			countUp <= countUp + 1;
			gameOver <= reset;
			if countUp = 208000 then

				if x_pos < 23 then
					if (bar_left < y_pos 
					and bar_left + 50 > y_pos) then
						lr <= '1';						
					else
						if x_pos < 5 then
							gameOver <= '1';
						end if;
					end if;
				end if;
				
				if x_pos > 615 then
					if (bar_right < y_pos 
					and bar_right + 50 > y_pos) then
						lr <= '0';
					else
						if x_pos > 635 then
							gameOver <= '1';
						end if;
					end if;
				end if;
				
				if y_pos <= 5 then
					ud <= '1';
				end if;
				if y_pos = 475 then
					ud <= '0';
				end if;
				
				if hold = '0' then
					case lr is
						when '0' => x_pos <= x_pos - 1;
						when '1' => x_pos <= x_pos + 1;
					end case;
					
					case ud is
						when '0' => y_pos <= y_pos - 1;
						when '1' => y_pos <= y_pos + 1;
					end case;
				end if;
				
				countUp <= 0;			
			end if;				
		end if;
		
		if gameOver = '1' then
			x_pos <= 320;
			y_pos <= 240;
			game_over <= '1';
		else
			game_over <= '0';
		end if;
	end process;

end Behavioral;



