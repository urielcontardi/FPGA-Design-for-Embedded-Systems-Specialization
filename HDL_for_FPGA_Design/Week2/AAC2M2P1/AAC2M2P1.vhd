--! \file        AAC2M2P1.vhd
--!
--! \brief       This VHDL file represents the logic of 
--!              the 74LS163 IC, which is a binary counter.
--!
--! \author      Uriel Abe Contardi
--! \date        24-03-2024
--!
--! \version     1.0
--!
--! \copyright   Copyright (c) 2024 - All Rights reserved.
--!
--! \note        Target devices: No specific target
--! \note        Tool versions: No specific tool
--! \note        Dependencies: No specific dependencies
--!
--! \ingroup    
--! \warning     None
--!
--! \note        Revisions:
--!             - 1.0   24-03-2024
--!				First revision.
--------------------------------------------------------------------------
-- Default libraries
--------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------------------------
-- User packages
--------------------------------------------------------------------------

--------------------------------------------------------------------------
-- Entity declaration
--------------------------------------------------------------------------
Entity AAC2M2P1 is port (
    CP  : in std_logic;                    -- clock
    SR  : in std_logic;                    -- Active low, synchronous reset
    -- Control Pins
    PE  : in std_logic;                    -- Parallel Enable (Load)
    CEP : in std_logic;                    -- Count enable parallel input
    CET : in std_logic;                    -- Count enable trickle input
    -- Data Pins
    P   : in std_logic_vector(3 downto 0); -- Parallel input
    Q   : out std_logic_vector(3 downto 0);
    TC  : out std_logic -- Terminal Count
);
End AAC2M2P1;

--------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------
Architecture rtl of AAC2M2P1 is

    signal ctr_reg, ctr_next    : unsigned(P'range) := (others => '0');

begin
    --------------------------------------------------------------------------
    -- Assign Output
    --------------------------------------------------------------------------
    Q   <= std_logic_vector(ctr_reg);
    TC  <= '1' when CET = '1' AND ctr_reg = (ctr_reg'range => '1') else '0';

    --------------------------------------------------------------------------
    -- Logic 
    --------------------------------------------------------------------------
    CountSeq : process (CP)
    begin
        if rising_edge(CP) then
            ctr_reg    <= ctr_next;
        end if;
    end process;
    
    CountComb : process (ctr_reg, PE, CEP, CET, SR)
    begin
        -- Prevent Latch inferring
        ctr_next    <= ctr_reg;
        -- Count State
        if CEP = '1' AND CET = '1' then
            ctr_next    <= ctr_reg + 1;
        end if;
        -- Register P input if Parallel Enable is '0'
        if PE = '0' then
            ctr_next    <= unsigned(P);
        end if;
        -- Reset
        if SR = '0' then
            ctr_next     <= (others => '0');
        end if;
    end process;
    
end architecture;
