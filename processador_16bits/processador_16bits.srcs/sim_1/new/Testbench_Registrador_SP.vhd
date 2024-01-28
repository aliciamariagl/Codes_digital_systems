library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Testbench_Registrador_SP is
--  Port ( );
end Testbench_Registrador_SP;

architecture Behavioral of Testbench_Registrador_SP is

    component Registrador_SP
        Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           push_pop : in STD_LOGIC;
           data_in : in STD_LOGIC_vector (15 downto 0);
           data_out : out STD_LOGIC_vector (15 downto 0));
    end component;
    
    signal clk, en, push_pop: STD_LOGIC;
    signal data_in, data_out: STD_LOGIC_vector(15 downto 0);
    constant interv: time := 100ns;

begin

    DUT: Registrador_SP port map(clk, en, push_pop, data_in, data_out);
    
    estimulos_clk: process
    begin
        clk <= '0';
        wait for 2ns;
        clk <= '1';
        wait for 2ns;
    end process;
    
    estimulos: process
    begin
    
    en <= '1';
    push_pop <= '1';
    data_in <= x"000a";
    wait for interv;
    
    en <= '1';
    push_pop <= '1';
    data_in <= x"000b";
    wait for interv;
    
    en <= '1';
    push_pop <= '1';
    data_in <= x"000c";
    wait for interv;
    
    en <= '1';
    push_pop <= '1';
    data_in <= x"000d";
    wait for interv;
    
    en <= '1';
    push_pop <= '0';
    data_in <= x"0000";
    wait for interv;
    
    en <= '1';
    push_pop <= '0';
    data_in <= x"0000";
    wait for interv;
    
    en <= '1';
    push_pop <= '0';
    data_in <= x"0000";
    wait for interv;
    
    en <= '1';
    push_pop <= '0';
    data_in <= x"0000";
    wait for interv;
    
    
    
    end process;

end Behavioral;
