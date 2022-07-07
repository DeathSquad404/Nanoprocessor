----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2018 01:35:39 PM
-- Design Name: 
-- Module Name: ProgramRom_Sim - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProgramRom_Sim is
--  Port ( );
end ProgramRom_Sim;

architecture Behavioral of ProgramRom_Sim is
   COMPONENT ProgramROM
PORT(  Memory_Select    :    IN    STD_LOGIC_VECTOR (2 DOWNTO 0);
        To_Instruction_bus    :    OUT    STD_LOGIC_VECTOR (11 DOWNTO 0) 
      );
END COMPONENT;

SIGNAL Memory_Select    :    STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL To_Instruction_bus    :    STD_LOGIC_VECTOR (11 DOWNTO 0);


BEGIN

UUT: ProgramROM PORT MAP(
    Memory_Select(2 DOWNTO 0) => Memory_Select(2 DOWNTO 0),
    To_Instruction_bus(11 DOWNTO 0) =>To_Instruction_bus(11 DOWNTO 0)
     
);

PROCESS
BEGIN

-- Index: 190331A : 101110011101111011
-- Index: 190215X : 101110011100000111
-- Index: 190137J : 101110011010111001

-- Index: 190152B : 101110011011001000
-- Index: 190495D : 101110100000011111
-- Index: 190507U : 101110100000101011

     Memory_Select <= "000";
     WAIT FOR 100 ns;
     Memory_Select <= "001";
     WAIT FOR 100 ns;
     Memory_Select <= "010";
     WAIT FOR 100 ns;
     Memory_Select <= "011";
     WAIT FOR 100 ns;
     Memory_Select <= "100";
     WAIT FOR 100 ns;
     Memory_Select <= "101";
     WAIT FOR 100 ns;
     Memory_Select <= "110";
     WAIT FOR 100 ns;
     Memory_Select <= "111";
   WAIT; -- will wait forever
END PROCESS;

end Behavioral;