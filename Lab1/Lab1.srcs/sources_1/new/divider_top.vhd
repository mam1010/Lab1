----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2019 02:16:58 PM
-- Design Name: 
-- Module Name: divider_top - rt1_structural
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

entity reg8 is --- ENTITY
    Port ( REG_IN : in std_logic;
        LD,CLK : in std_logic;
        REG_OUT : out std_logic);
end reg8;

architecture reg8 of reg8 is --- ARCHITECTURE
    begin
        reg: process(CLK)
            begin
                if (rising_edge(CLK)) then
                    if (LD = '1') then
                        REG_OUT <= REG_IN;
                    end if;
                end if;
            end process;
        end reg8;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divider_top is
    Port ( clk : in STD_LOGIC;
           div : out STD_LOGIC);
end divider_top;

architecture rt1_structural of divider_top is
    
    component clock_div
        port(CLK_IN: in std_logic;
            CLK_OUT: out std_logic);
    end component;
    
    component reg8
        Port ( REG_IN : in std_logic;
            LD,CLK : in std_logic;
            REG_OUT : out std_logic);
    end component;
    
    signal clk_div_result : std_logic;
    signal D : std_logic;
    signal Q : std_logic;
begin
    D <= not Q;
    ra: reg8
    port map ( REG_IN => D,
            LD => clk_div_result,
            CLK => clk,
            REG_OUT => Q );
    div <= Q;
    divider:clock_div
    port map(CLK_IN => clk,
             CLK_OUT => clk_div_result);
    
end rt1_structural;
