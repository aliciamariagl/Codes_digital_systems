library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Testbench_FSM is
--  Port ( );
end Testbench_FSM;

architecture Behavioral of Testbench_FSM is

    component FSM
        Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           IR_data : in STD_LOGIC_vector(15 downto 0);
           ROM_en : out STD_LOGIC;
           PC_clr : out STD_LOGIC;
           PC_inc : out STD_LOGIC;
           IR_load : out STD_LOGIC;
           Immed : out STD_LOGIC_vector(15 downto 0);
           RAM_sel : out STD_LOGIC;
           RAM_we : out STD_LOGIC;
           RF_sel : out STD_LOGIC_vector(1 downto 0);
           Rd_sel : out STD_LOGIC_vector(2 downto 0);
           Rd_wreg : out STD_LOGIC;
           Rm_sel : out STD_LOGIC_vector(2 downto 0);
           Rn_sel : out STD_LOGIC_vector(2 downto 0);
           ula_op : out STD_LOGIC_vector(3 downto 0);
           flag_jmp : out STD_LOGIC);
    end component;
    
    signal clk, rst, ROM_en, PC_clr, PC_inc, IR_load, RAM_sel, RAM_we, Rd_wreg, flag_jmp: STD_LOGIC;
    signal IR_data, Immed: STD_LOGIC_vector(15 downto 0);
    signal Rd_sel, Rm_sel, Rn_sel: STD_LOGIC_vector(2 downto 0);
    signal ula_op: STD_LOGIC_vector(3 downto 0);
    signal RF_sel: STD_LOGIC_vector(1 downto 0);
    constant interv: time := 100ns;

begin

    DUT: FSM port map(clk, rst, IR_data, ROM_en, PC_clr, PC_inc, IR_load, Immed, RAM_sel, RAM_we, RF_sel, Rd_sel, Rd_wreg, Rm_sel, Rn_sel, ula_op, flag_jmp);
    
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
    IR_data <= x"0000";
    wait for interv;
    
    rst <= '0';
    IR_data <= "0000100011100000";
    wait for interv;
    
    rst <= '0';
    IR_data <= "0000100011100011";
    wait for interv;
    
    rst <= '0';
    IR_data <= "0111010001101100";
    wait for interv;
    
    end process;

end Behavioral;
