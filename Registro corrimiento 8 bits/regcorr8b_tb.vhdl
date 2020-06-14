LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY regcorr8b_tb IS
END regcorr8b_tb;
 
ARCHITECTURE behavior OF regcorr8b_tb IS 
 
 
    COMPONENT regcorr8b
    PORT(
         x : IN  bit_vector(7 downto 0);
         y : OUT  bit_vector(7 downto 0);
         clk, clred, sdled, sdred : IN  bit;
         sed : IN  bit_vector (1 downto 0)
        );
    END COMPONENT;
    

   signal x : bit_vector(7 downto 0) := (others => '0');
   signal clk, clred, sdled, sdred : bit := '0';
   signal sed : bit_vector(1 downto 0) := "00";


   signal y : bit_vector(7 downto 0);

   constant CLK_period : time := 10 ns;
 
BEGIN
 
   uut: regcorr8b PORT MAP (
          x => x,
          y => y,
          clred => clred,
          sdled => sdled,
          sdred => sdred,
          sed => sed,
          clk => clk
        );

   CLK_process :process
   begin
		clk <= '0';
		wait for CLK_period*2;
		clk <= '1';
		wait for CLK_period*2;
   end process;
 

   stim_proc: process
   begin		

      wait for 100 ns;	
		
		sed<= "11"; 
		sdred<='0'; 
		sdled<='0';
		clred<= '1'; 
		x<= "11101110"; 
		
		wait for 30 ns; 
		sed<= "10"; 
		sdred<='0'; 
		sdled<='0';
		clred<= '1'; 
		x<= "11101110";
		
		wait for 30 ns; 
		sed<= "01"; 
		sdred<='0'; 
		sdled<='1';
		clred<= '1'; 
		x<= "11101110";
		
		wait for 60 ns; 
		sed<= "01"; 
		sdred<='0'; 
		sdled<='0';
		clred<= '0'; 
		x<= "11101110";
		
		
		wait for 30 ns; 
		sed<= "00"; 
		sdred<='0'; 
		sdled<='1';
		clred<= '1'; 
		x<= "11101110";

      wait;
   end process;

END;