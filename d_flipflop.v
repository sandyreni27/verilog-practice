
// D Flip-Flop
module dff(
  input D, clk, rst,
  output reg Q
);
  always @(posedge clk or posedge rst)
    if (rst) Q <= 0;
    else Q <= D;
endmodule

// 4-bit Register
module reg4bit(
  input [3:0] D, input clk, rst,
  output reg [3:0] Q
);
  always @(posedge clk or posedge rst)
    if (rst) Q <= 4'b0000;
    else Q <= D;
endmodule
Testbench
module tb_reg;
  reg [3:0] D; reg clk=0, rst=1;
  wire [3:0] Q;
  reg4bit uut(.D(D),.clk(clk),.rst(rst),.Q(Q));
  always #5 clk = ~clk;
  initial begin
    #10 rst=0; D=4'b1010; #10;
    D=4'b1111; #10; $finish;
  end
endmodule
