library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity Adder_2 is
    Generic (dois: integer:=2);
    Port (clk : in STD_LOGIC;
          instr : in STD_LOGIC_vector(15 downto 0);
          prox_instr : out STD_LOGIC_vector(15 downto 0));
end Adder_2;

architecture Behavioral of Adder_2 is
    
begin
    
    process(clk)
    begin
        if (clk'event and clk='0') then
            prox_instr <= instr + dois;
        end if;
    end process;
                    
end Behavioral;
