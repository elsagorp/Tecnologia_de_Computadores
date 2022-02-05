
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--Red neuronal para XOR
entity Red_Tanh is
        
        Port ( I1, I2: in STD_LOGIC_VECTOR(1 downto 0); 
           clk,rst : in STD_LOGIC;
          O1,O2 : out STD_LOGIC_VECTOR (15 downto 0);
          O : out STD_LOGIC );
end Red_Tanh;

architecture Structural of Red_Tanh is
    component Tanh is
        generic ( W1,W2,WB, width : integer  );
        Port ( I1, I2 : in STD_LOGIC_VECTOR(width -1 downto 0); 
               clk,rst : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (15 downto 0) );
    end component;
    
    component Aprox is
      Port (entrada:in std_logic_vector(15 downto 0);
                sal:out std_logic );
    end component;


    
    signal S_1, S_2,S_3: std_logic_vector (15 downto 0);
    signal A_1, A_2: std_logic;
    
begin

    --Neurona intermedia a1 en el ejemplo de la web
    Neurona_1: Tanh 
                generic map(4, 4 , -2, 2)
                port map(I1,I2,clk, rst, S_1);
    
  O1 <= S_1;
    --Neurona intermedia a2 en el ejemplo de la web
    Neurona_2:Tanh 
                generic map(-3,-3, 5,2)
                port map(I1,I2,clk,rst,S_2);
                
   O2 <= S_2;
    Neurona_3:Tanh 
                generic map(5, 5, -5, 16)
                port map(S_1,S_2,clk,rst,S_3);
            
    Aproximac:Aprox 
                        port map(S_3,O);
    
end Structural;
