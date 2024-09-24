library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_unsigned.all; 

entity Transition_Calculator is 
     port( CLK, Load, clear : in std_logic; 
           Data : in std_logic_vector(9 downto 0);
           Count : out std_logic_vector(3 downto 0)) ; 
end Transition_Calculator; 

architecture behavioral of Transition_Calculator is
begin

process(CLK, load, clear)
variable c : std_logic_vector(3 downto 0) := "0000";
begin
     if (clear= '0') then 
     c :="0000";
     
     elsif (load = '0') then 
     c := c;
     
     elsif (CLK'event and CLK = '1') then  
     for i in 8 downto 0 loop
     if (data(i+1) /= data(i)) then
     c := c+1;
     else 
     c := c;
     
     end if;
     end loop;
     end if;
     count <= c;
     
end process;
end behavioral;