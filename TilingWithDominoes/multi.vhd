library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity multi is
    port (
    a : in std_logic_vector(31 downto 0);
    y : out std_logic_vector(31 downto 0));
end multi;

architecture rtl of multi is
begin
y(31 downto 1) <= a(30 downto 0);
y(0) <= '0';
end rtl;
