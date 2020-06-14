library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity regcorr8b is
    Port ( x : in  bit_vector(7 downto 0);
           y : out  bit_vector(7 downto 0);
           clred, sdled, sdred, clk : in  bit;
           sed : in  bit_vector (1 downto 0)
           );
end regcorr8b;

architecture Behavioral of regcorr8b is
component regcorr
	Port ( clk, clred, sdled, sdred : in  bit;
           sed : in  bit_vector(1 downto 0) ;
           ded : in  bit_vector (3 downto 0);
           qed : out  bit_vector (3 downto 0));
end component; 
signal aux1, aux2: bit; 
begin
	re: regcorr port map (clk, clred, sdled, x(4), sed, x(3 downto 0), y(3 downto 0));  
	re2: regcorr port map (clk, clred, x(3), sdred, sed, x(7 downto 4), y(7 downto 4));
end Behavioral;