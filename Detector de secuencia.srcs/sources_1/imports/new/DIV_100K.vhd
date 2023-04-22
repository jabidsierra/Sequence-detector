----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.02.2021 20:39:25
-- Design Name: 
-- Module Name: DIV_100K - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Div_100K is
    Port ( CLK : in STD_LOGIC;
           Q : out STD_LOGIC);
end Div_100K;

architecture Behavioral of Div_100K is

constant Modulo: integer :=1000;
signal sQ: STD_LOGIC:='0';
signal cont: Integer range 0 to Modulo :=0;

begin

Div: process(clk)
begin
if(rising_edge(clk)) then
    cont <= cont +1;
    if(cont <= Modulo/2-1)then
        sq <= '0';
    elsif(cont < Modulo-1)then
        sq <= '1';
    else
        cont <= 0;
    end if;
else
    sq <= sq;
    cont <= cont;
end if;
end process;

Q <= sQ;

end Behavioral;
