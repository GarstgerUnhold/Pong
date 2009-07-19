library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity balken is
    Port ( speed : in std_logic;
			  hold : in std_logic;
			  buttons : in std_logic_vector (3 downto 0);
			  bar_left : out integer range 0 to 430;
			  bar_right : out integer range 0 to 430;
			  right_ai: in integer range 0 to 430;
			  ai_enabled: in std_logic;
			  X : in  integer range 0 to 640;
           Y : in  integer range 0 to 480;
			  rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			  rgb_out : out STD_LOGIC_VECTOR (2 downto 0);
           clk25 : in  bit;
			  reset : in bit);
end balken;

architecture Behavioral of balken is
	signal ltop,rtop,ltopnew,rtopnew : integer range 0 to 430 := 215;
	signal countUp : integer range 0 to 78000 := 0;
	signal speedCount : std_logic;
begin
	
bar_left <= ltopnew;
bar_right <= rtopnew;

	process (rgb_in,X,Y,clk25,reset,ltop,rtop)
	begin
		rgb_out <= rgb_in;
	
		if X < 20
		and X > 4
		and Y > ltop
		and Y < (ltop + 50) then
				rgb_out <= "100";
		end if;
		
		if X > 619 
		and X < 635
		and Y > rtop
		and Y < (rtop + 50) then
				rgb_out <= "010";
		end if;

		if clk25'event and clk25='1' then --for movement
			countUp <= countUp + 1;
			if countUp = 78000 then
				if speedCount = '0' and speed ='0' then
					speedCount <= '1';
				else
					speedCount <= '0';
					if hold = '0' then 
							-- move left
							if buttons(0) = '1' then ltopnew <= ltop - 1; end if;
							if buttons(1) = '1' then ltopnew <= ltop + 1; end if;
							
							-- move right
							if ai_enabled ='1' then	rtopnew <= right_ai;
							else
								if buttons(2) = '1' then rtopnew <= rtop - 1; end if;
								if buttons(3) = '1' then rtopnew <= rtop + 1; end if;
							end if;
					end if;
				end if;
				countUp <= 0;
			end if;

		end if;
		
		if reset = '1' then
			rtopnew <= 215;
			ltopnew <= 215;
		end if;
	end process;
	
	field_boundaries: process (ltopnew,rtopnew)
	begin
		if ltopnew < 2 then ltop <= 1;
		elsif ltopnew > 429 then ltop <= 430;
		else ltop <= ltopnew;
		end if;
		if rtopnew < 2 then rtop <= 1;
		elsif rtopnew > 429 then rtop <= 430;
		else rtop <= rtopnew;
		end if;
	end process field_boundaries;

end Behavioral;

