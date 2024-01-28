library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexador is
    Port ( e0 : in STD_LOGIC;
           e1 : in STD_LOGIC;
           e2 : in STD_LOGIC;
           e3 : in STD_LOGIC;
           c0 : in STD_LOGIC;
           c1 : in STD_LOGIC;
           s : out STD_LOGIC);
end multiplexador;

architecture Behavioral of multiplexador is

begin

    s <= (e0 and (not c1) and (not c0)) or (e1 and (not c1) and c0) or (e2 and c1 and (not c0)) or (e3 and c1 and c0);

end Behavioral;
