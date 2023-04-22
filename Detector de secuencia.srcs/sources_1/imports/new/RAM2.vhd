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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM2 is
    Port (
            en: in STD_LOGIC;
            clk: in STD_LOGIC;
            wr: in STD_LOGIC;
            addr: in STD_LOGIC_VECTOR (4 DOWNTO 0);
            din : in STD_LOGIC_VECTOR (3 downto 0);
            dout: out std_logic_vector (3 downto 0);
            rst: in std_logic);
end RAM2;

architecture Behavioral of RAM2 is
type ram_type is array (31 downto 0) of std_logic_vector (3 downto 0);
signal  myRam: ram_type;
begin
process (clk)
begin
if (clk'event and clk = '1')then 
    if (en = '1') then 
        if (wr= '1')then
            myRam(conv_integer(addr))<= din;
        else 
            dout <= myRam(conv_integer(addr));
        end if;
     end if;
end if;
            
end process;
end Behavioral;

