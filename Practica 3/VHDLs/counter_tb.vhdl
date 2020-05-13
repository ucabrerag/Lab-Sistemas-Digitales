 LIBRARY ieee;  
 USE ieee.std_logic_1164.ALL;  


 ENTITY counter_tb IS  
 END counter_tb;  

 ARCHITECTURE behavior OF counter_tb IS  
   COMPONENT counter 
   port(
    clk :in std_logic;
    oput : out std_logic_vector(7 downto 0)
);
   END COMPONENT;
  
   --Inputs  
   SIGNAL clk : std_logic := '1';  
   SIGNAL oput : std_logic_vector(7 downto 0);  
 BEGIN  
   uut: counter PORT MAP(  
     clk => clk,   
     oput => oput 
   );  

   PROCESS  
   BEGIN  
       wait for 5 ns;  
       clk <= not clk;  
   END PROCESS; 
  
 END;  