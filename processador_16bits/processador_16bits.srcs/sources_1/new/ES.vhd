library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ES is
    Port ( IN_OUT : in STD_LOGIC
           );
end ES;

architecture Behavioral of ES is

begin

    process(IN_OUT)
    begin
        if IN_OUT = '1' then
        
        end if;
    end process;

end Behavioral;
