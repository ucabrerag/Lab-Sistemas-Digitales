library ieee;
use ieee.std_logic_1164.all;

entity multiplexer is
    port (di : in std_logic_vector(3 downto 0);
        sel : in std_logic_vector(2 downto 0);
        do : out std_logic);
end multiplexer;

architecture archi of multiplexer is
begin
    process (sel, di)
    begin
        case sel is
            when "00" => do <= di(3);
            when "01" => do <= di(2);
            when "10" => do <= di(1);
            when others => do <= di(0);
        end case;
    end process;
end archi;
