`include "include/stddef.h"
`include "chip/cpu/cpu.h"
`include "chip/cpu/isa.h"

module dpram (
    input wire clk_0,
    input wire we_0,
    input wire [`SPM_ADDR_WIDTH - 1:0] addr_0,
    input wire [`DATA_WIDTH - 1:0] data_in_0,
    output reg [`DATA_WIDTH - 1:0] data_out_0,
    input wire clk_1,
    input wire we_1,
    input wire [`SPM_ADDR_WIDTH - 1:0] addr_1,
    input wire [`DATA_WIDTH - 1:0] data_in_1,
    output reg [`DATA_WIDTH - 1:0] data_out_1
);
    reg [`DATA_WIDTH - 1:0] mem [`SPM_ADDR_WIDTH - 1:0];

    always @(posedge clk_0) begin
       if ((we_1 == `ENABLE) && (addr_1 == addr_0)) data_out_0 <= #1 data_in_1;
       else data_out_0 <= #1 mem[addr_0];
       if(we_0 == `ENABLE) mem[addr_0] <= #1 data_in_0;
    end
    
    always @(posedge clk_1) begin
       if ((we_0 == `ENABLE) && (addr_0 == addr_1)) data_out_1 <= #1 data_in_0;
       else data_out_1 <= #1 mem[addr_1];
       if(we_1 == `ENABLE) mem[addr_1] <= #1 data_in_1;
    end
endmodule