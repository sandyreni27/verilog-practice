
module counter4bit(
  input clk, rst, up,
  output reg [3:0] count
);
  always @(posedge clk or posedge rst) begin
    if (rst) count <= 4'b0000;
    else if (up) count <= count + 1;
    else count <= count - 1;
  end
endmodule
Testbench
module tb_counter;
  reg clk=0, rst=1, up=1;
  wire [3:0] count;
  counter4bit uut(.clk(clk),.rst(rst),.up(up),.count(count));
  always #5 clk = ~clk;
  initial begin
    #12 rst=0;
    #80 up=0; // switch to count down
    #80 $finish;
  end
endmodule
