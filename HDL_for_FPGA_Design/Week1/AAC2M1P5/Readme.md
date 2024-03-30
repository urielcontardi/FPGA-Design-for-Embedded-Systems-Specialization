# Mission 2-005

General: The goal of this Mission is to practice using simple phrases in VHDL. You should watch the videos and then apply your knowledge by designing the circuits listed using VHDL or by identifying errors in the given VHDL example code. You should test your VHDL code using the testbenches provided, submit .out files in response to coding problems, and numerical responses when asked for line numbers. See the video item "Submitting VHDL Programming Assignments" to learn more about how to do submissions. These 4 problems will be auto-graded upon submission of the answers.

Problem 4: Full 1-bit Adder. This assignment is required. Students must earn at least 70% of the points possible to pass the assignment.

Write the VHDL code describing a full 1-bit adder. Using the entity below, also given in AAC2M1H1.vhd, create the architecture.

    library ieee;                                    

    use ieee.std_logic_1164.all;                                                  

    entity FullAdd is port (                   

   
        A, B, Cin: in std_logic;            

        Sum, Cout : out std_logic;
    )                  

    end Majority;                              

To begin, download the starter file AAC2M1H1.vhd, the testbench file AAC2M1H1_tb.vhdp, and vectorh.out from the .zip file located in the reading item "Files for Week 1 Programming Assignments". Finish the code in the starter file. 

After you have completed the design, use Modelsim and the testbench in AAC2M1H1_tb.vhdp to test your code and create an output file with the name myvectorh.out. Your code in file AAC2M1H1.vhd, the input file vectorh.out, and the testbench AAC2M1H1_tb.vhdp must be in the same directory. Use this directory as the source directory for the Modelsim project. Submit your myvectorh.out file to complete this problem. 