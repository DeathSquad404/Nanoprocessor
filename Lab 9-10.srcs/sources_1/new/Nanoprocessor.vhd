library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nanoprocessor is
    Port (  RESET : in STD_LOGIC;
            CLK : in STD_LOGIC;           
            ZERO_FLAG : out STD_LOGIC;
            OVERFLOW : out STD_LOGIC;
            S_7_Seg_val : out STD_LOGIC_VECTOR (6 downto 0);
--            S_7_Seg_sign : out STD_LOGIC_VECTOR (6 downto 0);
            Sign: out STD_LOGIC;
            S_LED : out STD_LOGIC_VECTOR (3 downto 0);
            an : out std_logic_vector(3 downto 0)
             );
    end Nanoprocessor;

architecture Behavioral of Nanoprocessor is

component MUX_8_to_1 is
    Port ( R0 : in STD_LOGIC_VECTOR (3 downto 0);
           R1 : in STD_LOGIC_VECTOR (3 downto 0);
           R2 : in STD_LOGIC_VECTOR (3 downto 0);
           R3 : in STD_LOGIC_VECTOR (3 downto 0);
           R4 : in STD_LOGIC_VECTOR (3 downto 0);
           R5 : in STD_LOGIC_VECTOR (3 downto 0);
           R6 : in STD_LOGIC_VECTOR (3 downto 0);
           R7 : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0));
end component;

component Reg_bank is
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
end component;

component Add_sub is
    Port ( A :in STD_LOGIC_Vector(3 downto 0);
           B :in STD_LOGIC_Vector(3 downto 0);
           Ctrl : in STD_LOGIC;
           S :out STD_LOGIC_Vector(3 downto 0);
           Overflow : out STD_LOGIC;
           Z_flag : out STD_LOGIC);
end component;

component Program_Counter is
    Port ( Inp : in STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           M_Sel : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component TBA is
    Port ( A :in STD_LOGIC_Vector(2 downto 0);
           C_IN :in STD_LOGIC;
           S :out STD_LOGIC_Vector(2 downto 0));
end component;

component MUX_2way_3bit is
    Port ( Jump_addr : in STD_LOGIC_VECTOR (2 downto 0);
           Incr_addr : in STD_LOGIC_VECTOR (2 downto 0);
           Jump_flag : in STD_LOGIC;
           Addr : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component MUX_2way_4bit is
    Port ( Result : in STD_LOGIC_VECTOR (3 downto 0);
           Imd_val : in STD_LOGIC_VECTOR (3 downto 0);
           Enb : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Instruction_decoder is
    Port ( Instruction: in std_logic_vector(11 downto 0);
           Reg_val: in std_logic_vector(3 downto 0);
           Reg_enable: out std_logic_vector(2 downto 0);
           load_select: out std_logic;
           imd_val: out std_logic_vector(3 downto 0);
           reg_sel_1: out std_logic_vector(2 downto 0);
           reg_sel_2: out std_logic_vector(2 downto 0);
           sub_sel: out std_logic;
           jump_flag: out std_logic;
           jump_addr: out std_logic_vector(2 downto 0)
    );
end component;

component display_unit is
    port(Reg_val : in STD_LOGIC_VECTOR (3 downto 0);
         S_7_Seg_val : out STD_LOGIC_VECTOR (6 downto 0);
         S_7_Seg_sign : out STD_LOGIC_VECTOR (6 downto 0);
         Sign : out STD_LOGIC);
end component;

component ProgramRom is
    Port ( Memory_Select  : in STD_LOGIC_VECTOR (2 downto 0);
           To_Instruction_bus : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC
           );
end component;

signal CLK_OUT,CLK_OUT_2: std_logic;           
signal R0,R1,R2,R3,R4,R5,R6,R7 : std_logic_vector(3 downto 0); 
signal IMD_VAL, ADD_SUB_RES, SEL_REG_VAL, MUX_A_OUT,MUX_B_OUT:std_logic_vector(3 downto 0);
signal REG_SEL_1, REG_SEL_2, REG_ENABLE,JUMP_ADDR : std_logic_vector(2 downto 0);
signal JUMP_FLAG, LOAD_SELECT,SUB_SEL, zero_F: std_logic;
signal INSTRUCTION : std_logic_vector(11 downto 0);
signal INCR_ADDR, NEXT_ADDR, M_SEL: std_logic_vector(2 downto 0);


begin

Slow_Clk_0: Slow_Clk 
    Port map ( Clk_in => CLK,
           Clk_out => CLK_OUT
           );

           
Instruction_decoder_0: Instruction_decoder 
    Port map ( Instruction => INSTRUCTION,
               Reg_val => MUX_A_OUT,
               Reg_enable => REG_ENABLE,
               load_select => LOAD_SELECT,
               imd_val => IMD_VAL,
               reg_sel_1 => REG_SEL_1,
               reg_sel_2 => REG_SEL_2,
               sub_sel => SUB_SEL,
               jump_flag => JUMP_FLAG,
               jump_addr => JUMP_ADDR
        );
    
ProgramRom_0: ProgramRom 
    Port map( Memory_Select => M_SEL,
           To_Instruction_bus => INSTRUCTION
           );
           
display_unit_0: display_unit 
    Port map(Reg_val => R7, 
        S_7_Seg_val => S_7_Seg_val,
--        S_7_Seg_sign => S_7_Seg_sign,
        Sign => Sign
        );

MUX_2way_4bit_0: MUX_2way_4bit 
    Port map ( Result => ADD_SUB_RES,
           Imd_val => IMD_VAL,
           Enb => LOAD_SELECT,
           O => SEL_REG_VAL );        

MUX_2way_3bit_0: MUX_2way_3bit 
    Port map ( Jump_addr => JUMP_ADDR,
           Incr_addr => INCR_ADDR,
           Jump_flag => JUMP_FLAG,
           Addr => NEXT_ADDR
           );
           
TBA_0: TBA 
    Port map ( A => M_SEL,
          C_IN => '0',
          S => INCR_ADDR
          );      
          
Program_Counter_0: Program_Counter 
    Port map ( Inp => NEXT_ADDR, 
         Reset => RESET,
         Clk => CLK_OUT,
         M_Sel => M_SEL  
         );        

Add_sub_0: Add_sub 
    Port map ( A => MUX_A_OUT, 
           B => MUX_B_OUT,
           Ctrl => SUB_SEL,
           S => ADD_SUB_RES,
           Overflow => OVERFLOW,
           Z_flag => zero_F
           );

Reg_bank_0: Reg_bank 
    Port map( Clk => CLK_OUT,
           input => SEL_REG_VAL,
           reset => RESET,
           R0 => R0,
           R1 => R1,
           R2 => R2,
           R3 => R3,
           R4 => R4,
           R5 => R5,
           R6 => R6,
           R7 => R7,
           reg_enb => REG_ENABLE
           );

MUX_8_to_1_A: MUX_8_to_1 
    Port map( 
            R0 => R0,
           R1 => R1, 
           R2 => R2, 
           R3 => R3, 
           R4 => R4, 
           R5 => R5, 
           R6 => R6, 
           R7 => R7, 
           O => MUX_A_OUT,
           S => REG_SEL_1
           );
           
MUX_8_to_1_B: MUX_8_to_1 
    Port map( 
           R0 => R0, 
          R1 => R1, 
          R2 => R2, 
          R3 => R3, 
          R4 => R4, 
          R5 => R5, 
          R6 => R6, 
          R7 => R7, 
          O => MUX_B_OUT,
          S => REG_SEL_2
          );
                      

S_LED <= R7;
ZERO_FLAG <= (not (INSTRUCTION(11) or INSTRUCTION(10))) and zero_F;
an <= "1110";
end Behavioral;
