library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity register_file is
    port(
        CLK : in std_logic;
        RD, RS, RT : in std_logic_vector(4 downto 0);
        WRDATA: in std_logic_vector(31 downto 0);
        RDATA1, RDATA2: out std_logic_vector(31 downto 0)
    );
end register_file;


architecture behavioral of register_file is
    type registerFile is array(31 downto 0) of std_logic_vector(31 downto 0);
    signal r : registerFile :=(0      => "00000000000000000000000000000001", --initialization of reg values
                               1      => "00000000000000000000000000000010",
                               others => "00000000000000000000000000000011"); 

    begin

        writeReg : process(CLK, RD)
            begin
                if CLK'event and CLK = '1' then
                    case RD is
			when "00000" =>r(0)  <= WRDATA;
                        when "00001" =>r(1)  <= WRDATA;
                        when "00010" =>r(2)  <= WRDATA;
                        when "00011" =>r(3)  <= WRDATA;
                        when "00100" =>r(4)  <= WRDATA;
                        when "00101" =>r(5)  <= WRDATA;
                        when "00110" =>r(6)  <= WRDATA;
                        when "00111" =>r(7)  <= WRDATA;
                        when "01000" =>r(8)  <= WRDATA;
                        when "01001" =>r(9)  <= WRDATA;
                        when "01010" =>r(10) <= WRDATA;
                        when "01011" =>r(11) <= WRDATA;
                        when "01100" =>r(12) <= WRDATA;
                        when "01101" =>r(13) <= WRDATA;
                        when "01110" =>r(14) <= WRDATA;
                        when "01111" =>r(15) <= WRDATA;
                        when "10000" =>r(16) <= WRDATA;
                        when "10001" =>r(17) <= WRDATA;
                        when "10010" =>r(18) <= WRDATA;
                        when "10011" =>r(19) <= WRDATA;
                        when "10100" =>r(20) <= WRDATA;
                        when "10101" =>r(21) <= WRDATA;
                        when "10110" =>r(22) <= WRDATA;
                        when "10111" =>r(23) <= WRDATA;
                        when "11000" =>r(24) <= WRDATA;
                        when "11001" =>r(25) <= WRDATA;
                        when "11010" =>r(26) <= WRDATA;
			when "11011" =>r(27) <= WRDATA;
			when "11100" =>r(28) <= WRDATA;
			when "11101" =>r(29) <= WRDATA;
                        when "11110" =>r(30) <= WRDATA;
                        when "11111" =>r(31) <= WRDATA;
                        when others => null;
                    end case;
                end if;
        end process;

        readReg1 : process(CLK, RS)
            begin
		if CLK'event and CLK = '1' then
                case RS is
                    when "00000" =>RDATA1 <= r(0);
                    when "00001" =>RDATA1 <= r(1);
                    when "00010" =>RDATA1 <= r(2);
                    when "00011" =>RDATA1 <= r(3);
                    when "00100" =>RDATA1 <= r(4);
                    when "00101" =>RDATA1 <= r(5);
                    when "00110" =>RDATA1 <= r(6);
                    when "00111" =>RDATA1 <= r(7);
                    when "01000" =>RDATA1 <= r(8);
                    when "01001" =>RDATA1 <= r(9);
                    when "01010" =>RDATA1 <= r(10);
                    when "01011" =>RDATA1 <= r(11);
                    when "01100" =>RDATA1 <= r(12);
                    when "01101" =>RDATA1 <= r(13);
                    when "01110" =>RDATA1 <= r(14);
                    when "01111" =>RDATA1 <= r(15);
                    when "10000" =>RDATA1 <= r(16);
                    when "10001" =>RDATA1 <= r(17);
                    when "10010" =>RDATA1 <= r(18);
                    when "10011" =>RDATA1 <= r(19);
                    when "10100" =>RDATA1 <= r(20);
                    when "10101" =>RDATA1 <= r(21);
                    when "10110" =>RDATA1 <= r(22);
                    when "10111" =>RDATA1 <= r(23);
                    when "11000" =>RDATA1 <= r(24);
                    when "11001" =>RDATA1 <= r(25);
                    when "11010" =>RDATA1 <= r(26);
                    when "11011" =>RDATA1 <= r(27);
                    when "11100" =>RDATA1 <= r(28);
                    when "11101" =>RDATA1 <= r(29);
                    when "11110" =>RDATA1 <= r(30);
                    when "11111" =>RDATA1 <= r(31);
                    when others => null;
                end case;
                end if;
        end process;

        readReg2 : process(CLK, RT)
            begin
              if CLK'event and CLK = '1' then
                case RT is
                    when "00000" =>RDATA2 <= r(0);
                    when "00001" =>RDATA2 <= r(1);
                    when "00010" =>RDATA2 <= r(2);
                    when "00011" =>RDATA2 <= r(3);
                    when "00100" =>RDATA2 <= r(4);
                    when "00101" =>RDATA2 <= r(5);
                    when "00110" =>RDATA2 <= r(6);
                    when "00111" =>RDATA2 <= r(7);
                    when "01000" =>RDATA2 <= r(8);
                    when "01001" =>RDATA2 <= r(9);
                    when "01010" =>RDATA2 <= r(10);
                    when "01011" =>RDATA2 <= r(11);
                    when "01100" =>RDATA2 <= r(12);
                    when "01101" =>RDATA2 <= r(13);
                    when "01110" =>RDATA2 <= r(14);
                    when "01111" =>RDATA2 <= r(15);
                    when "10000" =>RDATA2 <= r(16);
                    when "10001" =>RDATA2 <= r(17);
                    when "10010" =>RDATA2 <= r(18);
                    when "10011" =>RDATA2 <= r(19);
                    when "10100" =>RDATA2 <= r(20);
                    when "10101" =>RDATA2 <= r(21);
                    when "10110" =>RDATA2 <= r(22);
                    when "10111" =>RDATA2 <= r(23);
                    when "11000" =>RDATA2 <= r(24);
                    when "11001" =>RDATA2 <= r(25);
                    when "11010" =>RDATA2 <= r(26);
                    when "11011" =>RDATA2 <= r(27);
                    when "11100" =>RDATA2 <= r(28);
                    when "11101" =>RDATA2 <= r(29);
                    when "11110" =>RDATA2 <= r(30);
                    when "11111" =>RDATA2 <= r(31);
                    when others => null;
                end case;
              end if;
        end process;
end behavioral;
