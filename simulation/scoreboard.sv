//`include "transaction.sv"
class scoreboard;
    transaction trans;
    mailbox mon2scb;
    parameter 
    add = 4'b0000,
    sub = 4'b0010,
    mul = 4'b0010,
    div = 4'b0011,
    inv = 4'b0100,
    inc = 4'b0101,
    dec = 4'b0110,
    shl = 4'b0111,
    shr = 4'b1000,
    AND = 4'b1001,
    OR = 4'b1010,
    NAND = 4'b1011,
    NOR = 4'b1100,
    XOR = 4'b1101,
    XNOR = 4'b1110,
    MOD = 4'b1111;
    logic[15:0] y;
    string p;
    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction //new()
    task main;
    repeat(1)
    begin
        mon2scb.get(trans);
        if(trans.enable) begin
            case(trans.command)
                add:y=trans.a+trans.b;
                sub:y=trans.a-trans.b;
                mul:y=trans.a*trans.b;
                div:y=trans.a/trans.b;
                inv:y=~trans.a;
                inc:y=trans.b+1;
                dec:y=trans.b-1;
                shl:y=trans.a<<1;
                shr:y=trans.a>>1;
                AND:y=trans.a&trans.b;
                OR:y=trans.a|trans.b;
                NAND:y=~(trans.a&trans.b);
                NOR:y=~(trans.a|trans.b);
                XOR:y=trans.a^trans.b;
                XNOR:y=trans.a~^trans.b;
                MOD:y=trans.a%trans.b;
            endcase
        end
        else y = 16'bz;
        if(y===trans.out) p = "Test Pass";
        else p = "Test Fail";
        trans.out = y;
        trans.display({"scoreboard",p});
    end
    endtask
endclass //scoreboard