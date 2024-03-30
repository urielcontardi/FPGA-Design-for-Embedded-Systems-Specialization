# Mission 2-004

General: The goal of this Mission is to practice using simple phrases in VHDL. You should watch the videos and then apply your knowledge by designing the circuits listed using VHDL or by identifying errors in the given VHDL example code. You should test your VHDL code using the testbenches provided, submit .out files in response to coding problems, and numerical responses when asked for line numbers. See the video item "Submitting VHDL Programming Assignments" to learn more about how to do submissions. These 4 problems will be auto-graded upon submission of the answers.    

Problem 3: Majority Vote. This assignment is required. Students must earn at least 70% of the points possible to pass the assignment.

Using VHDL, design a majority vote circuit, which outputs a logical 1 only if 2 or more of 3 inputs are a 1. Using the entity below also given in AAC2M1P4.vhd, create the architecture.    

    library ieee;                                    

    use ieee.std_logic_1164.all;                                                  

    entity Majority is port (                   

   
        A, B, C: in std_logic;            

        Y: out std_logic;)                     

    end Majority;                              

Get files for this assignment from the .zip file located in the reading item "Files for Week 1 Programming Assignments". After you have completed the design, use Modelsim and the testbench provided in AAC2M1P4_tb.vhdp to test your code and create an output file with the name myvectorh.out. Your code in file AAC2M1P4.vhd, the input file vectorh.out, and the testbench AAC2M1P4_tb.vhdp must be in the same directory. Use this directory as the source directory for the Modelsim project. Submit your myvectorh.out file to complete this problem.