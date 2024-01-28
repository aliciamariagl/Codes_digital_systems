library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity latch is
    Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC;
           q : out STD_LOGIC);
end latch;

architecture Behavioral of latch is

begin

    process (clk)
    begin
        if (clk = '1') then
            q <= d;
        end if;
    end process;

end Behavioral;
