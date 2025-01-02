module alu (
    a,b,enable,command,out
);
    input[7:0] a,b;
    input enable;
    input[3:0] command;
    output[15:0] out;
    reg[15:0] y;
    parameter 
    add = 4'b0000,
    sub = 4'b0001,
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

    always @(command,a,b) begin
        case(command)
            add:y=a+b;
            sub:y=a-b;
            mul:y=a*b;
            div:y=a/b;
            inv:y=~a;
            inc:y=b+1;
            dec:y=b-1;
            shl:y=a<<1;
            shr:y=b>>1;
            AND:y=a&b;
            OR:y=a|b;
            NAND:y=~(a&b);
            NOR:y=~(a|b);
            XOR:y=a^b;
            XNOR:y=a~^b;
            MOD:y=a%b;
        endcase
    end
    assign out = (enable==1)?y:16'bz;
endmodule