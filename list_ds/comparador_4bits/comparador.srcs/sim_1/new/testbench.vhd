library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is

    component comparador
        Port ( a : in STD_LOGIC_vector (3 downto 0);
           b : in STD_LOGIC_vector (3 downto 0);
           s1 : out STD_LOGIC;
           s2 : out STD_LOGIC;
           s3 : out STD_LOGIC);
    end component;
    
    signal a,b: std_logic_vector (3 downto 0);
    signal s1,s2,s3: std_logic;
    constant interv: time := 100ns;

begin

    DUT: comparador port map(a=>a,b=>b,s1=>s1,s2=>s2,s3=>s3);  -- AQUI  primeiro a:componente; segundo a:signal

    estimulos: process
    begin
    
    a <= "0000";
    b <= "0000";
    wait for interv;
   
    a <= "0001";
    b <= "0000";
    wait for interv;
    
    a <= "0000";
    b <= "0001";
    wait for interv;

    end process;

end Behavioral;
