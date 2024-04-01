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
module ALU (
    input [2:0] Op_code,
    input [31:0] A, B,
    output reg [31:0] Y
  );

	always@(*)
  	begin
  	  case(Op_code)
  	    3'b000 : Y = A;
  	    3'b001 : Y = A+B;
  	    3'b010 : Y = A-B;
  	    3'b011 : Y = (A & B);
  	    3'b100 : Y = (A |B);
  	    3'b101 : Y = A+1;
  	    3'b110 : Y = A-1;
  	    3'b111 : Y = B;
  	    default:
  	      Y = 32'b0;
  	  endcase
  	end

endmodule
