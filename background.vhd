----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:48:44 07/10/2009 
-- Design Name: 
-- Module Name:    background - Behavioral 
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

entity background is
    Port (
		switch : in  bit;
		X : in integer range 0 to 640;
		Y : in integer range 0 to 480;
		rgb_out : out STD_LOGIC_VECTOR (2 downto 0);
		clk25 : in bit);
end background;

architecture Behavioral of background is

	component farbwechsel
		Port (
			X : in integer range 0 to 640;
			Y : in integer range 0 to 480;
			rgb_out : out STD_LOGIC_VECTOR (2 downto 0);
			clk25 : in bit);
	end component;

	signal chosen_background : STD_LOGIC_VECTOR (1 downto 0);
	signal rgb_farbw, rgb_field : STD_LOGIC_VECTOR (2 downto 0);
	signal will_switch : bit;
	signal deltaX : in integer range 0 to 320;
	signal deltaY : in integer range 0 to 240;
	signal count_up : integer range 0 to 25000000;
begin

	farbw : farbwechsel port map (
		X => X,
		Y => Y,
		rgb_out => rgb_farbw,
		clk25 => clk25);

	process
	begin
		if clk25'event and clk25 = '1' then
			if switch = '1' then
				will_switch <= '1';
			end if;
			count_up <= count_up + 1;
			if count_up = 6250000 then
				if will_switch = '1' then
					chosen_background <= chosen_background + "001";
					will_switch <= '0';
				end if;
				count_up <= 0;
			end if;
			
			if X > 320 then
			  deltaX <= X - 320;
			else
			  deltaX <= 320 - X;
			end if;
			
			if Y > 240 then
			  deltaY <= Y - 240;
			else
			  deltaY <= 240 - Y;
			end if;
			
			if X = 320 or X = 321 -- mittellinie
			or ((deltaY * deltaY) + (deltaX * deltaX)) = 1000 -- grosser mittelkreis
			or ((deltaY * deltaY) + (deltaX * deltaX)) =< 81 -- kleiner mittelkreis
			or X < 3 or X > 637 or Y < 3 or Y > 477 -- aussenrahmen
			or (((240 - deltaY) * (240 - deltaY)) + (deltaX * deltaX)) -- spielerkreise
			then
			  rgb_field <= "111";
			else
			  rgb_field <= "000";
			end if;
		end if;
		
	   case chosen_background is    
			when "00" => rgb_out <= rgb_field; -- spielfeld
			when "01" => rgb_out <= rgb_farbw; --farbwechsel
			when "10" => rgb_out <= "111"; --weiss
			when others => rgb_out <= "000"; --schwarz
		end case;
	end process;

end Behavioral;

