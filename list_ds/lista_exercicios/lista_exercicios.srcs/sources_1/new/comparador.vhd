library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparador is
    Port ( a : in STD_LOGIC_vector (3 downto 0);
           b : in STD_LOGIC_vector (3 downto 0);
           s1 : out STD_LOGIC;
           s2 : out STD_LOGIC;
           s3 : out STD_LOGIC);
end comparador;

architecture Behavioral of comparador is

    signal r1, r2, r3 : STD_LOGIC;

begin

    r1 <= (not b(3)) and a(3);
    r2 <= not (b(3) xor a(3));
    r3 <= (not a(3)) and b(3);
    
    process is
    begin
        if r2 = '1' then 
            r3 <= r3 or (r1 and (b(2) and (not a(2))));
            r2 <= r2 or (r1 and ((not b(2)) and a(2)));
            r1 <= r1 and (not(a(2) xor b(2)));
            if r2 = '1' then
                r3 <= r3 or (r1 and (b(1) and (not a(1))));
                r2 <= r2 or (r1 and ((not b(1)) and a(1)));
                r1 <= r1 and (not(a(1) xor b(1)));
                if r2 = '1' then
                    r3 <= r3 or (r1 and (b(0) and (not a(0))));
                    r2 <= r2 or (r1 and ((not b(0)) and a(0)));
                    r1 <= r1 and (not(a(0) xor b(0)));
                end if;
            end if;
        end if;
    end process;
    
    s1 <= r1; -- r1: a>b
    s2 <= r2; -- r2: a=b
    s3 <= r3; -- r3: a<b
    
end Behavioral; 
