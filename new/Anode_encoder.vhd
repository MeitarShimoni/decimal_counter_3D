library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Anode_encoder is
Port (reg_in : in std_logic_vector(2 downto 0);
      sel : out std_logic_vector(1 downto 0) );
end Anode_encoder;

architecture Behavioral of Anode_encoder is
-- 110 - > LSB -> 00
-- 101 => ISB -> 01
-- 011 -> MSB -> 10
begin

process(reg_in)
begin
case reg_in is
--    when "110" => 
--        sel <= "00";
    when "101" =>
        sel <= "01";
    when "011" =>
        sel <= "10";
    when others => 
        sel <= "00";
end case;

end process;


end Behavioral;
