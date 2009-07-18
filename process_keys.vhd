library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity process_keys is
	port (
		keys_in : in std_logic_vector(12 downto 6);
		reset: in bit;
		game_over: in std_logic;
		clk25: in bit;
		hold_out: out std_logic;
		inverse_out: out bit;
		ballspeed_out : out bit_vector(1 downto 0);
		paddlespeed_out : out bit
	);
	end process_keys;

architecture Behavioral of process_keys	is
	signal set_pause_key: std_logic;
	signal set_inverse_key: std_logic;
	signal set_paddlespeed_key: std_logic;
	signal Q_hold: std_logic;
	signal Q_inverse: bit;
	signal Q_paddlespeed: bit;
begin
	
	pause_key: process (clk25)
	begin
		if clk25'event and clk25='1' then
			if reset = '1' or game_over = '1' then Q_hold <='1';
			elsif keys_in(6)='1' and set_pause_key ='0'then 
				Q_hold <= not (Q_hold);
				set_pause_key <= '1';
				hold_out <= Q_hold;
			elsif set_pause_key ='1' and keys_in(6)='0' then set_pause_key <= '0'; end if;
		end if;
	end process pause_key;
	
	inverse_key: process (clk25)
	begin
		if clk25'event and clk25='1' then
			if keys_in(7)='1' and set_inverse_key ='0' then 
				Q_inverse <= not (Q_inverse);
				set_inverse_key <= '1';
				inverse_out <= Q_inverse;
			elsif set_inverse_key ='1' and keys_in(7)='0' then set_inverse_key <= '0'; end if;
		end if;
	end process inverse_key;
	
	ballspeed_keys: process(keys_in(12 downto 9), clk25)
	begin
		--if clk25'event and clk25='1' then
			case keys_in(12 downto 9) is
				when "0001" => ballspeed_out <= "00";
				when "0010" => ballspeed_out <= "01";
				when "0100" => ballspeed_out <= "10";
				when "1000" => ballspeed_out <= "11";
				when others =>
			end case;
		--end if;	
	end process ballspeed_keys;
	
	paddlespeed_key: process (clk25)
	begin
		if clk25'event and clk25='1' then
			if keys_in(8)='1' and set_paddlespeed_key ='0'then 
				Q_paddlespeed <= not (Q_paddlespeed);
				set_paddlespeed_key <= '1';
				paddlespeed_out <= Q_paddlespeed;
			elsif set_paddlespeed_key ='1' and keys_in(7)='0' then set_paddlespeed_key <= '0'; end if;
		end if;
	end process paddlespeed_key;
end Behavioral;