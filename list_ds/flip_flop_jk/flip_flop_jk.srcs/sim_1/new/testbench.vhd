library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

    component flipflop
        Port ( clk : in STD_LOGIC; 
           j : in STD_LOGIC;
           k : in STD_LOGIC;
           q : inout STD_LOGIC;
           q_bar : inout STD_LOGIC);
    end component;
    
    signal clk,j,k,q,q_bar: STD_LOGIC;     
    constant interv: time := 100ns;

begin

    DUT: flipflop port map(clk=>clk,j=>j,k=>k,q=>q,q_bar=>q_bar);  -- AQUI  primeiro a:componente; segundo a:signal

    estimulos: process
    begin
    
    clk <= '1';
    j <= '0';  
    k <= '1';    
    wait for interv;
    
    clk <= '1';
    j <= '1';  
    k <= '1';    
    wait for interv;
    
    clk <= '1';
    j <= '1';  
    k <= '0';    
    wait for interv;
    
    clk <= '1';
    j <= '1';  
    k <= '1';    
    wait for interv;
    
    clk <= '0';
    j <= '1';  
    k <= '0';    
    wait for interv;

    end process;

end Behavioral;
