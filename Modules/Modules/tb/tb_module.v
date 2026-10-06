`timescale 1ns/1ps
module tb_module;
reg a, b;
// output declaration of module top_module
wire out;

integer errors;

top_module top_module1(
    .a   	(a    ),
    .b   	(b    ),
    .out 	(out  )
);

initial begin
    $dumpfile("wave,vcd");
    $dumpvars(0, tb_module);
    errors = 0;

    a = 0;
    b = 0;
    expect(1'b0);
    #100;
    a = 1;
    b = 1;
    expect(1'b1);
    #100;
    a = 0;
    b = 1;
    expect(1'b0);
    #100;
    a = 1;
    b = 0;
    expect(1'b0);
    #100;

if (errors == 0) begin
    $display("=== MODULES ALL 4 CASES PASS ===");
end else begin
    $display("=== %0d FAILURES ===", errors);
end
$finish;
end

task expect;
    input exp;
    begin
    
        if (out != exp) begin
            $display("FAIL t=%0t a=%b b=%b exp=%b out=%b", $time, a, b, out, exp);
        errors = errors + 1;
        end else begin
            $display("PASS t=%0t a=%b b=%b out=%b", $time, a, b, out);
        end
    end
endtask

endmodule