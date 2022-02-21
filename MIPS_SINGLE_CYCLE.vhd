library ieee;
use ieee.std_logic_1164.all;

entity MIPS is
    port(
        INSTRUCTION: in std_logic_vector(31 downto 0);
        CLK: in std_logic;
	RESULT: out std_logic_vector(31 downto 0);
        CARRY_OUT: out std_logic
    );
end MIPS;


architecture behavioral of MIPS is
    COMPONENT ALU
        port(A,B :in std_logic_vector(31 downto 0);
	     FUNCT: in std_logic_vector(5 downto 0);
	     ALU_OUT: out std_logic_vector (31 downto 0);
	     CARRY_OUT : out std_logic
        );
    END COMPONENT;

    COMPONENT register_file
        port(CLK : in std_logic;
             RD, RS, RT : in std_logic_vector(4 downto 0);
             WRDATA: in std_logic_vector(31 downto 0);
             RDATA1, RDATA2: out std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    signal out1,out2,s_alu_out: std_logic_vector(31 downto 0);
    begin
        comp1: register_file 
               port map(CLK,INSTRUCTION(15 downto 11),INSTRUCTION(25 downto 21),INSTRUCTION(20 downto 16),s_alu_out,out1,out2);  
        comp2: ALU 
               port map(out1,out2,INSTRUCTION(5 downto 0),s_alu_out,CARRY_OUT);
        RESULT <= s_alu_out;
   end behavioral;