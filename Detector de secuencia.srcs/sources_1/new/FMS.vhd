----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2021 11:50:14
-- Design Name: 
-- Module Name: FMS - Behavioral
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
use ieee.std_logic_1164.all ; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
 
entity FSM is 
    port(
         clk, reset: in STD_LOGIC;
         a: in STD_LOGIC;
         Y: out STD_LOGIC);
end FSM;

architecture multi_seg_arch of FSM is 
    type eg_state_type is (s0, s1, s2, s3, s4);
    signal state_reg, state_next: eg_state_type;
begin 
---state register

process (clk,reset)
begin
    if (reset = '1') then 
        state_reg <= s0;
    elsif (clk'event and clk='1') then 
        state_reg <= state_next;
    end if;
end process;

---next state logic
process (state_reg,a)
begin
    case state_reg is 
        when s0=>
            if (a='1') then
                state_next <= s1;
             else 
                state_next <= s0;
            end if;
         when s1 => 
            if (a = '1') then 
                state_next <= s2;
            else
                state_next <= s0;
            end if;
         when s2 => 
            if (a = '1') then 
                state_next <= s2;
            else 
                state_next <= s3;
            end if;
         when s3 => 
            if (a = '1') then 
                state_next <= s4;
            else 
                state_next <= s0;
            end if;
         when s4 => 
            if (a = '1') then 
                state_next <= s2;
            else 
                state_next <= s0;
            end if;
    end case;
end process;
---mealy out 
process (state_reg , a)
begin
    case state_reg is
        when s0 =>
            y <= '0';
            when s1 =>
            y <= '0';
            when s2 =>
            y <= '0';
            when s3 =>
                if (a='1') then
                    y<='1';
                end if;
            when s4 =>
            y <= '0';
        end case;
    end process;
end multi_seg_arch;