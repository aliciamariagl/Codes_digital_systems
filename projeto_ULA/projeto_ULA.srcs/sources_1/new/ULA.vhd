library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ULA is
    Port ( a : in STD_LOGIC_vector (1 downto 0);
           b : in STD_LOGIC_vector (1 downto 0);
           result : out STD_LOGIC_vector (2 downto 0);
           button : in STD_LOGIC;
           led : out STD_LOGIC_vector (2 downto 0));
end ULA;

architecture Behavioral of ULA is

    signal carry: STD_LOGIC_vector (1 downto 0);

begin

    process(button,carry)
    begin
        case button is
            when '0' =>
                result(0) <= a(0) xor b(0);
                carry(0) <= a(0) and b(0);
                result(1) <= a(1) xor b(1) xor carry(0);
                carry(1) <= (carry(0) and (a(1) xor b(1))) or (a(1) and b(1));
                result(2) <= carry(1);
               -- result <= std_logic_vector(signed(a) + signed(b)); 
            when '1' =>
                if a > b then
                    if a(0) > b(0) then
                        result(0) <= '1';
                        result(1) <= a(1) xor b(1);
                    elsif a(0) < b(0) then
                        result(0) <= '1';
                        result(1) <= '0';
                    elsif a(0) = b(0) then
                        result(0) <= '0';
                        result(1) <= a(1) xor b(1);
                    end if;
                elsif a < b then
                    if b(0) > a(0) then
                        result(0) <= '1';
                        result(1) <= a(1) xor b(1);
                    elsif b(0) < a(0) then
                        result(0) <= '1';
                        result(1) <= '0';
                    elsif a(0) = b(0) then
                        result(0) <= '0';
                        result(1) <= a(1) xor b(1);
                    end if;
                else
                    
                end if;
                result(2) <= '0';
               -- result <= std_logic_vector(signed(a) - signed(b));
            when others =>
                result <= "000";
            end case;
    end process;

end Behavioral;
