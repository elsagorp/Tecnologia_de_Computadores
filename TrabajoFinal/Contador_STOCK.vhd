
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Contador_STOCK is
    Port(CLOCK, RESET_COUNT: in  STD_LOGIC;
        LATA_IN: in STD_LOGIC;
        LATA: out STD_LOGIC;
        EMPTY: out STD_LOGIC);
end Contador_STOCK;

architecture Behavioral of Contador_STOCK is
--Señal interna que hace de contador
    signal COUNT :  integer range 0 to 3 ;
begin
 process (CLOCK,RESET_COUNT) begin
        LATA <= LATA_IN;
        if(RESET_COUNT = '1')then 
            EMPTY <= '0'; 
            COUNT <= 0;
        elsif(rising_edge(CLOCK)) then
            EMPTY <= '0';
            if(COUNT = 3)then
                EMPTY <= '1';
            else
                if(LATA_IN = '1')then COUNT <= COUNT +1;
                end if;
            end if;
        end if;
   end process;

end Behavioral;
