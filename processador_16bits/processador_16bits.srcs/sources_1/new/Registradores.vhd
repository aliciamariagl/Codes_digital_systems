library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Registradores is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           reg : in STD_LOGIC;
           D : in STD_LOGIC_vector(15 downto 0);
           Q : out STD_LOGIC_vector(15 downto 0));
end Registradores;

architecture Behavioral of Registradores is

begin

    process(clk,rst,reg)
    begin
    
        if(clk'event and clk='1') then
            if(rst = '1') then
                Q <= (others=>'0');
            elsif(reg = '1') then
                Q <= D;
            end if;
        end if;
    
    end process;

end Behavioral;
