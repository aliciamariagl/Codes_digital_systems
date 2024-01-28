library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity ULA is
    Port ( A : in STD_LOGIC_vector(15 downto 0);
           B : in STD_LOGIC_vector(15 downto 0);
           Immed: in STD_LOGIC_vector(15 downto 0);
           op : in STD_LOGIC_vector(3 downto 0);
           Q : out STD_LOGIC_vector(15 downto 0);
           flag_Z : out STD_LOGIC;
           flag_C : out STD_LOGIC);
end ULA;

architecture Behavioral of ULA is
    
    signal result : STD_LOGIC_vector(15 downto 0);
    signal add, mul : STD_LOGIC_vector(31 downto 0);
    signal A_s, B_s : unsigned(15 downto 0);

begin
    
    A_s <= unsigned(A);
    B_s <= unsigned(B);
    mul <= std_logic_vector(unsigned' (A_s * B_s));
    add <= x"0000" & (A+B);
    
    result <= add(15 downto 0) when op = "0100" else
              A - B when op = "0101" else
              mul(15 downto 0) when op = "0110" else
              A and B when op = "0111" else
              A or B when op = "1000" else
              not A when op = "1001" else               -- Não aguento mais fazer isso, by: Guilherme :(
              A xor B when op = "1010" else
              shr(A, Immed) when op = "1011" else
              shl(A, Immed) when op = "1100" else   
              shr(A, x"0001") when op = "1101" else  
              shl(A, x"0001") when op = "1110" else
              x"0000";
                  
    flag_Z <= '0'  when A /= B else
              '1' when A = B;
              
    flag_C <= '0' when A >= B else
              '1' when A < B;
              
    Q <= result;
              
end Behavioral;
