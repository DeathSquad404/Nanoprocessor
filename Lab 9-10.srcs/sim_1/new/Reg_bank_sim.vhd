library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_bank_sim is
--  Port ( );
end Reg_bank_sim;

architecture Behavioral of Reg_bank_sim is
COMPONENT Reg_bank
   PORT( Clk	:	IN	STD_LOGIC; 
          reset	:	IN	STD_LOGIC; 
          R0	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R1	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R2	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R3	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R4	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R5	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R6	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          R7	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          input	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          reg_enb	:	IN	STD_LOGIC_VECTOR (2 DOWNTO 0));
   END COMPONENT;

   SIGNAL Clk	:	STD_LOGIC;
   SIGNAL reset	:	STD_LOGIC;
   SIGNAL R0	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R1	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R2	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R3	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R4	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R5	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R6	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL R7	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL input	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL reg_enb	:	STD_LOGIC_VECTOR (2 DOWNTO 0);

BEGIN

   UUT: Reg_bank PORT MAP(
		Clk => Clk, 
		reset => reset, 
		R0 => R0, 
		R1 => R1, 
		R2 => R2, 
		R3 => R3, 
		R4 => R4, 
		R5 => R5, 
		R6 => R6, 
		R7 => R7, 
		input => input, 
		reg_enb => reg_enb
   );

PROCESS
BEGIN
		input <= "1010";
		reset <= '0';
		CLK <= '0';
        reg_enb <= "111";
		WAIT FOR 30 ns;
		CLK <= '1';
		WAIT FOR 30 ns;
		reg_enb <= "001";
		CLK <= '0';
		WAIT FOR 30 ns;
		CLK <= '1';
		WAIT FOR 30 ns;
		reg_enb <= "010";
		CLK <= '0';
		WAIT FOR 30 ns;
		CLK <= '1';
		WAIT FOR 30 ns;
		reg_enb <= "011";
		CLK <= '0';
		WAIT FOR 30 ns;
		CLK <= '1';
		WAIT FOR 30 ns;
		reg_enb <= "100";
		CLK <= '0';
		WAIT FOR 30 ns;
		CLK <= '1';
		WAIT FOR 30 ns;
		reg_enb <= "101";
		CLK <= '0';
		WAIT FOR 30 ns;
		CLK <= '1';
		WAIT FOR 30 ns;
		reg_enb <= "110";
		CLK <= '0';
		WAIT FOR 30 ns;
		CLK <= '1';
		WAIT FOR 30 ns;
		reg_enb <= "111";
		CLK <= '0';
		WAIT FOR 30 ns;
		CLK <= '1';
		WAIT FOR 30 ns;
		reset<='1';
		CLK <='0';
        WAIT FOR 30ns;
        CLK<='1';
        WAIT FOR 30 ns;
        CLK <= '0';
        input<="1101";
        reg_enb<="000";
        reset<='0';
        WAIT FOR 30 ns;
        Clk <= '1';
        WAIT; 
   END PROCESS;



end Behavioral;

