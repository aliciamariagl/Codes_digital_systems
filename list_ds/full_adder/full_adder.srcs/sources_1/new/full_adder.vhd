library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           z : in STD_LOGIC;
           add : out STD_LOGIC;
           carry : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

begin

    add <= (x xor y) xor z;
    carry <= (z and (x xor y)) or (x and y);

end Behavioral;
