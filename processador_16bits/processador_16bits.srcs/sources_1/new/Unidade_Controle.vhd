library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity Unidade_Controle is
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
           en_sp : out STD_LOGIC;
           push_pop : out STD_LOGIC;
           PC_D_s: out STD_LOGIC_vector(15 downto 0) -- TESTE
           );  
end Unidade_Controle;

architecture Behavioral of Unidade_Controle is
    
    signal Immed_s : STD_LOGIC_vector(15 downto 0);
   -- signal ROM_en_s : STD_LOGIC;
    signal IR_Q : STD_LOGIC_vector(15 downto 0);
    signal IR_ld : STD_LOGIC;
    signal PC_rst : STD_LOGIC;
    signal PC_ld : STD_LOGIC;
    signal PC_D: STD_LOGIC_vector(15 downto 0) := x"0000";
    signal flag_jmp : STD_LOGIC;
    signal PC_Q : STD_LOGIC_vector(15 downto 0) := x"0000";

begin

    IR: entity work.Registradores
    port map(clk=>clk,
             rst=>rst,
             reg=>IR_ld,
             D=>ROM_dout,
             Q=>IR_Q);
             
    PC: entity work.Registradores 
    port map(clk=>clk,
             rst=>PC_rst,
             reg=>PC_ld,
             D=>PC_D,
             Q=>PC_Q);
    
    PC_D <= PC_Q + Immed_s when flag_jmp = '1' and ROM_dout(15 downto 11) = "00001" and ROM_dout(1 downto 0) = "00" else
            PC_Q + Immed_s when flag_Z = '1' and flag_C = '0' and ROM_dout(15 downto 11) = "00001" and ROM_dout(1 downto 0) = "01" else
            PC_Q + Immed_s when flag_Z = '0' and flag_C = '1' and ROM_dout(15 downto 11) = "00001" and ROM_dout(1 downto 0) = "10" else
            PC_Q + Immed_s when flag_Z = '0' and flag_C = '0' and ROM_dout(15 downto 11) = "00001" and ROM_dout(1 downto 0) = "11" else
            PC_Q + 2;
            
    ROM_addr <= PC_Q;
    Immed <= Immed_s;
    
   PC_D_s <= PC_D; -- TESTE
    
    controlador: entity work.FSM
       port map ( clk=>clk,
                  rst=>rst,
                  IR_data=>IR_Q,
                  ROM_en=>ROM_en,
                  PC_clr=>PC_rst,
                  PC_inc=>PC_ld,
                  IR_load=>IR_ld,
                  Immed=>Immed_s,
                  RAM_sel=>RAM_sel,
                  RAM_we=>RAM_we,
                  RF_sel=>RF_sel,
                  Rd_sel=>Rd_sel,
                  Rd_wreg=>Rd_wreg,
                  Rm_sel=>Rm_sel,
                  Rn_sel=>Rn_sel,
                  ula_op=>ula_op,
                  flag_jmp=>flag_jmp,
                  en_SP=>en_sp,
                  push_pop=>push_pop);
                    
end Behavioral;