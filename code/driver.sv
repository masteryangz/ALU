//`include "transaction.sv"

class driver;
    virtual intf vif;
    mailbox gen2driv;
    function new(virtual intf vif, mailbox gen2driv);
        this.vif = vif;
        this.gen2driv = gen2driv;
    endfunction //new()
    task main;
        repeat(1)
        begin
            transaction trans;
            gen2driv.get(trans);
            vif.a<=trans.a;
            vif.b<=trans.b;
            vif.enable<=trans.enable;
            vif.command<=trans.command;
            trans.display("Driver");
            trans.out=vif.out;
        end
    endtask //main
endclass //driver
