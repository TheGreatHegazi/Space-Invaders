library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;

entity tb_game_controller is
end tb_game_controller;

architecture behavior of tb_game_controller is
	component game_controller is
		Generic(

			-----------GRAPHICS-----------------------
		
			LETTER_WIDTH        : integer := 8;
			SPRITE_WIDTH	    : integer := 32;
			SPRITE_HEIGHT	    : integer := 16;
			
			BULLET_SIZE        : integer := 8;
			
			SCORE_LETTER_HEIGHT  : integer := 16;
			SCORE_VALUE_HEIGHT   : integer := 32;
			
			
			ALIEN_HEIGHT_TOP  	: integer := 80;
			ALIEN_HEIGHT_BOTTOM : integer := 432;
			
			SHIP_HEIGHT   : integer := 448;
			DIV_HEIGHT	  : integer := 458;
			LIVES_HEIGHT  : integer := 480;	
			
			ROW_MSB		  : integer := 3;
			ROW_LSB       : integer := 1;
			COL_MSB       : integer := 4;
			COL_LSB       : integer := 1;			

         SCREEN_WIDTH  : integer := 640;
         SCREEN_HEIGHT : integer := 480;		


			---------------GAMEPLAY----------------------

			ADDRESS_WIDTH 		: integer := 3;				
			ALIEN_MOVE_DELAY 	: integer := 8;
			ALIEN_DOWN_DELAY 	: integer := 8;
         NUM_ALIENS    		: integer := 60   

           );
		Port (
			clk             : in std_logic; -- Clock for the system
			rst             : in std_logic; -- Resets the state machine

			-- Inputs
			shoot           : in std_logic; -- User shoot
			move_left       : in std_logic; -- User left
			move_right      : in std_logic; -- User right
		  
			pixel_x         : in integer; -- X position of the cursor
			pixel_y		   : in integer; -- Y position of the cursor
        
			-- Outputs
			pixel_color		: out std_logic_vector (2 downto 0)
				
			);
			
			end component;
			
		signal clk : std_logic;
		signal rst : std_logic;
		
		signal shoot_in : std_logic;
		signal move_left_in : std_logic;
		signal move_right_in : std_logic;
		
		signal pixel_x_in  : integer;
		signal pixel_y_in : integer;
		
		signal pixel_color_out: std_logic_vector (2 downto 0);

		constant clk_period : time := 10 ns;

		variable current_state : integer := 0;

begin

	dut: game_controller
	port map (
		clk => clk,
		rst => rst,
		shoot => shoot_in,
		move_left => move_left_in,
		move_right => move_right_in,
		pixel_x => pixel_x_in,
		pixel_y => pixel_y_in,
		pixel_color => pixel_color_out
	);

	clk_process : process
	begin
		clk_in <= '0';
		wait for clk_period/2;
		clk_in <= '1';
		wait for clk_period/2;
	end process;

	test : process
	begin
		
	end process;	

end behavior;

















