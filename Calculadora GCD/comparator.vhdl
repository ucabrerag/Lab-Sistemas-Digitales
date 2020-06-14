
library IEEE;
use  IEEE.std_logic_1164.all; 
--use IEEE.std_logic_arith.all; 
--use IEEE.std_logic_unsigned.all;

entity comparator is
port(	rst: in std_logic;
x, y: in std_logic_vector( 3 downto 0 ); 
salida: out std_logic_vector( 1 downto 0 )
);
end comparator;

architecture comparator_arc of comparator is 

begin

process( x, y, rst ) 

begin
if( rst = '1' ) then
salida <= "00";	-- do nothing 
elsif( x > y ) then
salida <= "10";	-- if x greater 
elsif( x < y ) then
salida <= "01";	-- if y greater 
else
salida <= "11";	-- if equivalance. 
end if;
end process; 
end comparator_arc;
