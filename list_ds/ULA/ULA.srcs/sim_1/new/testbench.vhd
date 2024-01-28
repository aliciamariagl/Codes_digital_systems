library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

    component ULA
        Port ( seletor : in STD_LOGIC_vector (1 downto 0);
           n1 : in STD_LOGIC_vector (3 downto 0);
           n2 : in STD_LOGIC_vector (3 downto 0);
           result : out STD_LOGIC_vector (3 downto 0));
    end component;
    
    signal seletor: STD_LOGIC_vector (1 downto 0);
    signal n1,n2: STD_LOGIC_vector (3 downto 0);
    signal result: STD_LOGIC_vector (3 downto 0);
    constant interval: time := 100ns;

begin

    DUT: ULA port map(seletor=>seletor,n1=>n1,n2=>n2,result=>result);
    
    estimulos: process
    begin
    
    seletor <= "00";
    n1 <= "0110";
    n2 <= "0011";
    wait for interval;
    
    seletor <= "01";
    n1 <= "0110";
    n2 <= "0011";
    wait for interval;
    
    seletor <= "10";
    n1 <= "0110";
    n2 <= "0011";
    wait for interval;
    
    seletor <= "11";
    n1 <= "0110";
    n2 <= "0011";
    wait for interval;
    
    end process;

end Behavioral;
