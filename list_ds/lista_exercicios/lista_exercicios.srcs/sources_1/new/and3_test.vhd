library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and3_test is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           x : out STD_LOGIC);
end and3_test;

architecture Behavioral of and3_test is

begin
    x <= a and b and c;
   
end Behavioral;
