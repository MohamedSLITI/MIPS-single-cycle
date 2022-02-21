library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is 
    port( A,B :in std_logic_vector(31 downto 0);
	  FUNCT: in std_logic_vector(5 downto 0);
	  ALU_OUT: out std_logic_vector (31 downto 0);
	  CARRY_OUT : out std_logic
    );
end ALU;

architecture behavioral of ALU is
    signal ALU_RESULT: std_logic_vector(31 downto 0);
        begin
	    process(FUNCT)
	        begin
		    case(FUNCT) is --funct values are based on MIPS function codes
                        when "100000" => ALU_RESULT<= std_logic_vector(signed(A)+signed(B));
                        when "100010" => ALU_RESULT<= std_logic_vector(signed(A)-signed(B));
			when "100100" => ALU_RESULT<= A and B;
			when "100101" => ALU_RESULT<= A or B; 
                        when others => ALU_RESULT<= "00000000000000000000000000000000";
                    end case;
                    if ALU_RESULT   = "00000000000000000000000000000000" then
                        CARRY_OUT  <='1';
                    else CARRY_OUT <='0';
                    end if;
           end process;
           ALU_OUT<=ALU_RESULT;
end behavioral;
