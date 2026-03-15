module nand_gate (
  input input_1,
  input input_2,
  output nand_result);
  assign nand_result = ~(input_1 & input_2);
endmodule
