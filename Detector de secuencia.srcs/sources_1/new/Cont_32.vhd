----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2021 11:19:20
-- Design Name: 
-- Module Name: Cont_32 - Behavioral
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

entity Cont_32 is
generic(N: integer :=5);
    Port ( Cup,CLK : in STD_LOGIC;
           ARst : in STD_LOGIC;
           q1: out STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(N-1 Downto 0));
end Cont_32;

architecture Behavioral of Cont_32 is

signal cont: Integer range 0 to 2**N-1 :=0;
signal sQ: STD_LOGIC:='0';

begin

con: process(clk, ARst)
begin
    if(ARst = '1')then
        cont <= 0;
    elsif(rising_edge(CLK) and cup = '1')then
        cont <= cont +1;
        if(cont = 32)then
        sq <= '1';
        cont <= 0;
        else 
        sq <= '0';
        end if;
    else
        cont <= cont;
    end if;
end process;

Q <= STD_LOGIC_VECTOR(TO_UNSIGNED(cont,N));
q1<=sq;
end Behavioral;
