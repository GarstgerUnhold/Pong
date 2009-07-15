----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:53:59 07/15/2009 
-- Design Name: 
-- Module Name:    score - Behavioral 
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

entity score is
	Port( X : in integer range 0 to 640;
         Y : in integer range 0 to 480;
			rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			rgb_out: out STD_LOGIC_VECTOR (2 downto 0);
			clk25 : in bit;
			reset : in bit);
end score;

architecture Behavioral of score is
	signal a1,a2,a3,a4,a5,a6,a7,a8,a9,a0 : bit_vector(5 downto 1);
	signal b1,b2,b3,b4,b5,b6,b7,b8,b9,b0 : bit_vector(5 downto 1);
	signal c1,c2,c3,c4,c5,c6,c7,c8,c9,c0 : bit_vector(5 downto 1);
	signal d1,d2,d3,d4,d5,d6,d7,d8,d9,d0 : bit_vector(5 downto 1);
	signal e1,e2,e3,e4,e5,e6,e7,e8,e9,e0 : bit_vector(5 downto 1);
	--signal left_player,right_player : integer range 0 to 9;
	signal chosen_number_part : bit_vector(5 downto 1);
begin
		a1 <= "00011";a2 <= "00110";a3 <= "01111";a4 <= "11000";a5 <= "11111";
		b1 <= "01111";b2 <= "11011";b3 <= "00011";b4 <= "11011";b5 <= "11000";
		c1 <= "00011";c2 <= "00110";c3 <= "01111";c4 <= "11111";c5 <= "11111";
		d1 <= "00011";d2 <= "01100";d3 <= "00011";d4 <= "00011";d5 <= "00011";
		e1 <= "00011";e2 <= "11111";e3 <= "01111";e4 <= "00011";e5 <= "11111";
		
		a6 <= "00110";a7 <= "11111";a8 <= "01110";a9 <= "01110";a0 <= "01110";
		b6 <= "01100";b7 <= "00011";b8 <= "11011";b9 <= "11011";b0 <= "11011";
		c6 <= "11110";c7 <= "00011";c8 <= "01110";c9 <= "01111";c0 <= "11011";
		d6 <= "11011";d7 <= "00110";d8 <= "11011";d9 <= "00110";d0 <= "11011";
		e6 <= "01110";e7 <= "01100";e8 <= "01110";e9 <= "01100";e0 <= "01110";
		
		process begin
			if (X > 40) and (X < 46) and (Y > 20) and (Y < 26) then --Player 1 Score box
				case Y is
					when 21 => chosen_number_part <= a1;
					when 22 => chosen_number_part <= b1;
					when 23 => chosen_number_part <= c1;
					when 24 => chosen_number_part <= d1;
					when 25 => chosen_number_part <= e1;
					when others => chosen_number_part <= "00000";
				end case;
				
				case X is
					when 41 => rgb_out <= chosen_number_part(1) & chosen_number_part(1) & chosen_number_part(1);
					when 42 => rgb_out <= chosen_number_part(2) & chosen_number_part(2) & chosen_number_part(2);
					when 43 => rgb_out <= chosen_number_part(3) & chosen_number_part(3) & chosen_number_part(3);
					when 44 => rgb_out <= chosen_number_part(4) & chosen_number_part(4) & chosen_number_part(4);
					when 45 => rgb_out <= chosen_number_part(5) & chosen_number_part(5) & chosen_number_part(5);
					when others => rgb_out <= "000";
			elsif (X > 594) and (X < 600) and (Y > 20) and (Y < 26) then --Player 2 Score box
				case Y is
					when 21 => chosen_number_part <= a2;
					when 22 => chosen_number_part <= b2;
					when 23 => chosen_number_part <= c2;
					when 24 => chosen_number_part <= d2;
					when 25 => chosen_number_part <= e2;
					when others => chosen_number_part <= "00000";
				end case;
				
				case X is
					when 595 => rgb_out <= chosen_number_part(1) & chosen_number_part(1) & chosen_number_part(1);
					when 596 => rgb_out <= chosen_number_part(2) & chosen_number_part(2) & chosen_number_part(2);
					when 597 => rgb_out <= chosen_number_part(3) & chosen_number_part(3) & chosen_number_part(3);
					when 598 => rgb_out <= chosen_number_part(4) & chosen_number_part(4) & chosen_number_part(4);
					when 599 => rgb_out <= chosen_number_part(5) & chosen_number_part(5) & chosen_number_part(5);
					when others => rgb_out <= "111";
			else
				rgb_out <= rgb_in;
			end if;
		end process;

end Behavioral;

