//! \file        AAC2M4P1.vhd
//!
//! \brief       This VHDL file represents the logic of
//!              the 74LS161 IC, which is a binary counter.
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
module LS161a(
    input [3:0] D,        // Parallel Input
    input CLK,            // Clock
    input CLR_n,          // Active Low Asynchronous Reset
    input LOAD_n,         // Enable Parallel Input
    input ENP,            // Count Enable Parallel
    input ENT,            // Count Enable Trickle
    output [3:0]Q,        // Parallel Output
    output RCO            // Ripple Carry Output (Terminal Count)
  );
  reg [3:0]temp;

  always @(posedge CLK)
  begin
    if (CLR_n==0)
      temp<=0000;
    else if (CLR_n==1)
    begin
      if (LOAD_n == 0)

        temp<=D;
      else if (ENP==1 & ENT==1)
        temp<=temp+1;
    end
  end

  assign Q=temp;
  assign RCO = temp[3]& temp[2]& temp[1]& temp[0]& ENT;
endmodule
