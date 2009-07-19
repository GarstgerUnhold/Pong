	library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity process_keys is
	port (
		keys_in : in std_logic_vector(13 downto 5);
		reset: in bit;
		game_over: in std_logic;
		clk25: in bit;
		hold_out: out std_logic;
		inverse_out: out bit;
		ballspeed_out : out std_logic_vector(1 downto 0);
		paddlespeed_out : out bit;
		AI_out: out std_logic;
		switch_out: out std_logic
	);
	end process_keys;

architecture Behavioral of process_keys	is
	signal set_pause_key: std_logic :='0';
	signal set_inverse_key: std_logic := '0';
	signal set_paddlespeed_key: std_logic :='0';
	signal set_AI_key: std_logic := '0';
	signal set_switch_key: std_logic := '0';
	signal Q_hold: std_logic := '1';
	signal Q_inverse: bit := '0';
	signal Q_paddlespeed: bit := '0';
	signal Q_AI: std_logic := '0';
	
begin
	
	switch_key: process (clk25)
	begin
		if clk25'event and clk25='1' then
			if keys_in(5)='1' and set_switch_key ='0' then 
				switch_out <= '1';
				set_switch_key <='1';
			elsif set_switch_key ='1' then 
				switch_out <= '0';
				if keys_in(5)='0' then set_switch_key <= '0'; end if;
			else switch_out <='0';
			end if;
		end if;
	end process switch_key;
	
	pause_key: process (clk25)
	begin
		if clk25'event and clk25='1' then
			if reset = '1' or game_over = '1' then Q_hold <='1';
			elsif keys_in(6)='1' and set_pause_key ='0'then 
				Q_hold <= not (Q_hold);
				set_pause_key <= '1';
			elsif set_pause_key ='1' and keys_in(6)='0' then set_pause_key <= '0'; end if;
		hold_out <= Q_hold;
		end if;
	end process pause_key;
	
	inverse_key: process (clk25)
	begin
		if clk25'event and clk25='1' then
			if keys_in(7)='1' and set_inverse_key ='0' then 
				Q_inverse <= not (Q_inverse);
				set_inverse_key <= '1';
			elsif set_inverse_key ='1' and keys_in(7)='0' then set_inverse_key <= '0'; end if;
		inverse_out <= Q_inverse;
		end if;
	end process inverse_key;
	
	ai_key: process (clk25)
	begin
		if clk25'event and clk25='1' then
			if keys_in(13)='1' and set_ai_key ='0' then 
				Q_AI <= not (Q_AI);
				set_AI_key <= '1';
			elsif set_AI_key ='1' and keys_in(13)='0' then set_AI_key <= '0'; end if;
		AI_out <= Q_AI;
		end if;
	end process ai_key;
	
	ballspeed_keys: process(keys_in(12 downto 9), clk25)
	begin
		if clk25'event and clk25='1' then
			case keys_in(12 downto 9) is
				when "0001" => ballspeed_out <= "00";
				when "0010" => ballspeed_out <= "01";
				when "0100" => ballspeed_out <= "10";
				when "1000" => ballspeed_out <= "11";
				when others =>
			end case;
		end if;	
	end process ballspeed_keys;
	
	paddlespeed_key: process (clk25)
	begin
		if clk25'event and clk25='1' then
			if keys_in(8)='1' and set_paddlespeed_key ='0'then 
				Q_paddlespeed <= not (Q_paddlespeed);
				set_paddlespeed_key <= '1';
			elsif set_paddlespeed_key ='1' and keys_in(7)='0' then set_paddlespeed_key <= '0'; end if;
		paddlespeed_out <= Q_paddlespeed;
		end if;
	end process paddlespeed_key;
end Behavioral;