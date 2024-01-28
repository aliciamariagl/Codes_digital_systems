library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity ROM is
    generic (addr_width : integer := 16;
             data_width : integer := 16);
    Port (clk : in STD_LOGIC;
          en : in STD_LOGIC;
          addr : in STD_LOGIC_vector(15 downto 0);
          dout : out STD_LOGIC_vector(15 downto 0));
end ROM;

architecture Behavioral of ROM is


    type mem is array(0 to (2**addr_width)-1) of std_logic_vector(addr_width - 1 downto 0);
    signal ram_block : mem:=(X"0000",X"1950",X"1220",X"4744",X"207C",X"2F3E",X"3560",X"3620",X"46D4",X"50C4",X"6424",X"7324",X"8224",X"A224",X"90E0",X"FFFF",others => (others => '0'));
    
begin
    
    process(clk)
    begin
    if(clk'event and clk = '1') then
        if (en = '1') then
            dout <= ram_block(TO_INTEGER(unsigned(addr))); 
        end if;
    end if;
    end process;
                    
end Behavioral;
