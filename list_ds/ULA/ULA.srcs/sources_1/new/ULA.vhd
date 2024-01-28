library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity ULA is
    Port ( seletor : in STD_LOGIC_vector (1 downto 0);
           n1 : in STD_LOGIC_vector (3 downto 0);
           n2 : in STD_LOGIC_vector (3 downto 0); 
           result : out STD_LOGIC_vector (3 downto 0));
end ULA;

architecture Behavioral of ULA is

    signal c: STD_LOGIC_vector (3 downto 0);

begin

    process (n1,n2,seletor,c)
    begin
        case seletor is
            when "00" => 
                result <= n1 + n2;
            when "01" => 
                result <= n1 - n2;
            when "10" => 
                result(0) <= n1(0) and n2(0);
                result(1) <= n1(1) and n2(1);
                result(2) <= n1(2) and n2(2);
                result(3) <= n1(3) and n2(3);
            when "11" => 
                result(0) <= n1(0) or n2(0);
                result(1) <= n1(1) or n2(1);
                result(2) <= n1(2) or n2(2);
                result(3) <= n1(3) or n2(3);
            when others =>
                result <= "0000";
        end case;
    end process;

end Behavioral;
