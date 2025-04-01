
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decimal_counter_3D is
Port (CLK,RST : in std_logic;
      TOP_COUNT : in std_logic_vector(3 downto 0);
      seg_out : out std_logic_vector(6 downto 0);
      anode_out : out std_logic_vector(2 downto 0);
      led,clk5o,clk500o : out std_logic );
end decimal_counter_3D;

architecture Structure of decimal_counter_3D is
signal clk5,clk500 : std_logic;
signal EN0,EN1,EN2 : std_logic;
signal clr0,clr1,clr2 : std_logic;
signal REACH_90,REACH_91,REACH_92 : std_logic;
signal REACH_TOP0,REACH_TOP1,REACH_TOP2 : std_logic;
signal Q0,Q1,Q2 : integer;
signal Q1s,Q2s : std_logic_vector(3 downto 0); -- MEITAR SHIMONI TRY.


signal y_reg : std_logic_vector(2 downto 0);
signal sel : std_logic_vector(1 downto 0);
signal mux_out : integer;
begin

--entity ClockDivider is
--    Port (
--        clk100MHz : in  STD_LOGIC;
--        rst       : in  STD_LOGIC;
--        clk500Hz  : out STD_LOGIC;
--        clk5Hz    : out STD_LOGIC
--    );
--end ClockDivider;
Clock_Divider : entity work.ClockDivider(Behavioral) port map(clk100MHz=>CLK,rst=>RST,clk500Hz=>clk500,
clk5Hz=>clk5);
clk500o <= clk500; clk5o <= clk5;
--entity counter is
--  Port (
--    EN, RST, CLK, CLR: in std_logic;
--    TOP_COUNT: in std_logic_vector(3 downto 0);
--    REACH_9, REACH_TOP: out std_logic;
--    Q: out integer
--  );
clr0 <= REACH_90 or (REACH_TOP0 and REACH_TOP1 and REACH_TOP2) ;
LSD_Counter : entity work.counter(Behavioral) port map(EN=>'1',RST=>RST,CLK=>clk5,CLR=>clr0,
TOP_COUNT=>TOP_COUNT,REACH_9=>REACH_90,REACH_TOP=>REACH_TOP0,Q=>Q0);

clr1 <= REACH_91 or (REACH_TOP0 and REACH_TOP1 and REACH_TOP2) ;
--EN1 <= REACH_90; -- Starts the next count from 0 -- MEITAR SHIMONI TRY.
Q1s <= std_logic_vector(to_unsigned(Q0,4)); -- MEITAR SHIMONI TRY.
EN1 <= Q1s(3) and Q1s(0); -- MEITAR SHIMONI TRY.
ISD_Counter : entity work.counter(Behavioral) port map(EN=>EN1,RST=>RST,CLK=>clk5,CLR=>clr1,
TOP_COUNT=>TOP_COUNT,REACH_9=>REACH_91,REACH_TOP=>REACH_TOP1,Q=>Q1);

clr2 <= (REACH_TOP0 and REACH_TOP1 and REACH_TOP2) ;
led <= clr2;
Q2s <= std_logic_vector(to_unsigned(Q1,4)); -- MEITAR SHIMONI TRY.
-- EN2 <= REACH_90 and REACH_91; -- MEITAR SHIMONI TRY.
EN2 <= EN1 and (Q2s(3) and Q2s(0)); -- MEITAR SHIMONI TRY.
MSD_Counter : entity work.counter(Behavioral) port map(EN=>EN2,RST=>RST,CLK=>clk5,CLR=>clr2,
TOP_COUNT=>TOP_COUNT,REACH_9=>REACH_92,REACH_TOP=>REACH_TOP2,Q=>Q2);

--entity Shift_REG is
--Port (clk, RST  : in std_logic;
--        y_reg : out std_logic_vector(2 downto 0));
--end Shift_REG
SHIFT_REGISTER : entity work.Shift_REG(Behavioral) port map(clk=>clk500,RST=>RST,y_reg=>y_reg);
anode_out <= y_reg;
--entity Anode_encoder is
--Port (reg_in : in std_logic_vector(2 downto 0);
--      sel : out std_logic_vector(1 downto 0) );
--end Anode_encoder;
ANODE_ENCODER : entity work.Anode_encoder(Behavioral) port map(reg_in=>y_reg,sel=>sel);

--Port (I0, I1, I2 : in integer range 0 to 9;
--      sel : in std_logic_vector( 1 downto 0);
--      Y : out integer range 0 to 9);
--end Mux4x1;

MUX4x1 : entity work.Mux4x1(Behavioral) port map(I0=>Q0,I1=>Q1,I2=>Q2,sel=>sel,Y=>mux_out);

--Port (HEX  : in integer range 0 to 9;
--      seg : out std_logic_vector(6 downto 0));
--end Seg_decoder;

Segment7 : entity work.Seg_decoder(Behavioral) port map(Hex=>mux_out,seg=>seg_out);

end Structure;

















