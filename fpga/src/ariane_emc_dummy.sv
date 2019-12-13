module ariane_emc_dummy (
  input  logic        clk,
  input  logic        rstn,
  
  input  logic        penable,
  input  logic        pwrite,
  input  logic [31:0] paddr,
  input  logic        psel,
  input  logic [31:0] pwdata,
  output logic [31:0] prdata,
  output logic        pready,
  output logic        pslverr,
  
  input  logic [15:0] flash_dq_i,
  output logic [15:0] flash_dq_o,
  output logic [15:0] flash_dq_t,
  output logic [26:0] flash_a, // lowest bit ignored
  output logic        flash_we_b,
  output logic        flash_oe_b,
  output logic        flash_ce_b,
  output logic        flash_adv_b,
  input  logic        flash_wait
);

//------------------------------------------------------------------------------
// flash logic

logic [26:0] flash_read_addr;
logic        flash_read_req;
logic        flash_read_valid;

assign flash_a = flash_read_addr;
assign flash_dq_o = '0;
assign flash_dq_t = '1;
assign flash_we_b = '1;
assign flash_adv_b = '0;
logic [15:0] data_q;
assign data_q = 16'hdead;

always_comb begin : flash_ctrl
  flash_ce_b = 1'b1;
  flash_oe_b = 1'b1;
  flash_read_valid = 1'b1;
end

//------------------------------------------------------------------------------
// apb bus logic

logic flash_read_addr_sel;
assign flash_read_addr = {paddr[26:2], flash_read_addr_sel, 1'b0};

logic [15:0] data_hw_lo_d, data_hw_lo_q;
logic [15:0] data_hw_hi_d, data_hw_hi_q;

assign prdata = {data_hw_hi_q, data_hw_lo_q};

enum logic [1:0] {
  APB_IDLE,
  APB_WAIT_LO,
  APB_WAIT_HI,
  APB_DONE
} apb_state_n, apb_state_q;

// never output error; writes are ignored
assign pslverr = 1'b0;
always_comb begin: apb_ctrl
  pready         = 1'b0;
  flash_read_req = 1'b0;
  apb_state_n    = apb_state_q;
  data_hw_lo_d   = data_hw_lo_q;
  data_hw_hi_d   = data_hw_hi_q;
  flash_read_addr_sel = 1'b0;
  case (apb_state_q)
    APB_IDLE: begin
      pready = 1'b1;
      if (psel && penable && ~pwrite) begin
        flash_read_addr_sel = 1'b0;
        pready = 1'b0;
        flash_read_req = 1'b1;
        apb_state_n = APB_WAIT_LO;
      end
    end // APB_IDLE
    
    APB_WAIT_LO: begin
      pready = 1'b0;
      flash_read_addr_sel = 1'b0;
      if (flash_read_valid) begin
        data_hw_lo_d = data_q;
        flash_read_addr_sel = 1'b1;
        flash_read_req = 1'b1;
        apb_state_n = APB_WAIT_HI;
      end
    end // APB_WAIT_LO
    
    APB_WAIT_HI: begin
      pready = 1'b0;
      flash_read_addr_sel = 1'b1;
      if (flash_read_valid) begin
        data_hw_hi_d = data_q;
        apb_state_n = APB_DONE;
      end
    end // APB_WAIT_HI
    
    APB_DONE: begin
      pready = 1'b1;
      apb_state_n = APB_IDLE;
    end // APB_DONE
  endcase
end

always_ff @(posedge clk) begin
  if (~rstn) begin
    apb_state_q             <= APB_IDLE;
    data_hw_lo_q            <= '0;
    data_hw_hi_q            <= '0;
  end else begin
    apb_state_q             <= apb_state_n;
    data_hw_lo_q            <= data_hw_lo_d;
    data_hw_hi_q            <= data_hw_hi_d;
  end
end

endmodule
