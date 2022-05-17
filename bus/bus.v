`include "include/stddef.h"
`include "bus/bus.h"
`include "bus/bus_arbiter.v"
`include "bus/bus_addr_dec.v"
`include "bus/bus_master_mux.v"
`include "bus/bus_slave_mux.v"

module bus (
    input wire clk,
    input wire reset_,

    input wire m0_req_,
    input wire m1_req_,
    input wire m2_req_,
    input wire m3_req_,
    input wire m0_as_,
    input wire m1_as_,
    input wire m2_as_,
    input wire m3_as_,
    input wire m0_rw,
    input wire m1_rw,
    input wire m2_rw,
    input wire m3_rw,
    input wire [`ADDR_WIDTH - 1:0] m0_addr,
    input wire [`ADDR_WIDTH - 1:0] m1_addr,
    input wire [`ADDR_WIDTH - 1:0] m2_addr,
    input wire [`ADDR_WIDTH - 1:0] m3_addr,
    input wire [`DATA_WIDTH - 1:0] m0_wr_data,
    input wire [`DATA_WIDTH - 1:0] m1_wr_data,
    input wire [`DATA_WIDTH - 1:0] m2_wr_data,
    input wire [`DATA_WIDTH - 1:0] m3_wr_data,

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

    output wire m0_grnt_,
    output wire m1_grnt_,
    output wire m2_grnt_,
    output wire m3_grnt_,
    output wire out_ready_,
    output wire [`DATA_WIDTH - 1:0] out_rd_data,

    output wire cs_0_,
    output wire cs_1_,
    output wire cs_2_,
    output wire cs_3_,
    output wire cs_4_,
    output wire cs_5_,
    output wire cs_6_,
    output wire cs_7_,
    output wire [`ADDR_WIDTH - 1:0] out_addr,
    output wire out_as_,
    output wire out_rw,
    output wire [`DATA_WIDTH - 1:0] out_wr_data
);
    wire [`ADDR_WIDTH - 1:0] addr;

    bus_arbiter bus_arbiter_0 (
        .clk(clk),
        .reset_(reset_),
        .m0_req_(m0_req_),
        .m1_req_(m1_req_),
        .m2_req_(m2_req_),
        .m3_req_(m3_req_),
        .m0_grnt_(m0_grnt_),
        .m1_grnt_(m1_grnt_),
        .m2_grnt_(m2_grnt_),
        .m3_grnt_(m3_grnt_)
    );

    bus_master_mux bue_master_mux_0 (
        .m0_grnt_(m0_grnt_),
        .m1_grnt_(m1_grnt_),
        .m2_grnt_(m2_grnt_),
        .m3_grnt_(m3_grnt_),
        .m0_addr(m0_addr),
        .m1_addr(m1_addr),
        .m2_addr(m2_addr),
        .m3_addr(m3_addr),
        .m0_as_(m0_as_),
        .m1_as_(m1_as_),
        .m2_as_(m2_as_),
        .m3_as_(m3_as_),
        .m0_rw(m0_rw),
        .m1_rw(m1_rw),
        .m2_rw(m2_rw),
        .m3_rw(m3_rw),
        .m0_wr_data(m0_wr_data),
        .m1_wr_data(m1_wr_data),
        .m2_wr_data(m2_wr_data),
        .m3_wr_data(m3_wr_data),
        .out_addr(out_addr),
        .out_as_(out_as_),
        .out_rw(out_rw),
        .out_wr_data(out_wr_data)
    );

    bus_addr_dec bus_addr_dec_0 (
        .in_addr(out_addr),
        .cs_0_(cs_0_),
        .cs_1_(cs_1_),
        .cs_2_(cs_2_),
        .cs_3_(cs_3_),
        .cs_4_(cs_4_),
        .cs_5_(cs_5_),
        .cs_6_(cs_6_),
        .cs_7_(cs_7_)
    );

    bus_slave_mux bus_slave_mux_0 (
        .cs_0_(cs_0_),
        .cs_1_(cs_1_),
        .cs_2_(cs_2_),
        .cs_3_(cs_3_),
        .cs_4_(cs_4_),
        .cs_5_(cs_5_),
        .cs_6_(cs_6_),
        .cs_7_(cs_7_),
        .s0_ready_(s0_ready_),
        .s1_ready_(s1_ready_),
        .s2_ready_(s2_ready_),
        .s3_ready_(s3_ready_),
        .s4_ready_(s4_ready_),
        .s5_ready_(s5_ready_),
        .s6_ready_(s6_ready_),
        .s7_ready_(s7_ready_),
        .s0_rd_data(s0_rd_data),
        .s1_rd_data(s1_rd_data),
        .s2_rd_data(s2_rd_data),
        .s3_rd_data(s3_rd_data),
        .s4_rd_data(s4_rd_data),
        .s5_rd_data(s5_rd_data),
        .s6_rd_data(s6_rd_data),
        .s7_rd_data(s7_rd_data),
        .out_ready_(out_ready_),
        .out_rd_data(out_rd_data)
    );
    
endmodule