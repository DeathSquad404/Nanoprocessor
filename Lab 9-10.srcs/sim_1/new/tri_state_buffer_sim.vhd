library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tri_state_buffer_sim is
--  Port ( );
end tri_state_buffer_sim;

architecture Behavioral of tri_state_buffer_sim is

component tri_state_buffer_4bit
    Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
    Enable : in STD_LOGIC;
    Output : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal input : std_logic_vector(3 downto 0);
signal output : std_logic_vector(3 downto 0);
signal enable : std_logic;

begin
UUT: tri_state_buffer_4bit
port map( input => input,
           output=> output,
           enable=>enable);
process
begin

input<= "1100";
enable<='0';

WAIT FOR 100ns;
enable<='1';
wait;

end process;
end Behavioral;
