
module nor_gate (
  input  input_1,
  input  input_2,
  output nor_result);
  assign nor_result = ~(input_1 | input_2);
endmodule

XOR Gate — xor_gate.v
module xor_gate (
  input  input_1,
  input  input_2,
  output xor_result);
  assign xor_result = input_1 ^ input_2;
endmodule

Testbench — tb_xor_gate.v
module tb_xor_gate;
  reg input_1, input_2;
  wire xor_result;
  xor_gate uut (.input_1(input_1), .input_2(input_2), .xor_result(xor_result));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb_xor_gate);
    input_1=0; input_2=0; #10;
    input_1=0; input_2=1; #10;
    input_1=1; input_2=0; #10;
    input_1=1; input_2=1; #10;
    $finish;
  end
  initial begin
    $monitor("in1=%b in2=%b result=%b", input_1, input_2, xor_result);
  end
endmodule

