
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_signed.all;



entity Tanh is
     generic ( W1,W2,WB, width : integer  );
    Port ( I1, I2 : in STD_LOGIC_VECTOR(width -1 downto 0); 
           clk,rst : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (15 downto 0) );
           
end Tanh;

architecture Structural of Tanh is
    component LUT_Tanh is
        port ( Ent : in STD_LOGIC_VECTOR (7 downto 0);
                clock: in STD_LOGIC;
               O : out STD_LOGIC_VECTOR (15 downto 0));

    end component;
    
    
    
    
    signal Y: STD_LOGIC_VECTOR (7 downto 0); 
    signal Y_aux1 : signed (7 downto 0); 
    signal Y_aux2 : signed (3 downto 0); 
    signal Ysub : STD_LOGIC_VECTOR (3 downto 0);
    signal S_s : STD_LOGIC_VECTOR (15 downto 0);
    signal i_1, i_2 : integer ;
    signal Ss1,ss2 : signed (width-1 downto 0);
    signal Ss1_aux,ss2_aux, dec1,dec2 : signed ((width/2)-1 downto 0);
    
    
  
begin

 Tabla : LUT_Tanh port map (Ent => Y, clock => clk,O => S_s);
    
    process (I1,I2) begin
        --if rising_edge(clk) then
               
                if(I1 /= "11" and I1 /= "00" and I1 /= "01"and I1 /= "10")then
                    ss1 <= signed(I1);
                    ss2 <= signed(I2);
                    Ss1_aux <= Ss1(width-1 downto (width/2));
                    dec1 <= Ss1(((width/2)-1) downto 0);
                    
                    Ss2_aux <= Ss2(width-1 downto (width/2));
                    dec2 <=Ss2(((width/2)-1) downto 0);
                    
  
                   -- x <= (x1 * W1)+(x2 * W2) + WB;
                   
                    Ysub <= STD_LOGIC_VECTOR (to_signed(((to_integer(Ss1_aux)* W1)+(to_integer(Ss2_aux)* W2)+WB),4));
                    Y_aux2 <= signed(Ysub );
                    
                    Y_aux1 <=to_signed(((to_integer(dec1)* (W1*100))+(to_integer(dec2)* (W2*100))),8);
                    
                    Y <= STD_LOGIC_VECTOR ((Y_aux2 + Y_aux1(7 downto 4)) & Y_aux1(3 downto 0));
                   
                
                else 
                    i_1 <= to_integer(signed(I1));
                    
                    i_2 <= to_integer(signed(I2));
                    
                   -- Y_aux <= (i_1 * W1)+(i_2 * W2) + WB;
                    Ysub <= STD_LOGIC_VECTOR (to_signed(((i_1* W1)+(i_2* W2)+WB),4));
                    
                    
                     Y <= STD_LOGIC_VECTOR (Ysub & "0000");
                    
                end if;

        end process;
        
      process (clk,rst) begin
      
        if rising_edge(clk) then
            
                S <= S_s; 
        
        end if;
        if(rst = '1')then
        
                S <= (others=> 'Z');
                Y <= (others=> 'Z');
        end if;
     end process;


end Structural;


