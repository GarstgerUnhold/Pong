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

	signal rgb_farbw, chosen_background : STD_LOGIC_VECTOR (2 downto 0);
	signal will_switch : bit;
	signal deltaX : integer range 0 to 320;
	signal deltaY : integer range 0 to 240;
	signal count_up : integer range 0 to 25000000;
begin

	farbw : farbwechsel port map (
		X => X,
		Y => Y,
		rgb_out => rgb_farbw,
		clk25 => clk25);
	
	deltaX <= X - 320 when X > 320 else 320 - X; 	
	deltaY <= Y - 240 when Y > 240 else 240 - Y;

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
			
			case chosen_background is
			  
			  -- fussball feld
			  when "000" =>
			    if X = 320 or X = 321 -- mittellinie
			    or ((deltaY * deltaY) + (deltaX * deltaX)) = 10000 -- grosser mittelkreis
			    or ((deltaY * deltaY) + (deltaX * deltaX)) < 82 -- kleiner mittelkreis
			    or X < 3 or X > 637 or Y < 3 or Y > 477 -- aussenrahmen
			    or (((320 - deltaX) * (320 - deltaX)) + (deltaY * deltaY)) = 10000 -- spielerkreise
			    then
			      rgb_out <= "111";
			    else
			      rgb_out <= "000";
			    end if;
			  
			  -- kreise
			  when "001" => 
			    if deltaX > 5 and deltaY > 5 and ((((deltaY * deltaY) + (deltaX * deltaX)) MOD 64) > 32)
			    then
			      if (X < 320 and Y > 240) or (X > 320 and Y < 240) then
			        rgb_out <= "011";
			      else
			        rgb_out <= "101";
			      end if;
			    elsif ((deltaY * deltaY) + (deltaX * deltaX)) < 10000 then
			      if (X < 320 and Y > 240) or (X > 320 and Y < 240) then
  			        rgb_out <= "101";
  			      else
  			        rgb_out <= "011";
  			      end if;
  			    else
			      rgb_out <= "111";
			    end if;
			    
			  -- karos
			  when "010" =>
			    if (deltaX MOD 64) > 32 and (deltaY MOD 64) > 32 then
			      rgb_out <= "001";
			    else
			      rgb_out <= "110";
			    end if;
			    
			  -- farbwechsel
			  when "011" => rgb_out <= rgb_farbw;
			  
			  -- schwarz
			  when "100" => rgb_out <= "000";
			  
			  -- weiss
			  when "101" => rgb_out <= "111";
			  
			  -- gelb
			  when "110" => rgb_out <= "110";
			  
			  -- pink
			  when others => rgb_out <= "101"; 			
			  
			end case; 		
		end if;
	end process;

end Behavioral;

