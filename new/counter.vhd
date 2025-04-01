library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
  Port (
    EN, RST, CLK, CLR: in std_logic;
    TOP_COUNT: in std_logic_vector(3 downto 0);
    REACH_9, REACH_TOP: out std_logic;
    Q: out integer
  );
end counter;

architecture Behavioral of counter is
  signal count: integer := 0;
begin

process(CLK, RST, CLR)
  begin
    if RST = '1' or rising_edge(CLR) then
      count <= 0;
    elsif rising_edge(CLK) then
      if EN = '1' then
        count <= count + 1;
      end if;
    end if;
  end process;

  process(count, TOP_COUNT)
  begin
    if count = to_integer(unsigned(TOP_COUNT))+1 then -- Updated +1
      REACH_TOP <= '1';
    else
      REACH_TOP <= '0';
    end if;
    
    if count = 10 then -- Updated to 10
      REACH_9 <= '1';
    else
      REACH_9 <= '0';
    end if;
  end process;

  Q <= count;

end Behavioral;
