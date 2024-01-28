library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

    component somador
        Port ( a : in STD_LOGIC_vector (3 downto 0);
           b : in STD_LOGIC_vector (3 downto 0);
           add : out STD_LOGIC_vector (3 downto 0);
           carry : out STD_LOGIC);
    end component;
    
    signal a,b,add: std_logic_vector (3 downto 0);
    signal carry: std_logic;
    constant interv: time := 100ns;

begin

    DUT: somador port map(a,b,add,carry);  -- AQUI  primeiro a:componente; segundo a:signal

    estimulos: process
    begin
    
    a <= "1111";
    b <= "1111";
    wait for interv;
    
    a <= "1110";
    b <= "1111";
    wait for interv;
    
    a <= "0011";
    b <= "0001";
    wait for interv;

    end process;

end Behavioral;
