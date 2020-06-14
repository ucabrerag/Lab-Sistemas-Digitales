library IEEE;
use  IEEE.std_logic_1164.all; 
--use IEEE.std_logic_arith.all; 
--use IEEE.std_logic_unsigned.all;
--use work.all; 
-- work is the name of Folder that contains all the components. Don mistype it!

entity gcd is

port(	rst, clk, go_i: in std_logic;

x_i, y_i: in std_logic_vector( 3 downto 0 );
d_o: out std_logic_vector( 3 downto 0 ) );
end gcd;

architecture gcd_arc of gcd is 

component fsm is
port(	rst, clk, proceed: in std_logic;
comparison: in std_logic_vector( 1 downto 0 ); 
enable, xsel, ysel, xld, yld: out std_logic );
end component;

component mux is
port(	rst, sLine: in std_logic;
load, result: in std_logic_vector( 3 downto 0 ); 
salida: out std_logic_vector( 3 downto 0 ) );
end component;

component comparator is
port(	rst: in std_logic;
x, y: in std_logic_vector( 3 downto 0 ); 
salida: out std_logic_vector( 1 downto 0 ) );
end component;

component subtractor is
port(	rst: in std_logic;
cmd: in std_logic_vector( 1 downto 0 );
x, y: in std_logic_vector( 3 downto 0 );
xout, yout: out std_logic_vector( 3 downto 0 ) );
end component;

component regis is
port(	rst, clk, load: in std_logic;
entrada: in std_logic_vector( 3 downto 0 ); 
salida: out std_logic_vector( 3 downto 0 ) );
end component;

signal xld, yld, xsel, ysel, enable: std_logic; 
signal comparison: std_logic_vector( 1 downto 0 ); 
signal result: std_logic_vector( 3 downto 0 );

signal xsub, ysub, xmux, ymux, xreg, yreg: std_logic_vector( 3 downto 0 ); 

begin
-- doing structure modeling here by using portmap

-- FSM controller
TOFSM: fsm port map(	rst, clk, go_i, comparison,
enable, xsel, ysel, xld, yld );
-- Datapath
X_MUX: mux port map( rst, xsel, x_i, xsub, xmux ); 
Y_MUX: mux port map( rst, ysel, y_i, ysub, ymux ); 
X_REG: regis port map( rst, clk, xld, xmux, xreg ); 
Y_REG: regis port map( rst, clk, yld, ymux, yreg );
U_COMP: comparator port map( rst, xreg, yreg, comparison );
X_SUB: subtractor port map( rst, comparison, xreg, yreg, xsub, ysub ); 
OUT_REG: regis port map( rst, clk, enable, xsub, result );

d_o <= result; 

end gcd_arc;
