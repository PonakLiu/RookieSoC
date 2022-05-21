`include "include/stddef.h"
`include "chip/cpu/cpu.h"
`include "chip/cpu/isa.h"

module gpr (
    input wire clk,
    input wire reset_,
    //two read ports
    input wire [`REG_ADDR_WIDTH - 1:0] rd_addr_0,
    input wire [`REG_ADDR_WIDTH - 1:0] rd_addr_1,
    output wire [`DATA_WIDTH - 1:0] rd_data_0,
    output wire [`DATA_WIDTH - 1:0] rd_data_1,
    //one write ports
    input wire we_,
    input wire [`REG_ADDR_WIDTH - 1:0] wr_addr,
    input wire [`DATA_WIDTH - 1:0] wr_data
);
    reg [`DATA_WIDTH - 1:0] gpr [`REG_ADDR_WIDTH - 1:0];
    integer i;

    //read
    assign rd_data_0 = ((we_ == `ENABLE_) && (wr_addr == rd_addr_0)) ? wr_data : gpr[rd_addr_0];
    assign rd_data_1 = ((we_ == `ENABLE_) && (wr_addr == rd_addr_1)) ? wr_data : gpr[rd_addr_1];

    //write
    always @(posedge clk or negedge reset_) begin
        if (reset_ == `ENABLE_) begin
            for (i = 0; i < `REG_NUM; i = i + 1) gpr[i] <= #1 `DATA_WIDTH'h0;
        end else begin
            if (we_ == `ENABLE_) gpr[wr_addr] <= #1 wr_data;
        end
    end
endmodule