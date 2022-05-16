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

    output reg m0_grnt_,
    output reg m1_grnt_,
    output reg m2_grnt_,
    output reg m3_grnt_,
    output reg out_ready_,
    output reg [`DATA_WIDTH - 1:0] out_rd_data,

    output reg cs_0_,
    output reg cs_1_,
    output reg cs_2_,
    output reg cs_3_,
    output reg cs_4_,
    output reg cs_5_,
    output reg cs_6_,
    output reg cs_7_,
    output reg [`ADDR_WIDTH - 1:0] out_addr,
    output reg out_as_,
    output reg out_rw,
    output reg [`DATA_WIDTH - 1:0] out_wr_data
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
    
endmodule