
module mux_2to1 (
  input      input_0,
  input      input_1,
  input      select,
  output reg mux_out);    // reg because driven in always block
  always @(*) begin
    if (select == 1'b0)
      mux_out = input_0;
    else
      mux_out = input_1;
  end
endmodule

Testbench — tb_mux_2to1.v
module tb_mux_2to1;
  reg input_0, input_1, select;
  wire mux_out;
  mux_2to1 uut (.input_0(input_0), .input_1(input_1),
                .select(select), .mux_out(mux_out));
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, tb_mux_2to1);
    input_0=0; input_1=1; select=0; #10;  // expect mux_out=0
    input_0=0; input_1=1; select=1; #10;  // expect mux_out=1
    input_0=1; input_1=0; select=0; #10;  // expect mux_out=1
    input_0=1; input_1=0; select=1; #10;  // expect mux_out=0
    $finish;
  end
  initial begin
    $monitor("sel=%b out=%b", select, mux_out);
  end
endmodule

