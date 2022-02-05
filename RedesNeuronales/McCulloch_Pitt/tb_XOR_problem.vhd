library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity tb_XOR is

end tb_XOR;

architecture Behavioral of tb_XOR is
    component XOR_problem is
        Port (X1,X2,clck,rst: in std_logic;
               result: out std_logic );
    end component;
    
    signal X1_aux,X2_aux,rst_aux,clck_aux,output_aux: std_logic;
begin
    MY_XOR: XOR_problem port map(X1_aux,X2_aux,clck_aux,rst_aux,output_aux);
    
    process begin
        clck_aux  <= '0' ; wait for 15ns;
        clck_aux  <= '1' ; wait for 15ns;
    end process;
    
    process begin
        rst_aux  <= '0' ; wait for 120ns;
        rst_aux  <= '1' ; wait for 30ns;
        rst_aux  <= '0' ; wait ;
    end process;
    
    process begin
        X1_aux <= '0'; X2_aux <= '0' ; wait for 30ns;
        X1_aux <= '0'; X2_aux <= '1' ; wait for 30ns;
        X1_aux <= '1'; X2_aux <= '1' ; wait for 30ns;
        X1_aux <= '1'; X2_aux <= '0' ; wait for 30ns;

    end process;
    
end Behavioral;
