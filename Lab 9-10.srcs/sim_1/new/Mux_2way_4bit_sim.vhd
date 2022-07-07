library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2way_4bit_sim is
--  Port ( );
end Mux_2way_4bit_sim;

architecture Behavioral of Mux_2way_4bit_sim is

component Mux_2way_4bit
   Port ( Result : in STD_LOGIC_VECTOR (3 downto 0);
       Imd_val : in STD_LOGIC_VECTOR (3 downto 0);
       Enb : in STD_LOGIC;
       O : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal Result,Imd_val,O : std_logic_vector(3 downto 0);
signal enb : std_logic;
begin
UUT: Mux_2way_4bit
port map(
            result(3 downto 0)=>result(3 downto 0),
            imd_val(3 downto 0)=>imd_val(3 downto 0),
            O(3 downto 0)=> O(3 downto 0),
            enb=> enb);
process
begin

-- Index: 190331A : 101110011101111011
-- Index: 190215X : 101110011100000111
-- Index: 190137J : 101110011010111001

-- Index: 190152B : 101110011011001000
-- Index: 190495D : 101110100000011111
-- Index: 190507U : 101110100000101011

result<="0010";
imd_val<="1000";
enb<='0';

WAIT FOR 100ns;
enb<='1';
WAIT;
            


end process;
end Behavioral;
