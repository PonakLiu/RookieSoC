`include "include/stddef.h"
`include "bus/bus.h"

module bus_slave_mux (
    input wire cs_0_,
    input wire cs_1_,
    input wire cs_2_,
    input wire cs_3_,
    input wire cs_4_,
    input wire cs_5_,
    input wire cs_6_,
    input wire cs_7_,
    input wire s0_ready_,
    input wire s1_ready_,
    input wire s2_ready_,
    input wire s3_ready_,
    input wire s4_ready_,
    input wire s5_ready_,
    input wire s6_ready_,
    input wire s7_ready_,
    input wire [`DATA_WIDTH - 1:0] s0_rd_data,
    input wire [`DATA_WIDTH - 1:0] s1_rd_data,
    input wire [`DATA_WIDTH - 1:0] s2_rd_data,
    input wire [`DATA_WIDTH - 1:0] s3_rd_data,
    input wire [`DATA_WIDTH - 1:0] s4_rd_data,
    input wire [`DATA_WIDTH - 1:0] s5_rd_data,
    input wire [`DATA_WIDTH - 1:0] s6_rd_data,
    input wire [`DATA_WIDTH - 1:0] s7_rd_data,
    output reg out_ready_,
    output reg [`DATA_WIDTH - 1:0] out_rd_data
);
    always @(*) begin
        if (cs_0_ == `ENABLE_) begin
            out_ready_ = s0_ready_;
            out_rd_data = s0_rd_data;
        end else if (cs_1_ == `ENABLE_) begin
            out_ready_ = s1_ready_;
            out_rd_data = s1_rd_data;
        end else if (cs_2_ == `ENABLE_) begin
            out_ready_ = s2_ready_;
            out_rd_data = s2_rd_data;
        end else if (cs_3_ == `ENABLE_) begin
            out_ready_ = s3_ready_;
            out_rd_data = s3_rd_data;
        end else if (cs_4_ == `ENABLE_) begin
            out_ready_ = s4_ready_;
            out_rd_data = s4_rd_data;
        end else if (cs_5_ == `ENABLE_) begin
            out_ready_ = s5_ready_;
            out_rd_data = s5_rd_data;
        end else if (cs_6_ == `ENABLE_) begin
            out_ready_ = s6_ready_;
            out_rd_data = s6_rd_data;
        end else if (cs_7_ == `ENABLE_) begin
            out_ready_ = s7_ready_;
            out_rd_data = s7_rd_data;
        end else begin
            out_ready_ = `DISABLE;
            out_rd_data = `DATA_WIDTH'h0;
        end
    end

endmodule //bus_slave_mux