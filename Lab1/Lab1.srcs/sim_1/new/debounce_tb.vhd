----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 03:28:19 PM
-- Design Name: 
-- Module Name: debounce_tb - testbench
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
    
entity debounce_tb is
--  Port ( );
end debounce_tb;

architecture testbench of debounce_tb is
    signal tb_clk : std_logic := '0';
    signal tb_sw0 : std_logic := '0';
    signal tb_led0 : std_logic;
    
    component debounce is
        port(
        
            btn  : in std_logic;        -- 125 Mhz clock
            clk  : in std_logic;        -- switch, '1' = on
            
            dbnc : out std_logic        -- led, '1' = on
        
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
    switch_proc: process
    begin
    
        wait for 1 ms;
        tb_sw0 <= '1';
        
        wait for 30 ms;
        tb_sw0 <= '0';
    
    end process switch_proc;
    dut : debounce
        port map (
        
            clk  => tb_clk,
            btn  => tb_sw0,
            dbnc => tb_led0
        
        );
end testbench;
