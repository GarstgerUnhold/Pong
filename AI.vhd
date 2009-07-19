library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity AI is
    Port (
			right_pos: in integer range 0 to 430;
			right_pos_out: out integer range 0 to 430;
			ball_pos: in integer range 0 to 480
			);
end AI;

architecture Behavioral of AI is
begin

	process (right_pos, ball_pos)
		begin
		if ball_pos < 25 then right_pos_out <= 0;
		elsif ball_pos > 455 then right_pos_out <= 430;
		else right_pos_out <= (ball_pos - 25);
		end if;
	end process;

end Behavioral;