library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

    component multiplicador
        Port ( a : in STD_LOGIC_vector (1 downto 0);
           b : in STD_LOGIC_vector (1 downto 0);
           x : out STD_LOGIC_vector (3 downto 0));
    end component;
    
    signal a,b: std_logic_vector (1 downto 0);
    signal x: std_logic_vector (3 downto 0);
    constant interv: time := 100ns;

begin

    DUT: multiplicador port map(a,b,x);  -- AQUI  primeiro a:componente; segundo a:signal

    estimulos: process
    begin
    
    a <= "00";
    b <= "01";
    wait for interv;
    
    a <= "10";
    b <= "11";
    wait for interv;
    
    a <= "00";
    b <= "11";
    wait for interv;
    
    a <= "01";
    b <= "10";
    wait for interv;
    
    a <= "00";
    b <= "10";
    wait for interv;
    
    a <= "01";
    b <= "11";
    wait for interv;
    
    a <= "11";
    b <= "11";
    wait for interv;

    end process;

end Behavioral;
