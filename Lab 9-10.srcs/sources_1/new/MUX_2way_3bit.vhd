----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2021 03:51:40 PM
-- Design Name: 
-- Module Name: MUX_2way_3bit - Behavioral
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

entity MUX_2way_3bit is
Port ( Jump_addr : in STD_LOGIC_VECTOR (2 downto 0);
       Incr_addr : in STD_LOGIC_VECTOR (2 downto 0);
       Jump_flag : in STD_LOGIC;
       Addr : out STD_LOGIC_VECTOR (2 downto 0));
end MUX_2way_3bit;

architecture Behavioral of MUX_2way_3bit is
component tri_state_buffer_3bit
    port(  Input : in STD_LOGIC_VECTOR (2 downto 0);
           Output : out STD_LOGIC_VECTOR (2 downto 0);
           Enable : in STD_LOGIC);
end component;

Signal not_jump : STD_LOGIC;

begin
not_jump<=not(Jump_flag);
tri_state_buffer_3bit_0 : tri_state_buffer_3bit
    port map (  Input => Jump_addr,
                Enable=> Jump_flag,
                Output => Addr);
tri_state_buffer_3bit_1 : tri_state_buffer_3bit
    port map (  Input => Incr_addr,
                Enable=> not_jump,
                Output => Addr);

end Behavioral;
