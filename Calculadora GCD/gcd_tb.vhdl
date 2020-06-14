LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY gcd_tb IS
END gcd_tb;
 
ARCHITECTURE behavior OF gcd_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT gcd
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         go_i : IN  std_logic;
         x_i : IN  std_logic_vector(3 downto 0);
         y_i : IN  std_logic_vector(3 downto 0);
         d_o : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '1';
   signal clk : std_logic := '0';
   signal go_i : std_logic := '1';
   signal x_i : std_logic_vector(3 downto 0) := (others => '0');
   signal y_i : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal d_o : std_logic_vector(3 downto 0);

   -- Clock period definitions
  constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: gcd PORT MAP (
          rst => rst,
          clk => clk,
          go_i => go_i,
          x_i => x_i,
          y_i => y_i,
          d_o => d_o
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/10;
		clk <= '1';
		wait for clk_period/10;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
	wait for 5 ns;
	x_i <= "1100";
    y_i <= "0100";
   rst <= '0';

  

    wait for 50 ns;
	x_i <= "1111";
    y_i <= "1010";


    wait for 100 ns;
	x_i <= "1000";
    y_i <= "0110";



    wait for 200 ns;
    x_i <= "1100";
    y_i <= "0100";

   end process;

END;
