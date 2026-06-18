library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity programcounter is
port(
	clk: in std_logic;
	clr: in std_logic;
	ld: in std_logic;
	inc: in std_logic;
	d: in std_logic_vector(31 downto 0);
	q: out std_logic_vector(31 downto 0));
end programcounter;

architecture description of programcounter is
	component add4
		port(	a: in std_logic_vector(31 downto 0);
				b: out std_logic_vector(31 downto 0));
	end component;
	component mux2to1
		port(	s: in std_logic;
				w0, w1: in std_logic_vector(31 downto 0);
				f: out std_logic_vector(31 downto 0));
	end component;
	component register32
		port(	d: in std_logic_vector(31 downto 0);
				clk: in std_logic;
				clr: in std_logic;
				ld: in std_logic;
				q: out std_logic_vector(31 downto 0));
	end component;
	signal add_out : std_logic_vector(31 downto 0);
	signal mux_out: std_logic_vector(31 downto 0);
	signal q_out: std_logic_vector(31 downto 0);
begin
	add0: add4 port map(q_out, add_out);
	mux0: mux2to1 port map(inc,d,add_out,mux_out);
	reg0: register32 port map(mux_out,clk,clr,ld,q_out);
	q <= q_out;
end description;