library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Testbench_Unidade_Controle is
--  Port ( );
end Testbench_Unidade_Controle;

architecture Behavioral of Testbench_Unidade_Controle is

    component Unidade_Controle
        Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           ROM_en : out STD_LOGIC;
           ROM_addr : out STD_LOGIC_vector(15 downto 0);
           ROM_dout : in STD_LOGIC_vector(15 downto 0);
           Immed : out STD_LOGIC_vector(15 downto 0);
           RAM_sel : out STD_LOGIC;
           RAM_we : out STD_LOGIC;
           RF_sel : out STD_LOGIC_vector(1 downto 0);
           Rd_sel : out STD_LOGIC_vector(2 downto 0);
           Rd_wreg : out STD_LOGIC;
           Rm_sel : out STD_LOGIC_vector(2 downto 0);
           Rn_sel : out STD_LOGIC_vector(2 downto 0);
           ula_op : out STD_LOGIC_vector(3 downto 0);
           flag_Z : in STD_LOGIC;
           flag_C : in STD_LOGIC;
           PC_D_s: out STD_LOGIC_vector(15 downto 0) --TESTE
           );
    end component;
    
    signal clk, rst, ROM_en, RAM_sel, RAM_we, Rd_wreg, flag_Z, flag_C: STD_LOGIC;
    signal ROM_addr, ROM_dout, Immed: STD_LOGIC_vector(15 downto 0);
    signal Rd_sel, Rm_sel, Rn_sel: STD_LOGIC_vector(2 downto 0);
    signal ula_op: STD_LOGIC_vector(3 downto 0);
    signal RF_sel: STD_LOGIC_vector(1 downto 0);
    constant interv: time := 100ns;
    
    signal PC_D_s : STD_LOGIC_vector(15 downto 0);

begin

    DUT: Unidade_Controle port map(clk, rst, ROM_en, ROM_addr, ROM_dout, Immed, RAM_sel, RAM_we, RF_sel, Rd_sel, Rd_wreg, Rm_sel, Rn_sel, ula_op, flag_Z, flag_C, PC_D_s);
    
    estimulos_clk: process
    begin
        clk <= '0';
        wait for 2ns;
        clk <= '1';
        wait for 2ns;
    end process;
    
    estimulos: process
    begin
    
    rst <= '1';
    ROM_dout <= x"0820";
    flag_Z <= '0';
    flag_C <= '0';
    wait for interv;
    
    rst <= '0';
    ROM_dout <= x"0820";
    flag_Z <= '0';
    flag_C <= '0';
    wait for interv;
    
    rst <= '0';
    ROM_dout <= x"08e0";
    flag_Z <= '0';
    flag_C <= '1';
    wait for interv;
    
    rst <= '0';
    ROM_dout <= x"1272";
    wait for interv;
    
    rst <= '0';
    ROM_dout <= x"5454";
    wait for interv;
    
    end process;

end Behavioral;
