----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.01.2020 16:14:39
-- Design Name: 
-- Module Name: Div_frec - Behavioral
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

entity Div_frec is
    Port ( CLK : in STD_LOGIC;
           Q : out STD_LOGIC);
end Div_frec;

architecture Behavioral of Div_frec is

constant Modulo: integer :=100;
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