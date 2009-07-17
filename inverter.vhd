----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:27:50 07/16/2009 
-- Design Name: 
-- Module Name:    inverter - Behavioral 
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

entity inverter is
    Port ( inverse : in bit;
			  X : in integer range 0 to 640;
           Y : in integer range 0 to 480;
			  rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			  rgb_out: out STD_LOGIC_VECTOR (2 downto 0);
			  clk25 : in bit);
end inverter;

architecture Behavioral of inverter is
	
begin

   process
	begin
		if inverse = '1' then
			rgb_out <= (not rgb_in(2) & not rgb_in(1) & not rgb_in(0));
		else
			rgb_out <= rgb_in;
		end if;
	end process;
	
end Behavioral;

