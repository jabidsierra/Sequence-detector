----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2021 11:30:51
-- Design Name: 
-- Module Name: Memoria_32x16 - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom_mem is
Port ( Addr : in STD_LOGIC_VECTOR (4 downto 0);
Data : out STD_LOGIC_VECTOR (15 downto 0));
end rom_mem;

architecture Behavioral of rom_mem is

type mem is array (0 to 31) of std_logic_vector(15 downto 0);

--constant rom: mem :=(0 => "1101000110100000",
--1 => "1101101000000001",
--2 => "1101000000000001",
--3 => "0000000000001101",
--others => (others =>'0'));
constant rom: mem :=(0 => x"DE1E",
1 => x"0F0D",
2 => x"FFFF",
3 => x"DA07",
4 => x"69B4",
others => (others =>'0'));
begin

data <= rom(TO_INTEGER(unsigned(ADDR)));

end Behavioral;