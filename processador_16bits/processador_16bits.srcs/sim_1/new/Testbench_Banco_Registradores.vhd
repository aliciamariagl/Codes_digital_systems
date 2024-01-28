library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Testbench_Banco_Registradores is
--  Port ( );
end Testbench_Banco_Registradores;

architecture Behavioral of Testbench_Banco_Registradores is

    component Banco_Registradores
        Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           Rd : in STD_LOGIC_vector(15 downto 0);
           Rd_sel : in STD_LOGIC_vector(2 downto 0);
           Rd_wr : in STD_LOGIC;
           Rm_sel : in STD_LOGIC_vector(2 downto 0);
           Rn_sel : in STD_LOGIC_vector(2 downto 0);
           Rm : out STD_LOGIC_vector(15 downto 0);
           Rn : out STD_LOGIC_vector(15 downto 0));
    end component;
    
    signal clk, rst, Rd_wr: STD_LOGIC;
    signal Rd, Rm, Rn: STD_LOGIC_vector(15 downto 0);
    signal Rd_sel, Rm_sel, Rn_sel: STD_LOGIC_vector(2 downto 0);
    constant interv: time := 100ns;

begin

    DUT: Banco_Registradores port map(clk, rst, Rd, Rd_sel, Rd_wr, Rm_sel, Rn_sel, Rm, Rn);
    
    estimulos: process
    begin
    
    clk <= '0';
    rst <= '0';
    Rd <= x"aaaa";
    Rd_sel <= "010";
    Rd_wr <= '1';
    Rm_sel <= "000";
    Rn_sel <= "000";
    wait for interv;
    
    clk <= '1';
    rst <= '0';
    Rd <= x"aaaa";
    Rd_sel <= "010";
    Rd_wr <= '1';
    Rm_sel <= "000";
    Rn_sel <= "000";
    wait for interv;
    
    clk <= '0';
    rst <= '0';
    Rd <= x"7777";
    Rd_sel <= "000";
    Rd_wr <= '1';
    Rm_sel <= "010";
    Rn_sel <= "000";
    wait for interv;
    
    clk <= '1';
    rst <= '0';
    Rd <= x"7777";
    Rd_sel <= "000";
    Rd_wr <= '1';
    Rm_sel <= "010";
    Rn_sel <= "000";
    wait for interv;
    
    clk <= '0';
    rst <= '0';
    Rd <= x"7777";
    Rd_sel <= "000";
    Rd_wr <= '0';
    Rm_sel <= "010";
    Rn_sel <= "000";
    wait for interv;
    
    clk <= '1';
    rst <= '0';
    Rd <= x"7777";
    Rd_sel <= "000";
    Rd_wr <= '0';
    Rm_sel <= "010";
    Rn_sel <= "000";
    wait for interv;
    
    end process;

end Behavioral;
