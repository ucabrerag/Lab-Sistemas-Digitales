library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_bit.all; 

entity regcorr is
    Port ( clk, clred, sdled, sdred : in  bit;
           sed : in  bit_vector(1 downto 0) ;
           ded : in  bit_vector (3 downto 0);
           qed : out  bit_vector (3 downto 0));
end regcorr;

architecture Behavioral of regcorr is

begin
	process (clk, clred)
	begin 
		if clred = '0' then qed<= "0000"; 
		elsif clk = '1' and clk'event then 
			if sed = "11" then qed<=ded; 
			elsif sed = "10" then qed<= sdred & ded(3 downto 1); 
			elsif sed = "01" then qed<= ded(2 downto 0) & sdled; 
			end if; 
		end if; 
	end process; 

end Behavioral;