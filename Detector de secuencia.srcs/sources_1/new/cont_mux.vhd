----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2021 22:20:55
-- Design Name: 
-- Module Name: cont_mux - Behavioral
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

entity cont_mux is
generic(N: integer :=4);
    Port ( Cup,CLK : in STD_LOGIC;
           ARst : in STD_LOGIC;
           Q1: out STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(N-1 Downto 0));
end cont_mux;

architecture Behavioral of cont_mux is

signal cont: Integer range 0 to 2**N-1 :=0;
signal sQ: STD_LOGIC:='0';
begin

con: process(clk, ARst)
begin
    if(ARst = '1')then
        cont <= 0;
    elsif(rising_edge(CLK) and cup = '1')then
        cont <= cont +1;
        if(cont = 15)then
        sq <= '1';
        cont<= 0;
        else 
        sq <= '0';
        end if;
    else
        cont <= cont;
        sq <= sq;
    end if;
end process;

Q <= STD_LOGIC_VECTOR(TO_UNSIGNED(cont,N));
Q1 <= sq;
end Behavioral;