`include "interface.sv"
`include "test.sv"
module tb_top ();
    intf i_intf();
    test t1(i_intf);
    alu dut(
        .a(i_intf.a),
        .b(i_intf.b),
        .enable(i_intf.enable),
        .command(i_intf.command),
        .out(i_intf.out)
    );
endmodule