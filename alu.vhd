library ieee;
use ieee.std_logic_1164.all;

entity alu is 
	port (A, B : in std_logic_vector(3 downto 0);
			s	  : in std_logic_vector(0 to 1);
			f	  : out std_logic_vector(3 downto 0);
			Z,C,V,N : out std_logic);
end alu;

architecture logica of alu is	
	component fulladder4subtracao
	port(X, Y : in std_logic_vector(3 downto 0);
		  s	 : out std_logic_vector(3 downto 0));
	end component fulladder4subtracao;
	
	component fulladder4somador is
	port(Cin : IN STD_LOGIC;
			X, Y : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			Cout : OUT STD_LOGIC );
	end component fulladder4somador;
	
	signal resulsoma : std_logic_vector(3 downto 0);
	signal resulsub  : std_logic_vector(3 downto 0);
	signal Cin2      : std_logic;
	signal cout      : std_logic;
	
	begin
		conta1 : fulladder4subtracao port map (A, B, resulsub);
		conta2 : fulladder4somador port map (Cin2, A, B, resulsoma, cout);
		
		process (A,B,s, resulsub, resulsoma, Cin2)
		begin
		if s="00" then
			f <= resulsub(3 downto 0);
			
		elsif s="01" then
			
			f <= resulsoma(3 downto 0);
			
		elsif s="10" then
			f <= A and B;
		else
			f <= A or B;
		end if;
		end process;
end logica;