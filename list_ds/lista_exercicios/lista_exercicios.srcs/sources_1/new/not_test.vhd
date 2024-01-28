library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_test is
    Port ( a : in STD_LOGIC;
           x : out STD_LOGIC);
end not_test;

architecture Behavioral of not_test is

begin
    x <= not a;

end Behavioral;
