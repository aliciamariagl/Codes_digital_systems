library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

    component not_test   -- AQUI
        Port ( a : in STD_LOGIC;
           x : out STD_LOGIC);
    end component;

    component and_test   -- AQUI
        Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
    end component;
    
    component nand_test   -- AQUI
        Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
    end component;
    
    component or_test   -- AQUI
        Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
    end component;
    
    component nor_test   -- AQUI
        Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
    end component;

    component xor_test   -- AQUI
        Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
    end component;
    
    component xnor_test   -- AQUI
        Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
    end component;
    
    signal a,b,x_not,x_and,x_nand,x_or,x_nor,x_xor,x_xnor: std_logic;
    constant interv: time := 100ns;

begin

    DUT_NOT: not_test port map(a,x_not);  -- AQUI  primeiro a:componente; segundo a:signal
    DUT_AND: and_test port map(a,b,x_and);
    DUT_NAND: nand_test port map(a,b,x_nand);
    DUT_OR: or_test port map(a,b,x_or);
    DUT_NOR: nor_test port map(a,b,x_nor);
    DUT_XOR: xor_test port map(a,b,x_xor);
    DUT_XNOR: xnor_test port map(a,b,x_xnor);

    estimulos: process
    begin
    
    a <= '0';
    b <= '0';
    wait for interv;
    
    a <= '0';
    b <= '1';
    wait for interv;
    
    a <= '1';
    b <= '0';
    wait for interv;
    
    a <= '1';
    b <= '1';
    wait for interv;

    end process;

end Behavioral;
