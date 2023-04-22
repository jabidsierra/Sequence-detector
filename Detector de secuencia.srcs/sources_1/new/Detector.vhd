----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2021 22:30:17
-- Design Name: 
-- Module Name: Detector - Behavioral
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

entity Detector is
    Port ( W : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           Arst : in STD_LOGIC;
           Q1: out STD_LOGIC;
           Cup: in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Detector;

architecture Behavioral of Detector is
component FSM is 
    port(
         clk, reset: in STD_LOGIC;
         a: in STD_LOGIC;
         Y: out STD_LOGIC);
end component;
component cont_mux is
generic(N: integer :=4);
    Port ( Cup,CLK : in STD_LOGIC;
           ARst : in STD_LOGIC;
           Q1: out STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(N-1 Downto 0));
end component;
component mux_16 is
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
end component;
COMPONENT CONTMAQ is
generic(N: integer :=4);
    Port ( Cup,CLK : in STD_LOGIC;
           ARst : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(N-1 Downto 0));
end COMPONENT;
COMPONENT Div_frec is
    Port ( CLK : in STD_LOGIC;
           Q : out STD_LOGIC);
end COMPONENT;
signal cont: std_logic_vector (3 downto 0);
signal F: std_logic;
signal cont2: std_logic;
signal Q2: std_logic;
SIGNAL RESETMAQ:STD_LOGIC;
begin
Q1 <=Q2;
resetmaq1: Div_frec port map (CLK=>Q2,Q=>RESETMAQ);
mux: mux_16 port map (M0=>W(15),M1=>W(14),M2=>W(13),M3=>W(12),M4=>W(11),M5=>W(10),M6=>W(9),M7=>W(8),M8=>W(7),M9=>W(6),M10=>W(5),M11=>W(4),M12=>W(3),M13=>W(2),M14=>W(1),M15=>W(0),s=>cont, F=>F);
conmux: cont_mux port map(clk=> clk, Arst=>Arst,Cup=>'1', Q=>cont, Q1=>Q2);
F_S_M : FSM port map (a => F,Y=>cont2, clk=>clk, reset=> RESETMAQ);
cont_2: CONTMAQ port map (clk=> cont2, Arst=>Q2,Cup=>Cup, Q=>Y);

end Behavioral;
