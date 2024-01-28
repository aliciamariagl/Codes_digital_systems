library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor_test is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end nor_test;

architecture Behavioral of nor_test is

begin
    x <= a nor b;

end Behavioral;
