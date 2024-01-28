library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xnor_test is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end xnor_test;

architecture Behavioral of xnor_test is

begin
    x <= a xnor b;

end Behavioral;
