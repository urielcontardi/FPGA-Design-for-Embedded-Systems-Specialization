--! \file		FullAdder.vhd
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
Entity FullAdder is
    Port (
        a  : in  std_logic;  
        b  : in  std_logic;  
        ci : in  std_logic;  
        s  : out std_logic;  
        co : out std_logic   
    );
End entity;

--------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------
Architecture rtl of FullAdder is
Begin

    s  <= a xor b xor ci;
    co <= (a and b) or (ci and (a xor b));

End architecture;

