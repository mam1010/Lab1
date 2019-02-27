----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2019 02:48:21 PM
-- Design Name: 
-- Module Name: counter_top - rt1_structural
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

entity counter_top is
    Port ( CLK : in STD_LOGIC;
           BTN : in STD_LOGIC_VECTOR (3 downto 0);
           sw : in STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (3 downto 0));
end counter_top;

architecture rt1_structural of counter_top is
    component debounce
        port(btn : in STD_LOGIC;
               clk : in STD_LOGIC;
               dbnc : out STD_LOGIC);
    end component;
    
    component fancy_counter
        Port ( clk : in STD_LOGIC;
               clk_en : in STD_LOGIC;
               dir : in STD_LOGIC;
               en : in STD_LOGIC;
               ld : in STD_LOGIC;
               rst : in STD_LOGIC;
               updn : in STD_LOGIC;
               val : in STD_LOGIC_VECTOR (3 downto 0);
               cnt : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component clock_div
            port(CLK_IN: in std_logic;
                CLK_OUT: out std_logic);
        end component;
    
    signal u1_out : std_logic;
    signal u2_out : std_logic;
    signal u3_out : std_logic;
    signal u4_out : std_logic;
    signal u5_out : std_logic;
    
begin
    u1: debounce
    port map(btn => BTN(0),
            clk => CLK,
            dbnc => u1_out);
    
    u2:debounce
    port map(btn => BTN(1),
                clk => CLK,
                dbnc => u2_out);
    u3:debounce
    port map(btn => BTN(2),
                clk => CLK,
                dbnc => u3_out);
    
    u4:debounce
    port map(btn => BTN(3),
                clk => CLK,
                dbnc => u4_out);
    
    u5:clock_div
    port map(CLK_IN => CLK,
                CLK_OUT => u5_out);
    
    u6: fancy_counter
    port map(clk => CLK,
                clk_en => u5_out,
                dir => sw(0),
                en => u2_out,
                ld => u4_out,
                rst => u1_out,
                updn => u3_out,
                val => sw(3 downto 1),
                cnt => led);
end rt1_structural;
