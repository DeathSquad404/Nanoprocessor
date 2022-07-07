library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity display_unit is
    port(Reg_val : in STD_LOGIC_VECTOR (3 downto 0);
         S_7_Seg_val : out STD_LOGIC_VECTOR (6 downto 0);
         S_7_Seg_sign : out STD_LOGIC_VECTOR (6 downto 0);
         Sign : out STD_LOGIC);
end display_unit;

architecture Behavioral of display_unit is
component Reg_7_seg
    Port ( Reg_val : in STD_LOGIC_VECTOR (3 downto 0);
           S_7_Seg : out STD_LOGIC_VECTOR (6 downto 0));
end component;

begin
Reg_7_seg_val: Reg_7_seg port map(
     Reg_val => Reg_val,
     S_7_Seg => S_7_Seg_val
 );

 S_7_Seg_sign(6) <= not(Reg_val(3)); 
 Sign <= Reg_val(3);
 S_7_Seg_sign(5 downto 0) <= "111111";

end Behavioral;
