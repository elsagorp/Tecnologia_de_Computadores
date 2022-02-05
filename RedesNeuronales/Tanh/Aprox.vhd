

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.all;
use IEEE.NUMERIC_STD.ALL;

entity Aprox is
      Port (entrada:in std_logic_vector(15 downto 0);
                sal:out std_logic );
end Aprox;

architecture Behavioral of Aprox is
    signal ent,dec: signed (7 downto 0);
begin
    process(entrada)begin
        sal <= '0';
        ent <= signed(entrada(15 downto 8));
        dec <= signed(entrada(7 downto 0));
        
        if((ent < 0) or (dec < 0))then
            sal <= '0';
        elsif((ent > 0) or (dec >0))then
            sal <= '1'; 
        elsif((ent= 0) and (dec =0))then
        
            sal <= '0';

        end if;
    
    end process;

end Behavioral;
