library IEEE; 
use IEEE.std_logic_1164.all;
library ALTERA;
use ALTERA.altera_primitives_components.all;

entity timer is 
port(
clk: IN std_logic;
reset: IN std_logic;
enable: IN std_logic; 
tiempo: OUT std_logic_vector(7 downto 0);
fin_timer: out std_logic
 ); 
end entity timer; 

--*************************************************
--**********DEFINICION DE ARQUITECTURA*************
--************************************************* 

architecture timerArch of timer is 

component dffe is
port(
d, clk, clrn, prn, ena: IN std_logic;
q:OUT std_logic
);
end component dffe; 

signal clear,d0,d1,d2,d3,d4,d5,d6,d7: std_logic;
signal q: std_logic_vector(7 downto 0);
signal s: std_logic_vector(6 downto 0);

begin
--clear <= reset; --activo en bajo 
d0<=NOT q(0);
d1<=NOT q(1);
d2<=NOT q(2);
d3<=NOT q(3);
d4<=NOT q(4);
d5<=NOT q(5);
d6<=NOT q(6);
d7<=NOT q(7);
F1: dffe port map(d0,clk,  reset, '1', enable, q(0));
F2: dffe port map(d1,clk,  reset, '1', s(0) , q(1));
F3: dffe port map(d2,clk,  reset, '1', s(1) , q(2));
F4: dffe port map(d3,clk,  reset, '1', s(2) , q(3));
F5: dffe port map(d4,clk,  reset, '1', s(3) , q(4));
F6: dffe port map(d5,clk,  reset, '1', s(4) , q(5));
F7: dffe port map(d6,clk,  reset, '1', s(5) , q(6));
F8: dffe port map(d7,clk,  reset, '1', s(6) , q(7));

s(0)<=enable AND q(0);
s(1)<=s(0) AND q(1);
s(2)<=s(1) AND q(2);
s(3)<=s(2) AND q(3);
s(4)<=s(3) AND q(4);
s(5)<=s(4) AND q(5);
s(6)<=s(5) AND q(6);

fin_timer<=(q(0) AND q(1) AND q(2) AND q(3)and q(4) AND q(5) AND q(6) AND q(7));
tiempo<=(q(7) & q(6) & q(5) & q(4) & q(3) & q(2) & q(1) & q(0));
end timerArch;