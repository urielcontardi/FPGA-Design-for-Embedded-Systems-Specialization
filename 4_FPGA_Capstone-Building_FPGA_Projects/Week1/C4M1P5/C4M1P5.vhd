--! \file		C4M1P5.vhd
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
Entity C4M1P5 is
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
Architecture rtl of C4M1P5 is

    signal result : unsigned(4 downto 0);
    signal hex7Seg0, hex7Seg1   : std_logic_vector(3 downto 0);

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
    xDisp_o <= bin_to_7segment(x);
    yDisp_o <= bin_to_7segment(y);

    error_o <= '1' when (x >= "1010" OR y >= "1010") else '0';

    --------------------------------------------------------------------------
    -- Display Driver for Result
    --------------------------------------------------------------------------
    -- Hex to 7-seg Driver
    resDisp1_o <= bin_to_7segment(hex7Seg1);
    resDisp0_o <= bin_to_7segment(hex7Seg0);

    
End architecture;
