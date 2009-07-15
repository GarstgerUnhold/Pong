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

	signal chosen_background : STD_LOGIC_VECTOR (2 downto 0);
	signal rgbs : STD_LOGIC_VECTOR (23 downto 0);
	signal will_switch : bit;
	signal count_up : integer range 0 to 6250000;
begin

	farbw : farbwechsel port map (
		X => X,
		Y => Y,
		rgb_out => rgbs(23 downto 21),
		clk25 => clk25);
	
	rgbs(20 downto 18) <= "111";

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
		end if;
		
		case chosen_background is
			when "000" => rgb_out <= rgbs(23 downto 21); --farbwechsel
			when "001" => rgb_out <= rgbs(20 downto 18); --weiss
			when others => rgb_out <= "000"; --schwarz
		end case;
	end process;

end Behavioral;

