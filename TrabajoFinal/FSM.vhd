----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.01.2021 15:38:42
-- Design Name: 
-- Module Name: FSM - Behavioral
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

--Circuito digital que une el contador de stock y la maquina de refrescos
entity FSM is
    Port (CLOCK, RESET: in  STD_LOGIC;
         COIN_IN: in STD_LOGIC_VECTOR(2 downto 0);
         LATA: out STD_LOGIC;
         EMPTY: out STD_LOGIC;
         COIN_OUT: out STD_LOGIC_VECTOR(2 downto 0));

end FSM;

architecture Structural of FSM is
    component Expendedora is 
        Port (CLOCK, RESET: in  STD_LOGIC;
             COIN_IN: in STD_LOGIC_VECTOR(2 downto 0);
             LATA: out STD_LOGIC;
             COIN_OUT: out STD_LOGIC_VECTOR(2 downto 0));
    end component;
    component Contador_STOCK is
           Port(CLOCK, RESET_COUNT: in  STD_LOGIC;
                LATA_IN: in STD_LOGIC;
                LATA: out STD_LOGIC;
                EMPTY: out STD_LOGIC);
    end component;
    
    signal INT_LATA: STD_LOGIC;
    
begin
        
    Expendedor : Expendedora port map(
        CLOCK => CLOCK,
        RESET => RESET,
        COIN_IN => COIN_IN,
        LATA => INT_LATA,
        COIN_OUT => COIN_OUT 
    );
    
    Contador : Contador_STOCK port map(
        CLOCK => CLOCK,
        RESET_COUNT => RESET,
        LATA_IN => INT_LATA,
        LATA => LATA,
        EMPTY => EMPTY  
        );

 

end Structural;
