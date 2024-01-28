library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

    component full_adder
        Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           z : in STD_LOGIC;
           add : out STD_LOGIC;
           carry : out STD_LOGIC);
    end component;
    
    signal a,b,c,soma,resto: std_logic;
    constant interv: time := 100ns;

begin
    
    DUT: full_adder port map(x=>a,y=>b,z=>c,add=>soma,carry=>resto);  -- AQUI  primeiro a:componente; segundo a:signal

    estimulos: process
    begin
    
    a <= '0';
    b <= '0';
    c <= '0';
    wait for interv;
    
    a <= '0';
    b <= '0';
    c <= '1';
    wait for interv;
    
    a <= '0';
    b <= '1';
    c <= '0';
    wait for interv;
    
    a <= '0';
    b <= '1';
    c <= '1';
    wait for interv;
    
    a <= '1';
    b <= '0';
    c <= '0';
    wait for interv;
    
    a <= '1';
    b <= '0';
    c <= '1';
    wait for interv;
    
    a <= '1';
    b <= '1';
    c <= '0';
    wait for interv;
    
    a <= '1';
    b <= '1';
    c <= '1';
    wait for interv;

    end process;

end Behavioral;
