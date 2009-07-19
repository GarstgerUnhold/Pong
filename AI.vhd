library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity AI is
    Port ( 
			ai_enabled: in std_logic;
			left_pos: in integer range 0 to 430;
			left_pos_out: out integer range 0 to 430;
			ball_pos: in integer range 0 to 480
			);
end AI;

architecture Behavioral of AI is
begin

	process (left_pos, ball_pos, ai_enabled)
		begin
		if ai_enabled ='0' then
			left_pos_out <=left_pos;
		else
			left_pos_out <= ball_pos;
		end if;
	end process;

end Behavioral;