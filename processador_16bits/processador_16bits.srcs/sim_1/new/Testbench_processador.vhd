library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Testbench_Processador is
--  Port ( );
end Testbench_Processador;

architecture Behavioral of Testbench_Processador is
    -- sinais de fora do sistema
    signal clk : STD_LOGIC := '0';
    signal rst : STD_LOGIC := '1';
    
    -- sinais de dentro do sistema                         
    signal ROM_en : STD_LOGIC:= '0';
    signal ROM_addr : std_logic_vector(15 downto 0);
    signal ROM_dout : std_logic_vector(15 downto 0);
    signal Immed : std_logic_vector(15 downto 0);
    signal RAM_sel : std_logic:= '0';
    signal RAM_we : std_logic:= '0';
    signal RF_sel : std_logic_vector(1 downto 0);
    signal Rd_sel : std_logic_vector(2 downto 0);
    signal Rd_wr : std_logic;
    signal Rm_sel : std_logic_vector(2 downto 0);
    signal Rn_sel : std_logic_vector(2 downto 0);
    signal ula_op : std_logic_vector(3 downto 0);
    signal flag_Z : std_logic;
    signal flag_C : std_logic;
    signal en_sp : std_logic;
    signal push_pop : std_logic;
    signal Rn : std_logic_vector(15 downto 0);
    signal RAM_din : std_logic_vector(15 downto 0);
    signal Rm : std_logic_vector(15 downto 0);
    signal RAM_dout : std_logic_vector(15 downto 0);
    
    
begin
    ROM: entity work.ROM
    port map(clk=>clk,
             en=>ROM_en,
             addr=>ROM_addr,
             dout=>ROM_dout);

    Unidade_de_Controle: entity work.Unidade_Controle
    port map(clk=>clk,
             rst=>rst,
             ROM_en=>ROM_en,
             ROM_addr=>ROM_addr,
             ROM_dout=>ROM_dout,
             Immed=>Immed,
             RAM_sel=>RAM_sel,
             RAM_we=>RAM_we,
             RF_sel=>RF_sel,
             Rd_sel=>Rd_sel,
             Rd_wreg=>Rd_wr,
             Rm_sel=>Rm_sel,
             Rn_sel=>Rn_sel,
             ula_op=>ula_op,
             flag_Z=>flag_Z,
             flag_C=>flag_C,
             en_sp=>en_sp,
             push_pop=>push_pop);
             
    Multiplexador_2x1: entity work.Mux_2x1
    port map(sel=>RAM_sel,
             I0=>Rn,
             I1=>Immed,
             RAM_din=>RAM_din);
             
   RAM: entity work.RAM
    port map(clk=>clk,
             we=>RAM_we,
             din=>RAM_din,
             addr=>Rm,
             dout=>RAM_dout);
             
    Datapath: entity work.Datapath
    port map(clk=>clk,
             rst=>rst, 
             ula_op=>ula_op,
             Rn_sel=>Rn_sel,
             Rm_sel=>Rm_sel,
             Rd_wr=>Rd_wr,
             Rd_sel=>Rd_sel,
             RF_sel=>RF_sel,
             Immed=>Immed,
             RAM_dout=>RAM_dout,                -- Se não acaar o semestre, ele vai acabar comigo :(, by: gui
             Rm=>Rm,
             Rn=>Rn,
             flag_Z=>flag_Z,
             flag_C=>flag_C,
             en_sp=>en_sp,
             push_pop=>push_pop);
    
    Clock_signal:
    process begin
        clk <= '1';
        wait for 1 ns;
        clk <= '0';
        wait for 1 ns;
    end process;
    
    Stimulus:
    process begin
        wait for 4 ns;
        rst <= '0';
        
        wait for 100 ns;
        
    end process;

end Behavioral;
