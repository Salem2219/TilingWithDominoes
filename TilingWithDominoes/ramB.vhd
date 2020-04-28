library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ramB is
port(clk, wr : in std_logic;
i : in std_logic_vector(3 downto 0);
A : in std_logic_vector(31 downto 0);
B : out std_logic_vector(31 downto 0));
end ramB;
architecture rtl of ramB is
type ram_type is array (0 to 15) of
std_logic_vector(31 downto 0);
signal program: ram_type:= (
"00000000000000000000000000000000", -- sample contents
"00000000000000000000000000000001",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000"
); 
component adder is
    port (a, b : in std_logic_vector(31 downto 0);
    y : out std_logic_vector(31 downto 0));
end component;
component minus1 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component minus2 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
signal iminus2, iminus1 : std_logic_vector(3 downto 0);
signal B1, add : std_logic_vector(31 downto 0);

begin
    u1 : adder port map (B1, A, add);
    u2 : minus1 port map (i, iminus1);
    u3 : minus2 port map (i, iminus2);
    B1 <= program(conv_integer(unsigned(iminus2)));
process(clk)
begin
if (rising_edge(clk)) then
if (wr = '1') then
program(conv_integer(unsigned(i))) <= add;
end if;
end if;
end process;
B <= program(conv_integer(unsigned(iminus1)));
end rtl;
