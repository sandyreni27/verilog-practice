
module seq_detector_101(
  input clk, rst, in,
  output reg out
);
  parameter S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11;
  reg [1:0] state, next;

  // State register
  always @(posedge clk or posedge rst)
    if (rst) state <= S0;
    else state <= next;

  // Next state logic
  always @(*) begin
    case(state)
      S0: next = in ? S1 : S0;
      S1: next = in ? S1 : S2;
      S2: next = in ? S3 : S0;
      S3: next = in ? S1 : S0;
    endcase
  end

  // Output logic (Moore)
  always @(*) out = (state == S3);
endmodule
Testbench
module tb_fsm;
  reg clk=0, rst=1, in=0;
  wire out;
  seq_detector_101 uut(.clk(clk),.rst(rst),.in(in),.out(out));
  always #5 clk = ~clk;
  initial begin
    #12 rst=0;
    // Feed: 1 0 1 → should detect
    in=1;#10; in=0;#10; in=1;#10;
    in=0;#10; in=1;#10; in=0;#10; in=1;#10;
    $finish;
  end
endmodule
