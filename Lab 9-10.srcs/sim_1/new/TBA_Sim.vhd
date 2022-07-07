library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TBA_Sim is
--  Port ( );
end TBA_Sim;

architecture Behavioral of TBA_Sim is
Component TBA
    port(
               A : in STD_LOGIC_VECTOR (2 downto 0);
               C_in : in std_logic; 
               S : out STD_LOGIC_VECTOR (2 downto 0);
               C_out : out STD_LOGIC
);
end component;
SIGNAL A : std_logic_vector(2 downto 0);
signal C_in : std_logic;
signal C_out : std_logic;
signal S : std_logic_vector(2 downto 0);
begin
UUT: TBA PORT MAP(
    A(2 downto 0)=>A(2 downto 0),
    C_in=>C_in,
    C_out=>C_out,
    S(2 downto 0)=>S(2 downto 0)
);
process
begin
    A<="000";
    C_in<='0';

    wait for 100ns;   
    A<="010";
    

  wait for 100ns;
    A<="100";
    
    wait;
    
 end process;
end Behavioral;

