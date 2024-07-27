--! \file		C4M1P1.vhdl
--!
--! \brief		
--!
--! \author		Uriel Abe Contardi
--! \date       21-07-2024
--!
--! \version    1.0
--!
--!
--! \note		Target devices : No specific target
--! \note		Tool versions  : No specific tool
--! \note		Dependencies   : No specific dependencies
--!
--! \ingroup	WCW
--! \warning	None
--!
--! \note		Revisions:
--!				- 1.0	21-07-2024
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
Entity C4M1P1 is
    Port (
        bin     : in std_logic_vector(7 downto 0);
        HEX1    : out std_logic_vector(6 downto 0);
        HEX0    : out std_logic_vector(6 downto 0)
    );
End entity;

--------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------
Architecture rtl of C4M1P1 is
Begin

    --------------------------------------------------------------------------
    -- Assign Logic
    --------------------------------------------------------------------------
    HEX0_Inst : entity work.ssDisplayDriver
    port map(
        value_in => bin(3 downto 0),
        driver_o => HEX0
    );

    HEX1_Inst : entity work.ssDisplayDriver
    port map(
        value_in => bin(7 downto 4),
        driver_o => HEX1
    );
    
End architecture;
