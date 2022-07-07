library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_DFF is
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end Reg_DFF;

architecture Behavioral of Reg_DFF is

begin
    process (Clk) begin
        if (rising_edge(Clk)) then
                if Res = '1' then
                    Q<='0';
                    Qbar<='1';
                else if En = '1' then
                    Q<=D;
                    Qbar <= not D;
                end if;
            end if;
        end if;
    end process;        
end Behavioral;