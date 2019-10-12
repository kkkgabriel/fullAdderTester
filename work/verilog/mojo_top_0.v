/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    output reg spi_miso,
    output reg [3:0] spi_channel,
    output reg avr_rx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    input [1:0] ip_pin
  );
  
  
  
  reg rst;
  
  reg [7:0] op;
  
  reg auto;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [7-1:0] M_seg_seg;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_2 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [2-1:0] M_debounce_out;
  debounce_3 debounce (
    .clk(clk),
    .rst(rst),
    .io_button(io_button),
    .out(M_debounce_out)
  );
  wire [5-1:0] M_autoclk_out;
  autoclk_4 autoclk (
    .clk(clk),
    .rst(rst),
    .io_dip(io_dip),
    .out(M_autoclk_out)
  );
  reg M_test_d, M_test_q = 1'h0;
  reg [2:0] M_state_d, M_state_q = 3'h0;
  
  always @* begin
    M_test_d = M_test_q;
    M_state_d = M_state_q;
    
    auto = io_dip[16+7+0-:1];
    if (!auto) begin
      if (M_debounce_out == 2'h2) begin
        if (M_state_q == 3'h0) begin
          M_state_d = 3'h7;
        end else begin
          M_state_d = M_state_q - 1'h1;
        end
      end else begin
        if (M_debounce_out == 2'h1) begin
          if (M_state_q == 3'h7) begin
            M_state_d = 3'h0;
          end else begin
            M_state_d = M_state_q + 1'h1;
          end
        end else begin
          if (M_debounce_out == 2'h3) begin
            M_test_d = !M_test_q;
          end
        end
      end
    end
  end
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_seg = ~M_seg_seg;
    io_sel = ~M_seg_sel;
    led = 8'h00;
    if (auto) begin
      if (M_autoclk_out == 1'h1) begin
        M_seg_values = 16'h9000;
        op = 8'h00;
      end else begin
        if (M_autoclk_out == 2'h2) begin
          op = 8'h00;
          if (ip_pin == 2'h0) begin
            M_seg_values = 16'h3455;
          end else begin
            M_seg_values = 16'h6478;
          end
        end else begin
          if (M_autoclk_out == 2'h3) begin
            M_seg_values = 16'h9001;
            op = 8'h21;
          end else begin
            if (M_autoclk_out == 3'h4) begin
              op = 8'h21;
              if (ip_pin == 2'h1) begin
                M_seg_values = 16'h3455;
              end else begin
                M_seg_values = 16'h6478;
              end
            end else begin
              if (M_autoclk_out == 3'h5) begin
                M_seg_values = 16'h9010;
                op = 8'h41;
              end else begin
                if (M_autoclk_out == 3'h6) begin
                  op = 8'h41;
                  if (ip_pin == 2'h1) begin
                    M_seg_values = 16'h3455;
                  end else begin
                    M_seg_values = 16'h6478;
                  end
                end else begin
                  if (M_autoclk_out == 3'h7) begin
                    M_seg_values = 16'h9011;
                    op = 8'h62;
                  end else begin
                    if (M_autoclk_out == 4'h8) begin
                      op = 8'h62;
                      if (ip_pin == 2'h2) begin
                        M_seg_values = 16'h3455;
                      end else begin
                        M_seg_values = 16'h6478;
                      end
                    end else begin
                      if (M_autoclk_out == 4'h9) begin
                        M_seg_values = 16'h9100;
                        op = 8'h81;
                      end else begin
                        if (M_autoclk_out == 4'ha) begin
                          op = 8'h81;
                          if (ip_pin == 2'h1) begin
                            M_seg_values = 16'h3455;
                          end else begin
                            M_seg_values = 16'h6478;
                          end
                        end else begin
                          if (M_autoclk_out == 4'hb) begin
                            M_seg_values = 16'h9101;
                            op = 8'ha2;
                          end else begin
                            if (M_autoclk_out == 4'hc) begin
                              op = 8'ha2;
                              if (ip_pin == 2'h2) begin
                                M_seg_values = 16'h3455;
                              end else begin
                                M_seg_values = 16'h6478;
                              end
                            end else begin
                              if (M_autoclk_out == 4'hd) begin
                                M_seg_values = 16'h9110;
                                op = 8'hc2;
                              end else begin
                                if (M_autoclk_out == 4'he) begin
                                  op = 8'hc2;
                                  if (ip_pin == 2'h2) begin
                                    M_seg_values = 16'h3455;
                                  end else begin
                                    M_seg_values = 16'h6478;
                                  end
                                end else begin
                                  if (M_autoclk_out == 4'hf) begin
                                    M_seg_values = 16'h9111;
                                    op = 8'he3;
                                  end else begin
                                    if (M_autoclk_out == 5'h10) begin
                                      op = 8'he3;
                                      if (ip_pin == 2'h3) begin
                                        M_seg_values = 16'h3455;
                                      end else begin
                                        M_seg_values = 16'h6478;
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end else begin
      if (M_test_q) begin
        
        case (M_state_q)
          3'h0: begin
            if (ip_pin == 2'h0) begin
              M_seg_values = 16'h3455;
            end else begin
              M_seg_values = 16'h6478;
            end
          end
          3'h1: begin
            if (ip_pin == 2'h1) begin
              M_seg_values = 16'h3455;
            end else begin
              M_seg_values = 16'h6478;
            end
          end
          3'h2: begin
            if (ip_pin == 2'h1) begin
              M_seg_values = 16'h3455;
            end else begin
              M_seg_values = 16'h6478;
            end
          end
          3'h3: begin
            if (ip_pin == 2'h2) begin
              M_seg_values = 16'h3455;
            end else begin
              M_seg_values = 16'h6478;
            end
          end
          3'h4: begin
            if (ip_pin == 2'h1) begin
              M_seg_values = 16'h3455;
            end else begin
              M_seg_values = 16'h6478;
            end
          end
          4'h5: begin
            if (ip_pin == 2'h2) begin
              M_seg_values = 16'h3455;
            end else begin
              M_seg_values = 16'h6478;
            end
          end
          3'h6: begin
            if (ip_pin == 2'h2) begin
              M_seg_values = 16'h3455;
            end else begin
              M_seg_values = 16'h6478;
            end
          end
          3'h7: begin
            if (ip_pin == 2'h3) begin
              M_seg_values = 16'h3455;
            end else begin
              M_seg_values = 16'h6478;
            end
          end
          default: begin
            M_seg_values = 16'h6478;
          end
        endcase
      end else begin
        
        case (M_state_q)
          3'h0: begin
            M_seg_values = 16'h9000;
            op = 8'h00;
          end
          3'h1: begin
            M_seg_values = 16'h9001;
            op = 8'h21;
          end
          3'h2: begin
            M_seg_values = 16'h9010;
            op = 8'h41;
          end
          3'h3: begin
            M_seg_values = 16'h9011;
            op = 8'h62;
          end
          3'h4: begin
            M_seg_values = 16'h9100;
            op = 8'h81;
          end
          3'h5: begin
            M_seg_values = 16'h9101;
            op = 8'ha2;
          end
          3'h6: begin
            M_seg_values = 16'h9110;
            op = 8'hc2;
          end
          3'h7: begin
            M_seg_values = 16'h9111;
            op = 8'he3;
          end
          default: begin
            M_seg_values = 16'h9000;
            op = 8'h80;
          end
        endcase
      end
    end
    io_led = {{auto, 7'h00}, op, {6'h00, ip_pin}};
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_test_q <= 1'h0;
      M_state_q <= 3'h0;
    end else begin
      M_test_q <= M_test_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
