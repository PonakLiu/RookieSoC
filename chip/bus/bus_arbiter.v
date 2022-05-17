`include "include/stddef.h"
`include "chip/bus/bus.h"

module bus_arbiter (
    input wire clk,
    input wire reset_,

    input wire m0_req_,
    output reg m0_grnt_,
    input wire m1_req_,
    output reg m1_grnt_,
    input wire m2_req_,
    output reg m2_grnt_,
    input wire m3_req_,
    output reg m3_grnt_
);
    reg [`BUS_MASTER_IDX_WIDTH - 1:0] owner;

    always @(posedge clk or negedge reset_) begin
        if (reset_ == `ENABLE_) begin
            owner <= #1 `BUS_MASTER_0;
        end else begin
            case (owner)
                `BUS_MASTER_0 : begin
                    if(m0_req_ == `ENABLE_)begin
                        owner <= #1 `BUS_MASTER_0;
                    end else if(m1_req_ == `ENABLE_) begin
                        owner <= #1 `BUS_MASTER_1;
                    end else if(m2_req_ == `ENABLE_) begin
                        owner <= #1 `BUS_MASTER_2;
                    end else if(m3_req_ == `ENABLE_) begin
                        owner <= #1 `BUS_MASTER_3;
                    end
                end
                `BUS_MASTER_1 : begin
                    if(m1_req_ == `ENABLE_)begin
                        owner <= #1 `BUS_MASTER_1;
                    end else if(m2_req_ == `ENABLE_) begin
                        owner <= #1 `BUS_MASTER_2;
                    end else if(m3_req_ == `ENABLE_) begin
                        owner <= #1 `BUS_MASTER_3;
                    end else if(m0_req_ == `ENABLE_) begin
                        owner <= #1 `BUS_MASTER_0;
                    end
                end
                `BUS_MASTER_2 : begin
                    if(m2_req_ == `ENABLE_)begin
                        owner <= #1 `BUS_MASTER_2;
                    end else if(m3_req_ == `ENABLE_) begin
                        owner <= #1 `BUS_MASTER_3;
                    end else if(m0_req_ == `ENABLE_) begin
                        owner <= #1 `BUS_MASTER_0;
                    end else if(m1_req_ == `ENABLE_) begin
                        owner <= #1 `BUS_MASTER_1;
                    end
                end
                `BUS_MASTER_3 : begin
                    if(m3_req_ == `ENABLE_)begin
                        owner <= #1 `BUS_MASTER_3;
                    end else if(m0_req_ == `ENABLE_) begin
                        owner <= #1 `BUS_MASTER_0;
                    end else if(m1_req_ == `ENABLE_) begin
                        owner <= #1 `BUS_MASTER_1;
                    end else if(m2_req_ == `ENABLE_) begin
                        owner <= #1 `BUS_MASTER_2;
                    end
                end
            endcase
        end
    end

    always @(*) begin
        m0_grnt_ = `DISABLE_;
        m1_grnt_ = `DISABLE_;
        m2_grnt_ = `DISABLE_;
        m3_grnt_ = `DISABLE_;
        case (owner)
            `BUS_MASTER_0 : m0_grnt_ = `ENABLE_;
            `BUS_MASTER_1 : m1_grnt_ = `ENABLE_;
            `BUS_MASTER_2 : m2_grnt_ = `ENABLE_;
            `BUS_MASTER_3 : m3_grnt_ = `ENABLE_;
            
        endcase
    end  
    
endmodule