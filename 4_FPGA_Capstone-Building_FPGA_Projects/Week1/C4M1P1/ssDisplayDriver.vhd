--! \file		ssDisplayDriver.vhd
--!
--! \brief		Seven Segment Display Driver
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
entity ssDisplayDriver is
    port (
        value_in : in std_logic_vector(3 downto 0);
        driver_o : out std_logic_vector(6 downto 0)
    );
end entity;

architecture rtl of ssDisplayDriver is

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

begin

    driver_o <= bin_to_7segment(value_in);

end architecture;