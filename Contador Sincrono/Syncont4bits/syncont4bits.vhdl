library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_bit.all; 

entity syncont4bits is
    Port ( de : in  unsigned(3 downto 0);
           args , argp, clk, po, ud : in  bit;
           Q : out  unsigned(3 downto 0);
           TC : out  bit);
end syncont4bits;

architecture Behavioral of syncont4bits is
signal Qint: unsigned(3 downto 0); 
begin
	Process(clk)
	begin 
		if clk='1' and clk'event then 
			if po ='1' then Qint<=de; 
			elsif argp='0' and args ='0' then 
				if ud ='1' then Qint<=Qint+1; 
				elsif ud='0' then Qint<= Qint-1; 
				end if; 
			end if; 
		end if; 
	end process; 

TC<= '0' when 
Qint="1111" and po='0' and argp='0' and args ='0' and ud='1'
else '0' when Qint="0000" and po='0' and argp='0' and args ='0' and ud='0'
else '1'; 

Q<=Qint; 
end Behavioral;