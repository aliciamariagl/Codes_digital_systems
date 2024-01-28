library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand_test is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end nand_test;

architecture Behavioral of nand_test is

begin
    x <= a nand b;

end Behavioral;
