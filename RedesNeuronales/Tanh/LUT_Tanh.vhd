------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_arith.all;


entity LUT_Tanh is
     Port ( Ent : in STD_LOGIC_VECTOR ( 7 downto 0);
            clock: in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (15 downto 0));
end LUT_Tanh;

architecture Behavioral of LUT_Tanh is

type rom is array (0 to 8) of STD_LOGIC_VECTOR (15 downto 0);
    signal tanh_val : rom := (
        0 => x"00_00",
        
        1 => x"00_32",   -- => +0,50         x"0032",
        2 => x"00_4B",   -- => +0,75         x"004B",
        3 => x"01_00",   -- => +1,00         x"0064",
        
        4 => x"00_CE",   --  => -0,50        x"FFCE",
        5 => x"00_B5",   --  => -0,75        x"FFB5",
        6 => x"FF_00",   --  => -1,00        x"FF9C",
        
        others => x"00_00"
        
        );
    
    signal ente: signed(3 downto 0);
    signal dec: signed(3 downto 0); 
    signal id: integer :=1;
    signal r : real ;
begin

      process (clock) begin
          if rising_edge(clock) then
          
           ente <= signed(Ent(7 downto 4));
           dec <=  signed(Ent(3 downto 0));
           
          end if;
       end process;
       
       process (clock) begin
          if rising_edge(clock) then
                if((ente = 0)and (dec=0))then
                    O <= x"00_00";
                elsif(ente > 2)then
                   O <= x"01_00";
                elsif(ente < -2)then 
                  O <= x"FF_00";
                else
                 O <= tanh_val(id); 
                end if;
          
          end if;
       end process;

    process (clock) begin
            
        if rising_edge(clock) then
          
               if(ente <= -2)then
                    id <= 6;
                 
               elsif(ente = -1) then
                    
                  id <= 5;
                
                    
               elsif((ente = 0) and (dec < 0))then
                   
                  id <= 4;
                   
                    
              end if;
           
               if(ente >= 2)then
                 id <= 3;
                  
               elsif(ente = 1) then
                  
                 id <= 2;
                  
               elsif((ente = 0) and (dec > 0))then
                    
                 id <= 1;
                 

               end if;
           end if;
          
       
    end process;
    

end Behavioral;
