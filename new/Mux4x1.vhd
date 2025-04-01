
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Mux4x1 is
Port (I0, I1, I2 : in integer;
      sel : in std_logic_vector( 1 downto 0);
      Y : out integer);
end Mux4x1;

architecture Behavioral of Mux4x1 is

begin

process(sel,I0,I1,I2)
begin
case sel is
    when "00" =>
        Y <= I0;
    when "01" =>
        Y <= I1;
    when "10" =>
        Y <= I2;
    when others =>
        Y <= I0; -- maybe to change.
end case;
end process;


end Behavioral;
