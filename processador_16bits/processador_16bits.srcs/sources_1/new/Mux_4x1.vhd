library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_4x1 is
    Port ( sel : in STD_LOGIC_vector(1 downto 0);
           I0 : in STD_LOGIC_vector(15 downto 0);
           I1 : in STD_LOGIC_vector(15 downto 0);
           I2 : in STD_LOGIC_vector(15 downto 0);
           I3 : in STD_LOGIC_vector(15 downto 0);
           Rd : out STD_LOGIC_vector(15 downto 0));
end Mux_4x1;

architecture Behavioral of Mux_4x1 is

begin

    Rd <= I0 when sel = "00" else
          I1 when sel = "01" else
          I2 when sel = "10" else
          I3 when sel = "11";

end Behavioral;
