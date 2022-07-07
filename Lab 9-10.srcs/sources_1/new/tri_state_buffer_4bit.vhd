
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tri_state_buffer_4bit is
    Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
           Enable : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (3 downto 0));
end tri_state_buffer_4bit;

architecture Behavioral of tri_state_buffer_4bit is

begin
Output<=Input WHEN (Enable='1') else "ZZZZ";

end Behavioral;
