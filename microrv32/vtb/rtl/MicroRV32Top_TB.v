`timescale 1 ns / 1 ps
`include "MicroRV32Top.v"

module MicroRV32Top_TB();

    parameter period = 10; //ns

    reg clk, rst;
    reg[31:0] word;
    integer i,j;
    
    MicroRV32Top DUT (
        .clk(clk),
        .reset(rst)
    );

    always begin
        clk <= 0;
        #(period/2);
        clk <= 1;
        #(period/2);
    end

    initial begin
        //$monitor("t = %4d ns,clk = %d,rst = %d",$time,clk,rstn);
    end
    
    initial begin
        rst <= 1;
    end

    initial begin
        $display("Starting simulation");
        $dumpfile("sim/tb.vcd");
        $dumpvars(0,MicroRV32Top_TB);
        $display("\n ==  ==  ==  ==  ==  ==  ==  = \n");
        $monitor("t = %4d ns RESET\n",$time);
        #(16*period);
        rst <= 0;
        #(850*period);

        $display("Simulation finished");
        $monitor("t  = %4d ns",$time);
        $display("\n ==  ==  ==  ==  ==  ==  ==  = \n");
        word = 0;
        $display("pc = %h",DUT.cpu.pcLogic_programCounter);
        // for(i=0;i<10;i=i+1)
        // begin
        //     word = {DUT.ram.mem[i],DUT.ram.mem[i+1],DUT.ram.mem[i+2],DUT.ram.mem[i+3]};
        //     $display("mem@i=%d : %h",i,word);
        // end
        for(j=0;j<31;j=j+1)
        begin
            $display("reg{x%d} : %h", j, DUT.cpu.regs.regFile[j]);
        end
        $finish;
    end
endmodule