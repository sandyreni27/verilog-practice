// day2_adders.v
module half_adder(
    input a, b,
    output sum, carry
);
    assign sum   = a ^ b;
    assign carry = a & b;
endmodule

module full_adder(
    input a, b, cin,
    output sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

// Testbench
module tb_adders;
    reg a, b, cin;
    wire hs, hc, fs, fc;

    half_adder ha(.a(a),.b(b),.sum(hs),.carry(hc));
    full_adder fa(.a(a),.b(b),.cin(cin),.sum(fs),.cout(fc));

    initial begin
        $display("-- Half Adder --");
        $display("A B | SUM CARRY");
        a=0;b=0;#10; $display("%b %b |  %b    %b",a,b,hs,hc);
        a=0;b=1;#10; $display("%b %b |  %b    %b",a,b,hs,hc);
        a=1;b=0;#10; $display("%b %b |  %b    %b",a,b,hs,hc);
        a=1;b=1;#10; $display("%b %b |  %b    %b",a,b,hs,hc);

        $display("-- Full Adder --");
        $display("A B Cin | SUM COUT");
        a=0;b=0;cin=0;#10; $display("%b %b  %b  |  %b    %b",a,b,cin,fs,fc);
        a=0;b=1;cin=0;#10; $display("%b %b  %b  |  %b    %b",a,b,cin,fs,fc);
        a=1;b=0;cin=1;#10; $display("%b %b  %b  |  %b    %b",a,b,cin,fs,fc);
        a=1;b=1;cin=1;#10; $display("%b %b  %b  |  %b    %b",a,b,cin,fs,fc);
        $finish;
    end
endmodule