LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
-------------------------------------------------------
ENTITY Control IS
	PORT (	boton		:	IN			STD_LOGIC;
				reset		:	IN			STD_LOGIC;
				enable	:	out		std_LOGIC);  
END ENTITY Control; 

Architecture FSM OF Control IS 
TYPE states IS  (	State0,State1,State2);
SIGNAL state: states;
BEGIN 
---------------sequential section:------------------------
PROCESS (reset,boton,state)
BEGIN  
     IF (reset= '0') THEN
			state <= state0;
		ELSE	
   CASE state IS
	    WHEN state0=> 
	      IF (boton='0') THEN
			state<= State1;
			ELSE 
			state<=State0; 
	      END IF; 
	    WHEN state1=>
			IF (boton='1') THEN
			state<= State2;
			ELSE 
			state<=State1; 
	      END IF; 
	  WHEN state2=> 
			state<= State2; 	    
END CASE ;
END IF;
END PROCESS;

process(state)
	
		begin
		case state is
				when state0 =>
				enable<='0';
				
				when state1 =>
				enable<='0';
				
				WHEN state2 =>
				enable<='1';								
								
				END CASE;
END PROCESS;
END ARChitecture FSM;