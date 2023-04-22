----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2021 14:22:42
-- Design Name: 
-- Module Name: RAM - Behavioral
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

entity RAM is
    generic(K: integer:=16;
            A: integer:=5;
            W: integer:=5);
    Port (
            WR: in STD_LOGIC;
            ADDR: in STD_LOGIC_VECTOR (W-1 DOWNTO 0);
            DIN : in STD_LOGIC_VECTOR (K-1 downto 0);
            DOUT: out std_logic_vector (K-1 downto 0));
end RAM;

architecture Behavioral of RAM is
subtype word is std_logic_vector (K-1 downto 0);
type MEMORY is array (0 to 2**A-1) of word;
signal RAM32: MEMORY;
begin
process (WR,DIN,ADDR)
    variable RAM_ADDR_IN: natural range 0 to 2**w-1;
    begin 
        RAM_ADDR_IN:= to_integer(UNSIGNED(ADDR));
        if (WR='1') THEN 
            RAM32 (RAM_ADDR_IN) <= DIN;
        end if;
        DOUT<= RAM32(RAM_ADDR_IN);
end process;

end Behavioral;
