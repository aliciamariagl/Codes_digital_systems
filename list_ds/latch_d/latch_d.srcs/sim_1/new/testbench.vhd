library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

    component latch
        Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC;
           q : out STD_LOGIC);
    end component;
    
    signal clk,d,q: STD_LOGIC;
    constant interv: time := 100ns;

begin

    DUT: latch port map(clk,d,q);  -- AQUI  primeiro a:componente; segundo a:signal

    estimulos: process
    begin
    
    clk <= '1';
    d <= '0';
    wait for interv;
    
    clk <= '0';
    d <= '1';
    wait for interv;
    
    clk <= '1';
    d <= '1';
    wait for interv;
    
    clk <= '0';
    d <= '0';
    wait for interv;

    end process;

end Behavioral;
