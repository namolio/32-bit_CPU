library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity add4 is
port(	
		a: in std_logic_vector(31 downto 0);
		b: out std_logic_vector(31 downto 0));
end add4;

architecture description of add4 is
begin
	b <= a+4;
end description;
