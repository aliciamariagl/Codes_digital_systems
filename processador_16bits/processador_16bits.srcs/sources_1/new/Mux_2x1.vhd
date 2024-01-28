library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2x1 is
    Port ( sel : in STD_LOGIC;
           I0 : in STD_LOGIC_vector(15 downto 0);
           I1 : in STD_LOGIC_vector(15 downto 0);
           RAM_din : out STD_LOGIC_vector(15 downto 0));
end Mux_2x1;

architecture Behavioral of Mux_2x1 is

begin

    RAM_din <= I0 when sel = '0' else
               I1 when sel = '1';

end Behavioral;
