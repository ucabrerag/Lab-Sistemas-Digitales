LIBRARY ieee;
USEieee.std_logic_1164.ALL;

ENTITY lcd_controller IS
  PORT(
    CLK        : IN    STD_LOGIC;  
    RESET    : IN    STD_LOGIC;  
    RW : OUT   STD_LOGIC;  
    RS : OUT   STD_LOGIC;
    EN : OUT   STD_LOGIC;
    LCD_DATA   : OUT   STD_LOGIC_VECTOR(7 DOWNTO 0); 
	  LINE1B: IN STD_LOGIC_VECTOR(127 downto 0); 
	  LINE2B : IN STD_LOGIC_VECTOR(127 downto 0)); 
END lcd_controller;

ARCHITECTURE controller OF lcd_controller IS
  TYPE CONTROL IS(power_up, initialize, RESETLINE, line1, line2, send);
  SIGNAL    state      : CONTROL;
  CONSTANT  freq       : INTEGER := 100; 
  SIGNAL 	ptr     	  : natural range 0 to 16 := 15; 
  SIGNAL 	line		  : STD_LOGIC := '1';
BEGIN
  PROCESS(clk)
    VARIABLE clk_count : INTEGER := 0; 
  BEGIN
  IF(clk'EVENT and clk = '1') THEN
    
      CASE state IS
        
        
        WHEN power_up =>
          IF(clk_count < (50000 * freq)) THEN   
            clk_count := clk_count + 1;
            state <= power_up;
          ELSE                                   
            clk_count := 0;
            RS <= '0';
            RW <= '0';
            lcd_data <= "00110000";
            statE<= initialize;
          END IF;
          
       
        WHEN initialize =>
          clk_count := clk_count + 1;
          IF(clk_count < (10 * freq)) THEN      
            lcd_data <= "00111100";      
         
            e <= '1';
            state <= initialize;
          ELSIF(clk_count < (60 * freq)) THEN    
            lcd_data <= "00000000";
            e <= '0';
            state <= initialize;
          ELSIF(clk_count < (70 * freq)) THEN   
            lcd_data <= "00001100";    
                 
            e <= '1';
            state <= initialize;
          ELSIF(clk_count < (120 * freq)) THEN  
            lcd_data <= "00000000";
            e <= '0';
            state <= initialize;
          ELSIF(clk_count < (130 * freq)) THEN   
            lcd_data <= "00000001";
            e <= '1';
            state <= initialize;
          ELSIF(clk_count < (2130 * freq)) THEN 
            lcd_data <= "00000000";
            e <= '0';
            state <= initialize;
          ELSIF(clk_count < (2140 * freq)) THEN  
            lcd_data <= "00000110";      

            e <= '1';
            state <= initialize;
          ELSIF(clk_count < (2200 * freq)) THEN  
            lcd_data <= "00000000";
            e <= '0';
            state <= initialize;
          ELSE                                  
            clk_count := 0;
            state <= RESETLINE;
          END IF;    
			 
		  WHEN resetline =>
			 ptr <= 16;
			 if line = '1' then
		      lcd_data <= "10000000";
            RS <= '0';
            RW <= '0';
            clk_count := 0; 
            state <= send;
			 else
			   lcd_data <= "11000000";
            RS <= '0';
            RW <= '0';
            clk_count := 0; 
            state <= send;
			 end if;
       
        WHEN line1 =>
				line <= '1';
				lcd_data <= LINE1B(ptr*8 + 7 downto ptr*8);
            RS <= '1';
            RW <= '0';
            clk_count := 0; 
				line <= '1';
            state <= send;
				
		  WHEN line2 =>
				line <= '0';
				lcd_data <= LINE2B(ptr*8 + 7 downto ptr*8);
            RS <= '1';
            RW <= '0';
            clk_count := 0;            
            state <= send;
		  
      
        WHEN send =>
			  IF(clk_count < (50 * freq)) THEN  
				  IF(clk_count < freq) THEN      
					e <= '0';
				  ELSIF(clk_count < (14 * freq)) THEN  
					e <= '1';
				  ELSIF(clk_count < (27 * freq)) THEN  
					e <= '0';
				  END IF;
				  clk_count := clk_count + 1;
				  state <= send;
			  ELSE
			  	  clk_count := 0;
				  if line = '1' then
					   if ptr = 0 then
							line <= '0';
							state <= resetline;
						else
							ptr <= ptr - 1;
							state <= line1;
						end if;
				  else
						if ptr = 0 then
							line <= '1';
							state <= resetline;
						else
							ptr <= ptr - 1;
							state <= line2;
						end if;
				  end if;
			  END IF;

      END CASE;    
    
  
      IF(reset_n = '0') THEN
          state <= power_up;
      END IF;
    
    END IF;
  END PROCESS;
END controller;
