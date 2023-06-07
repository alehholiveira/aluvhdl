LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fulladder4subtracao IS
    PORT (X, Y : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			 S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END fulladder4subtracao;

ARCHITECTURE alu OF fulladder4subtracao IS
	COMPONENT fulladder4
		PORT (Cin, X, Y : IN STD_LOGIC;
				  s, Cout : OUT STD_LOGIC);
	END COMPONENT;
   SIGNAL vaium : STD_LOGIC; -- Adiciona 1 para o numero barrado
   SIGNAL Z : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL COUT : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
	Z <= NOT Y;  -- Número em complemento de II
   stage0 : fulladder4 PORT MAP (vaium, X(0), Z(0), S(0), COUT(0));
   stage1 : fulladder4 PORT MAP (COUT(0), X(1), Z(1), S(1), COUT(1));
   stage2 : fulladder4 PORT MAP (COUT(1), X(2), Z(2), S(2), COUT(2));
   stage3 : fulladder4 PORT MAP (COUT(2), X(3), Z(3), S(3), vaium);
END alu;
