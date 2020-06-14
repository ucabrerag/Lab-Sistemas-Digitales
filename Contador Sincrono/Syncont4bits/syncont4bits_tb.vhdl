LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_bit.all; 

ENTITY syncont4bits_tb IS
END syncont4bits_tb;
 
ARCHITECTURE behavior OF syncont4bits_tb IS 
 
 
    COMPONENT syncont4bits
    PORT(
         de : IN  unsigned(3 downto 0);
         args, argp, clk, po, ud : IN  bit;
         Q : OUT  unsigned(3 downto 0);
         TC : OUT  bit
        );
    END COMPONENT;
    

   signal de : unsigned(3 downto 0) := (others => '0');
   signal args, argp, clk, po, ud : bit := '0';


   signal Q : unsigned(3 downto 0);
   signal TC : bit;


   constant clk_period : time := 10 ns;
 
BEGIN
 

   uut: syncont4bits PORT MAP (
          de => de,
          args => args,
          argp => argp,
          clk => clk,
          po => po,
          ud => ud,
          Q => Q,
          TC => TC
        );


   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 


   stim_proc: process
   begin		

      de<= "1101"; 
		args<='0'; 
		argp<='0';
		po<= '1'; 
		ud<='1'; 
		
		wait for 10 ns; 
		de<= "1101"; 
		args<='0'; 
		argp<='0';
		po<= '0'; 
		ud<='1'; 
		
		wait for 50 ns; 
		de<= "1101"; 
		args<='0'; 
		argp<='0';
		po<= '0'; 
		ud<='0'; 
		 
		
		
		

      wait;
   end process;

END;