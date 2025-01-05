//`include "transaction.sv"
class monitor;
    virtual intf vif;
    mailbox mon2scb;

    function new(virtual intf vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction //new()
    task main;
        repeat(1)
        #3
        begin
            transaction trans;
            trans = new();
            trans.a = vif.a;
            trans.b = vif.b;
            trans.enable = vif.enable;
            trans.command = vif.command;
            trans.out = vif.out;
            mon2scb.put(trans);
            trans.display("monitor");
        end
    endtask //automatic
endclass //monitor