// 32 x 32 Register file

module regbank32 (rdData1, rdData2, wrData, sr1, sr2, dr, write, reset, clk);
    input clk, write, reset;
    input [4:0] sr1, sr2, dr;
    input [31:0] wrData;
    output [31:0] rdData1, rdData2;
    integer k;

    reg [31:0] regfile [0:31];

    assign rdData1 = regfile[sr1];
    assign rdData2 = regfile[sr2];
 
    always @ (posedge clk)
        begin
            if (reset) 
            begin
                for (k=0; k<32; k=k+1)  
                begin
                    regfile[k] <= 0; //resets all the registers to 0
                end
            end
            else 
            begin
                if (write)
                    regfile[dr] <= wrData;
            end
        end
endmodule 