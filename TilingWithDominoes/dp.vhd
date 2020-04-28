library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port(clk, rst, ld, sel : in std_logic;
    n : in std_logic_vector(3 downto 0);
    x : out std_logic;
    y : out std_logic_vector(31 downto 0));
end dp;

architecture rtl of dp is
component comp is
    port (
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic);
end component;

component mux4 is
    port (s : in std_logic;
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;

component reg4 is
port (clk, rst, en: in std_logic;
reg_in: in std_logic_vector(3 downto 0);
reg_out: out std_logic_vector(3 downto 0));
end component;

component plus1 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component ramA is
port(clk, wr : in std_logic;
i, n : in std_logic_vector(3 downto 0);
B : in std_logic_vector(31 downto 0);
A, y : out std_logic_vector(31 downto 0));
end component;
component ramB is
port(clk, wr : in std_logic;
i : in std_logic_vector(3 downto 0);
A : in std_logic_vector(31 downto 0);
B : out std_logic_vector(31 downto 0));
end component;
signal A, B : std_logic_vector(31 downto 0);
signal i, i_in, iplus1 : std_logic_vector(3 downto 0);
begin
    i_reg : reg4 port map (clk, rst, ld, i_in, i);
    i_mux : mux4 port map (sel, "0010", iplus1, i_in);
    i_operation : plus1 port map (i, iplus1);
    ik_comp : comp port map(i, n, x);
    A_ram : ramA port map (clk, sel, i, n, B, A, y);
    B_ram : ramB port map (clk, sel, i, A, B);
end rtl;