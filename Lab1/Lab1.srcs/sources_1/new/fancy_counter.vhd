----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2019 02:43:01 PM
-- Design Name: 
-- Module Name: fancy_counter - Behavioral
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

entity fancy_counter is
    Port ( clk : in STD_LOGIC;
           clk_en : in STD_LOGIC;
           dir : in STD_LOGIC;
           en : in STD_LOGIC;
           ld : in STD_LOGIC;
           rst : in STD_LOGIC;
           updn : in STD_LOGIC;
           val : in STD_LOGIC_VECTOR (3 downto 0);
           cnt : out STD_LOGIC_VECTOR (3 downto 0));
end fancy_counter;

architecture Behavioral of fancy_counter is
    signal reg : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal direct : STD_LOGIC  := '0';
    signal counter : std_logic_vector(3 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if(rising_edge(CLK)) then
            if(en = '1') then
                if(rst = '1') then
                    cnt <= "0000";
                    counter <= "0000";
                else 
                    if(clk_en = '1') then
		              if(updn = '1') then
                            direct <= dir;
		              end if;
                      if(ld = '1') then
                        reg <= val;
                      end if;
                      if(direct = '1') then
                        if(counter = reg) then
                            counter <= "0000";
                        else
                            counter <= std_logic_vector(unsigned(counter) + 1);
                        end if;
                      else
                        if(counter = "0000") then
                            counter <= reg;
                        else
                            counter <= std_logic_vector(unsigned(counter) - 1);
                        end if;
                      end if;
                      cnt <= counter; 
                    end if;
                end if;
            end if;
        end if;
    end process;

end Behavioral;
