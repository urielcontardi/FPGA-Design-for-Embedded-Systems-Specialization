
--! \file        AAC2M2P1.vhd
--!
--! \brief       This VHDL file represents the logic of 
--!              the 74LS163 IC, which is a binary counter.
--!
--! \author      Uriel Abe Contardi
--! \date        24-03-2024
--!
--! \version     1.0
--!
--! \copyright   Copyright (c) 2024 - All Rights reserved.
--!
--! \note        Target devices: No specific target
--! \note        Tool versions: No specific tool
--! \note        Dependencies: No specific dependencies
--!
--! \ingroup    
--! \warning     None
--!
--! \note        Revisions:
--!             - 1.0   24-03-2024
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
Entity RAM128_32 is
	Port (
		clock   : in std_logic := '1';
		address : in std_logic_vector (6 downto 0);
		data    : in std_logic_vector (31 downto 0);
		wren    : in std_logic;
		q       : out std_logic_vector (31 downto 0)
	);
End entity;

--------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------
Architecture Behavioral of RAM128_32 is

	type array_type is array(0 to 2 ** 7) of std_logic_vector (31 downto 0);
	signal array_reg : array_type;

Begin

	process (clock)
	begin

		if (rising_edge(clock)) then

			if wren = '1' then

				array_reg(to_integer(unsigned(address))) <= data;
				q <= data;

			else

				q <= array_reg(to_integer(unsigned(address)));

			end if;

		end if;

	end process;

end architecture;