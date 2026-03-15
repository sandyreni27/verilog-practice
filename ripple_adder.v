
module ripple_carry_adder_4bit (
  input  [3:0] a,
  input  [3:0] b,
  input        cin,
  output [3:0] sum,
  output       cout);
  wire c1, c2, c3;
  full_adder FA0 (.input_1(a[0]), .input_2(b[0]), .carry_in(cin),
                  .sum(sum[0]), .carry_out(c1));
  full_adder FA1 (.input_1(a[1]), .input_2(b[1]), .carry_in(c1),
                  .sum(sum[1]), .carry_out(c2));
  full_adder FA2 (.input_1(a[2]), .input_2(b[2]), .carry_in(c2),
                  .sum(sum[2]), .carry_out(c3));
  full_adder FA3 (.input_1(a[3]), .input_2(b[3]), .carry_in(c3),
                  .sum(sum[3]), .carry_out(cout));
endmodule