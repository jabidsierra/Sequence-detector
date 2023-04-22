----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2021 08:45:43
-- Design Name: 
-- Module Name: t_b - Behavioral
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

entity t_b is
--  Port ( );
end t_b;

architecture Behavioral of t_b is
component main is
    Port (
    Arst: in std_logic;
    btn_in: in std_logic;
    btn_set: in std_logic;
    btn_reset: in std_logic; 
    sf: in std_logic_vector(1 downto 0);
    clk : in std_logic;
    AN: out STD_LOGIC_VECTOR (7 DOWNTO 0);
    Seg : out STD_LOGIC_VECTOR (6 downto 0));
end component;
signal Arst:  std_logic;
signal btn_in:  std_logic;
signal btn_set:  std_logic;
signal btn_reset:  std_logic; 
signal sf:  std_logic_vector(1 downto 0);
signal clk :  std_logic;
signal AN:  STD_LOGIC_VECTOR (7 DOWNTO 0);
signal Seg :  STD_LOGIC_VECTOR (6 downto 0);
signal T: Time := 10 ns;
begin
UTT: main port map (Arst=>Arst,btn_in=>btn_in,btn_set=>btn_set,btn_reset=>btn_reset,sf=>sf,clk=>clk,AN=>AN,seg=>seg);
Reloj: Process
Begin
    CLK <= '0'; wait for T/2;
    CLK <= '1'; wait for T/2;
end Process;

Stimulus: Process
Begin
    sf<= "00";
    Arst<='0';
     btn_set<='0';
    btn_reset<='0';
    btn_in<='1';wait for 10 ns;
    wait for 60000*T;
    Assert false
	report "Simulation completed"
    severity failure;

end Process;

end Behavioral;
