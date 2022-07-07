----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2021 04:11:25 PM
-- Design Name: 
-- Module Name: Instruction_decoder - Behavioral
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

entity Instruction_decoder is
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
end Instruction_decoder;

architecture Behavioral of Instruction_decoder is
component Decoder_2_to_4
    port (I: in std_logic_vector(1 downto 0);
          EN: in std_logic;
          Y: out std_logic_vector(3 downto 0));
end component;
SIGNAL MOV, ADD, NEG, JZR, add_or_neg, add_or_neg_or_jzr: std_logic;
begin
Decoder_2_to_40 : Decoder_2_to_4
   PORT MAP(I => Instruction(11 downto 10),
            Y(0) => ADD,
            Y(1) => NEG,
            Y(2) => MOV,
            Y(3) => JZR,
            EN => '1');
add_or_neg <= ADD OR NEG;
add_or_neg_or_jzr <= add_or_neg or JZR;           
load_select <= MOV;
Reg_enable <= Instruction(9 downto 7);
imd_val <= Instruction(3 downto 0);
reg_sel_1 <= Instruction(9 downto 7) and (add_or_neg_or_jzr,add_or_neg_or_jzr,add_or_neg_or_jzr) ;
reg_sel_2 <= Instruction(6 downto 4) and (add_or_neg,add_or_neg,add_or_neg);
sub_sel <= NEG;
jump_addr<= Instruction(2 downto 0);
jump_flag <= JZR and not(Reg_val(0) or Reg_val(1) or Reg_val(2) or Reg_val(3));

end Behavioral;