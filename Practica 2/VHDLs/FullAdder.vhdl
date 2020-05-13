library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY FullAdder is
    PORT(X: in STD_LOGIC;
         Y: in STD_LOGIC;
         CIN: in STD_LOGIC;
         COUT: out STD_LOGIC;
         SUM: out STD_LOGIC);
END FullAdder;

architecture Behavioral of FullAdder is

    signal temporal: STD_LOGIC_VECTOR(2 downto 0);

BEGIN
    PROCESS(temporal, X, Y, CIN)
    BEGIN 
        temporal <= (X, Y, CIN);
        CASE(temporal) is
            WHEN "000" => COUT <= '0'; SUM <= '0';
            WHEN "011" => COUT <= '1'; SUM <= '0';
            WHEN "101" => COUT <= '1'; SUM <= '0';
            WHEN "110" => COUT <= '1'; SUM <= '0';
            WHEN "111" => COUT <= '1'; SUM <= '1';
            WHEN OTHERS => COUT <= '0'; SUM <= '1';
        END CASE;

    END PROCESS;

END Behavioral;
         
