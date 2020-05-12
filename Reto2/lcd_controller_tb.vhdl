library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.TEXTIO.ALL;

entity lcd_controller_tb is
	port (
		clk          : in  std_logic;
		rst          : in  std_logic;
		lcd_e        : out std_logic;
		lcd_rs       : out std_logic;
		lcd_rw       : out std_logic;
		lcd_db       : out std_logic_vector(7 downto 0));
		
end lcd_controller_tb;

architecture Behavioral of lcd_controller_tb is

COMPONENT lcd_controller IS
	PORT(
		 clk        : IN    STD_LOGIC;  
		 reset_n    : IN    STD_LOGIC;  
		 rw, rs, e  : OUT   STD_LOGIC;  
		 lcd_data   : OUT   STD_LOGIC_VECTOR(7 DOWNTO 0);
		 line1_buffer : IN STD_LOGIC_VECTOR(127 downto 0); 
		 line2_buffer : IN STD_LOGIC_VECTOR(127 downto 0)); 
	END COMPONENT;
	

	signal line1_buffer : std_logic_vector(127 downto 0);
	signal line2_buffer : std_logic_vector(127 downto 0);	


begin

	LCD: lcd_controller port map(
		clk => clk,
		reset_n => rst,
		e => lcd_e,
		rs => lcd_rs,
		rw => lcd_rw,
		lcd_data => lcd_db,
		line1_buffer => line1_buffer,
		line2_buffer => line2_buffer 
	);

gene : process

	file Fin : TEXT open READ_MODE is "input_text.txt";
	variable current_read_line : line;
	variable current_read_field : std_logic_vector(127 downto 0);
	variable current_write_line : line;


	begin

	

		while not endfile(Fin) loop
			readline(Fin, current_read_line);
			--read(current_read_line,  current_read_field);
			line1_buffer <= current_read_field; wait for 100 ns;

			write(current_write_line, string'("instr(0x38);"));
			writeline(output, current_write_line);
			write(current_write_line, string'("instr(0x0F);"));
			writeline(output, current_write_line);
			write(current_write_line, string'("instr(0x01);"));
			writeline(output, current_write_line);
			write(current_write_line, string'("instr(0x06);"));
			writeline(output, current_write_line);
			--write(current_write_line, line1_buffer);
			write(current_write_line, string'("putstr('HOLA A TODOS');"));
			--write(current_write_line, line2_buffer);
			writeline(output, current_write_line);

			end loop;

	end process;



end architecture;