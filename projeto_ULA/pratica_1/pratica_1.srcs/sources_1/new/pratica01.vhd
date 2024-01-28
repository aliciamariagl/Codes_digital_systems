library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity pratica01 is
    Port ( botao0 : in STD_LOGIC;
           botao1: in STD_LOGIC;
           led : out STD_LOGIC;
           sw10 : in std_logic_vector(1 downto 0);
           sw32 : in std_logic_vector(1 downto 0);
           resultado : out std_logic_vector(2 downto 0)
    );
end pratica01;

architecture Behavioral of pratica01 is
shared variable op : std_logic := '0';
--    type estados is (soma, sub);
--    signal y : estados;
begin

    teste01:process(botao0)
    begin
        led <= botao0;
    end process;
    
    teste02:process(botao1)
      
    begin
        if(rising_edge(botao1)) then
            op := op xor '1';
        end if;
        
    end process;
    
    teste03:process(sw10, sw32)
    begin
        case op is 
            when '0' => 
                resultado <= ('0' & sw10) + ('0' & sw32);
            when '1' => 
                resultado <= ('0' & sw10) - ('0' & sw32);
            when others => 
                resultado <= "000";
        end case;
    end process;
end Behavioral;
