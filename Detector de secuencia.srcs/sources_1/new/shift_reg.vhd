----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2021 11:44:47
-- Design Name: 
-- Module Name: shift_reg - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;

entity shift_reg is 
    
    generic (N: integer := 16);
    port (
            clk, reset: in STD_LOGIC;
            s_in : in STD_LOGIC;
            s_out: out STD_LOGIC);
end shift_reg;

architecture arch of shift_reg is
    signal r_reg: std_logic_vector (N-1 downto 0);
    signal r_next: std_logic_vector (N-1 downto 0);
begin 
---register 
process (clk, reset)
begin 
    if (reset='1') then 
        r_reg <= (others => '0');
    elsif (clk'event and clk ='1') then 
        r_reg <= r_next;
    end if;
end process;
---next-state (shift right)
r_next <= s_in & r_reg(N-1 downto 1);
---output 
s_out <= r_reg(0);
end arch;