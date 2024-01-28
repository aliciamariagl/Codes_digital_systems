library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flipflop is
    Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC;
           q : out STD_LOGIC);
end flipflop;

architecture Behavioral of flipflop is

begin

    process (clk)
    begin
        if (clk' event and clk = '1') then
            q <= d;
        end if;
    end process;

end Behavioral;
