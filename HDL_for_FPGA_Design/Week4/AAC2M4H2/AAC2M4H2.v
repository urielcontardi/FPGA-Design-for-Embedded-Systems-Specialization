//! \file        AAC2M4H1.vhd
//!
//! \brief
//!
//!
//! \author      Uriel Abe Contardi
//! \date        01-04-2024
//!
//! \version     1.0
//!
//! \copyright   Copyright (c) 2024 - All Rights reserved.
//!
//! \note        Target devices: No specific target
//! \note        Tool versions: No specific tool
//! \note        Dependencies: No specific dependencies
//!
//! \ingroup
//! \warning     None
//!
//! \note        Revisions:
//!             - 1.0   01-04-2024
//!				First revision.
module FIFO8x9 (
    input clk, rst,
    input RdPtrClr, WrPtrClr,
    input RdInc, WrInc,
    input [8:0] DataIn,
    output reg [8:0] DataOut,
    input rden, wren
	);

	// Signal declarations
	reg [8:0] fifo_array[7:0];
	reg [7:0] wrptr, rdptr;
	wire [7:0] wr_cnt, rd_cnt;

	// Write pointer increment logic
	always @(posedge clk or posedge rst)
	begin
	  if (rst)
	    wrptr <= 0;
	  else if (WrPtrClr)
	    wrptr <= 0;
	  else if (WrInc)
	    wrptr <= wrptr + 1;
	end

	// Read pointer increment logic
	always @(posedge clk or posedge rst)
	begin
	  if (rst)
	    rdptr <= 0;
	  else if (RdPtrClr)
	    rdptr <= 0;
	  else if (RdInc)
	    rdptr <= rdptr + 1;
	end

	// Write logic
	always @(posedge clk)
	begin
	  if (wren)
	    fifo_array[wrptr] <= DataIn;
	end

	// Read logic
	always @(posedge clk)
	begin
	  if (rden)
	    DataOut <= fifo_array[rdptr];
	  else
	    DataOut <= 9'bZ; // High impedance when not enabled
	end

endmodule
