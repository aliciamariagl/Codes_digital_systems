library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decodificador is
    Port ( b1 : in STD_LOGIC;
           b2 : in STD_LOGIC;
           s0 : out STD_LOGIC;
           s1 : out STD_LOGIC;
           s2 : out STD_LOGIC;
           s3 : out STD_LOGIC);
end decodificador;

architecture Behavioral of decodificador is

    constant interv: time := 100ns;

begin

    process (b1, b2)
    begin
        if b1 = '0' then
            if b2 = '0' then
                s0 <= '1';     -- s0
                s1 <= '0';
                s2 <= '0';
                s3 <= '0';
              --  wait for interv;
            else
                s0 <= '0';      -- s2
                s1 <= '0';
                s2 <= '1';
                s3 <= '0';
              --  wait for interv;
            end if;
         --   wait for interv;
        else
            if b2 = '0' then
                s0 <= '0';      -- s1
                s1 <= '1';
                s2 <= '0';
                s3 <= '0';
              --  wait for interv;
            else
                s0 <= '0';     -- s3
                s1 <= '0';
                s2 <= '0';
                s3 <= '1';
              --  wait for interv;
            end if;
          --  wait for interv;
        end if;
    end process;

end Behavioral;
