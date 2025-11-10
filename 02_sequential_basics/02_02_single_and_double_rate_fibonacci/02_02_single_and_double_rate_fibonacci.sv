//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module fibonacci
(
  input               clk,
  input               rst,
  output logic [15:0] num
);

  logic [15:0] num2;

  always_ff @ (posedge clk)
    if (rst)
      { num, num2 } <= { 16'd1, 16'd1 };
    else
      { num, num2 } <= { num2, num + num2 };

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module fibonacci_2
(
  input               clk,
  input               rst,
  output logic [15:0] num,
  output logic [15:0] num2
);

  // Task:
  // Implement a module that generates two fibonacci numbers per cycle

logic [15:0] temp1, temp2;

    always_ff @ (posedge clk)
        if (rst)
          { num, temp1 } <= { 16'd1, 16'd1 };
        else
          { num, temp1 } <= { num + temp1, num + (num2 + temp1) };
    
    always_ff @(posedge clk)
        if(rst)
          { num2, temp2 } <= { 16'd1, 16'd2};
        else
          { num2, temp2 } <= { temp1 + temp2, temp2 + (num2 + temp2)};

endmodule
