-- Each of the components is created in separate file and is saved in the same folder.
-- Before we can create datapath unit, all the components(mux,sub and etc) MUST be created fist.
----------------------------------------------------------------------

-- Component: MULTIPLEXOR (file: mux.vhd) ----------------------------

library IEEE;
use  IEEE.std_logic_1164.all; 
--use IEEE.std_logic_arith.all; 
--use IEEE.std_logic_unsigned.all;

entity mux is
port(	rst, sLine: in std_logic;
load, result: in std_logic_vector( 3 downto 0 ); 
salida: out std_logic_vector( 3 downto 0 ));
end mux;

architecture mux_arc of mux is 

begin

process( rst, sLine, load, result ) 

begin

if( rst = '1' ) then
salida <= "0000";	-- do nothing 
elsif sLine = '0' then
salida <= load;	-- load inputs 
else
salida <= result;	-- load results 
end if;
end process; 

end mux_arc;
