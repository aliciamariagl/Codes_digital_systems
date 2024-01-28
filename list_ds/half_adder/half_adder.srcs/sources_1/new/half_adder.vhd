library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
    Port ( b1 : in STD_LOGIC;
           b2 : in STD_LOGIC;
           add : out STD_LOGIC;
           carry : out STD_LOGIC);
end half_adder;

architecture Behavioral of half_adder is

begin

    add <= b1 xor b2;
    carry <= b1 and b2;

end Behavioral;
