----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2021 03:33:13 PM
-- Design Name: 
-- Module Name: Add_sub - Behavioral
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

entity Add_sub is
Port ( A :in STD_LOGIC_Vector(3 downto 0);
       B :in STD_LOGIC_Vector(3 downto 0);
       Ctrl : in STD_LOGIC;
       S :out STD_LOGIC_Vector(3 downto 0);
       Overflow : out STD_LOGIC;
       Z_flag : out STD_LOGIC);
end Add_sub;

architecture Behavioral of Add_sub is

    component FA  
        port (A: in std_logic;  
              B: in std_logic;
              C_in: in std_logic;  
              S: out std_logic;
              C_out: out std_logic);  
    end component;
    
    SIGNAL FA0_C, FA1_C, FA2_C: std_logic;
    SIGNAL A_xor_Ctrl, RES: std_logic_vector(3 downto 0);
    
begin
    A_xor_Ctrl <= A xor (Ctrl, Ctrl, Ctrl, Ctrl);
    FA_0 : FA
        port map (  
            A => A_xor_Ctrl(0),  
            B => B(0),
            C_in => Ctrl,
            S => RES(0),  
            C_Out => FA0_C); 

    FA_1 : FA
        port map (  
            A => A_xor_Ctrl(1),  
            B => B(1),
            C_in => FA0_C,   
            S => RES(1),  
            C_Out => FA1_C);
    FA_2 : FA
        port map (  
            A => A_xor_Ctrl(2),  
            B => B(2),
            C_in => FA1_C,   
            S => RES(2),  
            C_Out => FA2_C);

    FA_3 : FA
        port map (  
            A => A_xor_Ctrl(3),  
            B => B(3),
            C_in => FA2_C,   
            S => RES(3));
    
    S <= RES;
    Z_flag <= not (RES(0) or RES(1) or RES(2) or RES(3));
    Overflow <= not (Ctrl) and ((A(3) XNOR B(3)) AND (A(3) XOR RES(3)));       
    --Overflow <= ((A(3) XOR Ctrl) XNOR B(3)) AND (A(3) XOR RES(3));                      
end Behavioral;