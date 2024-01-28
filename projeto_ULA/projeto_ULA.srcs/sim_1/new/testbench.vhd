library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

    component ULA
        Port ( a : in STD_LOGIC_vector (1 downto 0);
           b : in STD_LOGIC_vector (1 downto 0);
           result : out STD_LOGIC_vector (2 downto 0);
           button : in STD_LOGIC;
           led : out STD_LOGIC_vector (2 downto 0));
    end component;
    
    signal a,b: STD_LOGIC_vector (1 downto 0);
    signal button: STD_LOGIC;
    signal led,result: STD_LOGIC_vector (2 downto 0);
    constant interval: time := 100ns;

begin

    DUT: ULA port map(a,b,result,button,led);
    
    estimulos: process
    begin
    
    a <= "11";
    b <= "01";
    button <= '0';
    wait for interval;
    
    a <= "01";
    b <= "01";
    button <= '1';
    wait for interval;
    
    a <= "01";
    b <= "10";
    button <= '1';
    wait for interval;
    
    a <= "01";
    b <= "01";
    button <= '0';
    wait for interval;
    
    end process;

end Behavioral;
