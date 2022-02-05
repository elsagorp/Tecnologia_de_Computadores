

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity XOR_problem is
Port (X1,X2,clck,rst: in std_logic;
       result: out std_logic );
end XOR_problem;

architecture Structural of XOR_problem is
    component McCulloch_Pitt is
        generic( W1,W2,T,Dec: integer ); 
         port (X_1,X_2: in std_logic;
                Reset,Clk: in std_logic;
                salid: out std_logic );
     end component;
     
     signal S_1,S_2: std_logic;
begin

    Neuron_1: McCulloch_Pitt 
                generic map(1,1 , 0, 5)
                port map(X1,X2,rst,clck, S_1);
    
    
    Neuron_2: McCulloch_Pitt 
                generic map(-1,-1, -1 ,-5)
                port map(X1,X2,rst,clck,S_2);
    
    Neuron_3: McCulloch_Pitt 
                generic map(1,1,1 ,5)
                port map(S_1,S_2,rst,clck,result);
    

end Structural;