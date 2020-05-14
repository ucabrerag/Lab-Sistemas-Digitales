library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity clk_div is
port (
   clk_50: in std_logic;
   clk_1s: out std_logic
  );
end clk_div;
architecture Behavioral of clk_div is
signal counter: unsigned(27 downto 0):=(others =>'0');
begin
 process(clk_50)
 begin
  if(rising_edge(clk_50)) then
   counter <= (counter + x"0000001");
   if(counter>=x"2FAF080") then 
 
    counter <= x"0000000";
   end if;
  end if;
 end process;
 clk_1s <= '0' when counter < x"17D7840" else '1';
end Behavioral;