--PROJETO 1 - UNIDADE LÓGICA ARITMÉTICA
	--Alexandre Oliveira
	--Hugo Tahara Menegatti

library ieee;
use ieee.std_logic_1164.all;

entity alu is 
	port (A, B : in std_logic_vector(3 downto 0);		--entradas dos números
			s	  : in std_logic_vector(0 to 1);				--sinal do multiplexador
			f	  : out std_logic_vector(3 downto 0);		--saída da alu
			Z,C,V,N : out std_logic);							--flags
end alu;

architecture logica of alu is	

	component fulladder4somador is							--componente declarado do somador ripple carry
	port(Cin : IN STD_LOGIC;
			X, Y : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			Cout : OUT STD_LOGIC );
	end component fulladder4somador;
	
	signal B2		  : std_logic_vector(3 downto 0);	--sinal interno para B que realizará a soma ou subtração
	signal resulsoma : std_logic_vector(3 downto 0);	--sinal interno para a saída da soma
	signal cout      : std_logic;
	signal cin       : std_logic;								--transforma o número da subtração em complemento de dois
	signal f2       : std_logic_vector(3 downto 0);		--sinal interno para receber o resultado e poder comparar para fazer os flags
	
	
	begin
	
	--lógica e comportamento para a ALU
		--"00" para soma
		--"10" para subtração
		--"01" para operação AND
		--"11" para operação OR
		
		B2 <= not B when s="10" else B;						--barra o número caso a subtração tenha sido escolhida
		cin <= '1' when s="10" else '0';						--cin = 1 para transformar o número barrado em C2
		
		conta1 : fulladder4somador port map (cin, A, B2, resulsoma, cout);
		
		with s select												--escolhe a saída e resultado para o f, das operações realizadas
			f2 <= A and B when "01",
				  A or B when "11",
				  resulsoma when others;						--resulsoma é a saída tanto para a soma quanto para subtração
				  
	--condições para os flags
			--flag de zero
			Z <= not (f2(3) or f2(2) or f2(1) or f2(0));
			
			--flag de carry
			with s select
				C <= '0' when "01",
					  '0' when "11",
					  cout when others;
			
			--flag de overflow
			with s select
				V <= '0' when "01",
					  '0' when "11",
					  A(3) xor B2(3) xor resulsoma(3) xor cout when others;
			
			--flag de resultado número negativo
			with s select
				N <= resulsoma(3) when "10",
					  '0' when others;
			
			
			f <= f2;													--passa a saída do sinal interno para a saída final
		
end logica;

