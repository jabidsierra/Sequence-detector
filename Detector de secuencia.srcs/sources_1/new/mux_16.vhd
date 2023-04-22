----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2021 22:15:43
-- Design Name: 
-- Module Name: mux_16 - Behavioral
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

entity mux_16 is
    Port ( M0 : in STD_LOGIC;
           M1 : in STD_LOGIC;
           M2 : in STD_LOGIC;
           M3 : in STD_LOGIC;
           M4 : in STD_LOGIC;
           M5 : in STD_LOGIC;
           M6 : in STD_LOGIC;
           M7 : in STD_LOGIC;
           M8 : in STD_LOGIC;
           M9 : in STD_LOGIC;
           M10 : in STD_LOGIC;
           M11 : in STD_LOGIC;
           M12 : in STD_LOGIC;
           M13 : in STD_LOGIC;
           M14 : in STD_LOGIC;
           M15 : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR (3 downto 0);
           F : out STD_LOGIC);
end mux_16;

architecture Behavioral of mux_16 is

begin
MUX: 
with S select
F <= M0 when "0000",
     M1 when "0001",
     M2 when "0010",
     M3 when "0011",
     M4 when "0100",
     M5 when "0101",
     M6 when "0110",
     M7 when "0111",
     M8 when "1000",
     M9 when "1001",
     M10 when "1010",
     M11 when "1011",
     M12 when "1100",
     M13 when "1101",
     M14 when "1110",
     M15 when others;

end Behavioral;
