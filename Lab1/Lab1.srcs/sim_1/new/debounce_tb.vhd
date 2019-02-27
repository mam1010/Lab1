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

entity debounce_tb is
--  Port ( );
end debounce_tb;

architecture testbench of debounce_tb is
    signal tb_clk : std_logic := '0';
    signal tb_sw0 : std_logic := '0';
    signal tb_led0 : std_logic;
    
    component debounce is
        port(
        
            clk  : in std_logic;        -- 125 Mhz clock
            sw0  : in std_logic;        -- switch, '1' = on
            
            led0 : out std_logic        -- led, '1' = on
        
        );
    end component;
begin


end testbench;
