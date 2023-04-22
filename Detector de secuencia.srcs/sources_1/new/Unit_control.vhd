----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2021 05:24:35
-- Design Name: 
-- Module Name: Unit_control - Behavioral
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

entity Unit_control is
    Port ( ENTRADACONTROL: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
           SALIDACONTROL: OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
end Unit_control;

architecture Behavioral of Unit_control is

begin
with ENTRADACONTROL select SALIDACONTROL <=
--rst detec|CLK32|CUP32|CARGA|RST|CUPV|CUPDETEC-OUT    ---IN|BTNIN|RESET|SET|Q116|Q232
    "0111011" when "00001", --FE
    "0111001" when "00010", --FD
    "0100101" when "01000", --FB
    "0100101" when "01001", --F7
    "0100101" when "01010",
    "0100101" when "01011",
    "0100100" when "01100",
    "0100100" when "01101",
    "0100100" when "01110",
    "0100100" when "01111",
    "0001001"when "10000",
    "0110010" when "10001",
    "0111001" when "10010",
    "0100100" when "11000",
    "0100100" when "11001",
    "0100100" when "11010",
    "0100100" when "11011",
    "0100100" when "11100",
    "0100100" when "11101",
    "0100100" when "11110",
    "0100100" when "11111",
    "0000000" when others;
                
                
end Behavioral;
