library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vga is
    Port ( clk50 : in  STD_LOGIC;
			global_hsync : out bit;
			global_vsync : out  bit;
			global_rgb : out  STD_LOGIC_VECTOR (2 downto 0);
			global_kbclk: in std_logic;
			global_kbdata: in std_logic);
end vga;

architecture Behavioral of vga is

	component keyboard  					
		port (
			kbclk: in std_logic;
			kbdata: in std_logic;
			clk: in std_logic;
			keysout : out std_logic_vector(13 downto 0)
	);
	end component;
	
	component process_keys  					
		port (
		keys_in : in std_logic_vector(13 downto 6);
		reset: in bit;
		game_over: in std_logic;
		clk25: in bit;
		hold_out: out std_logic;
		inverse_out: out bit;
		ballspeed_out : out std_logic_vector(1 downto 0);
		paddlespeed_out : out bit;
		AI_out: out std_logic
	);
	end component;
	
	component SignalTiming  
		Port (						
			hsync, vsync : out bit;
			X : out integer range 0 to 640;
         Y : out integer range 0 to 480;
			clk25 : in  bit);
	end component;
	
	component ausgabe
		Port (
			X : in integer range 0 to 640;
         Y : in integer range 0 to 480;
			rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			rgb_out: out STD_LOGIC_VECTOR (2 downto 0)
			);
	end component;
	
	component inverter
		Port (
			inverse : in bit;
			rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			rgb_out: out STD_LOGIC_VECTOR (2 downto 0)
			);
	end component;
	
	component background
		Port (
			switch : in std_logic;
			X : in integer range 0 to 640;
			Y : in integer range 0 to 480;
			rgb_out : out STD_LOGIC_VECTOR (2 downto 0);
			clk25 : in bit);
	end component;
	
	component balken 
		Port (
			speed : in bit;
			hold : in std_logic;
			buttons : in std_logic_vector (3 downto 0);
			bar_left : out integer range 0 to 430;
			bar_right : out integer range 0 to 430;
			right_ai: in integer range 0 to 430;
			ai_enabled: in std_logic;
			X : in integer range 0 to 640;
			Y : in integer range 0 to 480;
			rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			rgb_out : out STD_LOGIC_VECTOR (2 downto 0);
			clk25 : in  bit;
			reset : in bit);
	end component;
	
	component ball is
    Port ( speed : in std_logic_vector (1 downto 0);
			  hold : in std_logic;
			  bar_left : in integer range 0 to 430;
			  bar_right : in integer range 0 to 430;
			  X : in  integer range 0 to 640;
			  Y : in  integer range 0 to 480;
			  ball_out : out bit;
			  rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			  rgb_out : out STD_LOGIC_VECTOR (2 downto 0);
			  clk25 : in  bit;
			  reset : in bit;
			  forward_game_over : out std_logic;
			  ball_y_pos_out: out integer range 0 to 480);
	end component;
	
	component ball_out_handler is
		Port ( ball_out : in bit;
			rgb_in : in STD_LOGIC_VECTOR (2 downto 0);
			rgb_out: out STD_LOGIC_VECTOR (2 downto 0);
			clk25 : in bit);
		end component;
		
		component AI is
    Port ( 
			right_pos: in integer range 0 to 430;
			right_pos_out: out integer range 0 to 430;
			ball_pos: in integer range 0 to 480
			);
		end component;
	
	signal intermediate_bar_left : integer range 0 to 430; -- output of balken
	signal intermediate_bar_right : integer range 0 to 430;
	signal intermediate_ball_out : bit;
	signal intermediate_X : integer range 0 to 640;
	signal intermediate_Y : integer range 0 to 480;
	signal intermediate_hsync, intermediat_vsync : bit;
	signal intermediate_clk25 : bit;
	signal intermediate_rgb1 : STD_LOGIC_VECTOR (2 downto 0); -- hintergrund
	signal intermediate_rgb2 : STD_LOGIC_VECTOR (2 downto 0); -- inverter
	signal intermediate_rgb3 : STD_LOGIC_VECTOR (2 downto 0); -- balken
	signal intermediate_rgb4 : STD_LOGIC_VECTOR (2 downto 0); -- ball
	signal intermediate_rgb5 : STD_LOGIC_VECTOR (2 downto 0); -- game over
	signal intermediate_keys : STD_LOGIC_VECTOR (13 downto 0);
	signal intermediate_reset : bit;
	signal intermediate_hold: std_logic;
	signal intermediate_inverse: bit;
	signal intermediate_game_over: std_logic;
	signal intermediate_ballspeed: std_logic_vector (1 downto 0);
	signal intermediate_paddlespeed: bit;
	signal intermediate_ballpos : integer range 0 to 480;
	signal intermediate_ai_enabled : std_logic;
	signal intermediate_bar_right2 : integer range 0 to 430; -- output of AI
	
begin

	process (clk50)
	begin
		if clk50'event and clk50='1' then
			if (intermediate_clk25 = '0') then
				intermediate_clk25 <= '1';
				if intermediate_keys(4) = '1' then
					intermediate_reset <= '1';
				else
					intermediate_reset <= '0';
				end if;
			else
				intermediate_clk25 <= '0';
			end if;
		end if;
	end process;
	
	keys : keyboard	port map (
		kbclk => global_kbclk,
		kbdata => global_kbdata,
		clk => clk50,
		keysout  => intermediate_keys);
			
	verarbeite_keys : process_keys	port map (
		keys_in => intermediate_keys(13 downto 6),
		reset => intermediate_reset,
		game_over => intermediate_game_over,
		clk25 => intermediate_clk25,
		hold_out => intermediate_hold,
		inverse_out => intermediate_inverse,
		ballspeed_out => intermediate_ballspeed,
		paddlespeed_out => intermediate_paddlespeed,
		AI_out => intermediate_ai_enabled);

	sigTime : SignalTiming port map (
		hsync => intermediate_hsync,
		vsync => intermediat_vsync,
		X => intermediate_X,
		Y => intermediate_Y,
		clk25 => intermediate_clk25);

	bg : background port map (
		switch => intermediate_keys(5), -- spacebar
		X => intermediate_X,
		Y => intermediate_Y,
		rgb_out => intermediate_rgb1,
		clk25 => intermediate_clk25);
		
	invers : inverter port map (
		inverse => intermediate_inverse,
		rgb_in => intermediate_rgb1,
		rgb_out => intermediate_rgb2);

	KI : AI port map (
		right_pos => intermediate_bar_right,
		right_pos_out => intermediate_bar_right2,
		ball_pos => intermediate_ballpos
		);
		
	male_balken : balken port map (
		speed => intermediate_paddlespeed,
		hold => intermediate_hold,
		bar_left => intermediate_bar_left,
		bar_right => intermediate_bar_right,
		right_ai => intermediate_bar_right2,
		ai_enabled => intermediate_ai_enabled,
		buttons => intermediate_keys (3 downto 0),
		X => intermediate_X,
		Y => intermediate_Y,
		rgb_in => intermediate_rgb2,
		rgb_out => intermediate_rgb3,
		clk25 => intermediate_clk25,
		reset => intermediate_reset);
		
	male_ball : ball port map (
		speed => intermediate_ballspeed (1 downto 0),
		hold => intermediate_hold,		
		bar_left => intermediate_bar_left,
		bar_right => intermediate_bar_right,
		ball_out => intermediate_ball_out,
		X => intermediate_X,
		Y => intermediate_Y,
		rgb_in => intermediate_rgb3,
		rgb_out => intermediate_rgb4,
		clk25 => intermediate_clk25,
		reset => intermediate_reset,
		forward_game_over => intermediate_game_over,
		ball_y_pos_out => intermediate_ballpos);
		
	ball_out_inverse : ball_out_handler port map (
	   ball_out => intermediate_ball_out,
		rgb_in => intermediate_rgb4,
		rgb_out => intermediate_rgb5,
		clk25 => intermediate_clk25);

	aus : ausgabe port map (
		X => intermediate_X,
		Y => intermediate_Y,
		rgb_in => intermediate_rgb5,
		rgb_out => global_rgb
		);

	global_hsync <= intermediate_hsync; 
	global_vsync <= intermediat_vsync;
	
end Behavioral;

