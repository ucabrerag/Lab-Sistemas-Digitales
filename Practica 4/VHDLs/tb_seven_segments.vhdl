library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity tb_seven_segments is
end tb_seven_segments;

architecture tb of tb_seven_segments is

    component seven_segments
        port (clk           : in std_logic;
              reset_n       : in std_logic;
              number        : in integer;
              displays_7seg : out std_logic_vector (27 downto 0));
    end component;

    signal clk           : std_logic;
    signal reset_n       : std_logic;
    signal number        : integer;
    signal displays_7seg : std_logic_vector (27 downto 0);

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : seven_segments
    port map (clk           => clk,
              reset_n       => reset_n,
              number        => number,
              displays_7seg => displays_7seg);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        number <= 2888;

        -- Reset generation
        -- EDIT: Check that reset_n is really your reset signal
        reset_n <= '1';
        wait for 100 ns;
        number <= 2834;
        reset_n <= '0';
        wait for 100 ns;

        number <= 9821;
        reset_n <= '1';
        wait for 100 ns;

        number <= 5302;
        reset_n <= '0';
        wait for 100 ns;

        number <= 1123;
        reset_n <= '1';
        wait for 100 ns;

        number <= 3920;
        reset_n <= '0';
        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;


    end process;

end tb;


