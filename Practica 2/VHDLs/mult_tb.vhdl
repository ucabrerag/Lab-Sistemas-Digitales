--ESTE ES EL ARCHIVO DE TEST BENCH DONDE SE UTILIZA LA TECNICA DE PORT MAP Y AYUDANDONOS DE COMPONENTES
--CABE SENIALAR QUE CADA RESULTADO EN R SE IRA GENERANDO CADA 20 ns PUES ASI SE INDICO EN EL CICLO DE RELOJ

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity mult_tb is
end entity;

architecture arch of mult_tb is
    signal X : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal Y : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal P : STD_LOGIC_VECTOR(7 downto 0);
    

    --- USING COMPONENT / PORT MAP

    COMPONENT mult is
        PORT(X: in STD_LOGIC_VECTOR(3 downto 0);
        Y: in STD_LOGIC_VECTOR(3 downto 0);
        P: out STD_LOGIC_VECTOR(7 downto 0)
        
        );
    END COMPONENT;


    begin
    -- EXPLICIT
        UUT : mult port map ( 
                            X => X, 
                            Y => Y,
                            P => P
                         );


    X <= "0101" after 20 ns, "1100" after 40 ns, "1001" after 60 ns, "0010" after 80 ns, "1111" after 100 ns,  "0101" after 120 ns, "1000" after 140 ns;
    Y <= "1111" after 20 ns, "0100" after 40 ns, "0011" after 60 ns, "1110" after 80 ns, "0110" after 100 ns,  "0101" after 120 ns, "0110" after 140 ns;
    
end architecture;