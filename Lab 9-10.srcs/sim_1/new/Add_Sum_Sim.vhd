----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2021 11:05:32 AM
-- Design Name: 
-- Module Name: Add_Sum_Sim - Behavioral
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

entity Add_Sum_Sim is
--  Port ( );
end Add_Sum_Sim;

architecture Behavioral of Add_Sum_Sim is
Component Add_sub
    port(
           A :in STD_LOGIC_Vector(3 downto 0);
           B :in STD_LOGIC_Vector(3 downto 0);
           Ctrl : in STD_LOGIC;
           S :out STD_LOGIC_Vector(3 downto 0);
           Overflow : out STD_LOGIC;
           Z_flag : out STD_LOGIC);
end component;
SIGNAL A,B : std_logic_vector(3 downto 0);
signal Ctrl : std_logic;
signal Z_flag,Overflow : std_logic;
signal S : std_logic_vector(3 downto 0);
begin
UUT: Add_sub PORT MAP(
    A=>A,
    B=> B,
    Z_flag=>Z_flag,
    Overflow => Overflow,
    Ctrl => Ctrl,
    S=>S
);
process
-- Index: 190331A : 101110011101111011
-- Index: 190215X : 101110011100000111
-- Index: 190137J : 101110011010111001

-- Index: 190152B : 101110011011001000
-- Index: 190495D : 101110100000011111
-- Index: 190507U : 101110100000101011
begin
    A(0)<='0';
    A(1)<='0';
    A(2)<='0';
    A(3)<='0';
    B(0)<='0';    
    B(1)<='0';
    B(2)<='0';
    B(3)<='0';
    Ctrl <= '0';

    wait for 100ns;   
    B(1)<='1';

  wait for 100ns;
    A(0)<='0';
    A(1)<='0';
    A(2)<='1';
    A(3)<='0';
    B(0)<='1';    
    B(1)<='1';
    B(2)<='1';
    B(3)<='0';
    Ctrl <= '0';  
  wait for 100ns;
    A(0)<='0';
    A(1)<='1';
    A(2)<='0';
    A(3)<='0';
    B(0)<='0';    
    B(1)<='0';
    B(2)<='0';
    B(3)<='0'; 
    Ctrl <= '1';
    wait for 100ns;
    A(0)<='0';
    A(1)<='0';
    A(2)<='1';
    A(3)<='1';
    B(0)<='1';    
    B(1)<='1';
    B(2)<='0';
    B(3)<='1'; 
    Ctrl <= '0';
    wait for 100ns;
    A(0)<='0';
    A(1)<='0';
    A(2)<='1';
    A(3)<='1';
    B(0)<='0';    
    B(1)<='0';
    B(2)<='1';
    B(3)<='1'; 
    Ctrl <= '0';
    wait for 100ns;   
    A(0)<='0';
    A(1)<='1';
    A(2)<='1';
    A(3)<='1';
    B(0)<='1';    
    B(1)<='1';
    B(2)<='1';
    B(3)<='1';
    Ctrl <='1';     
    wait;
    
 end process;
end Behavioral;
