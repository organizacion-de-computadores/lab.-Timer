library IEEE; 
use IEEE.std_logic_1164.all;


entity timer_solo is 
port(
	clk: in std_logic;
	boton: IN std_logic; 
	reset: IN std_logic; 
	tiempo: OUT std_logic_vector(7 downto 0);
	int_timer: out std_logic


);
end Entity timer_solo; 

--******************************--
--Definicion de Arquitectura------
--******************************--

architecture timer_soloArch of timer_solo is  

component control is 
port(
				boton		:	IN			STD_LOGIC;
				reset		:	IN			STD_LOGIC;
				enable	:	out		std_LOGIC
);
end component control;

component timer is 
port(
				clk: IN std_logic;
				reset: IN std_logic;
				enable: IN std_logic; 
				tiempo: OUT std_logic_vector(7 downto 0);
				fin_timer: out std_logic
);
end component timer;

component divisor is
port (
	clk: 	in STD_LOGIC;
	clk_seg:		out STD_LOGIC
);
end component divisor;


--Conexion entre bloques--
  
	signal enable_signal,clk_signal: std_logic;

begin

U1: control port map(boton,reset,enable_signal); 
U2: timer port map(clk_signal,reset,enable_signal,tiempo,int_timer);
U3: divisor port map(clk,clk_signal);


end timer_soloArch;