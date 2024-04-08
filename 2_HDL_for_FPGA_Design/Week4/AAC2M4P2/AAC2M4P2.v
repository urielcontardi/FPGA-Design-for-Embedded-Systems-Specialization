//! \file        AAC2M4P2.vhd
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
module RAM128x32 #(
    parameter Data_width = 32,  //# of bits in word
              Addr_width = 7  // # of address bits
  )
  (  //ports
    input wire clk,
    input wire we,
    input wire [(Addr_width-1):0] address,
    input wire [(Data_width-1):0] d,
    output wire [(Data_width-1):0] q
  );  

  // Declare Signal
  reg [Data_width-1:0] MEMORY[(2**Addr_width)-1:0];

  // Logicsssssssssss
  always@(posedge clk)
  begin
    if(we)
      MEMORY[address]<=d;
    else
      MEMORY[address]<=32'hxxxxxxxx;
  end

  // Assign Output
  assign q = MEMORY[address];

endmodule
