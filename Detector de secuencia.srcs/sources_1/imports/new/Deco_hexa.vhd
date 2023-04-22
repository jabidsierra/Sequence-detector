----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.02.2021 20:36:21
-- Design Name: 
-- Module Name: Deco_hexa - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Deco_hexa is
  Port (W : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (6 downto 0));
end Deco_hexa;

architecture Behavioral of Deco_hexa is

begin

with W select Y <=
--   ABCDEFG
    "0000001" when "0000", --FE
    "1001111" when "0001", --FD
    "0010010" when "0010", --FB
    "0000110" when "0011", --F7
    "1001100" when "0100",
    "0100100" when "0101",
    "0100000" when "0110",
    "0111001" when "0111",
    "0000000" when "1000",
    "0011000" when "1001",
    "1111110" when others;

end Behavioral;
