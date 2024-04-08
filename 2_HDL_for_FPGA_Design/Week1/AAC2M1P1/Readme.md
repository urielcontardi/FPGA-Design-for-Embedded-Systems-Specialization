# Mission 2-002

General: The goal of this Mission is to practice using simple phrases in VHDL. You should watch the videos and then apply your knowledge by designing the circuits listed using VHDL or by identifying errors in the given VHDL example code. You should test your VHDL code using the testbenches provided, submit .out files in response to coding problems, and numerical responses when asked for line numbers. See the video item "Submitting VHDL Programming Assignments" to learn more about how to do submissions. These 4 problems will be auto-graded upon submission of the answers.

Problem 1: Design a comparator. This assignment is required. Students must earn at least 70% of the points possible to pass the assignment.

Using VHDL, design a 2-bit version of the comparator in the video. To begin, download the starter file AAC2M1P1.vhd, testbench file AAC2M1P1_tb.vhdp, and vectorh.out from the .zip file located in the reading item "Files for Week 1 Programming Assignments". Using the entity below also given in AAC2M1P1.vhd, create the architecture.

    library ieee;
    use ieee.std_logic_1164.all;
    
    entity comparator2 is 
    port (
        A, B: in std_logic_vector(1 downto 0);
        Equals: out std_logic;
    )
    end comparator2;

After you have completed the design, use Modelsim and the testbench in AAC2M1P1_tb.vhdp to test your code and create an output file with the name myvectorh.out. Your code in file AAC2M1P1.vhd, the input file vectorh.out, and the testbench AAC2M1P1_tb.vhdp must be in the same directory. Use this directory as the source directory for the Modelsim project. Submit your myvectorh.out file to complete this problem