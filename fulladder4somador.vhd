LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fulladder4somador IS
	PORT (Cin : IN STD_LOGIC;
			X, Y : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			Cout : OUT STD_LOGIC );
END fulladder4somador;

ARCHITECTURE alu OF fulladder4somador IS
	COMPONENT fulladder4
		PORT (Cin, x, y : IN STD_LOGIC;
				s, Cout : OUT STD_LOGIC );
	END COMPONENT;
	SIGNAL C : STD_LOGIC_VECTOR(1 TO 3) ;
BEGIN
	stage0: fulladder4 PORT MAP (Cin, X(0), Y(0), S(0), C(1));
	stage1: fulladder4 PORT MAP (C(1), X(1), Y(1), S(1), C(2));
	stage2: fulladder4 PORT MAP (C(2), X(2), Y(2), S(2), C(3));
	stage3: fulladder4 PORT MAP (C(3), X(3), Y(3), S(3), Cout);
END alu;
