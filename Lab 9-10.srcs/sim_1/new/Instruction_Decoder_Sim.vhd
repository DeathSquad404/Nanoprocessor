----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2021 12:26:05 PM
-- Design Name: 
-- Module Name: Instruction_Decoder_Sim - Behavioral
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

entity Instruction_Decoder_Sim is
--  Port ( );
end Instruction_Decoder_Sim;

architecture Behavioral of Instruction_Decoder_Sim is
COMPONENT Instruction_decoder
   PORT(   Instruction: in std_logic_vector(11 downto 0);
           Reg_val: in std_logic_vector(3 downto 0);
           Reg_enable: out std_logic_vector(2 downto 0);
           load_select: out std_logic;
           imd_val: out std_logic_vector(3 downto 0);
           reg_sel_1: out std_logic_vector(2 downto 0);
           reg_sel_2: out std_logic_vector(2 downto 0);
           sub_sel: out std_logic;
           jump_flag: out std_logic;
           jump_addr: out std_logic_vector(2 downto 0));
   END COMPONENT;

   signal Instruction:  std_logic_vector(11 downto 0);
   signal Reg_val:  std_logic_vector(3 downto 0);
   signal Reg_enable:  std_logic_vector(2 downto 0);
   signal load_select:  std_logic;
   signal imd_val:  std_logic_vector(3 downto 0);
   signal reg_sel_1: std_logic_vector(2 downto 0);
   signal reg_sel_2: std_logic_vector(2 downto 0);
   signal sub_sel: std_logic;
   signal jump_flag:  std_logic;
   signal jump_addr: std_logic_vector(2 downto 0);   
   

BEGIN

   UUT: Instruction_decoder PORT MAP(
		       Instruction=>Instruction,
               Reg_val=>Reg_val,
               Reg_enable=>Reg_enable,
               load_select=>load_select,
               imd_val=>imd_val,
               reg_sel_1=>reg_sel_1,
               reg_sel_2=>reg_sel_2,
               sub_sel=>sub_sel,
               jump_flag=>jump_flag,
               jump_addr=>jump_addr
   );

PROCESS
   BEGIN
   
   -- Index: 190331A : 101110011101111011
   -- Index: 190215X : 101110011100000111
   -- Index: 190137J : 101110011010111001
   
   -- Index: 190152B : 101110011011001000
   -- Index: 190495D : 101110100000011111
   -- Index: 190507U : 101110100000101011
   
        Reg_val<="0000";
		Instruction <= "101110000000";
		WAIT FOR 100 ns;
		Instruction <= "101100000011";
		WAIT FOR 100 ns;
		Instruction <= "101010000001";
		WAIT FOR 100 ns;
		Instruction <= "011010000000";
		WAIT FOR 100 ns;
		Instruction <= "001111100000";
		WAIT FOR 100 ns;
		Instruction <= "111100000101";
		WAIT FOR 100 ns;
		Reg_val<="0100";
        Instruction <= "111100000111";
        WAIT;
   END PROCESS;
end Behavioral;
