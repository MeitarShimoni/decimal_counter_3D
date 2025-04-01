
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Seg_decoder is
Port (HEX  : in integer range 0 to 9;
      seg : out std_logic_vector(6 downto 0));
end Seg_decoder;

architecture Behavioral of Seg_decoder is

begin

process(HEX)
begin

if (HEX = 1 or HEX = 4 or HEX =  11 or HEX =  13) then -- a 
    seg(6) <= '1';
else seg(6) <= '0'; 
end if;

if (HEX = 5 or HEX =  6 or HEX = 11 or HEX = 12 or HEX = 14 or HEX = 15) then -- b
    seg(5) <= '1';
else seg(5) <= '0'; 
end if;

---------------- c
if (HEX = 2 or HEX =  12 or HEX = 14 or HEX = 15) then -- c
    seg(4) <= '1';
else seg(4) <= '0'; 
end if;

--------------- D 
if (HEX = 1 or HEX =  4 or HEX = 7 or HEX = 10 or HEX = 15) then -- D
    seg(3) <= '1';
else seg(3) <= '0'; 
end if;

------------------ E 
if (HEX = 1 or HEX =  3 or HEX = 4 or HEX = 5 or HEX = 7 or HEX = 9) then -- b
    seg(2) <= '1';
else seg(2) <= '0'; 
end if;

------------------ F
if (HEX = 1 or HEX =  2 or HEX = 3 or HEX = 7 or HEX = 13) then -- F
    seg(1) <= '1';
else seg(1) <= '0'; 
end if;

------------------ G
if (HEX = 0 or HEX =  1 or HEX = 7 or HEX = 12) then -- G
    seg(0) <= '1';
else seg(0) <= '0'; 
end if;

end process;
 

end Behavioral;
