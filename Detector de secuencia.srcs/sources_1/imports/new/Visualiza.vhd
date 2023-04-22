----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.02.2021 20:15:12
-- Design Name: 
-- Module Name: Visualiza - Behavioral
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

entity Visualiza is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           Sf : in STD_LOGIC_VECTOR (1 downto 0);
           Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Cup: in std_logic;
           Arst: in STD_LOGIC;
           AN: out STD_LOGIC_VECTOR (7 downto 0));
end Visualiza;

architecture Behavioral of Visualiza is

component Cont is
generic(N: integer :=3);
    Port ( Cup,CLK : in STD_LOGIC;
           ARst : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(N-1 Downto 0));
end component;
component Deco3a8 is
    Port ( W : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;
component Deco_hexa is
  Port (W : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (6 downto 0));
end component;
component Div_100K is
    Port ( CLK : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;
component Div_1M is
    Port ( CLK : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;
component Div_200K is
    Port ( CLK : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;
component mux_4a1 is
    Port ( I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           I2 : in STD_LOGIC;
           I3 : in STD_LOGIC;
           Sf : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC);
end component;
component mux_8a1 is
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           I4 : in STD_LOGIC_VECTOR (3 downto 0);
           I5 : in STD_LOGIC_VECTOR (3 downto 0);
           I6 : in STD_LOGIC_VECTOR (3 downto 0);
           I7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component Reg_univ is
    generic (N: integer :=8);
    Port ( 
          clk, reset: in std_logic;
          ctrl: in std_logic_vector (1 downto 0);
          d: in std_logic_vector (N-1 downto 0);
          q: out std_logic_vector (N-1 downto 0));
end component;
signal x: STD_LOGIC;
signal f1: STD_LOGIC;
signal f2: STD_LOGIC;
signal f3: STD_LOGIC;
signal y: STD_LOGIC_VECTOR (3 downto 0);
signal w: STD_LOGIC_VECTOR (2 downto 0);
signal e: STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Num1: std_logic_vector (3 downto 0);
SIGNAL Num2: std_logic_vector (3 downto 0);
SIGNAL Num3: std_logic_vector (3 downto 0);
SIGNAL Num4: std_logic_vector (3 downto 0);
SIGNAL Num5: std_logic_vector (3 downto 0);
SIGNAL Num6: std_logic_vector (3 downto 0);
SIGNAL Num7: std_logic_vector (3 downto 0);
SIGNAL Num8: std_logic_vector (3 downto 0);
SIGNAL Q1: STD_LOGIC_VECTOR (7 DOWNTO 0);
begin
num1 <="000"&Q1(0);
num2 <="000"&Q1(1);
num3 <="000"&Q1(2);
num4 <="000"&Q1(3);
num5 <="000"&Q1(4);
num6 <="000"&Q1(5);
num8 <="000"&Q1(6);
num8 <="000"&Q1(7);
div100k: Div_100K port map(clk => clk, q => f1);
div200k: Div_200K port map(clk => clk, q => f2);
div1Mk: Div_1M port map(clk => clk, q => f3);
mux4a1: mux_4a1 port map(sf => sf, I0 => CLK, I1 => f1, I2 => f2, I3 => f3, Y=>X);
cont_3: Cont port map (CLK => X, ARst => Arst, Cup=>Cup, Q=>w);
mux8a1:mux_8a1 port map (I0=>num1,I1=>num2,I2=>num3,I3=>num4,I4=>num5,I5=>num6,I6=>num7,I7=>num8,S=>W,Y=>Y); 
DECO_3A8: Deco3a8 port map (w=>w,Y=>AN );
DEXOHEX:Deco_hexa port map (w=>Y,Y=>Seg);
desplaza: Reg_univ port map (clk=> X, reset=> Arst,ctrl=>"01",d=>A,Q=>Q1);
end Behavioral;
