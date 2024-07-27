--! \file		BCD_Adder.vhd
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
Entity BCD_Adder is
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
Architecture rtl of BCD_Adder is

    signal result : std_logic_vector(4 downto 0);
    signal Z                    : std_logic;
    signal A                    : std_logic_vector(3 downto 0);
    signal hex7Seg0, hex7Seg1   : std_logic_vector(3 downto 0);
    signal hex7Seg              : std_logic_vector(7 downto 0);

Begin

    --------------------------------------------------------------------------
    -- Adder BLock
    --------------------------------------------------------------------------
    FOurBitAdderInst : Entity work.FourBitFUllAdder
    Port map(
        a    => x,
        b    => y,
        cin  => cin,
        s    => result(3 downto 0),
        cout => result(4)
    );

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
    --Z <= (result(3) AND result(1)) OR (result(3) AND result(2));
    Z <= '1' when result >= "01010" else '0';

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
    HEX7SEGDriver : Entity work.C4M1P1
    Port map(
        bin      => hex7Seg,
        HEX1    => resDisp1_o,
        HEX0    => resDisp0_o
    );

    hex7Seg <= hex7Seg1 & hex7Seg0;

    
End architecture;
