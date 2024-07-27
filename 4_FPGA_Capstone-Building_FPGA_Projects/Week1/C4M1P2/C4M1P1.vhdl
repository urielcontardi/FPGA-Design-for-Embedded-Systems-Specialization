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
        SW      : in std_logic_vector(7 downto 0);
        HEX1    : out std_logic_vector(6 downto 0);
        HEX0    : out std_logic_vector(6 downto 0)
    );
End entity;

--------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------
Architecture rtl of C4M1P1 is

    --// Function to convert 4-bit binary to 7-segment display
    Function bin_to_7segment(bin: in std_logic_vector(3 downto 0)) 
    return std_logic_vector is
        variable seg: std_logic_vector(6 downto 0);
    Begin
        case bin is
            when "0000" => seg := "0111111"; -- 0
            when "0001" => seg := "0000110"; -- 1
            when "0010" => seg := "1011011"; -- 2
            when "0011" => seg := "1001111"; -- 3
            when "0100" => seg := "1100110"; -- 4
            when "0101" => seg := "1101101"; -- 5
            when "0110" => seg := "1111101"; -- 6
            when "0111" => seg := "0000111"; -- 7
            when "1000" => seg := "1111111"; -- 8
            when "1001" => seg := "1101111"; -- 9
            when others => seg := "0000000"; -- don't care (all segments off)
        End case;

        Return seg;

    End function;

Begin

    --------------------------------------------------------------------------
    -- Assign Logic
    --------------------------------------------------------------------------
    HEX1 <= bin_to_7segment(SW(7 downto 4));
    HEX0 <= bin_to_7segment(SW(3 downto 0));

End architecture;
