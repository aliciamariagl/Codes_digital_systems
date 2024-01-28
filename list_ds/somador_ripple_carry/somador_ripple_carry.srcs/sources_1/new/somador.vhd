library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador is
    Port ( a : in STD_LOGIC_vector (3 downto 0);
           b : in STD_LOGIC_vector (3 downto 0);
           add : out STD_LOGIC_vector (3 downto 0);
           carry : out STD_LOGIC);
end somador;

architecture Behavioral of somador is

    signal c: STD_LOGIC_vector (3 downto 0);

begin

    add(0) <= a(0) xor b(0);
    c(0) <= a(0) and b(0);
    
    add(1) <= a(1) xor b(1) xor c(0);
    c(1) <= (c(0) and (a(1) xor b(1))) or (a(1) and b(1));
    
    add(2) <= a(2) xor b(2) xor c(1);
    c(2) <= (c(1) and (a(2) xor b(2))) or (a(2) and b(2));
    
    add(3) <= a(3) xor b(3) xor c(2);
    c(3) <= (c(2) and (a(3) xor b(3))) or (a(3) and b(3));
    
    carry <= c(3);

end Behavioral;
