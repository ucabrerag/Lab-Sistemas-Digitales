library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity counter is
port(
    clk :in std_logic;
    oput : out std_logic_vector(7 downto 0)
);
end counter;

architecture arch of counter is
signal toninty : std_logic := '0';
signal Qout : std_logic_vector(7 downto 0) := "00000000";   
component jk
port(
    J : in STD_LOGIC;
    K : in STD_LOGIC;
    clk : in STD_LOGIC;
    clr : in STD_LOGIC;
    Q : out STD_LOGIC;
    Qbar : out STD_LOGIC);
end component;

for all: jk use entity work.jk(arch);

signal j1,j2,j3,j4,j5,j6,j7,j8,k1,k2,k3,k4,k5,k6,k7,k8:std_logic := '0';          
signal Qbar : std_logic;
signal clock : std_logic;
begin
toninty <= Qout(0) and Qout(1) and (not Qout(2)) and (not Qout(3)) and (not Qout(4)) and Qout(5) and Qout(6) and (not Qout(7));
clock <= not(clk);
j1 <= '1';
j2 <= Qout(0) after 1 ps;
j3 <= Qout(0) and Qout(1);
j4 <= j3 and Qout(2);
j5 <= j4 and Qout(3);
j6 <= j5 and Qout(4);
j7 <= j6 and Qout(5);
j8 <= j7 and Qout(6);

k1 <= '1';
k2 <= Qout(0) after 1 ps;
k3 <= (Qout(0) and Qout(1));
k4 <= (j3 and Qout(2));
k5 <= (j4 and Qout(3));
k6 <= (j5 and Qout(4));
k7 <= (j6 and Qout(5));
k8 <= (j7 and Qout(6));

a1 : jk
port map(
    J => j1,
    K => k1,
    clk => clock,
    Q => Qout(0),
    Qbar => Qbar,
    clr => toninty
);

a2 : jk
port map(
    J => j2,
    K => k2,
    clk => clock,
    Q => Qout(1),
    Qbar => Qbar,
    clr => toninty
);

a3 : jk
port map(
    J => j3,
    K => k3,
    clk => clock,
    Q => Qout(2),
    Qbar => Qbar,
    clr => toninty
);

a4 : jk
port map(
    J => j4,
    K => k4,
    clk => clock,
    Q => Qout(3),
    Qbar => Qbar,
    clr => toninty
);

a5 : jk
port map(
    J => j5,
    K => k5,
    clk => clock,
    Q => Qout(4),
    Qbar => Qbar,
    clr => toninty
);

a6 : jk
port map(
    J => j6,
    K => k6,
    clk => clock,
    Q => Qout(5),
    Qbar => Qbar,
    clr => toninty
);

a7 : jk
port map(
    J => j7,
    K => k7,
    clk => clock,
    Q => Qout(6),
    Qbar => Qbar,
    clr => toninty
);


a8 : jk
port map(
    J => j8,
    K => k8,
    clk => clock,
    Q => Qout(7),
    Qbar => Qbar,
    clr => toninty
);


oput <= Qout;

end arch;