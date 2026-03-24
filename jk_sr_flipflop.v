
// JK Flip-Flop (master-slave style)
module jk_ff(
  input J, K, clk, rst,
  output reg Q
);
  always @(posedge clk or posedge rst) begin
    if (rst) Q <= 0;
    else case({J,K})
      2'b00: Q <= Q;      // No change
      2'b01: Q <= 0;      // Reset
      2'b10: Q <= 1;      // Set
      2'b11: Q <= ~Q;     // Toggle
    endcase
  end
endmodule
Testbench
module tb_jk;
  reg J=0, K=0, clk=0, rst=1;
  wire Q;
  jk_ff uut(.J(J),.K(K),.clk(clk),.rst(rst),.Q(Q));
  always #5 clk = ~clk;
  initial begin
    #12 rst=0; J=1; K=0; #20; // Set
    J=0; K=1; #20; // Reset
    J=1; K=1; #40; // Toggle
    $finish;
  end
endmodule
