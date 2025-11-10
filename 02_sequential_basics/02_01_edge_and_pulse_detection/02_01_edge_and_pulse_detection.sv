//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module posedge_detector (input clk, rst, a, output detected);

  logic a_r;

  // Note:
  // The a_r flip-flop input value d propogates to the output q
  // only on the next clock cycle.

  always_ff @ (posedge clk)
    if (rst)
      a_r <= '0;
    else
      a_r <= a;

  assign detected = ~ a_r & a;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module one_cycle_pulse_detector (input clk, rst, a, output detected);

  // Task:
  // Create an one cycle pulse (010) detector.
  //
  // Note:
  // See the testbench for the output format ($display task).
  logic a_r;
  logic a_f;

  always_ff@(posedge clk)
    if(rst)
      a_r <= '0;
    else
      a_r <= a;
  
  always_ff@(posedge clk)
    if(rst)
      a_f <= '0;
    else if(a_r)
      a_f <= '0;
    else
      a_f <= a;
    
  assign detected = a_f & ~a;
  
  
endmodule
/*seq_a:
1000_1110_0100_0100
0000_0000_1000_1000*/