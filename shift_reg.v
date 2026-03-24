
module sipo_shift_reg(
  input serial_in, clk, rst,
  output reg [3:0] Q
);
  always @(posedge clk or posedge rst) begin
    if (rst) Q <= 4'b0000;
    else Q <= {Q[2:0], serial_in}; // shift left, insert at LSB
  end
endmodule
Testbench
module tb_sipo;
  reg serial_in=0, clk=0, rst=1;
  wire [3:0] Q;
  sipo_shift_reg uut(.serial_in(serial_in),.clk(clk),.rst(rst),.Q(Q));
  always #5 clk = ~clk;
  initial begin
    #12 rst=0;
    // Send 1011 serially (MSB first)
    serial_in=1; #10; serial_in=0; #10;
    serial_in=1; #10; serial_in=1; #10;
    $finish; // Q should be 4'b1011
  end
endmodule
