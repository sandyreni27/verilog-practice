
module ripple_carry_adder_4bit (
  input  [3:0] a,
  input  [3:0] b,
  input        cin,
  output [3:0] sum,
  output       cout);
  wire c1, c2, c3;              // Internal carry wires between adders
  full_adder FA0 (.input_1(a[0]), .input_2(b[0]), .carry_in(cin),
                  .sum(sum[0]), .carry_out(c1));
  full_adder FA1 (.input_1(a[1]), .input_2(b[1]), .carry_in(c1),
                  .sum(sum[1]), .carry_out(c2));
  full_adder FA2 (.input_1(a[2]), .input_2(b[2]), .carry_in(c2),
                  .sum(sum[2]), .carry_out(c3));
  full_adder FA3 (.input_1(a[3]), .input_2(b[3]), .carry_in(c3),
                  .sum(sum[3]), .carry_out(cout));
endmodule

module tb_ripple_carry_adder_4bit;
  reg  [3:0] a, b;
  reg        cin;
  wire [3:0] sum;
  wire       cout;
  ripple_carry_adder_4bit uut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb_ripple_carry_adder_4bit);
    a=4'd3;  b=4'd5;  cin=0; #10;   // 3+5=8   → sum=1000, cout=0
    a=4'd9;  b=4'd7;  cin=0; #10;   // 9+7=16  → sum=0000, cout=1
    a=4'd15; b=4'd1;  cin=0; #10;   // 15+1=16 → sum=0000, cout=1
    a=4'd7;  b=4'd8;  cin=1; #10;   // 7+8+1=16→ sum=0000, cout=1
    $finish;
  end
