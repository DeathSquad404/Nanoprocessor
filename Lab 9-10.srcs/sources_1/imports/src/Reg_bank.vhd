library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_bank is
    Port ( Clk : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (3 downto 0);
           reset : in STD_LOGIC;
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0);
           reg_enb : in STD_LOGIC_VECTOR (2 downto 0));
end Reg_bank;

architecture Behavioral of Reg_bank is

COMPONENT Decoder_3_to_8
    Port (  I : in STD_LOGIC_VECTOR (2 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

COMPONENT Reg
Port (     D : in STD_LOGIC_VECTOR (3 downto 0);
           Res : in STD_LOGIC;
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

signal decoder_out:std_logic_vector(7 downto 0); 
signal bank_in :std_logic_vector(3 downto 0); 

begin

Decoder_3_to_8_0 : Decoder_3_to_8
port map(
    I => reg_enb,
    EN => '1',
    Y => decoder_out
);

Reg0 : Reg
port map(
    D => "0000",
    En =>'1',
    Res => reset,
    Clk => Clk,
    Q => R0
);
Reg1 : Reg
port map(
    D => input,
    En => decoder_out(1),
    Res => reset,
    Clk => Clk,
    Q => R1
);
Reg2 : Reg
port map(
    D => input,
    En => decoder_out(2),
    Res => reset,
    Clk => Clk,
    Q => R2
);
Reg3 : Reg
port map(
    D => input,
    En => decoder_out(3),
    Res => reset,
    Clk => Clk,
    Q => R3
);
Reg4 : Reg
port map(
    D => input,
    En => decoder_out(4),
    Res => reset,
    Clk => Clk,
    Q => R4
);
Reg5 : Reg
port map(
    D => input,
    En => decoder_out(5),
    Res => reset,
    Clk => Clk,
    Q => R5
);
Reg6 : Reg
port map(
    D => input,
    En => decoder_out(6),
    Res => reset,
    Clk => Clk,
    Q => R6
);
Reg7 : Reg
port map(
    D => input,
    En => decoder_out(7),
    Res => reset,
    Clk => Clk,
    Q => R7
);

end Behavioral;
