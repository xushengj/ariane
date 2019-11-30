/* Copyright 2018 ETH Zurich and University of Bologna.
 * Copyright and related rights are licensed under the Solderpad Hardware
 * License, Version 0.51 (the "License"); you may not use this file except in
 * compliance with the License.  You may obtain a copy of the License at
 * http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
 * or agreed to in writing, software, hardware and materials distributed under
 * this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
 * CONDITIONS OF ANY KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations under the License.
 *
 * File: $filename.v
 *
 * Description: Auto-generated bootrom
 */

// Auto-generated code
module payload (
   input  logic         clk_i,
   input  logic         req_i,
   input  logic [63:0]  addr_i,
   output logic [63:0]  rdata_o
);
    localparam int RomSize = 131;

    const logic [RomSize-1:0][63:0] mem = {
        64'h00000000_0020205c,
        64'h0000000a_0d21646f,
        64'h6f472073_6b6f6f4c,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h46454443_42413938,
        64'h37363534_33323130,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_bfd51965,
        64'h05130000_0517efff,
        64'hf0ef1925_05130000,
        64'h0517ec7f_f0efe406,
        64'h10058593_a0050513,
        64'h11410262_653765b9,
        64'h80826105_60e2ecff,
        64'hf0ef0091_4503ed7f,
        64'hf0ef0081_4503f55f,
        64'hf0efec06_002c1101,
        64'h80826145_694264e2,
        64'h740270a2_fe9410e3,
        64'hef9ff0ef_00914503,
        64'hf01ff0ef_34610081,
        64'h4503f81f_f0ef0ff5,
        64'h7513002c_00895533,
        64'h54e10380_0413892a,
        64'hf406e84a_ec26f022,
        64'h71798082_61456942,
        64'h64e27402_70a2fe94,
        64'h10e3f3bf_f0ef0091,
        64'h4503f43f_f0ef3461,
        64'h00814503_fc3ff0ef,
        64'h0ff57513_002c0089,
        64'h553b54e1_4461892a,
        64'hf406e84a_ec26f022,
        64'h71798082_00f58023,
        64'h0007c783_00e580a3,
        64'h97aa8111_00074703,
        64'h973e00f5_771316e7,
        64'h87930000_0797b7f5,
        64'h0405f93f_f0ef8082,
        64'h01416402_60a2e509,
        64'h00044503_842ae406,
        64'he0221141_808200e7,
        64'h88230200_071300e7,
        64'h8423fc70_071300e7,
        64'h8623470d_00a78223,
        64'h0ff57513_00e78023,
        64'h0085551b_0ff57713,
        64'h00e78623_f8000713,
        64'h00078223_100007b7,
        64'h02b5553b_0045959b,
        64'h808200a7_0023dfe5,
        64'h0207f793_01474783,
        64'h10000737_80820205,
        64'h75130147_c5031000,
        64'h07b78082_00054503,
        64'h808200b5_00238082,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_250000ef,
        64'h01a11113_0210011b
    };

    logic [$clog2(RomSize)-1:0] addr_q;

    always_ff @(posedge clk_i) begin
        if (req_i) begin
            addr_q <= addr_i[$clog2(RomSize)-1+3:3];
        end
    end

    // this prevents spurious Xes from propagating into
    // the speculative fetch stage of the core
    assign rdata_o = (addr_q < RomSize) ? mem[addr_q] : '0;
endmodule
