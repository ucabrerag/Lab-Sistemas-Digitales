LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_bit.all; 

 
ENTITY syncont099_8_tb IS
END syncont099_8_tb;
 
ARCHITECTURE behavior OF syncont099_8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT syncont099_8
    PORT(
         de : IN  bit_vector(7 downto 0);
         clk : IN  bit;
         clear : IN  bit;
         ld : IN  bit;
         dent : IN  bit;
         denp : IN  bit;
         dup : IN  bit;
         con : OUT  bit;
         qu : OUT  unsigned (7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal de : bit_vector(7 downto 0) := "00000000";
   signal clk : bit := '0';
   signal clear : bit := '0';
   signal ld : bit := '0';
   signal dent : bit := '0';
   signal denp : bit := '0';
   signal dup : bit := '0';

 	--Outputs
   signal con : bit;
   signal qu : unsigned (7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: syncont099_8 PORT MAP (
          de => de,
          clk => clk,
          clear => clear,
          ld => ld,
          dent => dent,
          denp => denp,
          dup => dup,
          con => con,
          qu => qu
        );

   CLK_process :process
   begin
		clk <= '0';
		wait for CLK_period;
		clk <= '1';
		wait for CLK_period;
   end process;
 

   stim_proc: process
   begin		
    
      wait for 100 ns;	
		clear<='1'; 
		ld<='0'; 
		de<= "10011000"; 
		dent<= '1'; 
		denp<='1'; 
		dup<='1'; 
		
		wait for 20 ns; 
		clear<='1'; 
		ld<='1'; 
		de<= "10011000"; 
		dent<= '1'; 
		denp<='1'; 
		dup<='1';
		
		wait for 60 ns; 
		clear<='1'; 
		ld<='1'; 
		de<= "10011000"; 
		dent<= '0'; 
		denp<='1'; 
		dup<='0';
		
		wait for 40 ns; 
		clear<='1'; 
		ld<='1'; 
		de<= "10011000"; 
		dent<= '1'; 
		denp<='1'; 
		dup<='0';
		
		wait for 90 ns;
		 
		clear<='0'; 
		ld<='1'; 
		de<= "10011000"; 
		dent<= '1'; 
		denp<='1'; 
		dup<='0';	

     

      wait;
   end process;

END;