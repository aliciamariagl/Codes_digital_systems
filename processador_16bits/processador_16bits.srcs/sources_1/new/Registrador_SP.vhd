library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

entity Registrador_SP is
    Port ( --clk : in STD_LOGIC;
           en : in STD_LOGIC;
           push_pop : in STD_LOGIC;
           data_in : in STD_LOGIC_vector (15 downto 0);
           data_out : out STD_LOGIC_vector (15 downto 0)
          );
end Registrador_SP;

architecture Behavioral of Registrador_SP is

    type pilha is array (0 to 100) of std_logic_vector(15 downto 0);
    signal sp : std_logic_vector (6 downto 0) := "1100100"; 
    signal used: pilha;

begin
    
    process(en)
    begin
     --   if rising_edge(clk) then
        if en = '1' then
            if push_pop = '1' then
                used(to_integer(unsigned(sp))) <= data_in;
                sp <= sp - 1;
             --   data_out <= data_in;
                data_out <= x"0000";
            else
                data_out <= used(to_integer(unsigned(sp+1)));
                sp <= sp + 1;
              --  data_out <= "000000000" & sp;
            end if;
        end if;
    --    end if;
    end process;
  --  data_out <= used(to_integer(unsigned(sp)));
    
end Behavioral;
