----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:11:26 07/10/2009 
-- Design Name: 
-- Module Name:    vgadriver - Behavioral 
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

entity SignalTiming is
    Port ( hsync, vsync : out bit;
			  X : out integer range 0 to 640;
           Y : out integer range 0 to 480;
			  clk25 : in  STD_LOGIC);
end SignalTiming;

architecture Behavioral of SignalTiming is
	signal hcounter : integer range 0 to 800;
	signal vcounter : integer range 0 to 521;
begin
	process
	begin
		if clk25'event and clk25='1' then
			hcounter <= hcounter + 1;
			if (hcounter = 800) then
				hcounter <= 0;
				vcounter <= vcounter + 1;
			end if;
			
			if (vcounter >= 521) then
				vcounter <= 0;
			end if;

			if (0 < hcounter) and (hcounter < 97) then
				hsync <= '1';
			else
				hsync <= '0';
			end if;
			
			if (0 < vcounter) and (vcounter < 3) then
				vsync <= '1';
			else
				vsync <= '0';
			end if;
			
			X <= hcounter - 144;
			if hcounter > 784 then
				X <= 640;
			end if;
			if hcounter < 144 then
				X <= 0;
			end if;
				
			Y <= vcounter - 31;
			if vcounter > 511 then
				Y <= 480;
			end if;
			if vcounter < 31 then
				Y <= 0;
			end if;
		end if;
	end process;

end Behavioral;

