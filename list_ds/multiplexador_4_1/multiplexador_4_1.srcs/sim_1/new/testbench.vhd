library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

    component multiplexador
        Port ( e0 : in STD_LOGIC;
           e1 : in STD_LOGIC;
           e2 : in STD_LOGIC;
           e3 : in STD_LOGIC;
           c0 : in STD_LOGIC;
           c1 : in STD_LOGIC;
           s : out STD_LOGIC);
    end component;
    
    signal e0,e1,e2,e3,c0,c1,s: std_logic;
    constant interv: time := 100ns;

begin

    DUT: multiplexador port map(e0,e1,e2,e3,c0,c1,s);  -- AQUI  primeiro a:componente; segundo a:signal

    estimulos: process
    begin
    
    e0 <= '0';
    e1 <= '1';
    e2 <= '0';
    e3 <= '1';
    
    c0 <= '0';
    c1 <= '0';
    wait for interv;
    
    e0 <= '0';
    e1 <= '1';
    e2 <= '1';
    e3 <= '1';
    
    c0 <= '1';
    c1 <= '0';
    wait for interv;
    
    e0 <= '0';
    e1 <= '1';
    e2 <= '0';
    e3 <= '0';
    
    c0 <= '0';
    c1 <= '1';
    wait for interv;
    
    e0 <= '1';
    e1 <= '0';
    e2 <= '0';
    e3 <= '1';
    
    c0 <= '1';
    c1 <= '1';
    wait for interv;
    
    e0 <= '0';
    e1 <= '1';
    e2 <= '1';
    e3 <= '1';
    
    c0 <= '0';
    c1 <= '0';
    wait for interv;

    end process;

end Behavioral;
