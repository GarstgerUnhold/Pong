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
    Port ( X : in  integer range 0 to 640;
           Y : in  integer range 0 to 480;
			  rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			  rgb_out : out STD_LOGIC_VECTOR (2 downto 0);
           clk25 : in  bit);
end ball;

architecture Behavioral of ball is
	signal lr : bit := '0'; --left/right
	signal ud : bit := '1'; --up/down
	signal x_pos : integer range 0 to 640 := 200;
	signal y_pos : integer range 0 to 480 := 200;
	signal countUp : integer range 0 to 312500 := 0;
begin

	process 
	begin
		rgb_out <= rgb_in;
	
		if X > (x_pos - 4) and (X < x_pos + 4)
		and Y > (y_pos - 4) and (Y < y_pos + 4) then
			rgb_out <= "001";
		end if;
			
		if clk25'event and clk25='1' then --for movement
			countUp <= countUp + 1;
			if countUp = 312500 then

				if x_pos <= 5 then
					lr <= '1';
				end if;
				if x_pos = 635 then
					lr <= '0';
				end if;
				
				if y_pos <= 5 then
					ud <= '1';
				end if;
				if y_pos = 475 then
					ud <= '0';
				end if;
				
				case lr is
					when '0' => x_pos <= x_pos - 1;
					when '1' => x_pos <= x_pos + 1;
				end case;
				
				case ud is
					when '0' => y_pos <= y_pos - 1;
					when '1' => y_pos <= y_pos + 1;
				end case;
				
				countUp <= 0;
			end if;
		end if;
	end process;

end Behavioral;



