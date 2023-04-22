----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2021 13:16:43
-- Design Name: 
-- Module Name: cont_leer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2020 05:27:15 PM
-- Design Name: 
-- Module Name: Cont_nbits - Behavioral
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

entity cont_leer is
generic(N: integer :=6);
    Port ( Cup,CLK : in STD_LOGIC;
           ARst : in STD_LOGIC;
           leer: out std_logic;
           Q : out STD_LOGIC_VECTOR(N-1 Downto 0));
end cont_leer;

architecture Behavioral of cont_leer is

signal cont: Integer range 0 to 2**N-1 :=0;
signal sQ: STD_LOGIC:='1';
begin

con: process(clk, ARst)
begin
    if(ARst = '1')then
        cont <= 0;
    elsif(rising_edge(CLK) and cup = '1')then
        cont <= cont +1;
        if (cont < 31)then
            sq <= '1';
            else 
            sq <= '0';
        end if;
    else
        cont <= cont;
    end if;
end process;

Q <= STD_LOGIC_VECTOR(TO_UNSIGNED(cont,N));
leer<=sq;
end Behavioral;
