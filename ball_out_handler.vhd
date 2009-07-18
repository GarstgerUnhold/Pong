library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 

entity ball_out_handler is
  Port ( ball_out : in bit;
       rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
       rgb_out: out STD_LOGIC_VECTOR (2 downto 0);
       clk25 : in bit);
end ball_out_handler;
 
architecture Behavioral of ball_out_handler is
	component inverter
		Port (
			inverse : in bit;
			rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			rgb_out: out STD_LOGIC_VECTOR (2 downto 0)
			);
	end component;
	
	signal count_up : integer range 0 to 10250000 := 0;
	signal ball_out_inverse : bit;
	signal rgb_intern: STD_LOGIC_VECTOR (2 downto 0);
  
begin
  
	process (clk25, rgb_in) --for ball_out
	begin
		if clk25'event and clk25 = '1' then
			if ball_out = '1' then
				ball_out_inverse <= '1';
			end if;
			count_up <= count_up + 1;
			if count_up = 10250000 then
					ball_out_inverse <= '0';
				count_up <= 0;
			end if;
		end if;
	end process;
    
	inverse : inverter port map (
	   inverse => ball_out_inverse,
		rgb_in => rgb_in,
		rgb_out => rgb_out);
 
end Behavioral;