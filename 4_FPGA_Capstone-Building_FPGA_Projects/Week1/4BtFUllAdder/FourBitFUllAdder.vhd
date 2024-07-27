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
        a    : in std_logic_vector(3 downto 0);
        b    : in std_logic_vector(3 downto 0);
        cin  : in std_logic;
        s    : out std_logic_vector(3 downto 0);
        cout : out std_logic
    );
End entity;

--------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------
Architecture rtl of FourBitFUllAdder is

    signal ci, co   : std_logic_vector(3 downto 0);

Begin

    --------------------------------------------------------------------------
    -- Assign Output
    --------------------------------------------------------------------------
    cout <= co(3);

    --------------------------------------------------------------------------
    -- Adder Circuit
    --------------------------------------------------------------------------
    -- Instance Adders
    FUllAdderGen : for ii in 0 to 3 generate
        FullAdderInst : Entity work.FullAdder
            Port map(
                a  => a(ii),
                b  => b(ii),
                ci => ci(ii),
                s  => s(ii),
                co => co(ii)
            );
    end generate;

    -- Inputs to adders
    ci(0)  <= cin;

    -- Internal Signals
    ci(1) <= co(0);
    ci(2) <= co(1);
    ci(3) <= co(2);

End architecture;
