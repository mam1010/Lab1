----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2019 02:40:26 PM
-- Design Name: 
-- Module Name: debounce - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debounce is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           dbnc : out STD_LOGIC);
end debounce;

architecture Behavioral of debounce is
    signal tmp_sig : std_logic_vector(1 downto 0);
    signal counter : std_logic_vector(1 downto 0);
begin
    process(clk)
    begin
        if clk'event and clk='1' then
          for i in 0 to 0 loop
             tmp_sig(i+1) <= tmp_sig(i);
          end loop;
          tmp_sig(0) <= btn;
          if(tmp_sig(0) = '1') then
            counter <= std_logic_vector(unsigned(counter) + 1);
          end if;
          if(unsigned(counter) = 3) then
            dbnc <= tmp_sig(0);
          end if;
        end if;
    end process;

end Behavioral;
