Library ieee;
use ieee.std_logic_1164.all; 


entity fullAdders is
port(x,y,Cin :in std_logic; 
        sum, Cout:out std_logic);
end fullAdders;


architecture level of fullAdders is
begin 
    sum <= (x xor y xor Cin); 
    Cout <= (x and y) or (x and Cin) or (x and Cin); 
end level; 