//! \file        AAC2M4P3.vhd
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
module FSM(
	input In1,
	input RST,
	input CLK, 
	output reg Out1
  );

	parameter STATE0=0, STATE1=1, STATE2=2;
	reg [1:0] state_reg, state_next;
  
  	always@(posedge CLK , negedge RST)
	begin
  		if (RST==0) state_reg <= STATE0;
  		else state_reg <= state_next;
	end
  
  	always@(state_reg,In1)
	begin
  		case(state_reg)
  			STATE0 : 
				if (In1) 
					state_next<=STATE1;
				else  
					state_next<=STATE0;

  			STATE1 : 
				if (In1) 
					state_next<=STATE1;
				else  
					state_next<=STATE2;

  			STATE2 : 
				if (In1) 
					state_next<=STATE0;
				else  
					state_next<=STATE2;
  		endcase
	end
  
  	always@(state_reg,In1)
  	case(state_reg)
  		STATE0 : Out1 = 0;
  		STATE1 : Out1 = 0;
  		STATE2 : Out1 = 1;
  	endcase

endmodule