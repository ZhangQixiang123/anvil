/* verilator lint_off UNOPTFLAT */
/* verilator lint_off WIDTHTRUNC */
/* verilator lint_off WIDTHEXPAND */
/* verilator lint_off WIDTHCONCAT */
module reggg (
  input logic[0:0] clk_i,
  input logic[0:0] rst_ni,
  input logic[0:0] _e_req_0
);
  always_ff @(posedge clk_i or negedge rst_ni) begin : _proc_transition
    if (~rst_ni) begin
    end
  end
  logic[0:0] thread_0_wire$3;
  logic[0:0] thread_0_wire$2;
  logic[0:0] thread_0_wire$1;
  logic[0:0] thread_0_wire$0;
  assign thread_0_wire$0 = 1'b1;
  assign thread_0_wire$1 = _e_req_0;
  assign thread_0_wire$2 = 1'b1;
  assign thread_0_wire$3 = _e_req_0;
  for (genvar i = 0; i < 7; i ++) begin : EVENTS0
    logic event_current;
    end
  logic _init_0;
  logic _thread_0_event_counter_2_1_q, _thread_0_event_counter_2_1_n;
  logic _thread_0_event_counter_1_1_q, _thread_0_event_counter_1_1_n;
  assign EVENTS0[6].event_current = EVENTS0[0].event_current && thread_0_wire$0;
  assign EVENTS0[5].event_current = EVENTS0[0].event_current && !thread_0_wire$0;
  assign EVENTS0[4].event_current = EVENTS0[1].event_current && thread_0_wire$2;
  assign EVENTS0[3].event_current = EVENTS0[1].event_current && !thread_0_wire$2;
  assign EVENTS0[2].event_current = _thread_0_event_counter_2_1_q;
  assign _thread_0_event_counter_2_1_n = EVENTS0[1].event_current;
  assign EVENTS0[1].event_current = _thread_0_event_counter_1_1_q;
  assign _thread_0_event_counter_1_1_n = EVENTS0[0].event_current;
  assign EVENTS0[0].event_current = _init_0 || EVENTS0[2].event_current;
  always_ff @(posedge clk_i or negedge rst_ni) begin : _thread_0_st_transition
    if (~rst_ni) begin
      _init_0 <= 1'b1;
      _thread_0_event_counter_2_1_q <= '0;
      _thread_0_event_counter_1_1_q <= '0;
    end else begin
      if (EVENTS0[6].event_current) begin
        $display("Received %d", thread_0_wire$1);
      end
      if (EVENTS0[5].event_current) begin
        $display("Not received");
      end
      if (EVENTS0[4].event_current) begin
        $display("Received %d", thread_0_wire$3);
      end
      if (EVENTS0[3].event_current) begin
        $display("Not received");
      end
      _init_0 <= 1'b0;
      _thread_0_event_counter_2_1_q <= _thread_0_event_counter_2_1_n;
      _thread_0_event_counter_1_1_q <= _thread_0_event_counter_1_1_n;
    end
  end
endmodule
module try_recv_sync_pat (
  input logic[0:0] clk_i,
  input logic[0:0] rst_ni
);
  logic[0:0] _reg_le_req_0;
  reggg _spawn_0 (
    .clk_i,
    .rst_ni
    ,._e_req_0 (_reg_le_req_0)
  );
  always_ff @(posedge clk_i or negedge rst_ni) begin : _proc_transition
    if (~rst_ni) begin
    end
  end
  logic[0:0] thread_0_wire$3;
  logic[0:0] thread_0_wire$1;
  localparam logic[0:0] thread_0_wire$0 = 1'b1;
  assign thread_0_wire$1 = 1'b1;
  localparam logic[0:0] thread_0_wire$2 = 1'b0;
  assign thread_0_wire$3 = 1'b1;
  for (genvar i = 0; i < 5; i ++) begin : EVENTS0
    logic event_current;
    end
  logic _init_0;
  logic _thread_0_event_counter_4_1_q, _thread_0_event_counter_4_1_n;
  logic _thread_0_event_counter_2_1_q, _thread_0_event_counter_2_1_n;
  assign EVENTS0[4].event_current = _thread_0_event_counter_4_1_q;
  assign _thread_0_event_counter_4_1_n = EVENTS0[2].event_current;
  assign EVENTS0[3].event_current = EVENTS0[2].event_current && thread_0_wire$3;
  assign EVENTS0[2].event_current = _thread_0_event_counter_2_1_q;
  assign _thread_0_event_counter_2_1_n = EVENTS0[0].event_current;
  assign EVENTS0[1].event_current = EVENTS0[0].event_current && thread_0_wire$1;
  assign EVENTS0[0].event_current = _init_0 || EVENTS0[4].event_current;
  logic[0:0] _reg_le_req_valid_selector_q, _reg_le_req_valid_selector_n;
  assign _reg_le_req_0 = (_reg_le_req_valid_selector_n == 1'd0) ? thread_0_wire$0 : (_reg_le_req_valid_selector_n == 1'd1) ? thread_0_wire$2 : '0;
  always_comb begin: _thread_0_selector
    _reg_le_req_valid_selector_n = _reg_le_req_valid_selector_q;
    if (EVENTS0[1].event_current) _reg_le_req_valid_selector_n = 1'd0;
    if (EVENTS0[3].event_current) _reg_le_req_valid_selector_n = 1'd1;
  end
  always_ff @(posedge clk_i or negedge rst_ni) begin : _thread_0_selector_trans
    if (~rst_ni) begin
      _reg_le_req_valid_selector_q <= '0;
    end else begin
      _reg_le_req_valid_selector_q <= _reg_le_req_valid_selector_n;
    end
  end
  always_ff @(posedge clk_i or negedge rst_ni) begin : _thread_0_st_transition
    if (~rst_ni) begin
      _init_0 <= 1'b1;
      _thread_0_event_counter_4_1_q <= '0;
      _thread_0_event_counter_2_1_q <= '0;
    end else begin
      if (EVENTS0[4].event_current) begin
        $finish;
      end
      if (EVENTS0[3].event_current) begin
      end
      if (EVENTS0[2].event_current) begin
        $display("Sent 2");
      end
      if (EVENTS0[1].event_current) begin
      end
      if (EVENTS0[0].event_current) begin
        $display("Sent 1");
      end
      _init_0 <= 1'b0;
      _thread_0_event_counter_4_1_q <= _thread_0_event_counter_4_1_n;
      _thread_0_event_counter_2_1_q <= _thread_0_event_counter_2_1_n;
    end
  end
endmodule
