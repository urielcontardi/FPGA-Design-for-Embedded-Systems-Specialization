--! \file		C4M1P4.vhd
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
Entity C4M1P4 is
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
Architecture rtl of C4M1P4 is

    signal ci, co   : std_logic_vector(3 downto 0);
    signal result : std_logic_vector(4 downto 0);
    signal Z                    : std_logic;
    signal A                    : std_logic_vector(3 downto 0);
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
    -- Instance Adders
    FUllAdderGen : for ii in 0 to 3 generate
        result(ii)  <= x(ii) xor y(ii) xor ci(ii);
        co(ii) <= (x(ii) and y(ii)) or (ci(ii) and (x(ii) xor y(ii)));
    end generate;

    -- Inputs to adders
    ci(0)  <= cin;

    -- Internal Signals
    ci(1) <= co(0);
    ci(2) <= co(1);
    ci(3) <= co(2);

    result(4) <= co(3);

    --------------------------------------------------------------------------
    -- Display Driver for X Y
    --------------------------------------------------------------------------
    xDisp_o <= bin_to_7segment(x);
    yDisp_o <= bin_to_7segment(y);

    error_o <= '1' when (x >= "1010" OR y >= "1010") else '0';

    --------------------------------------------------------------------------
    -- Display Driver for Result
    --------------------------------------------------------------------------
    Z <= (result(3) AND result(1)) OR (result(3) AND result(2));
   --Z <= '1' when result >= "01010" else '0';

    -- Circuit A
    process(result)
    begin
        case result is
            when "01010" => A <= "0000";
            when "01011" => A <= "0001";
            when "01100" => A <= "0010";
            when "01101" => A <= "0011";
            when "01110" => A <= "0100";
            when "01111" => A <= "0101";
            when "10000" => A <= "0110";
            when "10001" => A <= "0111";
            when "10010" => A <= "1000";
            when "10011" => A <= "1001";
            when others => A <= "0000"; -- Default case
        end case;
    end process;

    -- Segments Control
    hex7Seg1 <= "000" & Z; -- Z signal control hex7Seg1
    hex7Seg0 <= A when Z = '1' else result(3 downto 0); -- Mux to hex7Seg0

    -- Hex to 7-seg Driver
    resDisp1_o <= bin_to_7segment(hex7Seg1);
    resDisp0_o <= bin_to_7segment(hex7Seg0);

End architecture;
