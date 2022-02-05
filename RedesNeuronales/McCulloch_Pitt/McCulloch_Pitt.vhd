
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity McCulloch_Pitt is
     generic(W1,W2,T,Dec: integer);
     port (X_1,X_2: in std_logic;
            Reset,Clk: in std_logic;
            salid: out std_logic );
            

end McCulloch_Pitt;

architecture Behavioral of McCulloch_Pitt is
    signal i_1aux, i_2aux,Y: integer ;
    
   
begin
    process(CLK)begin
        if(rising_edge(CLK))then
            if(RESET = '1')then
              
                salid <= '0'; 

            else                          
               if(Y > T)then
         
                salid <= '1';
  
                elsif(Y < T ) then 
                            
                    salid <= '0';  
                    
                elsif(Y = T)then
                    if(Dec /= 0)then
                         if(Dec < 0)then
                            salid <= '1';
                          elsif(Dec > 0)then
                            salid <= '0';  
                         end if;
                    else
                        salid <= '1';
                    end if;
                
                end if;       
                
            end if;
            
        end if;
    end process;
    
    process(X_1,X_2)begin
    
        if(X_1= '1')then 
            i_1aux <= 1; 
        else
            i_1aux <= 0;
        end if;
        
        if(X_2= '1')then 
            i_2aux <= 1; 
        else
            i_2aux <= 0;
        end if;
        
         Y <= (i_1aux * W1)+(i_2aux * W2);
         
           
    end process;
   
  
end Behavioral;
