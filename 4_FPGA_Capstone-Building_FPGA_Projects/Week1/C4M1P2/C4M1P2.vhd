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
        bin      : in std_logic_vector(3 downto 0);
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
    signal hex7Seg0, hex7Seg1   : std_logic_vector(3 downto 0);
    signal hex7Seg              : std_logic_vector(7 downto 0);

Begin

    -- Internal Signal
    V <= bin;

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
    hex7Seg1 <= "000" & Z;

    -- Mux to hex7Seg0
    hex7Seg0 <= A when Z = '1' else V;

    --------------------------------------------------------------------------
    -- Hex to 7-seg Driver
    --------------------------------------------------------------------------
    HEX7SEGDriver : Entity work.C4M1P1
    Port map(
        bin      => hex7Seg,
        HEX1    => HEX1,
        HEX0    => HEX0
    );

    hex7Seg <= hex7Seg1 & hex7Seg0;

End architecture;
