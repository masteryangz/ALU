//`include "transaction.sv"
class generator;
    transaction trans;
    mailbox gen2driv;
    function new(mailbox gen2driv);
        this.gen2driv = gen2driv;
    endfunction //new()
    task main();
    repeat(1)
    begin
        trans = new();
        void'(trans.randomize());
        trans.display("Generator");
        gen2driv.put(trans);
    end
    endtask
endclass //generator