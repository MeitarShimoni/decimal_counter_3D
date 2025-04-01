
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Shift_REG is
Port (clk, RST  : in std_logic;
        y_reg : out std_logic_vector(2 downto 0));
end Shift_REG;

architecture Behavioral of Shift_REG is

signal reg : std_logic_vector(2 downto 0);
signal Q : std_logic;

begin


process(clk)
begin
 -- 110 101 011
report "Reached the process for the Shift Register" severity note;


if rising_edge(clk) then
    report "Rising Edge DONE" severity note;
    if RST = '1' and Q = '0'  then
        report "SHIFT REG RESET POINT" severity note;
        reg <= "110";
    else
        reg <= reg(0) & reg(2 downto 1);
    end if;
    Q <= RST;
end if;
end process;

y_reg <= reg;

end Behavioral;
