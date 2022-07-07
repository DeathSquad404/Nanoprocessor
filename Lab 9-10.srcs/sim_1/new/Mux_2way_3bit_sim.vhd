library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_2way_3bit_sim is
--  Port ( );
end Mux_2way_3bit_sim;

architecture Behavioral of Mux_2way_3bit_sim is
component Mux_2way_3bit
--    port(   Adder_3 : in STD_LOGIC_VECTOR (2 downto 0);
--            JUMP_TO : in STD_LOGIC_VECTOR (2 downto 0);
--            O : out STD_LOGIC_VECTOR (2 downto 0);
--            S : in STD_LOGIC);
Port ( Jump_addr : in STD_LOGIC_VECTOR (2 downto 0);
       Incr_addr : in STD_LOGIC_VECTOR (2 downto 0);
       Jump_flag : in STD_LOGIC;
       Addr : out STD_LOGIC_VECTOR (2 downto 0));
end component;
signal Incr_addr,Jump_addr,Addr : std_logic_vector(2 downto 0);
signal Jump_flag : std_logic;
begin
UUT: Mux_2way_3bit
port map(
            Jump_addr(2 downto 0)=>Jump_addr(2 downto 0),
            Incr_addr(2 downto 0)=>Incr_addr(2 downto 0),
            Addr(2 downto 0)=> Addr(2 downto 0),
            Jump_flag=> Jump_flag);
process
begin

-- Index: 190331A : 101110011101111011
-- Index: 190215X : 101110011100000111
-- Index: 190137J : 101110011010111001

-- Index: 190152B : 101110011011001000
-- Index: 190495D : 101110100000011111
-- Index: 190507U : 101110100000101011

Incr_addr<="001";
Jump_addr<="100";
Jump_flag<='0';

WAIT FOR 100ns;
Jump_flag<='1';
WAIT;
            


end process;
end Behavioral;