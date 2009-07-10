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

entity balken is
    Port ( buttons : in bit_vector (1 downto 0);
			  X : in  integer range 0 to 640;
           Y : in  integer range 0 to 480;
			  rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			  rgb_out : out STD_LOGIC_VECTOR (2 downto 0);
           clk25 : in  bit);
end balken;

architecture Behavioral of balken is
	signal ldir,rdir : bit;
	signal ltop,rtop : integer range 0 to 480 := 200;
	signal countUp : integer range 0 to 208000 := 0;
begin

	process 
	begin
		rgb_out <= rgb_in;
	
		if X < 20
		and Y > ltop
		and Y < (ltop + 50) then
				rgb_out <= "100";
		end if;
		
		if X > 619 
		and Y > rtop
		and Y < (rtop + 50) then
				rgb_out <= "010";
		end if;
	
		if clk25'event and clk25='1' then --for movement
			countUp <= countUp + 1;
			if countUp = 208000 then
			
				if buttons(0) = '1' then
					rdir <= not rdir;
				end if;
				if buttons(1) = '1' then
					ldir <= not ldir;
				end if;

				if rtop = 1 then
					rdir <= '1';
				end if;
				if rtop = 430 then
					rdir <= '0';
				end if;
				
				if ltop = 1 then
					ldir <= '1';
				end if;
				if ltop = 430 then
					ldir <= '0';
				end if;
				
				case ldir is
					when '0' => ltop <= ltop - 1;
					when '1' => ltop <= ltop + 1;
				end case;
				
				case rdir is
					when '0' => rtop <= rtop - 1;
					when '1' => rtop <= rtop + 1;
				end case;
				
				countUp <= 0;
			end if;
		end if;
	end process;

end Behavioral;

