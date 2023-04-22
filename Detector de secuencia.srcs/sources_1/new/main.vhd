----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2021 11:15:53
-- Design Name: 
-- Module Name: main - Behavioral
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

entity main is
    Port (
    Arst: in std_logic;
    btn_in: in std_logic;
    btn_set: in std_logic;
    btn_reset: in std_logic; 
    sf: in std_logic_vector(1 downto 0);
    clk : in std_logic;
    AN: out STD_LOGIC_VECTOR (7 DOWNTO 0);
    Seg : out STD_LOGIC_VECTOR (6 downto 0));
end main;

architecture Behavioral of main is
component Cont_32 is
generic(N: integer :=5);
    Port (Cup,CLK : in STD_LOGIC;
           ARst : in STD_LOGIC;
           q1: out STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(N-1 Downto 0));
end component;
component Detector is
    Port ( W : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           Arst : in STD_LOGIC;
           Q1: out STD_LOGIC;
           Cup: in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component rom_mem is
Port ( Addr : in STD_LOGIC_VECTOR (4 downto 0);
Data : out STD_LOGIC_VECTOR (15 downto 0));
end component;
component Unit_control is
    Port ( ENTRADACONTROL: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
           SALIDACONTROL: OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
end component;
component Visualiza is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           Sf : in STD_LOGIC_VECTOR (1 downto 0);
           Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Cup: in std_logic;
           Arst: in STD_LOGIC;
           AN: out STD_LOGIC_VECTOR (7 downto 0));
end component;
component RAM2 is
    Port (
            en: in STD_LOGIC;
            clk: in STD_LOGIC;
            wr: in STD_LOGIC;
            addr: in STD_LOGIC_VECTOR (4 DOWNTO 0);
            din : in STD_LOGIC_VECTOR (3 downto 0);
            dout: out std_logic_vector (3 downto 0);
            rst: in std_logic);
end component;
component cont_leer is
generic(N: integer :=6);
    Port ( Cup,CLK : in STD_LOGIC;
           ARst : in STD_LOGIC;
           leer: out std_logic;
           Q : out STD_LOGIC_VECTOR(N-1 Downto 0));
end component;
signal cont32: std_logic_vector (4 downto 0);
signal Q: std_logic_vector (15 downto 0);
SIGNAL Q1: STD_LOGIC;
signal q2: STD_LOGIC;
SIGNAL CUP: STD_LOGIC;
signal ENA : STD_LOGIC;
signal WEA : STD_LOGIC;
signal carga1: std_logic;
signal carga12: std_logic_vector (0 downto 0);
signal carga2: std_logic;
signal detener1: std_logic;
signal detener2: std_logic;
signal set: std_logic;
signal reset: std_logic;
signal iniciar: std_logic;
signal iniciar2: std_logic;
signal conteodetecc: std_logic_vector (3 downto 0);
signal visual: std_logic_vector (3 downto 0);
signal visual8bit: std_logic_vector (7 downto 0);
signal cargar:std_logic;
signal rstdetec: std_logic;
signal conteocontrol: std_logic;
signal operacion: std_logic;

begin
operacion<=cargar and conteocontrol;
carga12(0)<=carga1;
visual8bit <= "0000"&visual;
mem: rom_mem port map (Addr=>cont32,Data=>Q );
cont1: Cont_32 port map (CLK=> carga1, Cup=> iniciar2, Q=>cont32,Arst=> Arst,Q1=>q2);
detect: Detector port map (W=>Q, clk=>clk, Arst=> rstdetec,Q1=>Q1,CUP=>iniciar,y=>conteodetecc);
control:Unit_control port map (ENTRADACONTROL(0)=>q2,ENTRADACONTROL(1)=>Q1,ENTRADACONTROL(2)=>Btn_set,ENTRADACONTROL(3)=>btn_reset,ENTRADACONTROL(4)=>btn_in,SALIDACONTROL(0)=>iniciar,SALIDACONTROL(1)=>detener1,SALIDACONTROL(2)=>reset,SALIDACONTROL(3)=>cargar,SALIDACONTROL(4)=>iniciar2,SALIDACONTROL(5)=>carga1,SALIDACONTROL(6)=>rstdetec); 
memoria: RAM2 port map (wr =>operacion, addr=>CONT32,din=>conteodetecc,dout=>visual,clk=>clk,rst=>reset,en=>'1');
visualiz: visualiza port map (A=>visual8bit,clk=>clk,sf=>sf,seg=>seg,cup=>detener1,arst=>reset,AN=>AN);
contadorlectura:cont_leer port map (cup=>'1', clk=>carga1,Arst=>Arst,leer=>conteocontrol); 
end Behavioral;
