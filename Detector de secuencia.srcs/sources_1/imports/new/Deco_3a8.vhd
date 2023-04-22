----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.02.2021 20:36:21
-- Design Name: 
-- Module Name: Deco_3a8 - Behavioral
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

entity Deco3a8 is
    Port ( W : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Deco3a8;

architecture Behavioral of Deco3a8 is

begin

with W select Y <=
--   ABCDEFG
    "11111110" when "000", --FE
    "11111101" when "001", --FD
    "11111011" when "010", --FB
    "11110111" when "011", --F7
    "11101111" when "100",
    "11011111" when "101",
    "10111111" when "110",
    "01111111" when others;
      

end Behavioral;