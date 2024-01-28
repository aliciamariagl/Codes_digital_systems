library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

    component half_adder
        Port ( b1 : in STD_LOGIC;
           b2 : in STD_LOGIC;
           add : out STD_LOGIC;
           carry : out STD_LOGIC);
    end component;
    
    signal a,b,soma,c: std_logic;
    constant interv: time := 100ns;

begin

    DUT: half_adder port map(b1=>a,b2=>b,add=>soma,carry=>c);  -- AQUI  primeiro a:componente; segundo a:signal

    estimulos: process
    begin
    
    a <= '0';
    b <= '0';
    wait for interv;
    
    a <= '1';
    b <= '0';
    wait for interv;
    
    a <= '0';
    b <= '1';
    wait for interv;
    
    a <= '1';
    b <= '1';
    wait for interv;

    end process;

end Behavioral;
