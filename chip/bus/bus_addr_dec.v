`include "include/stddef.h"
`include "chip/bus/bus.h"

module bus_addr_dec (
    input wire [`ADDR_WIDTH - 1:0] in_addr,
    output reg cs_0_,
    output reg cs_1_,
    output reg cs_2_,
    output reg cs_3_,
    output reg cs_4_,
    output reg cs_5_,
    output reg cs_6_,
    output reg cs_7_
);
    wire [`BUS_SLAVE_IDX_WIDTH - 1:0] slave_idx = in_addr[`ADDR_WIDTH - 1:`ADDR_WIDTH - `BUS_SLAVE_IDX_WIDTH];

    always @(slave_idx) begin
        cs_0_ = `DISABLE_;
        cs_1_ = `DISABLE_;
        cs_2_ = `DISABLE_;
        cs_3_ = `DISABLE_;
        cs_4_ = `DISABLE_;
        cs_5_ = `DISABLE_;
        cs_6_ = `DISABLE_;
        cs_7_ = `DISABLE_;
        case (slave_idx)
            `BUS_SLAVE_0 : cs_0_ = `ENABLE_;
            `BUS_SLAVE_1 : cs_1_ = `ENABLE_;
            `BUS_SLAVE_2 : cs_2_ = `ENABLE_;
            `BUS_SLAVE_3 : cs_3_ = `ENABLE_;
            `BUS_SLAVE_4 : cs_4_ = `ENABLE_;
            `BUS_SLAVE_5 : cs_5_ = `ENABLE_;
            `BUS_SLAVE_6 : cs_6_ = `ENABLE_;
            `BUS_SLAVE_7 : cs_7_ = `ENABLE_;
        endcase
    end
endmodule