library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
ENTITY testbench is
END testbench;

ARCHITECTURE behavior of testbench is

COMPONENT Transition_Calculator is
     port( CLK, Load, clear : in std_logic; 
           Data : in std_logic_vector(9 downto 0);
           Count : out std_logic_vector(3 downto 0)); 
end COMPONENT;

signal clear : std_logic := '0'; 
signal clk : std_logic := '0';
signal load : std_logic := '0';
signal count : std_logic_vector (3 downto 0);
signal data : std_logic_vector (9 downto 0);

constant period : time := 10 ns;

begin
test: Transition_Calculator 
PORT MAP (
clk => clk,
load => load, 
clear => clear,
data => data,
count => count);

process 
begin 
clK <= '0';
wait for period/2;
clk <= '1';
wait for period/2;
end process;

 process
begin
clear <= '0';
wait for 2*period;

clear <= '1';
Load <= '1';
for i in 0 to 1023 loop
data <= conv_std_logic_vector(i, 10);
wait for 2*period;
end loop;

Load <= '0';
wait for 2*period;
wait;
end process;

end behavior;