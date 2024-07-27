--! \file		FourBitFUllAdder.vhd
--!
--! \brief		
--!
--! \author		Uriel Abe Contardi (urielcontardi@hotmail.com)
--! \date       26-07-2024
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
--!				- 1.0	26-07-2024	<urielcontardi@hotmail.com>
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
Entity FourBitFUllAdder is
    Port (
        SW      : in std_logic_vector(8 downto 0);
        LEDR    : out std_logic_vector(4 downto 0)
    );
End entity;

--------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------
Architecture rtl of FourBitFUllAdder is

    signal cin  : std_logic_vector(3 downto 0);
    signal co   : std_logic_vector(3 downto 0);
    signal a    : std_logic_vector(3 downto 0);
    signal b    : std_logic_vector(3 downto 0);
    signal s    : std_logic_vector(3 downto 0);

Begin

    --------------------------------------------------------------------------
    -- Adder Circuit
    --------------------------------------------------------------------------
    -- Inputs to adders
    a       <= SW(7 downto 4);
    b       <= SW(3 downto 0);
    cin(0)  <= SW(8);

    -- Output of adders
    LEDR(4) <= co(3);
    LEDR(3 downto 0) <= s;

    -- Instance Adders
    FUllAdderGen : for ii in 0 to 3 generate
        FullAdderInst : Entity work.FullAdder
            Port map(
                a  => a(ii),
                b  => b(ii),
                ci => cin(ii),
                s  => s(ii),
                co => co(ii)
            );
    end generate;

    -- Internal Signals
    cin(1) <= co(0);
    cin(2) <= co(1);
    cin(3) <= co(2);

End architecture;