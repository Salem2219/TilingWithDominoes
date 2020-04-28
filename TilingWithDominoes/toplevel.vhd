library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity toplevel is
    port (clk, rst, start : in std_logic;
    n : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(31 downto 0));
end toplevel;

architecture rtl of toplevel is
component dp is
    port(clk, rst, ld, sel : in std_logic;
    n : in std_logic_vector(3 downto 0);
    x : out std_logic;
    y : out std_logic_vector(31 downto 0));
end component;
component ctrl is
    port(clk,rst, start, x: in std_logic;
       ld, sel: out std_logic);
end component;
signal ld, sel, x: std_logic;
begin
    datapath : dp port map (clk, rst, ld, sel, n, x, y);
    control : ctrl port map (clk, rst, start, x, ld, sel);
end rtl;