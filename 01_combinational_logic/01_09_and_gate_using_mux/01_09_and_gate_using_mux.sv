//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux
(
  input  d0, d1,
  input  sel,
  output y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module and_gate_using_mux
(
    input  a,
    input  b,
    output o
);

  // Task:
  // Implement and gate using instance(s) of mux,
  // constants 0 and 1, and wire connections
  wire m1_out;

  mux m0(
    .d0(1'b0),
    .d1(1'b1),
    .sel(a),
    .y(m1_out)
  );

  mux m1(
    .d0(1'b0),
    .d1(m1_out),
    .sel(b),
    .y(o)
  );


endmodule
