-----------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Expendedora is
  Port (CLOCK, RESET: in  STD_LOGIC;
         COIN_IN: in STD_LOGIC_VECTOR(2 downto 0);--Se usan 3 bits ya que 5€ son "101", 2€ "010" y 1€ "001"
         LATA: out STD_LOGIC;--Las latas cuesten 2€
         COIN_OUT: out STD_LOGIC_VECTOR(2 downto 0));--Da las vueltas o si el RST esta en '1' devuelve todo el dinero introducido
end Expendedora;

architecture Behavioral of Expendedora is
    -- Crear los estados
    type state_type is (S0,S1,S2,S3);
    -- Registro para almacenar los estados
    signal PS, NS : state_type;

begin
   
    process (CLOCK) begin
       if(rising_edge(CLOCK)) then
          -- RESET síncrono al no estar al mismo nivel que rising_edge(CLOCK)
            if(RESET = '1') then --Señal de reinicio 
                PS <= S0;
            else
                PS <= NS;
           end if;
        end if;
      end process;
      
   -- Proceso para controlar los cambios de estados y las salidas.
   process(PS,COIN_IN, RESET) 
   begin
    LATA <= '0'; COIN_OUT <= "000";
        case PS is
           when S0=> --Estado en el que se espera meter el dinero.
                LATA <= '0';
                if(RESET = '1')then COIN_OUT <= COIN_IN; NS <= S0; -- Devuelve todo el dinero metido 
                elsif(COIN_IN = "001") then NS <= S1; COIN_OUT <= "000"; 
                elsif(COIN_IN = "010")then NS <= S2; COIN_OUT <= "000";  --Devolveria de cambio "000" estaría exacto.
                elsif(COIN_IN = "101")then NS <= S3; COIN_OUT <= "000";  --Devuelve 3€
                end if; 

                
            when S1=> --Solo te lleva a este estado si metes 1€.
                LATA <= '1';
                if(COIN_IN = "001")then NS <= S0; COIN_OUT <= "000";  --Ya que en la anterior se metió 1€ serían 3€ en total y por eso devuelve 1€.
                elsif(COIN_IN = "010")then NS <= S0; COIN_OUT <= "001";  --Devolveria de cambio "000" estaría exacto. 1€ + 1€ = 2€
                elsif(COIN_IN = "101")then NS <= S0; COIN_OUT <= "100";  -- Devuelve 4€ ya que había 1€ y se metieron 5€ despues.    
                end if;
 
            
            when S2 => --Estado despues de meter 2€ 
            
                 NS <= S0; COIN_OUT <= "000"; LATA <= '1'; --Devolveria de cambio "000" estaría exacto.
                
            when S3 => --Estado despues de meter 5€
            
                 NS <= S0; COIN_OUT <= "011"; LATA <= '1'; --Devuelve 3€

            -- Condicion de control
            when others =>
                NS <= S0; LATA <= '0'; COIN_OUT <= "000";        
         end case;
     end process;                
end Behavioral;
