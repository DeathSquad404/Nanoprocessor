----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2021 03:22:14 PM
-- Design Name: 
-- Module Name: MUX_2way_4bit - Behavioral
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

entity MUX_2way_4bit is
Port ( Result : in STD_LOGIC_VECTOR (3 downto 0);
       Imd_val : in STD_LOGIC_VECTOR (3 downto 0);
       Enb : in STD_LOGIC;
       O : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_2way_4bit;

architecture Behavioral of MUX_2way_4bit is

component tri_state_buffer_4bit
    port(  Input : in STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (3 downto 0);
           Enable : in STD_LOGIC);
end component;
Signal not_enb:STD_LOGIC;
begin
not_enb<=not(Enb);
tri_state_buffer_4bit_0 : tri_state_buffer_4bit
    port map (  Input => Result,
                Enable=> not_enb,
                Output => O);
tri_state_buffer_4bit_1 : tri_state_buffer_4bit
    port map (  Input => Imd_val,
                Enable=> Enb,
                Output => O);

end Behavioral;
