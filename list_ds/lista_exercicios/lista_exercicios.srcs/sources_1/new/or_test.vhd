library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_test is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end or_test;

architecture Behavioral of or_test is

begin
    x <= a or b;

end Behavioral;
