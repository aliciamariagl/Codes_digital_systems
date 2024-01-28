library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Testbench_Registradores is
--  Port ( );
end Testbench_Registradores;

architecture Behavioral of Testbench_Registradores is

    component Registradores
        Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           reg : in STD_LOGIC;
           D : in STD_LOGIC_vector(15 downto 0);
           Q : out STD_LOGIC_vector(15 downto 0));
    end component;
    
    signal clk_s, rst_s, reg_s: STD_LOGIC;
    signal D_s, Q_s: STD_LOGIC_vector(15 downto 0);
    constant interv: time := 100ns;

begin

    DUT: entity work.Registradores port map(clk=>clk_s, rst=>rst_s, reg=>reg_s, D=>D_s, Q=>Q_s);
    
    estimulos: process
    begin
    
    clk_s <= '0';
    rst_s <= '0';
    reg_s <= '1';
    D_s <= x"0011";    
    wait for interv;
    
    clk_s <= '1';
    rst_s <= '0';
    reg_s <= '1';
    D_s <= x"0100";    
    wait for interv;
    
    clk_s <= '0';
    rst_s <= '0';
    reg_s <= '0';
    D_s <= x"0001";    
    wait for interv;
    
    clk_s <= '1';
    rst_s <= '0';
    reg_s <= '1';
    D_s <= x"1111";    
    wait for interv;

    end process;

end Behavioral;
