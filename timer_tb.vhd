LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY timer_tb IS
END ENTITY timer_tb;
-------------------------------------------------------
ARCHITECTURE testbench OF timer_tb IS
	SIGNAL boton_tb				:	STD_LOGIC;
	SIGNAL clk_tb				:	STD_LOGIC;
	SIGNAL reset_tb				:	STD_LOGIC; 
	constant clk_period: time:= 20 ns;
	-------------------------------------------------------
BEGIN
	DUT: ENTITY work.timer_solo
	PORT MAP(		clk =>clk_tb,
						boton => boton_tb,
						reset => reset_tb);
	clk_process: process
begin
clk_tb<='0';
wait for clk_period/2;
clk_tb<='1';
wait for clk_period/2;
end process;

	signal_generation: PROCESS
	BEGIN

		reset_tb	<='0';
		WAIT FOR 40 ns;
		
		reset_tb	<='1';
		WAIT FOR 40 ns;

		boton_tb	<='0';
		WAIT FOR 40 ns;
		
		boton_tb	<='1';
		WAIT FOR 200 us;
		

		
	END PROCESS signal_generation;
	
END ARCHITECTURE;