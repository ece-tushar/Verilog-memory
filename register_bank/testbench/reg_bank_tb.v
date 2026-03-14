module regbank_tb;

reg [4:0] sr1, sr2, dr;
reg [31:0] wrData;
reg clk, write, reset;
wire [31:0] rdData1, rdData2;
integer k;

regbank32 uut (rdData1, rdData2, wrData, sr1, sr2, dr, write, reset, clk);

initial clk = 0;

always #5 clk = !clk;

initial 
    begin 
    #1 reset = 1; write = 0;
    #5 reset = 0; 
    end

initial 
    begin
        #7
        for (k=0; k<32; k=k+1) 
            begin
                dr = k; wrData = 10*k; write = 1; //writing data into the registers
                #10 write = 0;
            end
            
        #20
        for (k=0; k<32; k=k+2)
            begin
                sr1 = k; sr2 = k+1; // reading data from the registers
                #5;
            end
       #2000; $finish;
    end
endmodule