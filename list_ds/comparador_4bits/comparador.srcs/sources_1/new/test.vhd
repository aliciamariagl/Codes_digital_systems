library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end test;

architecture Behavioral of test is

begin

    x <= a and b;

end Behavioral;
