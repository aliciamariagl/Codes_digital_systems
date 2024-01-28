library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processador is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end processador;

architecture Behavioral of processador is

    signal ula_op : std_logic_vector(3 downto 0);
    signal Rn_sel, Rm_sel, Rd_sel: std_logic_vector(2 downto 0);
    signal RF_sel: std_logic_vector(1 downto 0);
    signal RAM_we, RAM_sel, ROM_en, Rd_wr, flag_Z, flag_C, en_sp, push_pop : std_logic;
    signal Immed, Rm, Rn, RAM_din, RAM_dout, ROM_addr, ROM_dout: std_logic_vector(15 downto 0);

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
             RAM_dout=>RAM_dout,
             Rm=>Rm,
             Rn=>Rn,
             flag_Z=>flag_Z,
             flag_C=>flag_C,
             en_sp=>en_sp,
             push_pop=>push_pop);

end Behavioral;
