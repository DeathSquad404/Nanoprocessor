library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_7_seg is
    Port ( Reg_val : in STD_LOGIC_VECTOR (3 downto 0);
           S_7_Seg : out STD_LOGIC_VECTOR (6 downto 0));
end Reg_7_seg;

architecture Behavioral of Reg_7_seg is

COMPONENT LUT_16_7 PORT(
       address : in STD_LOGIC_VECTOR (3 downto 0);
       data : out STD_LOGIC_VECTOR (6 downto 0)
    );
END COMPONENT;

begin
LUT_16_7_0: LUT_16_7 port map(
    address => Reg_val,
    data => S_7_Seg 
);

end Behavioral;
