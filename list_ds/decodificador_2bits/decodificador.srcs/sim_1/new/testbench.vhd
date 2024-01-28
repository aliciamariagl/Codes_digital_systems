library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

    component decodificador   -- AQUI
        Port ( b1 : in STD_LOGIC;
           b2 : in STD_LOGIC;
           s0 : out STD_LOGIC;
           s1 : out STD_LOGIC;
           s2 : out STD_LOGIC;
           s3 : out STD_LOGIC);
    end component;
    
    signal b1,b2,s0,s1,s2,s3: std_logic;
    constant interv: time := 100ns;

begin

    DUT: decodificador port map(b1,b2,s0,s1,s2,s3);  -- AQUI  primeiro a:componente; segundo a:signal

    estimulos: process
    begin
    
    b1 <= '0';
    b2 <= '0';
    wait for interv;
    
    b1 <= '1';
    b2 <= '0';
    wait for interv;
    
    b1 <= '0';
    b2 <= '1';
    wait for interv;
    
    b1 <= '1';
    b2 <= '1';
    wait for interv;

    end process;

end Behavioral;
