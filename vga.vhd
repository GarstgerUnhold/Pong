----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:07:55 07/10/2009 
-- Design Name: 
-- Module Name:    vga - Behavioral 
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

entity vga is
    Port ( clk50 : in  STD_LOGIC;
			  global_buttons : in bit_vector (1 downto 0); -- steuerung
			  global_bg_switch : in bit; -- background switching
           global_reset : in  bit;
           global_hsync : out bit;
           global_vsync : out  bit;
           global_rgb : out  STD_LOGIC_VECTOR (2 downto 0));
end vga;

architecture Behavioral of vga is

	component SignalTiming  
		Port (			
			reset : in bit;
			hsync, vsync : out bit;
			X : out integer range 0 to 640;
         Y : out integer range 0 to 480;
			clk25 : in  bit);
	end component;
	
	component ausgabe
		Port (
			X : in integer range 0 to 640;
         Y : in integer range 0 to 480;
			rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			rgb_out: out STD_LOGIC_VECTOR (2 downto 0);
			clk25 : in bit);
	end component;
	
	component background
		Port (
			switch : in bit;
			X : in integer range 0 to 640;
			Y : in integer range 0 to 480;
			rgb_out : out STD_LOGIC_VECTOR (2 downto 0);
			clk25 : in bit);
	end component;
	
	component balken 
		Port (
			buttons : in bit_vector (1 downto 0);
			X : in integer range 0 to 640;
         Y : in integer range 0 to 480;
			rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			rgb_out : out STD_LOGIC_VECTOR (2 downto 0);
			clk25 : in  bit);
	end component;
	
	component ball is
		Port ( 
			X : in integer range 0 to 640;
         Y : in integer range 0 to 480;
			rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			rgb_out : out STD_LOGIC_VECTOR (2 downto 0);
         clk25 : in  bit);
	end component;
	
	signal intermediate_X : integer range 0 to 640;
   signal intermediate_Y : integer range 0 to 480;
	signal intermediate_hsync, intermediat_vsync : bit;
	signal intermediate_clk25 : bit;
	signal intermediate_rgb1 : STD_LOGIC_VECTOR (2 downto 0); -- hintergrund
	signal intermediate_rgb2 : STD_LOGIC_VECTOR (2 downto 0); -- balken
	signal intermediate_rgb3 : STD_LOGIC_VECTOR (2 downto 0); -- ball
	
begin

	process (clk50)
	begin
		if clk50'event and clk50='1' then
			if (intermediate_clk25 = '0') then
				intermediate_clk25 <= '1';
			else
				intermediate_clk25 <= '0';
			end if;
		end if;
	end process;
	
	sigTime : SignalTiming port map (		
		reset => global_reset,
		hsync => intermediate_hsync,
		vsync => intermediat_vsync,
		X => intermediate_X,
		Y => intermediate_Y,
		clk25 => intermediate_clk25);

	bg : background port map (
		switch => global_bg_switch,
		X => intermediate_X,
		Y => intermediate_Y,
		rgb_out => intermediate_rgb1,
		clk25 => intermediate_clk25);

	male_balken : balken port map (
		buttons => global_buttons,
		X => intermediate_X,
		Y => intermediate_Y,
		rgb_in => intermediate_rgb1,
		rgb_out => intermediate_rgb2,
		clk25 => intermediate_clk25);
		
	male_ball : ball port map (
		X => intermediate_X,
		Y => intermediate_Y,
		rgb_in => intermediate_rgb2,
		rgb_out => intermediate_rgb3,
		clk25 => intermediate_clk25);

	aus : ausgabe port map (
		X => intermediate_X,
		Y => intermediate_Y,
		rgb_in => intermediate_rgb3,
		rgb_out => global_rgb,
		clk25 => intermediate_clk25);

	process (intermediate_clk25)
	begin
		if intermediate_clk25'event and intermediate_clk25='1' then
			global_hsync <= intermediate_hsync; 
			global_vsync <= intermediat_vsync;
		end if;
	end process;

end Behavioral;

