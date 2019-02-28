----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2019 02:00:30 PM
-- Design Name: 
-- Module Name: clock_div_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    
entity clock_div_tb is
--  Port ( );
end clock_div_tb;

architecture testbench of clock_div_tb is
    signal tb_clk : std_logic := '0';
    signal tb_led0 : std_logic;
    
    component clock_div is
        port(
        
             CLK_IN : in STD_LOGIC;
                   CLK_OUT : out STD_LOGIC
        
        );
    end component;
begin
    clk_gen_proc: process
    begin
    
        wait for 4 ns;
        tb_clk <= '1';
        
        wait for 4 ns;
        tb_clk <= '0';
    
    end process clk_gen_proc;
    
    -- flip the switch high after 1ms
    
    dut : clock_div
        port map (
        
            CLK_IN  => tb_clk,
            CLK_OUT  => tb_led0
        
        );
end testbench;
