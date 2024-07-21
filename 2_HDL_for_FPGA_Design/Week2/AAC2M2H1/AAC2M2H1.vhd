--! \file		AAC2M2H1.vhd
--!
--! \brief		
--!
--! \author		Uriel Abe Contardi
--! \date       30-03-2024
--!
--! \version    1.0
--!
--!
--! \note		Target devices : No specific target
--! \note		Tool versions  : No specific tool
--! \note		Dependencies   : No specific dependencies
--!
--! \ingroup	
--! \warning	None
--!
--! \note		Revisions:
--!				- 1.0	30-03-2024
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
entity ALU is
    port (
        Op_code : in std_logic_vector(2 downto 0);
        A, B    : in std_logic_vector(31 downto 0);
        Y       : out std_logic_vector(31 downto 0)
    );
end entity;

--------------------------------------------------------------------------
-- Architecture
--------------------------------------------------------------------------
architecture rtl of ALU is
begin

    process (Op_code, A, B)
    begin
        case Op_code is
            when "000" =>  -- Y <= A
                Y <= A;
            when "001" =>  -- Y <= A + B
                Y <= std_logic_vector(unsigned(A) + unsigned(B));
            when "010" =>  -- Y <= A - B
                Y <= std_logic_vector(unsigned(A) - unsigned(B));
            when "011" =>  -- Y <= A AND B
                Y <= A and B;
            when "100" =>  -- Y <= A OR B
                Y <= A or B;
            when "101" =>  -- Y <= A + 1
                Y <= std_logic_vector(unsigned(A) + 1);
            when "110" =>  -- Y <= A - 1
                Y <= std_logic_vector(unsigned(A) - 1);
            when "111" =>  -- Y <= B
                Y <= B;
            when others =>
                Y <= (others => 'X');  -- Uninitialized output
        end case;
    end process;

end architecture;