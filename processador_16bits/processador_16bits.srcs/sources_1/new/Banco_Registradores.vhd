library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

entity Banco_Registradores is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           Rd : in STD_LOGIC_vector(15 downto 0);
           Rd_sel : in STD_LOGIC_vector(2 downto 0);
           Rd_wr : in STD_LOGIC;
           Rm_sel : in STD_LOGIC_vector(2 downto 0);
           Rn_sel : in STD_LOGIC_vector(2 downto 0);
           Rm : out STD_LOGIC_vector(15 downto 0);
           Rn : out STD_LOGIC_vector(15 downto 0));
end Banco_Registradores;

architecture Behavioral of Banco_Registradores is
    
    type bank is array (0 to 7) of std_logic_vector(15 downto 0);
    signal reg_sel: bank;
    signal reg_en: std_logic_vector(7 downto 0);

begin
    
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                for i in 0 to 7 loop
                    reg_sel(i) <= x"0000";
                end loop;
            else
                Rm <= reg_sel(to_integer(unsigned(Rm_sel)));
                Rn <= reg_sel(to_integer(unsigned(Rn_sel)));
                if Rd_wr = '1' then
                    reg_sel(to_integer(unsigned(Rd_sel))) <= Rd;
                end if;
            end if;
        end if;
    end process;
                    
end Behavioral;
