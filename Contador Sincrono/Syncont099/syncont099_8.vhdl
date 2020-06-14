library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_bit.all; 

entity syncont099_8 is
    Port ( de : in  bit_vector(7 downto 0);
           clk, clear, ld, dent, denp, dup : in  bit;
           con : out  bit;
           qu : out  unsigned(7 downto 0));
end syncont099_8;

architecture Behavioral of syncont099_8 is
component syncont099 
	Port ( de : in  bit_vector(3 downto 0);
           clk, clear, ld, dent, denp, dup : in  bit;
           con : out  bit;
           qu : out  unsigned(3 downto 0));
end component; 
signal CO_AUX, CO_AUX2: bit;
signal AUX: bit_vector(1 downto 0); 
begin
	syncont0990: syncont099 port map (de(3 downto 0),clk, clear, ld, dent, denp, dup, CO_AUX, qu(3 downto 0)); 
	syncont0991: syncont099 port map (de(7 downto 4),clk, clear, ld, CO_AUX, denp, dup, CO_AUX2, qu(7 downto 4)); 

AUX<=CO_AUX & CO_AUX2; 

con<= '1' when AUX="11" and dup='1' and clear='1' and ld='1' 
else '1' when AUX="11" and dup='0' and clear='1' and ld='1'
else '0'; 

end Behavioral;