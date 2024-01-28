library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_test is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end xor_test;

architecture Behavioral of xor_test is

begin
    x <= a xor b;

end Behavioral;
