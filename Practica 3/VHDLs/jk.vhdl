library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity JK is
port(
    J, K, clk, clr : in  std_logic;
    Q, Qbar     : out std_logic
);
end JK;

architecture arch of JK is
signal D : std_logic;
signal Dn : std_logic;
signal clkn : std_logic;
signal clrn : std_logic;
signal o1 : std_logic := '1';
signal o2 : std_logic := '0';
signal o3 : std_logic := '0';
signal o4 : std_logic := '1';
signal o5 : std_logic := '0';
signal o6 : std_logic := '1';
signal o7 : std_logic := '1';
signal o8 : std_logic := '0';

begin

D <= (o8 and (not K)) or (o7 and J);
Dn <= not D;
clkn <= not clk;
clrn <= not clr;
o1 <= Dn and clkn;
o2 <= D  and clkn and clrn;
o3 <= not (o4 or o1 or clr);
o4 <= o3 nor o2;
o5 <= o3 and clk;
o6 <= o4 and clk;
o7 <= o8 nor o5;
o8 <= o7 nor o6;
Qbar <= o7;
Q    <= o8;
end arch;