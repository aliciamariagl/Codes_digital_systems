library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplicador is
    Port ( a : in STD_LOGIC_vector (1 downto 0);
           b : in STD_LOGIC_vector (1 downto 0);
           x : out STD_LOGIC_vector (3 downto 0));
end multiplicador;

architecture Behavioral of multiplicador is

begin

    x(0) <= a(0) and b(0);
    x(1) <= (a(1) and b(0)) xor (a(0) and b(1));
    x(2) <= (a(1) and b(1)) and (a(0) nand b(0));
    x(3) <= a(1) and a(0) and b(1) and b(0);

end Behavioral;
