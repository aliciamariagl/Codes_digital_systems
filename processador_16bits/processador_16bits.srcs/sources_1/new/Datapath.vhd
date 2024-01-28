library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity Datapath is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC; 
           ula_op : in STD_LOGIC_vector (3 downto 0);
           Rn_sel : in STD_LOGIC_vector (2 downto 0);
           Rm_sel : in STD_LOGIC_vector (2 downto 0);
           Rd_wr : in STD_LOGIC;
           Rd_sel : in STD_LOGIC_vector (2 downto 0);
           RF_sel : in STD_LOGIC_vector (1 downto 0);
           Immed : in STD_LOGIC_vector (15 downto 0);
           RAM_dout : in STD_LOGIC_vector (15 downto 0);
           Rm : out STD_LOGIC_vector (15 downto 0);
           Rn : out STD_LOGIC_vector (15 downto 0);
           flag_Z : out STD_LOGIC;
           flag_C : out STD_LOGIC;
           en_sp : in STD_LOGIC;
           push_pop : in STD_LOGIC;
           data_out_saida : out STD_LOGIC_vector (15 downto 0));
end Datapath;

architecture Behavioral of Datapath is
    
    signal ULA_Q, Rm_s, Rn_s, data_out, Rm_mux : STD_LOGIC_vector (15 downto 0);
    signal Rd_s : STD_LOGIC_vector (15 downto 0);

begin

    Mult: entity work.Mux_4x1
	       port map(sel=>RF_sel,
                    I0=>Rm_mux,
                    I1=>RAM_dout,
                    I2=>Immed,
                    I3=>ULA_Q,
                    Rd=>Rd_s);
    
    Banco_regs: entity work.Banco_Registradores
	               port map(clk=>clk,
                            rst=>rst,
                            Rd=>Rd_s,
                            Rd_sel=>Rd_sel,
                            Rd_wr=>Rd_wr,
                            Rm_sel=>Rm_sel,
                            Rn_sel=>Rn_sel,
                            Rm=>Rm_s,
                            Rn=>Rn_s);
    
    SP: entity work.Registrador_SP
    port map(-- clk=>clk,
              en=>en_sp,
              push_pop=>push_pop,
              data_in=> Rn_s,
              data_out=>data_out);
    
    data_out_saida <= data_out;
                
    ULA: entity work.ULA
	       port map(A=>Rm_s,
                    B=>Rn_s,
                    Immed=>Immed,
                    op=>ula_op,
                    Q=>ULA_Q,
                    flag_Z=>flag_Z,
                    flag_C=>flag_C);
    
    Rm_mux <= data_out when en_sp = '1' and push_pop = '0' else
              Rm_s;
    Rm <= Rm_s;
    Rn <= Rn_s;
                    
end Behavioral;
