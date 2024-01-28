library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_test is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end and_test;

architecture Behavioral of and_test is

begin
    x <= a and b;

end Behavioral;
