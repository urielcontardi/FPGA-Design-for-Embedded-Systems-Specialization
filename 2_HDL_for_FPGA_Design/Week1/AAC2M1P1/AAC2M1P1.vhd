--------------------------------------------------------------------------------
--                                                                            --
--               Application Assignment Problem 1 Module 1 Course 2           --
--                                                                            --
--------------------------------------------------------------------------------
--
-- 
-- @file AAC2M1P1.vhd
-- @brief Application Assignment 2-001 Example code with errors to be found
-- @version: 1.0 
-- Date of current revision:  @date 2018-08-08  
-- Target FPGA: [Intel Altera MAX10] 
-- Tools used: [Quartus Prime 16.1] for editing and synthesis 
--             [Modeltech ModelSIM 10.4a Student Edition] for simulation 
--             [Quartus Prime 16.1]  for place and route if applied
--             
--  Functional Description:  This file contains the entity VHDL code for a 
--              2-bit comparator.  The architecture is to be completed by the
--              student. 
--  Hierarchy:  Only 1 level for this simple device 
--  
--  Designed for: Coursera 
--                
--  Designed by:  @author Tim Scherr
--                University of Colorado
--
--      Copyright (c) 2018 by Tim Scherr
--
-- Redistribution, modification or use of this software in source or binary
-- forms is permitted as long as the files maintain this copyright. Users are
-- permitted to modify this and use it to learn about the field of HDl code.
-- Tim Scherr and the University of Colorado are not liable for any misuse
-- of this material.
------------------------------------------------------------------------------

--------------------------------------------------------------------------
-- Default libraries
--------------------------------------------------------------------------
Library ieee;                                	
Use ieee.std_logic_1164.all;           	

--------------------------------------------------------------------------
-- Entity declaration
--------------------------------------------------------------------------
Entity comparator2 is 
    port (                 	
        A, B    : in std_logic_vector(1 downto 0); 
        Equals  : out std_logic
    );            		
End comparator2;  


--------------------------------------------------------------------------
-- Bool Arch
--------------------------------------------------------------------------
Architecture bool_arch of comparator2 is
Begin
    --// Output
    Equals  <=  not(A(1) XOR B(1)) AND
                not(A(0) XOR B(0));
    
End architecture;

--------------------------------------------------------------------------
-- DataFlow Arch
--------------------------------------------------------------------------
Architecture dataflow_arch of comparator2 is
Begin
    --// Output
    Equals  <=  '1' when A=B else '0';
    
End architecture;