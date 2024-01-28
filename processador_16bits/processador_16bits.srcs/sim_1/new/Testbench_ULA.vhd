library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Testbench_ULA is
--  Port ( );
end Testbench_ULA;

architecture Behavioral of Testbench_ULA is

    component ULA
        Port ( A : in STD_LOGIC_vector(15 downto 0);
           B : in STD_LOGIC_vector(15 downto 0);
           Immed: in STD_LOGIC_vector(15 downto 0);
           op : in STD_LOGIC_vector(3 downto 0);
           Q : out STD_LOGIC_vector(15 downto 0);
           flag_Z : out STD_LOGIC;
           flag_C : out STD_LOGIC);
    end component;
    
    signal flag_Z, flag_C : STD_LOGIC;
    signal op: STD_LOGIC_vector(3 downto 0);
    signal A, B, Immed, Q: STD_LOGIC_vector(15 downto 0);
    constant interv: time := 100ns;

begin

    DUT: ULA port map(A, B, Immed, op, Q, flag_Z, flag_C);
    
    estimulos: process
    begin
    
    A <= x"0008";
    B <= x"0000";
    Immed <= x"0003";
    op <= "1011";
    wait for interv;
    
    A <= x"0008";
    B <= x"0000";
    Immed <= x"0003";
    op <= "1100";
    wait for interv;
    
    A <= x"0008";
    B <= x"0010";
    Immed <= x"0003";
    op <= "1101";
    wait for interv;
    
    A <= x"0008";
    B <= x"0010";
    Immed <= x"0003";
    op <= "1110";
    wait for interv;
    
    A <= x"0008";
    B <= x"0008";
    Immed <= x"0003";
    op <= "0000";
    wait for interv;
    
    end process;

end Behavioral;
