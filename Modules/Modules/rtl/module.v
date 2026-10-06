module top_module ( input a, input b, output out);

    mod_a mod1(
        .a(a),
        .b(b),
        .out(out)
    );

endmodule