# Mission 2-005

Problem 5: First-in, First-out FIFO Memory.  This assignment is required. Students must earn at least 70% of the points possible to pass the assignment.

Using VHDL, Design a FIFO memory. Make it 8-deep, 9 bits wide. When a read signal is asserted, the output of the FIFO should be enabled, otherwise it should be high impedance. When the write signal is asserted, write to one of the 9 bit registers. Use RdInc and WrInc as input signals to increment the pointers that indicate which register to read or write. Use RdPtrClr and WrPtrClr as input signals which reset the pointers to point to the first register in the array. Do not implement full or empty signals.    