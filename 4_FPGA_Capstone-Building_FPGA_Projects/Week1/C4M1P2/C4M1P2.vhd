--! \file		C4M1P2.vhd
--!
--! \brief		
--!
--! \author		Uriel Abe Contardi (urielcontardi@hotmail.com)
--! \date       21-07-2024
--!
--! \version    1.0
--!
--! \copyright	Copyright (c) 2024 - All Rights reserved.
--!
--! \note		Target devices : No specific target
--! \note		Tool versions  : No specific tool
--! \note		Dependencies   : No specific dependencies
--!
--! \ingroup	None
--! \warning	None
--!
--! \note		Revisions:
--!				- 1.0	21-07-2024	<urielcontardi@hotmail.com>
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
Entity C4M1P2 is
    Port (
        SW      : in std_logic_vector(3 downto 0);
        HEX1    : out std_logic_vector(6 downto 0);
        HEX0    : out std_logic_vector(6 downto 0)
    );
End entity;

--------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------
Architecture rtl of C4M1P2 is

    signal V                    : std_logic_vector(3 downto 0);
    signal Z                    : std_logic;
    signal A                    : std_logic_vector(3 downto 0);
    signal d0, d1               : std_logic_vector(3 downto 0);

    --// Function to convert 4-bit binary to 7-segment display
    function bin_to_7segment(bin : in std_logic_vector(3 downto 0))
        return std_logic_vector is
        variable seg : std_logic_vector(6 downto 0);
    begin
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
        end case;

        return seg;

    end function;

Begin

    -- Internal Signal
    V <= SW;

    --------------------------------------------------------------------------
    -- Comparator > 9
    -- This part of circuit must be '1' when v > 9 else '0'
    -- The output z for the comparator circuit can be specified using a single 
    -- Boolean expression, with the four inputsV3-0. Design this Boolean 
    -- expression by making a truth table that shows the valuations of the 
    -- inputs V3-0forwhich z has to be 1
    --------------------------------------------------------------------------
    --Z <= '1' when V >= "1010" else '0';
    Z <= (V(3) AND V(1)) OR (V(3) AND V(2));
    
    --------------------------------------------------------------------------
    -- Circuit A
    --------------------------------------------------------------------------
    process(V)
    begin
        case V is
            when "1010" => A <= "0000";
            when "1011" => A <= "0001";
            when "1100" => A <= "0010";
            when "1101" => A <= "0011";
            when "1110" => A <= "0100";
            when "1111" => A <= "0101";
            when others => A <= "0000"; -- Default case
        end case;
    end process;

    --------------------------------------------------------------------------
    -- Segments Control
    --------------------------------------------------------------------------
    -- Z signal control hex7Seg1
    d1 <= "000" & Z;

    -- Mux to hex7Seg0
    d0 <= A when Z = '1' else V;

    --------------------------------------------------------------------------
    -- Hex to 7-seg Driver
    --------------------------------------------------------------------------
    HEX0 <= bin_to_7segment(d0);
    HEX1 <= bin_to_7segment(d1);

End architecture;
