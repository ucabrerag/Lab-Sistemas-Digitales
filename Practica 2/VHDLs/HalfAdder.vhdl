library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY HalfAdder is
    PORT(X: in STD_LOGIC;
         Y: in STD_LOGIC;
         SUM: out STD_LOGIC;
         COUT: out STD_LOGIC);
END HalfAdder;

ARCHITECTURE Behavioral of HalfAdder is

BEGIN

SUM <= X XOR Y;
COUT <= X AND Y;

END Behavioral;