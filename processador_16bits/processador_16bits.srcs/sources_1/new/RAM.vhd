library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity RAM is
    Port ( clk : in STD_LOGIC;
           we : in STD_LOGIC; 
           din : in STD_LOGIC_vector (15 downto 0);  -- x"000a"
           addr : in STD_LOGIC_vector (15 downto 0); -- x"0000"
           dout : out STD_LOGIC_vector (15 downto 0));
end RAM;

architecture Behavioral of RAM is
    type mem is array(0 to (2**16)-1) of std_logic_vector(16 - 1 downto 0);
    signal ram_block : mem:=(others => (others => '0'));
begin

    process(clk)
    begin
        if(clk'event and clk = '1') then
            if (we = '1') then
                ram_block(TO_INTEGER(unsigned(addr))) <= din;               --Operação de escrita na memória
            end if;
        end if;
    end process;
    
    dout <= ram_block(TO_INTEGER(unsigned(addr)));       
end Behavioral;
