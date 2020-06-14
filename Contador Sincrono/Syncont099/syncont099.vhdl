library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_bit.all; 

entity syncont099 is
    Port ( de : in  bit_vector(3 downto 0);
           clk, clear, ld, dent, denp, dup : in  bit;
           con : out  bit;
           qu : out  unsigned(3 downto 0));
end syncont099;

architecture Behavioral of syncont099 is
signal Qint: unsigned(3 downto 0); 
begin
	process(clear, clk) 
	begin 
		if clear='0' then Qint<="0000"; 
		elsif clk='1' and clk'event then 
			if ld='0' then Qint<=UNSIGNED(de); 
			elsif dent='1' and denp='1' and dup='1' then 
				Qint<= Qint+1; 
				if Qint="1001" then 
				Qint<="0000";  
				end if; 
			elsif dent='1' and denp='1' and dup='0' then
				Qint<= Qint -1; 
				if Qint = "0000" then 
				Qint<="1001";  
				end if; 
			end if; 
		end if; 
	end process; 
	
con<= '1' when Qint="1001" and dup='1' and clear='1' and ld='1' 
else '1' when Qint="0000" and dup='0' and clear='1' and ld='1'
else '0'; 
qu<=Qint; 
end Behavioral;