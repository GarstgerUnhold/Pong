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
    Port ( speed : in std_logic_vector (1 downto 0);
			  hold : in std_logic;
			  bar_left : in integer range 0 to 430;
			  bar_right : in integer range 0 to 430;
			  X : in  integer range 0 to 640;
           Y : in  integer range 0 to 480;
			  game_over : out bit;
			  rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			  rgb_out : out STD_LOGIC_VECTOR (2 downto 0);
           clk25 : in  bit;
			  reset : in bit;
			  forward_score_over : out std_logic);
end ball;

architecture Behavioral of ball is

	component score is
		Port( pointLeft : in bit;
			pointRight : in bit;
		   X : in integer range 0 to 640;
         Y : in integer range 0 to 480;
			rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			rgb_out: out STD_LOGIC_VECTOR (2 downto 0);
			clk25 : in bit;
			reset : in bit;
			score_over : out std_logic);
	end component;

	signal lr : bit := '0'; --left/right
	signal ud : bit := '1'; --up/down
	signal deltaX, deltaY : integer range 0 to 640;
	signal x_pos : integer range 0 to 640 := 320;
	signal y_pos : integer range 0 to 480 := 240;
	signal countUp : integer range 0 to 208000 := 0;
	signal speedCount : std_logic_vector (1 downto 0);
	signal gameOver : bit;
	signal leftOut, rightOut : bit := '0';
	signal intern_rgb : STD_LOGIC_VECTOR (2 downto 0);
begin

	count : score port map (
		pointLeft => rightOut,
		pointRight => leftOut,
		X => X,
		Y => Y,
		rgb_in => rgb_in,
		rgb_out => intern_rgb,
		clk25 => clk25,
		reset => reset,
		score_over => forward_score_over);

	process (intern_rgb, x_pos, y_pos, clk25,X,Y)
	begin
		rgb_out <= intern_rgb;
		
		if (x_pos > X - 8) 
		and (x_pos < X + 8)
		and (y_pos > Y - 8)
		and (y_pos < Y + 8) then
			if (x_pos > X) then
				deltaX <= x_pos - X + 1;
			else
				deltaX <= X - x_pos;
			end if;
			if (y_pos > Y) then
				deltaY <= y_pos - Y + 1;
			else
				deltaY <= Y - y_pos;
			end if;
	
			if ((deltaY * deltaY) + (deltaX * deltaX)) < 64 then
				rgb_out <= "001";
			end if;
		end if;
		
		if clk25'event and clk25='1' then --for movement
			countUp <= countUp + 1;
			gameOver <= reset;
			if countUp = 52000 then
				if speedCount = (not speed(1) & not speed(0)) then
					speedCount <= "00";
					
					if x_pos < 27 then
						if (bar_left < y_pos 
						and bar_left + 50 > y_pos) then
							lr <= '1';						
						else
							if x_pos < 9 then
								leftOut <= '1';
								gameOver <= '1';
							end if;
						end if;
					end if;
					
					if x_pos > 611 then
						if (bar_right < y_pos 
						and bar_right + 50 > y_pos) then
							lr <= '0';
						else
							if x_pos > 631 then
								rightOut <= '1';
								gameOver <= '1';
							end if;
						end if;
					end if;
					
					if y_pos = 9 then
						ud <= '1';
					end if;
					if y_pos = 471 then
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
				else
					speedCount <= speedCount + "01";
				end if;
				countUp <= 0;
			end if;				
			
			if gameOver = '1' then -- this has to come synchronized for counting to work
				leftOut <= '0';
				rightOut <= '0';
				x_pos <= 320;
				y_pos <= 240;
				game_over <= '1';
			else
				game_over <= '0';
			end if;
			
		end if;
	end process;

end Behavioral;



