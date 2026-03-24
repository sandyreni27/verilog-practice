
module alu_4bit(
  input [3:0] A, B,
  input [1:0] sel,
  output reg [3:0] result
);
  always @(*) begin
    case(sel)
      2'b00: result = A + B;
      2'b01: result = A - B;
      2'b10: result = A & B;
      2'b11: result = A | B;
    endcase
  end
endmodule
Testbench
module tb_alu;
  reg [3:0] A, B; reg [1:0] sel; wire [3:0] result;
  alu_4bit uut(.A(A),.B(B),.sel(sel),.result(result));
  initial begin
    A=4'b1010; B=4'b0011; sel=2'b00; #10;
    sel=2'b01; #10; sel=2'b10; #10; sel=2'b11; #10;
    $finish;
  end
endmodule
