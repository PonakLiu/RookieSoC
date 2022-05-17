`include "include/stddef.h"
`include "chip/bus/bus.h"

module bus_master_mux (
    input wire [`ADDR_WIDTH - 1:0] m0_addr,
    input wire m0_as_,
    input wire m0_rw,
    input wire [`DATA_WIDTH - 1:0] m0_wr_data,
    input wire m0_grnt_,

    input wire [`ADDR_WIDTH - 1:0] m1_addr,
    input wire m1_as_,
    input wire m1_rw,
    input wire [`DATA_WIDTH - 1:0] m1_wr_data,
    input wire m1_grnt_,

    input wire [`ADDR_WIDTH - 1:0] m2_addr,
    input wire m2_as_,
    input wire m2_rw,
    input wire [`DATA_WIDTH - 1:0] m2_wr_data,
    input wire m2_grnt_,

    input wire [`ADDR_WIDTH - 1:0] m3_addr,
    input wire m3_as_,
    input wire m3_rw,
    input wire [`DATA_WIDTH - 1:0] m3_wr_data,
    input wire m3_grnt_,

    output reg [`ADDR_WIDTH - 1:0] out_addr,
    output reg out_as_,
    output reg out_rw,
    output reg [`DATA_WIDTH - 1:0] out_wr_data

);
    always @(*) begin
        if(m0_grnt_ == `ENABLE_) begin
            out_addr = m0_addr;
            out_as_ = m0_as_;
            out_rw = m0_rw;
            out_wr_data = m0_wr_data;
        end else if(m1_grnt_ == `ENABLE_) begin
            out_addr = m1_addr;
            out_as_ = m1_as_;
            out_rw = m1_rw;
            out_wr_data = m1_wr_data;
        end else if(m2_grnt_ == `ENABLE_) begin
            out_addr = m2_addr;
            out_as_ = m2_as_;
            out_rw = m2_rw;
            out_wr_data = m2_wr_data;
        end else if(m3_grnt_ == `ENABLE_) begin
            out_addr = m3_addr;
            out_as_ = m3_as_;
            out_rw = m3_rw;
            out_wr_data = m3_wr_data;
        end else begin
            out_addr = `ADDR_WIDTH'h0;
            out_as_ = `DISABLE_;
            out_rw = `READ;
            out_wr_data = `DATA_WIDTH'h0;
        end
    end

endmodule