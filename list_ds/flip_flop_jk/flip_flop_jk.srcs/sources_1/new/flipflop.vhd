library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flipflop is
    Port ( clk : in STD_LOGIC;
           j : in STD_LOGIC;
           k : in STD_LOGIC;
           q : inout STD_LOGIC;
           q_bar : inout STD_LOGIC);
end flipflop;

architecture Behavioral of flipflop is

begin

    process (clk,j,k)
  begin
    if (clk = '1') then  -- verifica se houve transição de clock
      if (j = '1' and k = '0') then   -- set
        q <= '1';
        q_bar <= '0';
      elsif (j = '0' and k = '1') then -- reset
        q <= '0';
        q_bar <= '1';
      elsif (j = '1' and k = '1') then -- toggle
        q <= not q;
        q_bar <= not q_bar;
      end if;
    end if;
  end process;

end Behavioral;
