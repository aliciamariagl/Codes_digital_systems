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

    signal r1, r2 : STD_LOGIC;
    constant interv: time := 10ns;

begin
    
    r1 <= ((not b(3)) and a(3)) or ((not(a(3) xor b(3))) and (not b(2)) and a(2)) or ((not(a(3) xor b(3))) and (not(a(2) xor b(2))) and (not b(1)) and a(1)) or ((not(a(3) xor b(3))) and (not(a(2) xor b(2))) and (not(a(1) xor b(1))) and (not b(0)) and a(0));
    r2 <= (not(a(3) xor b(3))) and (not(a(2) xor b(2))) and (not(a(1) xor b(1))) and (not(a(0) xor b(0)));
    s3 <= r1 nor r2;
    
    s1 <= r1;
    s2 <= r2;
    
    -- s1: a>b
    -- s2 a=b
    -- s3 a<b

end Behavioral;
