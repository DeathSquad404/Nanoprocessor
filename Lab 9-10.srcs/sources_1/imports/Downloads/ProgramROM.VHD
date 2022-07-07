library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ProgramRom is
    Port ( Memory_Select  : in STD_LOGIC_VECTOR (2 downto 0);
           To_Instruction_bus : out STD_LOGIC_VECTOR (11 downto 0));
end ProgramRom;

architecture Behavioral of ProgramRom is

type rom_type is array (0 to 7) of STD_LOGIC_VECTOR(11 downto 0);
SIGNAL programRom:rom_type:=(
"100010000011", -- MOVI R1, 3
"100100000001", -- MOVI R2, 1
"010100000000", -- NEG R2
"001110010000", -- ADD R7, R1
"000010100000", -- ADD R1, R2
"110010000111", -- JZR R1,7
"110000000011", -- JZR R0,3
"110000000111"  -- ADD R0,R0
);
begin

To_Instruction_bus <= programRom(to_integer(unsigned(Memory_Select)));

end Behavioral;
