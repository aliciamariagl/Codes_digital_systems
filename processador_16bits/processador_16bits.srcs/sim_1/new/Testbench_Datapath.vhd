library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Testbench_Datapath is
--  Port ( );
end Testbench_Datapath;

architecture Behavioral of Testbench_Datapath is

    component Datapath
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
        --   cont_sp : out STD_LOGIC_vector (6 downto 0);
           data_out_saida : out STD_LOGIC_vector (15 downto 0)
       --    Rd : out STD_LOGIC_vector (15 downto 0)
       );
    end component;
    
    signal clk, rst, Rd_wr, flag_Z, flag_C, en_sp, push_pop: STD_LOGIC;
    signal Immed, RAM_dout, Rm, Rn: STD_LOGIC_vector(15 downto 0);
    signal Rd_sel, Rm_sel, Rn_sel: STD_LOGIC_vector(2 downto 0);
    signal ula_op: STD_LOGIC_vector(3 downto 0);
    signal RF_sel: STD_LOGIC_vector(1 downto 0);
    constant interv: time := 100ns;
    
    signal data_out, Rd : STD_LOGIC_vector(15 downto 0);
    signal cont_sp : STD_LOGIC_vector(6 downto 0);
 
begin
    Rm<=x"0000";
    DUT: Datapath port map(clk, rst, ula_op, Rn_sel, Rm_sel, Rd_wr, Rd_sel, RF_sel, Immed, RAM_dout, Rm, Rn, flag_Z, flag_C, en_sp, push_pop, data_out);
    
    estimulos: process
    begin
    
    rst <= '1';
    ula_op <= "0000";
    Rn_sel <= "000";
    Rm_sel <= "000";
    Rd_wr <= '0';
    Rd_sel <= "000";
    RF_sel <= "00";
    Immed <= x"0000";
    RAM_dout <= x"0000";
    en_sp <= '0';
    push_pop <= '0';
    
    clk <= '0';
    wait for interv;
    
    clk <= '1';
    wait for interv;
    
    rst <= '0';
    ula_op <= "0000";
    Rn_sel <= "000";
    Rm_sel <= "000";
    Rd_wr <= '1';
    Rd_sel <= "001";
    RF_sel <= "10";
    Immed <= x"000a";
    RAM_dout <= x"0000";
    en_sp <= '0';
    push_pop <= '0';
    
    clk <= '0';
    wait for interv;
    
    clk <= '1';
    wait for interv;
    
    
    
    rst <= '0';
    ula_op <= "0000";
    Rn_sel <= "001";
    Rm_sel <= "000";
    Rd_wr <= '0';
    Rd_sel <= "000";
    RF_sel <= "00";
    Immed <= x"0000";
    RAM_dout <= x"0000";
    en_sp <= '1';
    push_pop <= '1';
    
    clk <= '0';
    wait for interv;
    
    clk <= '1';
    wait for interv;
    
    clk <= '0';
    wait for interv;
    
    clk <= '1';
    wait for interv;
    
    rst <= '0';
    ula_op <= "0000";
    Rn_sel <= "000";
    Rm_sel <= "000";
    Rd_wr <= '1';
    Rd_sel <= "010";
    RF_sel <= "00";
    Immed <= x"0000";
    RAM_dout <= x"0000";
    en_sp <= '1';
    push_pop <= '0';
    
    clk <= '0';
    wait for interv;
    
    clk <= '1';
    wait for interv;
    
    clk <= '0';
    wait for interv;
    
    clk <= '1';
    wait for interv;
    
    rst <= '0';
    ula_op <= "0000";
    Rn_sel <= "001";
    Rm_sel <= "010";
    Rd_wr <= '0';
    Rd_sel <= "000";
    RF_sel <= "00";
    Immed <= x"0000";
    RAM_dout <= x"0000";
    en_sp <= '0';
    push_pop <= '0';
    
    clk <= '0';
    wait for interv;
    
    clk <= '1';
    wait for interv;

    end process;

end Behavioral;
