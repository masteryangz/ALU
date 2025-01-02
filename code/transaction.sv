class transaction;
    rand logic[7:0] a,b;
    rand logic enable;
    rand bit[3:0] command;
    logic[15:0] out;
    function void display(string name);
        $display("======================================================");
        $display("%s",name);
        $display("enable=%0d,command=%0d,a=%0d,b=%0d,output=%0d,",enable,command,a,b,out);
        $display("======================================================");
        
    endfunction //display()
endclass //transaction