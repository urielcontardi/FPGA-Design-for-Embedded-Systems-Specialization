--! \file		AAC2M2P3.vhd
--!
--! \brief		
--!
--! \author		Uriel Abe Contardi (e-uriel@weg.net)
--! \date       30-03-2024
--!
--! \version    1.0
--!
--! \copyright	Copyright (c) 2022 WEG - All Rights reserved.
--!
--! \note		Target devices : No specific target
--! \note		Tool versions  : No specific tool
--! \note		Dependencies   : No specific dependencies
--!
--! \ingroup	
--! \warning	None
--!
--! \note		Revisions:
--!				- 1.0	30-03-2024	<e-uriel@weg.net>
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
entity FSM is
	port (
		In1  : in std_logic;
		RST  : in std_logic;
		CLK  : in std_logic;
		Out1 : inout std_logic
	);
end entity;

--------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------
architecture rtl of FSM is

	type ST_TYPE is (ST_A, ST_B, ST_C);
	signal current_state, next_state : ST_TYPE;

begin

	--------------------------------------------------------------------------
	-- Assign Ouput
	--------------------------------------------------------------------------
	Out1 <= '1' when current_state = ST_C else
		'0';

	--------------------------------------------------------------------------
	-- State Machine
	--------------------------------------------------------------------------
	SeqProc : process (CLK)
	begin
		if RST = '1' then
			current_state <= ST_A;
		elsif rising_edge(CLK) then
			current_state <= next_state;
		end if;
	end process;

	CombProc : process (current_state, In1)
	begin
		next_state <= current_state;

		case(current_state) is
			when ST_A =>

				if In1 = '1' then
					next_state <= ST_B;
				end if;

			when ST_B =>

				if In1 = '0' then
					next_state <= ST_C;
				end if;

			when ST_C =>

				if In1 = '1' then
					next_state <= ST_A;
				end if;

		end case;

	end process;
end architecture;