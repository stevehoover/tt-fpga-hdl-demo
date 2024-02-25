//_\TLV_version 1d: tl-x.org, generated by SandPiper(TM) 1.14-2022/10/10-beta-Pro
//_\source top.tlv 39

//_\SV
   // Include Tiny Tapeout Lab.
   // Included URL: "https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlv_lib/tiny_tapeout_lib.tlv"// Included URL: "https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlv_lib/fpga_includes.tlv"
//_\source top.tlv 232

//_\SV

// ================================================
// A simple Makerchip Verilog test bench driving random stimulus.
// Modify the module contents to your needs.
// ================================================

module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
   // Tiny tapeout I/O signals.
   logic [7:0] ui_in, uo_out;
   

   // A fake PmodKYPD.
   // Pmod in: uo_out[3:0]
   // Pmod out: ui_in[3:0]
   logic [15:0] button;
   logic [3:0] col_button;
   logic [3:0] col_sel = uo_out[3:0];

   assign ui_in[3:0] =
       ({4{col_sel[0]}} & button[3:0]) |
       ({4{col_sel[1]}} & button[7:4]) |
       ({4{col_sel[2]}} & button[11:8]) |
       ({4{col_sel[3]}} & button[15:12]);


   assign ui_in[7:4] = 4'b0000;
   
   logic ena = 1'b0;
   logic rst_n = ! reset;

   // Or, to provide specific inputs at specific times (as for lab C-TB) ...
   // BE SURE TO COMMENT THE ASSIGNMENT OF INPUTS ABOVE.
   // BE SURE TO DRIVE THESE ON THE B-PHASE OF THE CLOCK (ODD STEPS).
   // Driving on the rising clock edge creates a race with the clock that has unpredictable simulation behavior.
   initial begin
      #1  // Drive inputs on the B-phase.
         button = 16'b0000_0000_0000_0000;
      #10 // Step 5 cycles, past reset.
         button = 16'b0000_0000_0000_0000;
      #200
         button = 16'b0000_0000_0000_0001;
      #200
         button = 16'b0000_0000_0000_0000;
   end

   // Instantiate the Tiny Tapeout module.
   tt_um_template tt(.*);

   assign passed = top.cyc_cnt > 600;
   assign failed = 1'b0;
endmodule


// Provide a wrapper module to debounce input signals if requested.

//_\SV



// =======================
// The Tiny Tapeout module
// =======================

module tt_um_template (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    /*   // The FPGA is based on TinyTapeout 3 which has no bidirectional I/Os (vs. TT6 for the ASIC).
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    */
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
   logic reset = ! rst_n;

// ---------- Generated Code Inlined Here (before 1st \TLV) ----------
// Generated by SandPiper(TM) 1.14-2022/10/10-beta-Pro from Redwood EDA, LLC.
// (Installed here: /usr/local/mono/sandpiper/distro.)
// Redwood EDA, LLC does not claim intellectual property rights to this file and provides no warranty regarding its correctness or quality.


// For silencing unused signal messages.
`define BOGUS_USE(ignore)


genvar button, col, digit, input_label, leds, row, switch;


//
// Signals declared top-level.
//

// For $slideswitch.
logic [7:0] L0_slideswitch_a0;

// For $sseg_decimal_point_n.
logic L0_sseg_decimal_point_n_a0;

// For $sseg_digit_n.
logic [7:0] L0_sseg_digit_n_a0;

// For $sseg_segment_n.
logic [6:0] L0_sseg_segment_n_a0;

// For /fpga_pins/fpga|pipe$debug.
logic FpgaPins_Fpga_PIPE_debug_a0;

// For /fpga_pins/fpga|pipe$display_digit.
logic [3:0] FpgaPins_Fpga_PIPE_display_digit_a1,
            FpgaPins_Fpga_PIPE_display_digit_a2;

// For /fpga_pins/fpga|pipe$first.
logic [3:0] FpgaPins_Fpga_PIPE_first_a1;

// For /fpga_pins/fpga|pipe$reset.
logic FpgaPins_Fpga_PIPE_reset_n1,
      FpgaPins_Fpga_PIPE_reset_a0;

// For /fpga_pins/fpga|pipe$segments_n.
logic [6:0] FpgaPins_Fpga_PIPE_segments_n_a2;

// For /fpga_pins/fpga|pipe$selected_mask.
logic [15:0] FpgaPins_Fpga_PIPE_selected_mask_a1,
             FpgaPins_Fpga_PIPE_selected_mask_a2;

// For /fpga_pins/fpga|pipe$sseg_out.
logic [7:0] FpgaPins_Fpga_PIPE_sseg_out_a0;

// For /fpga_pins/fpga|pipe$ui_in.
logic [7:0] FpgaPins_Fpga_PIPE_ui_in_a1;
logic [5:4] FpgaPins_Fpga_PIPE_ui_in_a2;

// For /fpga_pins/fpga|pipe$uo_out.
logic [7:0] FpgaPins_Fpga_PIPE_uo_out_a0,
            FpgaPins_Fpga_PIPE_uo_out_a1;

// For /fpga_pins/fpga|pipe/button$first_index.
logic [3:0] FpgaPins_Fpga_PIPE_Button_first_index_a1 [15:0];

// For /fpga_pins/fpga|pipe/button$found.
logic FpgaPins_Fpga_PIPE_Button_found_a1 [15:0];

// For /fpga_pins/fpga|pipe/keypad$Button.
logic [15:0] w_FpgaPins_Fpga_PIPE_Keypad_Button_a0 /* without recirculation for "when" condition */,
             FpgaPins_Fpga_PIPE_Keypad_Button_a0,
             FpgaPins_Fpga_PIPE_Keypad_Button_a1;

// For /fpga_pins/fpga|pipe/keypad$CheckButton.
logic [3:0] FpgaPins_Fpga_PIPE_Keypad_CheckButton_a0,
            FpgaPins_Fpga_PIPE_Keypad_CheckButton_a1;

// For /fpga_pins/fpga|pipe/keypad$Reported.
logic [15:0] FpgaPins_Fpga_PIPE_Keypad_Reported_a0,
             FpgaPins_Fpga_PIPE_Keypad_Reported_a1;

// For /fpga_pins/fpga|pipe/keypad$Seq.
logic [25:0] FpgaPins_Fpga_PIPE_Keypad_Seq_n1,
             FpgaPins_Fpga_PIPE_Keypad_Seq_a0;

// For /fpga_pins/fpga|pipe/keypad$check_mask.
logic [15:0] FpgaPins_Fpga_PIPE_Keypad_check_mask_a1;

// For /fpga_pins/fpga|pipe/keypad$digit_pressed.
logic [3:0] FpgaPins_Fpga_PIPE_Keypad_digit_pressed_a1,
            FpgaPins_Fpga_PIPE_Keypad_digit_pressed_a2;

// For /fpga_pins/fpga|pipe/keypad$digits.
logic [63:0] FpgaPins_Fpga_PIPE_Keypad_digits_a1;

// For /fpga_pins/fpga|pipe/keypad$report_button.
logic FpgaPins_Fpga_PIPE_Keypad_report_button_a1;

// For /fpga_pins/fpga|pipe/keypad$reset.
logic FpgaPins_Fpga_PIPE_Keypad_reset_a0,
      FpgaPins_Fpga_PIPE_Keypad_reset_a1;

// For /fpga_pins/fpga|pipe/keypad$row.
logic [3:0] FpgaPins_Fpga_PIPE_Keypad_row_a1;

// For /fpga_pins/fpga|pipe/keypad$row_sel.
logic [1:0] FpgaPins_Fpga_PIPE_Keypad_row_sel_a0,
            FpgaPins_Fpga_PIPE_Keypad_row_sel_a1;

// For /fpga_pins/fpga|pipe/keypad$sample.
logic FpgaPins_Fpga_PIPE_Keypad_sample_a0,
      FpgaPins_Fpga_PIPE_Keypad_sample_a1;

// For /fpga_pins/fpga|pipe/keypad$sample_or_reset.
logic FpgaPins_Fpga_PIPE_Keypad_sample_or_reset_a1;

// For /fpga_pins/fpga|pipe/keypad$sampling.
logic FpgaPins_Fpga_PIPE_Keypad_sampling_a0,
      FpgaPins_Fpga_PIPE_Keypad_sampling_a1;

// For /fpga_pins/fpga|pipe/keypad$uo_out_lower.
logic [3:0] FpgaPins_Fpga_PIPE_Keypad_uo_out_lower_a0;




   //
   // Scope: /fpga_pins
   //


      //
      // Scope: /fpga
      //


         //
         // Scope: |pipe
         //

            // Staging of $display_digit.
            always_ff @(posedge clk) FpgaPins_Fpga_PIPE_display_digit_a2[3:0] <= FpgaPins_Fpga_PIPE_display_digit_a1[3:0];

            // Staging of $reset.
            always_ff @(posedge clk) FpgaPins_Fpga_PIPE_reset_a0 <= FpgaPins_Fpga_PIPE_reset_n1;

            // Staging of $selected_mask.
            always_ff @(posedge clk) FpgaPins_Fpga_PIPE_selected_mask_a2[15:0] <= FpgaPins_Fpga_PIPE_selected_mask_a1[15:0];

            // Staging of $ui_in.
            always_ff @(posedge clk) FpgaPins_Fpga_PIPE_ui_in_a2[5:4] <= FpgaPins_Fpga_PIPE_ui_in_a1[5:4];

            // Staging of $uo_out.
            always_ff @(posedge clk) FpgaPins_Fpga_PIPE_uo_out_a1[7:0] <= FpgaPins_Fpga_PIPE_uo_out_a0[7:0];


            //
            // Scope: /keypad
            //

               // Update state with next state or hold.
               assign FpgaPins_Fpga_PIPE_Keypad_Button_a0 = !FpgaPins_Fpga_PIPE_Keypad_sample_or_reset_a1 ? FpgaPins_Fpga_PIPE_Keypad_Button_a1[15:0] : w_FpgaPins_Fpga_PIPE_Keypad_Button_a0;
               // Staging of $Button.
               always_ff @(posedge clk) FpgaPins_Fpga_PIPE_Keypad_Button_a1[15:0] <= FpgaPins_Fpga_PIPE_Keypad_Button_a0[15:0];

               // Staging of $CheckButton.
               always_ff @(posedge clk) FpgaPins_Fpga_PIPE_Keypad_CheckButton_a1[3:0] <= FpgaPins_Fpga_PIPE_Keypad_CheckButton_a0[3:0];

               // Staging of $Reported.
               always_ff @(posedge clk) FpgaPins_Fpga_PIPE_Keypad_Reported_a1[15:0] <= FpgaPins_Fpga_PIPE_Keypad_Reported_a0[15:0];

               // Staging of $Seq.
               always_ff @(posedge clk) FpgaPins_Fpga_PIPE_Keypad_Seq_a0[25:0] <= FpgaPins_Fpga_PIPE_Keypad_Seq_n1[25:0];

               // Staging of $digit_pressed.
               always_ff @(posedge clk) FpgaPins_Fpga_PIPE_Keypad_digit_pressed_a2[3:0] <= FpgaPins_Fpga_PIPE_Keypad_digit_pressed_a1[3:0];

               // Staging of $reset.
               always_ff @(posedge clk) FpgaPins_Fpga_PIPE_Keypad_reset_a1 <= FpgaPins_Fpga_PIPE_Keypad_reset_a0;

               // Staging of $row_sel.
               always_ff @(posedge clk) FpgaPins_Fpga_PIPE_Keypad_row_sel_a1[1:0] <= FpgaPins_Fpga_PIPE_Keypad_row_sel_a0[1:0];

               // Staging of $sample.
               always_ff @(posedge clk) FpgaPins_Fpga_PIPE_Keypad_sample_a1 <= FpgaPins_Fpga_PIPE_Keypad_sample_a0;

               // Staging of $sampling.
               always_ff @(posedge clk) FpgaPins_Fpga_PIPE_Keypad_sampling_a1 <= FpgaPins_Fpga_PIPE_Keypad_sampling_a0;









//
// Debug Signals
//

   if (1) begin : DEBUG_SIGS_GTKWAVE

      (* keep *) logic [7:0] \@0$slideswitch ;
      assign \@0$slideswitch = L0_slideswitch_a0;
      (* keep *) logic  \@0$sseg_decimal_point_n ;
      assign \@0$sseg_decimal_point_n = L0_sseg_decimal_point_n_a0;
      (* keep *) logic [7:0] \@0$sseg_digit_n ;
      assign \@0$sseg_digit_n = L0_sseg_digit_n_a0;
      (* keep *) logic [6:0] \@0$sseg_segment_n ;
      assign \@0$sseg_segment_n = L0_sseg_segment_n_a0;

      //
      // Scope: /digit[0:0]
      //
      for (digit = 0; digit <= 0; digit++) begin : \/digit 

         //
         // Scope: /leds[7:0]
         //
         for (leds = 0; leds <= 7; leds++) begin : \/leds 
            (* keep *) logic  \//@0$viz_lit ;
            assign \//@0$viz_lit = L1_Digit[digit].L2_Leds[leds].L2_viz_lit_a0;
         end
      end

      //
      // Scope: /fpga_pins
      //
      if (1) begin : \/fpga_pins 

         //
         // Scope: /fpga
         //
         if (1) begin : \/fpga 

            //
            // Scope: |pipe
            //
            if (1) begin : P_pipe
               (* keep *) logic  \///@0$debug ;
               assign \///@0$debug = FpgaPins_Fpga_PIPE_debug_a0;
               (* keep *) logic [3:0] \///@1$display_digit ;
               assign \///@1$display_digit = FpgaPins_Fpga_PIPE_display_digit_a1;
               (* keep *) logic [3:0] \///@1$first ;
               assign \///@1$first = FpgaPins_Fpga_PIPE_first_a1;
               (* keep *) logic  \///@-1$reset ;
               assign \///@-1$reset = FpgaPins_Fpga_PIPE_reset_n1;
               (* keep *) logic [6:0] \///@2$segments_n ;
               assign \///@2$segments_n = FpgaPins_Fpga_PIPE_segments_n_a2;
               (* keep *) logic [15:0] \///@1$selected_mask ;
               assign \///@1$selected_mask = FpgaPins_Fpga_PIPE_selected_mask_a1;
               (* keep *) logic [7:0] \///@0$sseg_out ;
               assign \///@0$sseg_out = FpgaPins_Fpga_PIPE_sseg_out_a0;
               (* keep *) logic [7:0] \///@1$ui_in ;
               assign \///@1$ui_in = FpgaPins_Fpga_PIPE_ui_in_a1;
               (* keep *) logic [7:0] \///@0$uo_out ;
               assign \///@0$uo_out = FpgaPins_Fpga_PIPE_uo_out_a0;

               //
               // Scope: /button[15:0]
               //
               for (button = 0; button <= 15; button++) begin : \/button 
                  (* keep *) logic [3:0] \////@1$first_index ;
                  assign \////@1$first_index = FpgaPins_Fpga_PIPE_Button_first_index_a1[button];
                  (* keep *) logic  \////@1$found ;
                  assign \////@1$found = FpgaPins_Fpga_PIPE_Button_found_a1[button];
                  (* keep *) logic  \////@1$its_me ;
                  assign \////@1$its_me = L1_FpgaPins_Fpga_PIPE_Button[button].L1_its_me_a1;

                  //
                  // Scope: /prev
                  //
                  if (1) begin : \/prev 
                     (* keep *) logic [3:0] \/////@1$first_index ;
                     assign \/////@1$first_index = L1_FpgaPins_Fpga_PIPE_Button[button].L1_Prev_first_index_a1;
                     (* keep *) logic  \/////@1$found ;
                     assign \/////@1$found = L1_FpgaPins_Fpga_PIPE_Button[button].L1_Prev_found_a1;
                  end
               end

               //
               // Scope: /keypad
               //
               if (1) begin : \/keypad 
                  (* keep *) logic [15:0] \////@0$Button ;
                  assign \////@0$Button = FpgaPins_Fpga_PIPE_Keypad_Button_a0;
                  (* keep *) logic [3:0] \////@0$CheckButton ;
                  assign \////@0$CheckButton = FpgaPins_Fpga_PIPE_Keypad_CheckButton_a0;
                  (* keep *) logic [15:0] \////@0$Reported ;
                  assign \////@0$Reported = FpgaPins_Fpga_PIPE_Keypad_Reported_a0;
                  (* keep *) logic [25:0] \////@-1$Seq ;
                  assign \////@-1$Seq = FpgaPins_Fpga_PIPE_Keypad_Seq_n1;
                  (* keep *) logic [15:0] \////@1$check_mask ;
                  assign \////@1$check_mask = FpgaPins_Fpga_PIPE_Keypad_check_mask_a1;
                  (* keep *) logic [3:0] \////@1$digit_pressed ;
                  assign \////@1$digit_pressed = FpgaPins_Fpga_PIPE_Keypad_digit_pressed_a1;
                  (* keep *) logic [63:0] \////@1$digits ;
                  assign \////@1$digits = FpgaPins_Fpga_PIPE_Keypad_digits_a1;
                  (* keep *) logic  \////@1$report_button ;
                  assign \////@1$report_button = FpgaPins_Fpga_PIPE_Keypad_report_button_a1;
                  (* keep *) logic  \////@0$reset ;
                  assign \////@0$reset = FpgaPins_Fpga_PIPE_Keypad_reset_a0;
                  (* keep *) logic [3:0] \////?$sample@1$row ;
                  assign \////?$sample@1$row = FpgaPins_Fpga_PIPE_Keypad_row_a1;
                  (* keep *) logic [1:0] \////?$sampling@0$row_sel ;
                  assign \////?$sampling@0$row_sel = FpgaPins_Fpga_PIPE_Keypad_row_sel_a0;
                  (* keep *) logic  \////@0$sample ;
                  assign \////@0$sample = FpgaPins_Fpga_PIPE_Keypad_sample_a0;
                  (* keep *) logic  \////@1$sample_or_reset ;
                  assign \////@1$sample_or_reset = FpgaPins_Fpga_PIPE_Keypad_sample_or_reset_a1;
                  (* keep *) logic  \////@0$sampling ;
                  assign \////@0$sampling = FpgaPins_Fpga_PIPE_Keypad_sampling_a0;
                  (* keep *) logic [3:0] \////@0$uo_out_lower ;
                  assign \////@0$uo_out_lower = FpgaPins_Fpga_PIPE_Keypad_uo_out_lower_a0;
               end
            end
         end
      end

      //
      // Scope: /switch[7:0]
      //
      for (switch = 0; switch <= 7; switch++) begin : \/switch 
         (* keep *) logic  \/@0$viz_switch ;
         assign \/@0$viz_switch = L1_Switch[switch].L1_viz_switch_a0;
      end


   end

// ---------- Generated Code Ends ----------
//_\TLV
   /* verilator lint_off UNOPTFLAT */
   // Connect Tiny Tapeout I/Os to Virtual FPGA Lab.
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlvlib/tinytapeoutlib.tlv 76   // Instantiated from top.tlv, 315 as: m5+tt_connections()
      assign L0_slideswitch_a0[7:0] = ui_in;
      assign L0_sseg_segment_n_a0[6:0] = ~ uo_out[6:0];
      assign L0_sseg_decimal_point_n_a0 = ~ uo_out[7];
      assign L0_sseg_digit_n_a0[7:0] = 8'b11111110;
   //_\end_source

   // Instantiate the Virtual FPGA Lab.
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 307   // Instantiated from top.tlv, 318 as: m5+board(/top, /fpga, 7, $, , my_design)
      
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 355   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 309 as: m4+thanks(m5__l(309)m5_eval(m5_get(BOARD_THANKS_ARGS)))
         //_/thanks
            
      //_\end_source
      
   
      // Board VIZ.
   
      // Board Image.
      
      //_/fpga_pins
         
         //_/fpga
            //_\source top.tlv 186   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 340 as: m4+my_design.
               //_|pipe
                  //_@-1
                     assign FpgaPins_Fpga_PIPE_reset_n1 = reset || ui_in[7];
                  //_@0
                     assign FpgaPins_Fpga_PIPE_debug_a0 = | ui_in[6:4];
                  //_\source top.tlv 64   // Instantiated from top.tlv, 192 as: m5+PmodKYPD(|pipe, /keypad, @0, $uo_out_lower[3:0], $ui_in[3:0], 1'b1, $sseg_out[3:0], $debug, ⌈left: 40, top: 80, width: 20, height: 20⌉)
                     //_/keypad
                        // Pipelined logic to poll the keypad.
                        // Determine a fixed sequence of polling that will:
                        //   - Drive a keypad row to read, and hold it for the duration of the "sample window".
                        //   - Receive row data (1 bit per column) back from keypad, reading it at the last cycle of the sample window.
                        //   - Update array of button states ($Button).
                        // Independently, scan button states one button at a time, reporting new button presses and remembering those
                        // that have been reported while still pressed.
                        //_@0
                           assign FpgaPins_Fpga_PIPE_Keypad_reset_a0 = FpgaPins_Fpga_PIPE_reset_a0;
                  
                           // Run fast in Makerchip simulation.
                           
                           
                           
                           
                  
                           // Sample once every 2^24 cycles.
                           // Sample input 2^23 cycles after driving input.
                           // When not driving outputs, drive $sseg_out[3:0].
                           // Determine when to update column keypad input
                           // and when to sample keypad output.
                           assign FpgaPins_Fpga_PIPE_Keypad_Seq_n1[25:0] =
                              FpgaPins_Fpga_PIPE_Keypad_reset_a0 ? 0 : FpgaPins_Fpga_PIPE_Keypad_Seq_a0 + 1;
                           assign FpgaPins_Fpga_PIPE_Keypad_sampling_a0 = FpgaPins_Fpga_PIPE_debug_a0 ? FpgaPins_Fpga_PIPE_Keypad_Seq_a0[23:         23] == 1'b0 :
                                                      FpgaPins_Fpga_PIPE_Keypad_Seq_a0[16:15] == 2'b0;
                           assign FpgaPins_Fpga_PIPE_Keypad_sample_a0 = FpgaPins_Fpga_PIPE_Keypad_sampling_a0 &&
                                     FpgaPins_Fpga_PIPE_debug_a0 ? FpgaPins_Fpga_PIPE_Keypad_Seq_a0[22:0] == ~          23'b0 :
                                                    FpgaPins_Fpga_PIPE_Keypad_Seq_a0[14:0] == ~ 15'b0;
                  
                           // Update column keypad input.
                           //$row_sel[1:0] = 2'h1;  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                           //_?$sampling
                              assign FpgaPins_Fpga_PIPE_Keypad_row_sel_a0[1:0] = FpgaPins_Fpga_PIPE_debug_a0 ? FpgaPins_Fpga_PIPE_Keypad_Seq_a0[25:         24] :
                                                             FpgaPins_Fpga_PIPE_Keypad_Seq_a0[18:17];
                           // Connect the Pmod to uo_out[3:0] and ui_in[3:0].
                           assign FpgaPins_Fpga_PIPE_Keypad_uo_out_lower_a0[3:0] = FpgaPins_Fpga_PIPE_Keypad_sampling_a0 ? 4'b1 << FpgaPins_Fpga_PIPE_Keypad_row_sel_a0 : FpgaPins_Fpga_PIPE_sseg_out_a0[3:0];
                           //$_pmod_in = 4'b1 << $row_sel;
                        //_@1
                  
                           //_?$sample
                              assign FpgaPins_Fpga_PIPE_Keypad_row_a1[3:0] = FpgaPins_Fpga_PIPE_ui_in_a1[3:0];  // A row of data from keypad, indexed by column.
                           assign FpgaPins_Fpga_PIPE_Keypad_sample_or_reset_a1 = FpgaPins_Fpga_PIPE_Keypad_sample_a1 || FpgaPins_Fpga_PIPE_Keypad_reset_a1;
                           //_?$sample_or_reset
                              // Update button states for the selected column.
                              assign w_FpgaPins_Fpga_PIPE_Keypad_Button_a0[15:0] =
                                 FpgaPins_Fpga_PIPE_Keypad_reset_a1 ? 16'b0 :
                                          {FpgaPins_Fpga_PIPE_Keypad_row_sel_a1 == 2'h3 ? FpgaPins_Fpga_PIPE_Keypad_row_a1 : FpgaPins_Fpga_PIPE_Keypad_Button_a1[15:12],
                                           FpgaPins_Fpga_PIPE_Keypad_row_sel_a1 == 2'h2 ? FpgaPins_Fpga_PIPE_Keypad_row_a1 : FpgaPins_Fpga_PIPE_Keypad_Button_a1[11:8],
                                           FpgaPins_Fpga_PIPE_Keypad_row_sel_a1 == 2'h1 ? FpgaPins_Fpga_PIPE_Keypad_row_a1 : FpgaPins_Fpga_PIPE_Keypad_Button_a1[7:4],
                                           FpgaPins_Fpga_PIPE_Keypad_row_sel_a1 == 2'h0 ? FpgaPins_Fpga_PIPE_Keypad_row_a1 : FpgaPins_Fpga_PIPE_Keypad_Button_a1[3:0]};
                  
                  
                  
                        //
                        // Report pressed buttons (only once)
                        //
                  
                        // Check one button each cycle.
                        // Use the same pipeline as polling, aligned so that $Button, $Reported, and $CheckButton update
                        // at the same stage.
                        //_@1
                           // Pressed buttons that have been reported (to avoid reporting twice).
                           assign FpgaPins_Fpga_PIPE_Keypad_Reported_a0[15:0] =
                              FpgaPins_Fpga_PIPE_Keypad_reset_a1
                                 ? 16'b0 :
                              // default: button is pressed and not previously or just reported.
                                   FpgaPins_Fpga_PIPE_Keypad_Button_a1 & (FpgaPins_Fpga_PIPE_Keypad_Reported_a1 | (FpgaPins_Fpga_PIPE_Keypad_check_mask_a1 & {16{FpgaPins_Fpga_PIPE_Keypad_report_button_a1}}));
                  
                           // Can only reset to zero on TT3 FPGA demo board, so have to start with encoded count.
                           assign FpgaPins_Fpga_PIPE_Keypad_CheckButton_a0[3:0] =
                              FpgaPins_Fpga_PIPE_Keypad_reset_a1
                                 ? 4'h0 :
                              1'b1
                                 ? FpgaPins_Fpga_PIPE_Keypad_CheckButton_a1 + 4'h1 :
                              // default
                                   FpgaPins_Fpga_PIPE_Keypad_CheckButton_a1;
                           assign FpgaPins_Fpga_PIPE_Keypad_check_mask_a1[15:0] = 16'b1 << FpgaPins_Fpga_PIPE_Keypad_CheckButton_a1;
                           // Is the check button pressed and not reported.
                           assign FpgaPins_Fpga_PIPE_Keypad_report_button_a1 = 1'b1 && | (FpgaPins_Fpga_PIPE_Keypad_check_mask_a1 & FpgaPins_Fpga_PIPE_Keypad_Button_a1 & ~ FpgaPins_Fpga_PIPE_Keypad_Reported_a1);
                  
                           // Report it.
                           assign FpgaPins_Fpga_PIPE_Keypad_digits_a1[63:0] = 64'h123A_456B_789C_0FED;
                           //$digits[63:0] = 64'h1470_258F_369E_ABCD;
                           assign FpgaPins_Fpga_PIPE_Keypad_digit_pressed_a1[3:0] = FpgaPins_Fpga_PIPE_Keypad_reset_a1 ? 4'hF : FpgaPins_Fpga_PIPE_Keypad_report_button_a1 ? FpgaPins_Fpga_PIPE_Keypad_digits_a1[(FpgaPins_Fpga_PIPE_Keypad_CheckButton_a1 * 4) +: 4] : FpgaPins_Fpga_PIPE_Keypad_digit_pressed_a2[3:0];
                  
                           for (row = 0; row <= 3; row++) begin : L1_FpgaPins_Fpga_PIPE_Keypad_Row //_/row
                              
                              for (col = 0; col <= 3; col++) begin : L2_Col //_/col
                                 
                              end
                           end
                  
                           
                  //_\end_source
            
                  //_@1
                     // Several debug modes are supported.
                     // Use 3'b000 for normal operation.
                     // ui_in[4]: 0: output single button as digit; 1: output button mask
                     // ui_in[5]: if as mask: 0: buttons 0-15; 1: buttons 16-31
                     //           if as button: 0: normal operation; 1: debug output ($Buttons or $Reported)
                     // ui_in[6]: 0: output $Buttons; 1: output $Reported
                     assign FpgaPins_Fpga_PIPE_selected_mask_a1[15:0] = FpgaPins_Fpga_PIPE_ui_in_a1[6] ? FpgaPins_Fpga_PIPE_Keypad_Reported_a1 : FpgaPins_Fpga_PIPE_Keypad_Button_a1;
            
                     // Find $first button in $selected_mask.
                     /* verilator lint_off UNOPTFLAT */
                     for (button = 0; button <= 15; button++) begin : L1_FpgaPins_Fpga_PIPE_Button //_/button

                        // For $its_me.
                        logic L1_its_me_a1;

                        // For /prev$first_index.
                        logic [3:0] L1_Prev_first_index_a1;

                        // For /prev$found.
                        logic L1_Prev_found_a1;

                        //_/prev
                           assign {L1_Prev_first_index_a1[3:0], L1_Prev_found_a1} = {FpgaPins_Fpga_PIPE_Button_first_index_a1[button - 1], FpgaPins_Fpga_PIPE_Button_found_a1[button - 1]};
                        assign L1_its_me_a1 = (button == 0 || ! L1_Prev_found_a1) && FpgaPins_Fpga_PIPE_selected_mask_a1[button];
                        assign FpgaPins_Fpga_PIPE_Button_found_a1[button] = (button > 0 && L1_Prev_found_a1) || L1_its_me_a1;
                        assign FpgaPins_Fpga_PIPE_Button_first_index_a1[button][3:0] = L1_its_me_a1 ? button : button == 0 ? 4'b0 : L1_Prev_first_index_a1;
                     end
                     assign FpgaPins_Fpga_PIPE_first_a1[3:0] = FpgaPins_Fpga_PIPE_Button_first_index_a1[15];
                     /* verilator lint_on UNOPTFLAT */
            
                     assign FpgaPins_Fpga_PIPE_display_digit_a1[3:0] =
                        FpgaPins_Fpga_PIPE_ui_in_a1[5] ? FpgaPins_Fpga_PIPE_Keypad_digits_a1[(FpgaPins_Fpga_PIPE_first_a1 * 4) +: 4] :
                                    FpgaPins_Fpga_PIPE_Keypad_digit_pressed_a1;
                  //_@2
                     //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 844   // Instantiated from top.tlv, 218 as: m5+sseg_decoder($segments_n, $display_digit)
                        assign FpgaPins_Fpga_PIPE_segments_n_a2[6:0] =
                             (FpgaPins_Fpga_PIPE_display_digit_a2 == 0) ? 7'b1000000 : // '0'
                             (FpgaPins_Fpga_PIPE_display_digit_a2 == 1) ? 7'b1111001 : // '1'
                             (FpgaPins_Fpga_PIPE_display_digit_a2 == 2) ? 7'b0100100 : // '2'
                             (FpgaPins_Fpga_PIPE_display_digit_a2 == 3) ? 7'b0110000 : // '3'
                             (FpgaPins_Fpga_PIPE_display_digit_a2 == 4) ? 7'b0011001 : // '4'
                             (FpgaPins_Fpga_PIPE_display_digit_a2 == 5) ? 7'b0010010 : // '5'
                             (FpgaPins_Fpga_PIPE_display_digit_a2 == 6) ? 7'b0000010 : // '6'
                             (FpgaPins_Fpga_PIPE_display_digit_a2 == 7) ? 7'b1111000 : // '7'
                             (FpgaPins_Fpga_PIPE_display_digit_a2 == 8) ? 7'b0000000 : // '8'
                             (FpgaPins_Fpga_PIPE_display_digit_a2 == 9) ? 7'b0010000 : // '9'
                             (FpgaPins_Fpga_PIPE_display_digit_a2 == 10) ? 7'b0001000 : // 'a'
                             (FpgaPins_Fpga_PIPE_display_digit_a2 == 11) ? 7'b0000011 : // 'b'
                             (FpgaPins_Fpga_PIPE_display_digit_a2 == 12) ? 7'b1000110 : // 'c'
                             (FpgaPins_Fpga_PIPE_display_digit_a2 == 13) ? 7'b0100001 : // 'd'
                             (FpgaPins_Fpga_PIPE_display_digit_a2 == 14) ? 7'b0000110 : // 'e'
                             (FpgaPins_Fpga_PIPE_display_digit_a2 == 15) ? 7'b0001110 : // 'f'
                             7'b1111111 ;                // 'nothing'
                     //_\end_source
                  // Re-align output for 7-seg to combine with keypad input.
                     assign FpgaPins_Fpga_PIPE_sseg_out_a0[7:0] = FpgaPins_Fpga_PIPE_ui_in_a2[4] ? {FpgaPins_Fpga_PIPE_ui_in_a2[5] ? FpgaPins_Fpga_PIPE_selected_mask_a2[15:8] : FpgaPins_Fpga_PIPE_selected_mask_a2[7:0]} : {1'b0, ~ FpgaPins_Fpga_PIPE_segments_n_a2};
                  //_@0
                     assign FpgaPins_Fpga_PIPE_uo_out_a0[7:0] = {FpgaPins_Fpga_PIPE_sseg_out_a0[7:4], FpgaPins_Fpga_PIPE_Keypad_uo_out_lower_a0};
                  //_@1
                     assign uo_out = FpgaPins_Fpga_PIPE_uo_out_a1;
                     // Output goes to PmodKYPD, and PmodKYPD responds on *ui_in (with unknown delay, absorbed by sample window).
                     assign FpgaPins_Fpga_PIPE_ui_in_a1[7:0] = ui_in;
                     
            
               // Connect Tiny Tapeout outputs. Note that uio_ outputs are not available in the Tiny-Tapeout-3-based FPGA boards.
               
               
            //_\end_source
   
      // LEDs.
      
   
      // 7-Segment
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 395   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 346 as: m4+fpga_sseg.
         for (digit = 0; digit <= 0; digit++) begin : L1_Digit //_/digit
            
            for (leds = 0; leds <= 7; leds++) begin : L2_Leds //_/leds

               // For $viz_lit.
               logic L2_viz_lit_a0;

               assign L2_viz_lit_a0 = (! L0_sseg_digit_n_a0[digit]) && ! ((leds == 7) ? L0_sseg_decimal_point_n_a0 : L0_sseg_segment_n_a0[leds % 7]);
               
            end
         end
      //_\end_source
   
      // slideswitches
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 454   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 349 as: m4+fpga_switch.
         for (switch = 0; switch <= 7; switch++) begin : L1_Switch //_/switch

            // For $viz_switch.
            logic L1_viz_switch_a0;

            assign L1_viz_switch_a0 = L0_slideswitch_a0[switch];
            
         end
      //_\end_source
   
      // pushbuttons
      
   //_\end_source
   // Label the switch inputs [0..7] (1..8 on the physical switch panel) (top-to-bottom).
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlvlib/tinytapeoutlib.tlv 82   // Instantiated from top.tlv, 320 as: m5+tt_input_labels_viz(⌈"KYPD row0", "KYPD row1", "KYPD row2", "KYPD row3", "D:Mask", "D:High/Dbg", "D:Reported", "Reset"⌉)
      for (input_label = 0; input_label <= 7; input_label++) begin : L1_InputLabel //_/input_label
         
      end
   //_\end_source

//_\SV
endmodule


// Undefine macros defined by SandPiper.
`undef BOGUS_USE
