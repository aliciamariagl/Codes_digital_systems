library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM is
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
           flag_jmp : out STD_LOGIC;
           en_SP : out STD_LOGIC;
           push_pop : out STD_LOGIC);
end FSM;

architecture Behavioral of FSM is

    -- Estados da FSM                                                                                            
    type state is (inicio, busca, decodificacao, exec_nop, exec_halt, exec_mov, exec_load, exec_store, exec_ula, exec_ula_immed, exec_pilha, exec_desvio, exec_es);
    -- Estado atual e próximo
    signal estado_atual, proximo_estado: state;  
    -- Instrução lida
    signal instruction : std_logic_vector (15 downto 0);
    
begin
    
    process (clk,rst)
    begin
        if (rst = '1') then
            estado_atual <= inicio;           --estado inicial
        elsif (clk'event and clk='1') then
            estado_atual <= proximo_estado;   --próximo  estado.
        end if;
    end process;
    
    process(estado_atual, instruction)
    begin
        case estado_atual is
            when inicio =>
                flag_jmp <= '0';
                en_SP <= '0';
                ROM_en <= '0';
                PC_clr <= '1';
                PC_inc <= '0';
                IR_load <= '0';
                Immed <= x"0000";
                RAM_sel <= '0';
                RAM_we <= '0';
                RF_sel <= "00";
                Rd_sel <= "000";
                Rd_wreg <= '0';
                Rm_sel <= "000";
                Rn_sel <= "000";
                ula_op <= "0000";
                proximo_estado <= busca;
            when busca =>
                flag_jmp <= '0';
                en_SP <= '0';
                ROM_en <= '1';
                PC_clr <= '0';
                PC_inc <= '1';                  -- Tá faltando o estado "Mortos de estudar, by: Gui"
                IR_load <= '1';
                Immed <= x"0000";
                RAM_sel <= '0';
                RAM_we <= '0';
                RF_sel <= "00";
                Rd_sel <= "000";
                Rd_wreg <= '0';
                Rm_sel <= "000";
                Rn_sel <= "000";
                ula_op <= "0000";
                proximo_estado <= decodificacao;
            when decodificacao =>
                flag_jmp <= '0';
                en_SP <= '0';
                ROM_en <= '0';
                PC_clr <= '0';
                PC_inc <= '0';
                IR_load <= '0';
                Immed <= x"0000";
                RAM_sel <= '0';
                RAM_we <= '0';
                RF_sel <= "00";
                Rd_sel <= "000";
                Rd_wreg <= '0';
                Rm_sel <= "000";
                Rn_sel <= "000";
                ula_op <= "0000";
                -- transição de estado
                if (instruction = x"0000") then
                    proximo_estado <= exec_nop;
                elsif (instruction = x"1111") then
                    proximo_estado <= exec_halt;
                elsif (instruction(15 downto 12) = "0001") then
                    proximo_estado <= exec_mov;
                elsif (instruction(15 downto 12) = "0010") then
                    proximo_estado <= exec_store;
                elsif (instruction(15 downto 12) = "0011") then
                    proximo_estado <= exec_load;
                elsif (instruction(15 downto 12) = x"4" or instruction(15 downto 12) = x"5" or instruction(15 downto 12) = x"6" or instruction(15 downto 12) = x"7" or instruction(15 downto 12) = x"8" or instruction(15 downto 12) = x"9" or instruction(15 downto 12) = x"A" or instruction(15 downto 12) = x"D" or instruction(15 downto 12) = x"E") then
                    proximo_estado <= exec_ula;
                elsif (instruction(15 downto 12) = x"B" or instruction(15 downto 12) = x"C") then
                    proximo_estado <= exec_ula_immed;
                elsif (instruction(15 downto 12) = x"0" and instruction(11) = '0') then
                    if (instruction(1 downto 0) = "11") then
                        proximo_estado <= exec_ula;
                    elsif (instruction(1 downto 0) = "01" or instruction(1 downto 0) = "10") then
                        proximo_estado <= exec_pilha;
                    end if;
                elsif (instruction(15 downto 12) = x"0" and instruction(11) = '1') then
                    proximo_estado <= exec_desvio;
                elsif (instruction(15 downto 12) = x"F") then
                    proximo_estado <= exec_es;
                else 
                    proximo_estado <= exec_nop;
                end if;
            when exec_nop =>
                flag_jmp <= '0';
                en_SP <= '0';
                proximo_estado <= busca;
            when exec_halt =>
                flag_jmp <= '0';
                en_SP <= '0';
                proximo_estado <= exec_halt;
            when exec_mov =>
                flag_jmp <= '0';
                en_SP <= '0';
                RF_sel <= instruction(11) & '0';
                Rd_wreg <= '1';
                Rd_sel <= instruction(10 downto 8);
                Rm_sel <= instruction(7 downto 5);
                Immed <= x"00" & instruction(7 downto 0);
                proximo_estado <= busca;
            when exec_load =>
                flag_jmp <= '0';
                en_SP <= '0';
                RF_sel <= "01";
                Rd_wreg <= '1';
                Rd_sel <= instruction(10 downto 8);
                Rm_sel <= instruction(7 downto 5);
                proximo_estado <= busca;
            when exec_store =>
                flag_jmp <= '0';
                en_SP <= '0';
                RAM_we <= '1';
                RAM_sel <= instruction(11);
                Rm_sel <= instruction(7 downto 5);
                Rn_sel <= instruction(4 downto 2);
                Immed <= x"00" & instruction(10 downto 8) & instruction(4 downto 0);
                proximo_estado <= busca;
            when exec_ula =>
                flag_jmp <= '0';
                en_SP <= '0';
                RF_sel <= "11";
                Rd_wreg <= '1';
                Rd_sel <= instruction(10 downto 8);
                Rm_sel <= instruction(7 downto 5);
                Rn_sel <= instruction(4 downto 2);
                ula_op <= instruction(15 downto 12);
                proximo_estado <= busca;
            when exec_ula_immed =>
                flag_jmp <= '0';
                en_SP <= '0';
                RF_sel <= "10";
                Rd_wreg <= '1';
                Rd_sel <= instruction(10 downto 8);
                Rm_sel <= instruction(7 downto 5);
                Immed <= "00000000000" & instruction(4 downto 0);
                ula_op <= instruction(15 downto 12);
                proximo_estado <= busca;
            when exec_desvio =>
                en_SP <= '0';
                if instruction(1 downto 0) = "00" then
                    flag_jmp <= '1';
                else
                    flag_jmp <= '0';
                end if;
                Immed <= "0000000" & instruction(10 downto 2);
                proximo_estado <= busca;
            when exec_pilha =>
                flag_jmp <= '0';
                en_SP <= '1';
                if instruction(1 downto 0) = "01" then
                    push_pop <= '1';
                    Rn_sel <= instruction(4 downto 2);
                    Rd_wreg <= '0';
                elsif instruction(1 downto 0) = "10" then
                    push_pop <= '0';
                    Rd_sel <= instruction(10 downto 8);
                    Rd_wreg <= '1';
                end if;
                proximo_estado <= busca;
            when exec_es =>
                
                proximo_estado <= busca;
            when others =>
                proximo_estado <= busca;
        end case;
    end process;
    
    instruction <= IR_data;

end Behavioral;
