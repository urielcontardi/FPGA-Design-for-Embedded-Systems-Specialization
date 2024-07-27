--! \file		BCD_Adder_Revisited.vhd
--!
--! \brief		
--!
--! \author		Uriel Abe Contardi (urielcontardi@hotmail.com)
--! \date       27-07-2024
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
--!				- 1.0	27-07-2024	<urielcontardi@hotmail.com>
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
Entity BCD_Adder_Revisited is
    Port (
        x           : in std_logic_vector(3 downto 0);
        y           : in std_logic_vector(3 downto 0);
        cin         : in std_logic;
        xDisp_o     : out std_logic_vector(6 downto 0);
        yDisp_o     : out std_logic_vector(6 downto 0);
        resDisp1_o  : out std_logic_vector(6 downto 0);
        resDisp0_o  : out std_logic_vector(6 downto 0);
        error_o     : out std_logic
    );
End entity;

--------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------
Architecture rtl of BCD_Adder_Revisited is

    signal result : unsigned(4 downto 0);
    signal hex7Seg0, hex7Seg1   : std_logic_vector(3 downto 0);
    signal hex7Seg              : std_logic_vector(7 downto 0);

Begin

    --------------------------------------------------------------------------
    -- Adder BLock
    --------------------------------------------------------------------------
    Adder_comb : process(x,y,cin)
        variable sum : unsigned(4 downto 0);
        variable aux : std_logic_vector(0 downto 0);
    begin
        aux(0) := cin;
        sum := unsigned("0"&x) + unsigned("0"&y) + unsigned("0000"&aux);

        if sum >= 10 then
            hex7Seg1 <= "0001";
            hex7Seg0 <= std_logic_vector(sum - 10)(hex7Seg0'range);
        else
            hex7Seg1 <= "0000";
            hex7Seg0 <= std_logic_vector(sum)(hex7Seg0'range);
        end if;

    end process;
    

    --------------------------------------------------------------------------
    -- Display Driver for X Y
    --------------------------------------------------------------------------
    XDispDriver_Inst : entity work.ssDisplayDriver
    port map(
        value_in => x,
        driver_o => xDisp_o
    );

    YDispDriver_Inst : entity work.ssDisplayDriver
    port map(
        value_in => y,
        driver_o => yDisp_o
    );

    error_o <= '1' when (x >= "1010" OR y >= "1010") else '0';

    --------------------------------------------------------------------------
    -- Display Driver for Result
    --------------------------------------------------------------------------
    -- Hex to 7-seg Driver
    HEX7SEGDriver : Entity work.C4M1P1
    Port map(
        bin      => hex7Seg,
        HEX1    => resDisp1_o,
        HEX0    => resDisp0_o
    );

    hex7Seg <= hex7Seg1 & hex7Seg0;

    
End architecture;
