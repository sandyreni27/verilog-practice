module example_and_gate 
  ( 
    input_1,
    input_2,
    and_result);
   
  input  input_1;
  input  input_2;
  output and_result;
 
  wire   and_temp;  
 
  assign and_temp = input_1 & input_2;
   
  assign and_result = and_temp;
 
endmodule // example_and_gate

module tb_and_gate;

  // Declare inputs as reg, outputs as wire
  reg input_1;
  reg input_2;
  wire and_result;

  // Instantiate your AND gate module
  example_and_gate uut (
    .input_1(input_1),
    .input_2(input_2),
    .and_result(and_result)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_and_gate);

    // Test all 4 combinations
    input_1 = 0; input_2 = 0; #10;
    input_1 = 0; input_2 = 1; #10;
    input_1 = 1; input_2 = 0; #10;
    input_1 = 1; input_2 = 1; #10;

    $finish;
  end

  // Print results
  initial begin
    $monitor("input_1=%b  input_2=%b  result=%b", input_1, input_2, and_result);
  end

endmodule