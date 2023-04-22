----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2021 00:41:55
-- Design Name: 
-- Module Name: Reg_univ - Behavioral
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

entity Reg_univ is
    generic (N: integer :=8);
    Port ( 
          clk, reset: in std_logic;
          ctrl: in std_logic_vector (1 downto 0);
          d: in std_logic_vector (N-1 downto 0);
          q: out std_logic_vector (N-1 downto 0));
end Reg_univ;

architecture arch of Reg_univ is
signal r_reg: std_logic_vector (N-1 downto 0);
signal r_next: std_logic_vector (N-1 downto 0);
begin
---register 
process (clk, reset)
begin 
    if (reset = '1') then 
        r_reg <= (others=> '0');
    elsif (clk'event and clk ='1') then
        r_reg <= r_next;
    end if;
end process;
--- next- state logic
with ctrl select
r_next <= 
    r_reg when "00", ---no op
    r_reg (N-2 downto 0)&d(0) when "01", ---shift left
    d(N-1)& r_reg(N-1 downto 1) when "10", ---shift right
    d when others; ---load
---output
q <= r_reg;
end arch;
