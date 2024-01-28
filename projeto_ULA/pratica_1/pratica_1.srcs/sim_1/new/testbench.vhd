library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pratica01_tb is
end pratica01_tb;

architecture Behavioral of pratica01_tb is

    component pratica01 is
        Port ( botao0 : in STD_LOGIC;
               botao1: in STD_LOGIC;
               led : out STD_LOGIC;
               sw10 : in std_logic_vector(1 downto 0);
               sw32 : in std_logic_vector(1 downto 0);
               resultado : out std_logic_vector(2 downto 0)
        );
    end component;

    signal botao0_tb : STD_LOGIC;
    signal botao1_tb : STD_LOGIC;
    signal led_tb : STD_LOGIC;
    signal sw10_tb : std_logic_vector(1 downto 0);
    signal sw32_tb : std_logic_vector(1 downto 0);
    signal resultado_tb : std_logic_vector(2 downto 0);

begin

    DUT : pratica01 
        port map (
            botao0 => botao0_tb,
            botao1 => botao1_tb,
            led => led_tb,
            sw10 => sw10_tb,
            sw32 => sw32_tb,
            resultado => resultado_tb
        );

    stimulus: process
    begin
            
        -- Teste 3: selecao = '0', sw10 = "00", sw32 = "01"
        botao1_tb <= '1';
        wait for 10 ns;
        sw10_tb <= "00";
        sw32_tb <= "01";
        wait for 10 ns;
        assert (resultado_tb = "001")
            report "Teste 3 falhou" severity error;
            wait for 100ns;
        -- Teste 4: selecao = '1', sw10 = "11", sw32 = "10"
        
        botao1_tb <= '0';
        wait for 100ns;
        botao1_tb <= '1';
        sw10_tb <= "11";
        sw32_tb <= "10";
        wait for 10 ns;
        assert (resultado_tb = "001")
            report "Teste 4 falhou" severity error;
            wait for 100ns;
        wait;
    end process;

end Behavioral;
