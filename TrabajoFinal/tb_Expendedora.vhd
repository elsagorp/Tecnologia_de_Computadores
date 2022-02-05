----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.01.2021 13:20:23
-- Design Name: 
-- Module Name: tb_Expendedora - Behavioral
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


entity tb_Expendedora is
end tb_Expendedora;

architecture Behavioral of tb_Expendedora is
component Expendedora is 
        Port (CLOCK, RESET: in  STD_LOGIC;
         COIN_IN: in STD_LOGIC_VECTOR(2 downto 0);
         LATA: out STD_LOGIC;
         COIN_OUT: out STD_LOGIC_VECTOR(2 downto 0));
    end component;
    
    signal INT_CLK, INT_RST, INT_LATA: STD_LOGIC;
    signal INT_COIN_IN, INT_COIN_OUT: STD_LOGIC_VECTOR(2 downto 0);
begin
DUT: Expendedora port map(INT_CLK, INT_RST,INT_COIN_IN,INT_LATA,INT_COIN_OUT);

    process begin
        INT_CLK <= '0'; wait for 10 ns;
        INT_CLK <= '1'; wait for 10 ns;
    end process;
    
    process begin
        INT_RST <= '0'; wait for 30 ns;
        INT_RST <= '1'; wait for 90 ns;
        INT_RST <= '0'; wait;
          
    end process;
    
    process begin
    
    INT_COIN_IN <= "010"; wait for 30 ns;
    INT_COIN_IN <= "001"; wait for 30 ns;
    INT_COIN_IN <= "010"; wait for 30 ns;
    INT_COIN_IN <= "001"; wait for 30 ns;
    INT_COIN_IN <= "101"; wait for 30 ns;
    INT_COIN_IN <= "101"; wait for 30 ns;
    INT_COIN_IN <= "010"; wait for 30 ns;
    INT_COIN_IN <= "001"; wait for 30 ns;
    INT_COIN_IN <= "001"; wait for 30 ns;

    end process;
end Behavioral;
