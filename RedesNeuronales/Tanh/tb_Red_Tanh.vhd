

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_Red_Tanh is

end tb_Red_Tanh;

architecture Behavioral of tb_Red_Tanh is

    component Red_Tanh is
        
        Port ( I1, I2: in STD_LOGIC_VECTOR(1 downto 0); 
           clk,rst : in STD_LOGIC;
          O1,O2 :out STD_LOGIC_VECTOR (15 downto 0);
           O : out STD_LOGIC );
    end component;
    
    signal Clck,Rst,output: std_logic;
    --signal wid : integer := 0;
    signal I_1, I_2:  STD_LOGIC_VECTOR(1 downto 0);
    signal O_1,O_2: std_logic_VECTOR (15 downto 0);
begin
    MY_XOR : Red_Tanh   port map(I_1,I_2,Clck,Rst, O_1, O_2, output);
    
    process begin
        Clck  <= '0' ; wait for 10ns;
        Clck  <= '1' ; wait for 10ns;
    end process;
    
    process begin
        Rst  <= '0' ; wait for 120ns;
        Rst  <= '1' ; wait for 30ns;
        Rst  <= '0' ; wait ;
    end process;
    
    process begin
        I_1 <= "00"; I_2 <= "00" ; wait for 30ns;
        I_1 <= "01"; I_2 <= "01" ; wait for 30ns;
        I_1 <= "00"; I_2 <= "01" ; wait for 30ns;
        I_1 <= "01"; I_2 <= "00" ; wait for 30ns;
      
    
    end process;
    
    


end Behavioral;
