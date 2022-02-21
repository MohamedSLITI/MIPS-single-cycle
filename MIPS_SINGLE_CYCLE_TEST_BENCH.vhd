library ieee;
use ieee.std_logic_1164.all;

entity MIPS_tb is
end MIPS_tb;

architecture behavioral of MIPS_tb is
    component MIPS
        port(INSTRUCTION: in std_logic_vector(31 downto 0);
             CLK: in std_logic;
	     RESULT: out std_logic_vector(31 downto 0);
             CARRY_OUT: out std_logic
             );
    end component MIPS;

    signal s_instruction,s_result: std_logic_vector(31 downto 0);
    signal s_clk,s_carry: std_logic;
    begin
        uut : MIPS port map(s_instruction,s_clk,s_result,s_carry);
        stim_process : process
        begin
            wait for 10 ns;
            s_instruction <="00000011001001110000000000100000"; --add
            s_clk         <='1';
            wait for 10 ns;
            s_instruction <="00000011001110010100000000100101"; --or
            s_clk         <='1';
            wait for 10 ns;
            s_instruction <="00000011001001110000000000100000"; --add
            s_clk         <='1';
            wait for 10 ns;
            s_instruction <="00000011111000011010000000100010"; --sub
            s_clk         <='1';
            wait for 10 ns;
            s_instruction <="00000000100010010100100000100100"; --and
            s_clk         <='0';
            wait for 10 ns;
            s_instruction <="00000000101101001000000000100010"; --sub
            s_clk         <='1';
            wait;
        end process;
    end;
