library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Program_Counter_Sim is
--  Port ( );
end Program_Counter_Sim;

architecture Behavioral of Program_Counter_Sim is

COMPONENT Program_Counter

Port ( Inp : in STD_LOGIC_VECTOR (2 downto 0); 
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           M_Sel : out STD_LOGIC_VECTOR (2 downto 0));
   END COMPONENT;


   SIGNAL Inp	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
   SIGNAL Reset	:	STD_LOGIC;
   SIGNAL Clk	:	STD_LOGIC;
   SIGNAL M_Sel :	STD_LOGIC_VECTOR (2 DOWNTO 0);

BEGIN

   UUT: Program_Counter PORT MAP(
		M_Sel(2 downto 0) => M_Sel(2 downto 0), 
		Inp(2 downto 0) =>Inp(2 downto 0), 
		Reset => Reset, 
		Clk => Clk
   );
PROCESS
   BEGIN
   -- Index: 190331A : 101110011101111011
   -- Index: 190215X : 101110011100000111
   -- Index: 190137J : 101110011010111001
   
   -- Index: 190152B : 101110011011001000
   -- Index: 190495D : 101110100000011111
   -- Index: 190507U : 101110100000101011
		Inp<= "001";
           Clk <= '0';
           Reset <= '0';
           WAIT FOR 100 ns;
           Clk <= '1';
           WAIT FOR 100 ns;
           Clk <= '0';
           WAIT FOR 100 ns;
           Inp<="101";
           Clk <= '1';
           WAIT FOR 100 ns;
           Clk <= '0';        
           WAIT FOR 100 ns;
           Clk <= '1';
           Reset<='1';
           WAIT FOR 100 ns;
           Clk <= '0';
           Reset<='0';
         WAIT; 
   END PROCESS;

end Behavioral;

