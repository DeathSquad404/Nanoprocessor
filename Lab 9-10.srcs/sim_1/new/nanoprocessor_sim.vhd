library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity nanoprocessor_sim is
--  Port ( );
end nanoprocessor_sim;

architecture Behavioral of nanoprocessor_sim is
component Nanoprocessor
    Port (  RESET : in STD_LOGIC; -- clr
            CLK : in STD_LOGIC;   -- clk
            ZERO_FLAG : out STD_LOGIC; -- zero
            OVERFLOW : out STD_LOGIC; -- c
            S_7_Seg_val : out STD_LOGIC_VECTOR (6 downto 0); 
--            S_7_Seg_sign : out STD_LOGIC_VECTOR (6 downto 0);
            Sign: out STD_LOGIC;
            S_LED : out STD_LOGIC_VECTOR (3 downto 0);
            an : out std_logic_vector(3 downto 0)
             );
            
end component;
signal RESET,CLK : std_logic;
signal ZERO_FLAG,OVERFLOW, Sign : std_logic;
signal S_7_Seg_val : std_logic_vector(6 downto 0);
signal S_LED : std_logic_vector(3 downto 0);
constant clock_period: time := 10ns;

begin
UUT : Nanoprocessor 
    port map(   RESET=> RESET,
                CLK=>CLK,
                ZERO_FLAG=>ZERO_FLAG,
                OVERFLOW=>OVERFLOW,
                S_7_Seg_val=> S_7_Seg_val,
--                S_7_Seg_sign => S_7_Seg_sign,
                Sign => Sign,
                S_LED=> S_LED

    );
clock_process: process
     begin
     Clk <= '0';
     wait for clock_period/2;
     Clk <= '1';
     wait for clock_period/2;
  end process;
sim : process
begin
    RESET<='1';
    WAIT FOR 100ns;
    RESET<='0';
WAIT;
end process;
end Behavioral;

