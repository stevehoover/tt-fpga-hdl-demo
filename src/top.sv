`line 2 "top.tlv" 0
`line 50 "top.tlv" 1

//_\SV
   // Include Tiny Tapeout Lab.
   // Included URL: "https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlv_lib/tiny_tapeout_lib.tlv"// Included URL: "https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlv_lib/fpga_includes.tlv"

   // Default Makerchip TL-Verilog Code Template
   // Included hidden file.// Included hidden file.


// ================================================
// A simple Makerchip Verilog test bench driving random stimulus.
// Modify the module contents to your needs.
// ================================================

module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
   // Tiny tapeout I/O signals.
   logic [7:0] ui_in, uo_out;
   
   
   
   assign ui_in = 8'b0;
   
   logic ena = 1'b0;
   logic rst_n = ! reset;

   
   
      
         
      
         
      
         
      
         
      
         
   
   

   // Instantiate the Tiny Tapeout module.
   tt_um_template tt(.*);

   assign passed = uo_out[0];
   assign failed = uo_out[1];
endmodule


// Provide a wrapper module to debounce input signals if requested.

// The above macro expands to multiple lines. We enter a new \SV block to reset line tracking.
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
   logic passed, failed;  // Connected to uo_out[0] and uo_out[1] respectively, which connect to Makerchip passed/failed.

   wire reset = ! rst_n;

`include "top_gen.sv" //_\TLV
   /* verilator lint_off UNOPTFLAT */
   // Connect Tiny Tapeout I/Os to Virtual FPGA Lab.
   `line 77 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlvlib/tinytapeoutlib.tlv" 1
      assign L0_slideswitch_a0[7:0] = ui_in;
      assign L0_sseg_segment_n_a0[6:0] = ~ uo_out[6:0];
      assign L0_sseg_decimal_point_n_a0 = ~ uo_out[7];
      assign L0_sseg_digit_n_a0[7:0] = 8'b11111110;
   //_\end_source
   `line 129 "top.tlv" 2

   // Instantiate the Virtual FPGA Lab.
   `line 308 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv" 1
      
      `line 356 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv" 1
         //_/thanks
            /* Viz omitted here */























      //_\end_source
      `line 310 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv" 2
      
   
      // Board VIZ.
   
      // Board Image.
      /* Viz omitted here */



















      //_/fpga_pins
         /* Viz omitted here */


         //_/fpga
            `line 104 "/raw.githubusercontent.com/stevehoover/immutable/master/MESTcourse/solutions.tlv" 1
               `line 206 "/raw.githubusercontent.com/stevehoover/immutable/master/MESTcourse/solutions.tlv" 1
                  `line 1 "M5-FN-riscv_gen" 1
                     
                  //_\end_source
                  `line 207 "/raw.githubusercontent.com/stevehoover/immutable/master/MESTcourse/solutions.tlv" 2
                  `line 1 "M5-FN-riscv_sum_prog" 1
                     // Inst #0: ADD x10, x0, x0
                     // Inst #1: ADD x14, x10, x0
                     // Inst #2: ADDI x12, x10, 10
                     // Inst #3: ADD x13, x10, x0
                     // Inst #4: ADD x14, x13, x14
                     // Inst #5: ADDI x13, x13, 1
                     // Inst #6: BLT x13, x12, loop
                     // Inst #7: ADD x10, x14, x0
                     // Inst #8: SW x0, x10, 4
                     // Inst #9: LW x15, x0, 4
                     
                  //_\end_source
                  `line 208 "/raw.githubusercontent.com/stevehoover/immutable/master/MESTcourse/solutions.tlv" 2
                  
               
                  //_|cpu
                     //_@0
                        assign FpgaPins_Fpga_CPU_reset_a0 = reset;
               
               
                     // ============================================================================================================
                     // Solutions: Cut this section to provide the shell.
               
                     
                     
               
               
                     // Define the logic that will be included, based on lab ID.
                     // Lab m5_get(LabId): Next PC
                     
                     
                     
                     // Lab m5_get(LabId): Fetch (part 1)
                     
                     
                     
                     // Lab m5_get(LabId): Fetch (part 2)
                     
                     
               
                     // Lab m5_get(LabId): Instruction Types Decode and Immediate Decode
                     //_@1
                        // Types
                        assign FpgaPins_Fpga_CPU_is_i_instr_a1 = FpgaPins_Fpga_CPU_instr_a1[6:3] == 4'b0000 ||
                                      FpgaPins_Fpga_CPU_instr_a1[6:2] == 5'b00100 ||
                                      FpgaPins_Fpga_CPU_instr_a1[6:2] == 5'b00110 ||
                                      FpgaPins_Fpga_CPU_instr_a1[6:2] == 5'b11001 ;
               
                        assign FpgaPins_Fpga_CPU_is_r_instr_a1 = FpgaPins_Fpga_CPU_instr_a1[6:2] == 5'b01011 ||
                                      FpgaPins_Fpga_CPU_instr_a1[6:2] == 5'b01100 ||
                                      FpgaPins_Fpga_CPU_instr_a1[6:2] == 5'b01110 ||
                                      FpgaPins_Fpga_CPU_instr_a1[6:2] == 5'b10100 ;
               
                        assign FpgaPins_Fpga_CPU_is_s_instr_a1 = FpgaPins_Fpga_CPU_instr_a1[6:3] == 4'b0100;
               
                        assign FpgaPins_Fpga_CPU_is_b_instr_a1 = FpgaPins_Fpga_CPU_instr_a1[6:2] == 5'b11000;
               
                        assign FpgaPins_Fpga_CPU_is_j_instr_a1 = FpgaPins_Fpga_CPU_instr_a1[6:2] == 5'b11011;
               
                        assign FpgaPins_Fpga_CPU_is_u_instr_a1 = FpgaPins_Fpga_CPU_instr_a1[6:2] == 5'b00101 ||
                                      FpgaPins_Fpga_CPU_instr_a1[6:2] == 5'b01101;
                     
               
                     // Lab m5_get(LabId): Instruction Immediate Value Decoded
               
                        // Immediate
                        assign FpgaPins_Fpga_CPU_imm_a1[31:0]  =  FpgaPins_Fpga_CPU_is_i_instr_a1 ? {{21{FpgaPins_Fpga_CPU_instr_a1[31]}}, FpgaPins_Fpga_CPU_instr_a1[30:20]} :
                                       FpgaPins_Fpga_CPU_is_s_instr_a1 ? {{21{FpgaPins_Fpga_CPU_instr_a1[31]}}, FpgaPins_Fpga_CPU_instr_a1[30:25], FpgaPins_Fpga_CPU_instr_a1[11:7]} :
                                       FpgaPins_Fpga_CPU_is_b_instr_a1 ? {{20{FpgaPins_Fpga_CPU_instr_a1[31]}}, FpgaPins_Fpga_CPU_instr_a1[7], FpgaPins_Fpga_CPU_instr_a1[30:25], FpgaPins_Fpga_CPU_instr_a1[11:8], 1'b0} :
                                       FpgaPins_Fpga_CPU_is_u_instr_a1 ? {FpgaPins_Fpga_CPU_instr_a1[31:12], 12'b0} :
                                       FpgaPins_Fpga_CPU_is_j_instr_a1 ? {{12{FpgaPins_Fpga_CPU_instr_a1[31]}}, FpgaPins_Fpga_CPU_instr_a1[19:12], FpgaPins_Fpga_CPU_instr_a1[20], FpgaPins_Fpga_CPU_instr_a1[30:21], 1'b0} :
                                                      32'b0 ;
                     
               
                     
                     // Lab m5_get(LabId): Instruction Immediate Valid
                     
                     
               
                     // Lab m5_get(LabId): Instruction Field Decode
                     
                     //_@1
                        assign FpgaPins_Fpga_CPU_funct7_valid_a1 = FpgaPins_Fpga_CPU_is_r_instr_a1;
                        assign FpgaPins_Fpga_CPU_funct3_valid_a1 = FpgaPins_Fpga_CPU_is_r_instr_a1 || FpgaPins_Fpga_CPU_is_i_instr_a1 || FpgaPins_Fpga_CPU_is_s_instr_a1 || FpgaPins_Fpga_CPU_is_b_instr_a1;
                        assign FpgaPins_Fpga_CPU_rs1_valid_a1    = FpgaPins_Fpga_CPU_is_r_instr_a1 || FpgaPins_Fpga_CPU_is_i_instr_a1 || FpgaPins_Fpga_CPU_is_s_instr_a1 || FpgaPins_Fpga_CPU_is_b_instr_a1;
                        assign FpgaPins_Fpga_CPU_rs2_valid_a1    = FpgaPins_Fpga_CPU_is_r_instr_a1 || FpgaPins_Fpga_CPU_is_s_instr_a1 || FpgaPins_Fpga_CPU_is_b_instr_a1 ;
                        assign FpgaPins_Fpga_CPU_rd_valid_a1     = FpgaPins_Fpga_CPU_is_r_instr_a1 || FpgaPins_Fpga_CPU_is_i_instr_a1 || FpgaPins_Fpga_CPU_is_u_instr_a1 || FpgaPins_Fpga_CPU_is_j_instr_a1;
                     
               
                     
                     // Lab m5_get(LabId): Instruction Decode
                     
                     
                     
               
                     
                     
                     
                     // Lab m5_get(LabId): Register File Read
                     
                     
                     
                     
                     
                     
               
                     
                     
                     // Lab m5_get(LabId): Register File Read (part 2)
                     
                     
               
                     
                     // Lab m5_get(LabId): Arithmetic Logic Unit
                     
                     
                     
               
                     // Lab m5_get(LabId): Register File Write
                     
                     
               
                     
                     // Lab m5_get(LabId): Branches (part 1)
                     
                     
                     
               
                     
                     // Lab m5_get(LabId): Branches (part 2)
                     
                     
                     
                     
               
                     
                     // Lab m5_get(LabId): Testbench
                     
                     
               
                     
                     // Lab m5_get(LabId): 3-Cycle Valid
                     
                     
               
                     // Lab m5_get(LabId): 3-Cycle RISC-V (part 1)
                     
                     
                     //_@1
                        assign FpgaPins_Fpga_CPU_inc_pc_a1[31:0] = FpgaPins_Fpga_CPU_pc_a1 + 32'd4;
                     //_@3
                        assign FpgaPins_Fpga_CPU_valid_taken_br_a3 = FpgaPins_Fpga_CPU_valid_a3 && FpgaPins_Fpga_CPU_taken_br_a3;
                     
               
                     // Lab m5_get(LabId): 3-Cycle RISC-V (part 2)
                     
                     
                     
                     
                     
                     
               
                     // Lab m5_get(LabId): Register File Bypass
                     
                     
               
                     // Lab m5_get(LabId): Determining Branch Shadow
                     
                     
                     
               
                     // Lab m5_get(LabId): Complete Instruction Decode
                     
                     //_@1
                        assign FpgaPins_Fpga_CPU_is_lui_a1     =  FpgaPins_Fpga_CPU_dec_bits_a1[6:0] ==        7'b0110111 ;
                        assign FpgaPins_Fpga_CPU_is_auipc_a1   =  FpgaPins_Fpga_CPU_dec_bits_a1[6:0] ==        7'b0010111 ;
                        assign FpgaPins_Fpga_CPU_is_jal_a1     =  FpgaPins_Fpga_CPU_dec_bits_a1[6:0] ==        7'b1101111 ;
                        assign FpgaPins_Fpga_CPU_is_jalr_a1    =  FpgaPins_Fpga_CPU_dec_bits_a1[9:0] ==   10'b000_1100111 ;
               
                        assign FpgaPins_Fpga_CPU_is_load_a1    =  FpgaPins_Fpga_CPU_opcode_a1        ==        7'b0000011 ;
               
                        //$is_sb      =  $dec_bits[9:0] ==   10'b000_0100011 ;
                        //$is_sh      =  $dec_bits[9:0] ==   10'b001_0100011 ;
                        //$is_sw      =  $dec_bits[9:0] ==   10'b010_0100011 ;
               
                        assign FpgaPins_Fpga_CPU_is_slti_a1    =  FpgaPins_Fpga_CPU_dec_bits_a1[9:0] ==   10'b010_0010011 ;
                        assign FpgaPins_Fpga_CPU_is_sltiu_a1   =  FpgaPins_Fpga_CPU_dec_bits_a1[9:0] ==   10'b011_0010011 ;
                        assign FpgaPins_Fpga_CPU_is_xori_a1    =  FpgaPins_Fpga_CPU_dec_bits_a1[9:0] ==   10'b100_0010011 ;
                        assign FpgaPins_Fpga_CPU_is_ori_a1     =  FpgaPins_Fpga_CPU_dec_bits_a1[9:0] ==   10'b110_0010011 ;
                        assign FpgaPins_Fpga_CPU_is_andi_a1    =  FpgaPins_Fpga_CPU_dec_bits_a1[9:0] ==   10'b111_0010011 ;
                        assign FpgaPins_Fpga_CPU_is_slli_a1    =  FpgaPins_Fpga_CPU_dec_bits_a1      == 11'b0_001_0010011 ;
                        assign FpgaPins_Fpga_CPU_is_srli_a1    =  FpgaPins_Fpga_CPU_dec_bits_a1      == 11'b0_101_0010011 ;
                        assign FpgaPins_Fpga_CPU_is_srai_a1    =  FpgaPins_Fpga_CPU_dec_bits_a1      == 11'b1_101_0010011 ;
               
                        assign FpgaPins_Fpga_CPU_is_sub_a1     =  FpgaPins_Fpga_CPU_dec_bits_a1      == 11'b1_000_0110011 ;
                        assign FpgaPins_Fpga_CPU_is_sll_a1     =  FpgaPins_Fpga_CPU_dec_bits_a1      == 11'b0_001_0110011 ;
                        assign FpgaPins_Fpga_CPU_is_slt_a1     =  FpgaPins_Fpga_CPU_dec_bits_a1      == 11'b0_010_0110011 ;
                        assign FpgaPins_Fpga_CPU_is_sltu_a1    =  FpgaPins_Fpga_CPU_dec_bits_a1      == 11'b0_011_0110011 ;
                        assign FpgaPins_Fpga_CPU_is_xor_a1     =  FpgaPins_Fpga_CPU_dec_bits_a1      == 11'b0_100_0110011 ;
                        assign FpgaPins_Fpga_CPU_is_srl_a1     =  FpgaPins_Fpga_CPU_dec_bits_a1      == 11'b0_101_0110011 ;
                        assign FpgaPins_Fpga_CPU_is_sra_a1     =  FpgaPins_Fpga_CPU_dec_bits_a1      == 11'b1_101_0110011 ;
                        assign FpgaPins_Fpga_CPU_is_or_a1      =  FpgaPins_Fpga_CPU_dec_bits_a1      == 11'b0_110_0110011 ;
                        assign FpgaPins_Fpga_CPU_is_and_a1     =  FpgaPins_Fpga_CPU_dec_bits_a1      == 11'b0_111_0110011 ;
               
                     
               
                     // Lab m5_get(LabId): Complete ALU
                     
                     //_@3
                        /* verilator lint_off WIDTH */
                        assign FpgaPins_Fpga_CPU_sltu_rslt_a3[31:0]      =   FpgaPins_Fpga_CPU_src1_value_a3 < FpgaPins_Fpga_CPU_src2_value_a3 ;
                        assign FpgaPins_Fpga_CPU_sltiu_rslt_a3[31:0]     =   FpgaPins_Fpga_CPU_src1_value_a3 < FpgaPins_Fpga_CPU_imm_a3;
                        /* verilator lint_on WIDTH */
                     
               
                     // Lab m5_get(LabId): Redirect Loads
                     
                     
                     //_@3
                        assign FpgaPins_Fpga_CPU_valid_load_a3 = FpgaPins_Fpga_CPU_valid_a3 && FpgaPins_Fpga_CPU_is_load_a3;
                     
               
                     // Lab m5_get(LabId): Load Data
                     
                     
                     
               
                     // Lab m5_get(LabId): Data Memory
                     //_@4
                        assign FpgaPins_Fpga_CPU_dmem_wr_en_a4          = FpgaPins_Fpga_CPU_is_s_instr_a4 && FpgaPins_Fpga_CPU_valid_a4;
                        assign FpgaPins_Fpga_CPU_dmem_wr_data_a4[31:0]  = FpgaPins_Fpga_CPU_src2_value_a4;
                        assign FpgaPins_Fpga_CPU_dmem_rd_en_a4          = FpgaPins_Fpga_CPU_is_load_a4;
                        assign FpgaPins_Fpga_CPU_dmem_addr_a4[2:0]      = FpgaPins_Fpga_CPU_result_a4[4:2];
               
                     //_@5
                        assign FpgaPins_Fpga_CPU_ld_data_a5[31:0]       = FpgaPins_Fpga_CPU_dmem_rd_data_a5;
               
                     `line 51 "/raw.githubusercontent.com/efabless/chipcraftmestcourse/main/tlvlib/riscvshelllib.tlv" 1
                        // Data Memory
                        //_@4
                           for (dmem = 0; dmem <= 7; dmem++) begin : L1_FpgaPins_Fpga_CPU_Dmem logic L1_wr_a4; //_/dmem
                              assign L1_wr_a4 = FpgaPins_Fpga_CPU_dmem_wr_en_a4 && (FpgaPins_Fpga_CPU_dmem_addr_a4[2:0] == dmem);
                              assign FpgaPins_Fpga_CPU_Dmem_value_a4[dmem][31:0] = FpgaPins_Fpga_CPU_reset_a4 ?   dmem :
                                             L1_wr_a4        ?   FpgaPins_Fpga_CPU_dmem_wr_data_a4 :
                                                            FpgaPins_Fpga_CPU_Dmem_value_a5[dmem][31:0]; end
                     
                           //_?$dmem_rd_en
                              assign FpgaPins_Fpga_CPU_dmem_rd_data_a4[31:0] = FpgaPins_Fpga_CPU_Dmem_value_a5[FpgaPins_Fpga_CPU_dmem_addr_a4[2:0]];
                           `BOGUS_USE(FpgaPins_Fpga_CPU_dmem_rd_data_a4)
                     //_\end_source
                     `line 433 "/raw.githubusercontent.com/stevehoover/immutable/master/MESTcourse/solutions.tlv" 2
                     
               
                  // Lab m5_get(LabId): Load/Store in Program
               
                  //_|cpu
                     
                  
               
                     // Lab m5_get(LabId): Jumps
                     
                     
               
                     //_@3
                        assign FpgaPins_Fpga_CPU_is_jump_a3    =  FpgaPins_Fpga_CPU_is_jal_a3 || FpgaPins_Fpga_CPU_is_jalr_a3;
                        assign FpgaPins_Fpga_CPU_jalr_tgt_pc_a3[31:0]   =  FpgaPins_Fpga_CPU_src1_value_a3 + FpgaPins_Fpga_CPU_imm_a3;
                        assign FpgaPins_Fpga_CPU_valid_jump_a3 =  FpgaPins_Fpga_CPU_is_jump_a3 && FpgaPins_Fpga_CPU_valid_a3;
                     
               
               
               
                     // Logic that changes throughout.
               
               
                     //_@0
                     
                        
                                                      
                     
                        
                                       
                                                         
                     
                        
                                       
                                                               
                     
                        
                                       
                                                               
                     
                        
                                       
                                       
                                                               
                     
                        assign FpgaPins_Fpga_CPU_pc_a0[31:0]   =  FpgaPins_Fpga_CPU_reset_a1                     ?  '0 :
                                       FpgaPins_Fpga_CPU_valid_taken_br_a3            ?  FpgaPins_Fpga_CPU_br_tgt_pc_a3   :
                                       FpgaPins_Fpga_CPU_valid_load_a3                ?  FpgaPins_Fpga_CPU_inc_pc_a3      :
                                       FpgaPins_Fpga_CPU_valid_jump_a3 && FpgaPins_Fpga_CPU_is_jal_a3  ?  FpgaPins_Fpga_CPU_br_tgt_pc_a3   :
                                       FpgaPins_Fpga_CPU_valid_jump_a3 && FpgaPins_Fpga_CPU_is_jalr_a3 ?  FpgaPins_Fpga_CPU_jalr_tgt_pc_a3 :
                                                                        FpgaPins_Fpga_CPU_inc_pc_a1 ;
                     
               
                     
                     //_@2
                        assign FpgaPins_Fpga_CPU_br_tgt_pc_a2[31:0] = FpgaPins_Fpga_CPU_pc_a2 + FpgaPins_Fpga_CPU_imm_a2;
                     
               
                     
                     //_@0
                        assign FpgaPins_Fpga_CPU_imem_rd_en_a0                          = !FpgaPins_Fpga_CPU_reset_a0;
                        assign FpgaPins_Fpga_CPU_imem_rd_addr_a0[4-1:0] = FpgaPins_Fpga_CPU_pc_a0[4+1:2];
                     //_@1
                        assign FpgaPins_Fpga_CPU_instr_a1[31:0]                         = FpgaPins_Fpga_CPU_imem_rd_data_a1[31:0];
                        //`BOGUS_USE($instr)
                     
               
                     
                     
                        
                        
                        
                        
                        
                        
                        
                              // Other fields
                     //_@1
                        //_?$funct7_valid
                           assign FpgaPins_Fpga_CPU_funct7_a1[6:0] = FpgaPins_Fpga_CPU_instr_a1[31:25];
                        //_?$funct3_valid
                           assign FpgaPins_Fpga_CPU_funct3_a1[2:0] = FpgaPins_Fpga_CPU_instr_a1[14:12];
                        //_?$rs1_valid
                           assign FpgaPins_Fpga_CPU_rs1_a1[4:0]    = FpgaPins_Fpga_CPU_instr_a1[19:15];
                        //_?$rs2_valid
                           assign FpgaPins_Fpga_CPU_rs2_a1[4:0]    = FpgaPins_Fpga_CPU_instr_a1[24:20];
                        //_?$rd_valid
                           assign FpgaPins_Fpga_CPU_rd_a1[4:0]     = FpgaPins_Fpga_CPU_instr_a1[11:7];
                        assign FpgaPins_Fpga_CPU_opcode_a1[6:0]    = FpgaPins_Fpga_CPU_instr_a1[6:0];
                        //`BOGUS_USE($funct7 $funct3 $opcode $funct3)
                     
               
                     
                     //_@1
                        assign FpgaPins_Fpga_CPU_dec_bits_a1[10:0] = {FpgaPins_Fpga_CPU_funct7_a1[5], FpgaPins_Fpga_CPU_funct3_a1, FpgaPins_Fpga_CPU_opcode_a1};
                        assign FpgaPins_Fpga_CPU_is_beq_a1     =  FpgaPins_Fpga_CPU_dec_bits_a1[9:0] ==   10'b000_1100011 ;
                        assign FpgaPins_Fpga_CPU_is_bne_a1     =  FpgaPins_Fpga_CPU_dec_bits_a1[9:0] ==   10'b001_1100011 ;
                        assign FpgaPins_Fpga_CPU_is_blt_a1     =  FpgaPins_Fpga_CPU_dec_bits_a1[9:0] ==   10'b100_1100011 ;
                        assign FpgaPins_Fpga_CPU_is_bge_a1     =  FpgaPins_Fpga_CPU_dec_bits_a1[9:0] ==   10'b101_1100011 ;
                        assign FpgaPins_Fpga_CPU_is_bltu_a1    =  FpgaPins_Fpga_CPU_dec_bits_a1[9:0] ==   10'b110_1100011 ;
                        assign FpgaPins_Fpga_CPU_is_bgeu_a1    =  FpgaPins_Fpga_CPU_dec_bits_a1[9:0] ==   10'b111_1100011 ;
               
                        assign FpgaPins_Fpga_CPU_is_addi_a1    =  FpgaPins_Fpga_CPU_dec_bits_a1[9:0] ==   10'b000_0010011 ;
                        assign FpgaPins_Fpga_CPU_is_add_a1     =  FpgaPins_Fpga_CPU_dec_bits_a1      == 11'b0_000_0110011 ;
                     
               
                     //_@2
                     
                        assign FpgaPins_Fpga_CPU_rf_rd_en1_a2           =  FpgaPins_Fpga_CPU_rs1_valid_a2;
                        assign FpgaPins_Fpga_CPU_rf_rd_en2_a2           =  FpgaPins_Fpga_CPU_rs2_valid_a2;
                        assign FpgaPins_Fpga_CPU_rf_rd_index1_a2[4:0]   =  FpgaPins_Fpga_CPU_rs1_a2;
                        assign FpgaPins_Fpga_CPU_rf_rd_index2_a2[4:0]   =  FpgaPins_Fpga_CPU_rs2_a2;
                     
               
                     
                     
                     
                        
                        
                     
                     
                        assign FpgaPins_Fpga_CPU_src1_value_a2[31:0] =
                             (FpgaPins_Fpga_CPU_rf_wr_index_a3 == FpgaPins_Fpga_CPU_rf_rd_index1_a2) && FpgaPins_Fpga_CPU_rf_wr_en_a3
                                 ?  FpgaPins_Fpga_CPU_result_a3   :
                                    FpgaPins_Fpga_CPU_rf_rd_data1_a2 ;
                        assign FpgaPins_Fpga_CPU_src2_value_a2[31:0] =
                             (FpgaPins_Fpga_CPU_rf_wr_index_a3 == FpgaPins_Fpga_CPU_rf_rd_index2_a2) && FpgaPins_Fpga_CPU_rf_wr_en_a3
                                 ?  FpgaPins_Fpga_CPU_result_a3   :
                                    FpgaPins_Fpga_CPU_rf_rd_data2_a2 ;
                     
                     
               
                     //_@3
                     
                        
                        
                        
                     
                        
                        
                        
                     
                        
                        
                        
                     
                        assign FpgaPins_Fpga_CPU_rf_wr_en_a3            =  (FpgaPins_Fpga_CPU_rd_valid_a3 && FpgaPins_Fpga_CPU_valid_a3 && FpgaPins_Fpga_CPU_rd_a3 != 5'b0) || FpgaPins_Fpga_CPU_valid_load_a5;
                        assign FpgaPins_Fpga_CPU_rf_wr_index_a3[4:0]    =  FpgaPins_Fpga_CPU_valid_load_a5 ? FpgaPins_Fpga_CPU_rd_a5 : FpgaPins_Fpga_CPU_rd_a3;
                        assign FpgaPins_Fpga_CPU_rf_wr_data_a3[31:0]    =  FpgaPins_Fpga_CPU_valid_load_a5 ? FpgaPins_Fpga_CPU_ld_data_a5 : FpgaPins_Fpga_CPU_result_a3;
                     
               
                     /* verilator lint_off WIDTH */
               
                     
                     
                        
                                          
                                                      
                     
                     //_@3
                        assign FpgaPins_Fpga_CPU_result_a3[31:0] =   FpgaPins_Fpga_CPU_is_andi_a3    ?  FpgaPins_Fpga_CPU_src1_value_a3 & FpgaPins_Fpga_CPU_imm_a3 :
                                          FpgaPins_Fpga_CPU_is_ori_a3     ?  FpgaPins_Fpga_CPU_src1_value_a3 | FpgaPins_Fpga_CPU_imm_a3 :
                                          FpgaPins_Fpga_CPU_is_xori_a3    ?  FpgaPins_Fpga_CPU_src1_value_a3 ^ FpgaPins_Fpga_CPU_imm_a3 :
                                          (FpgaPins_Fpga_CPU_is_addi_a3 || FpgaPins_Fpga_CPU_is_load_a3 || FpgaPins_Fpga_CPU_is_s_instr_a3) ?  FpgaPins_Fpga_CPU_src1_value_a3 + FpgaPins_Fpga_CPU_imm_a3 :
                                          FpgaPins_Fpga_CPU_is_slli_a3    ?  FpgaPins_Fpga_CPU_src1_value_a3 << FpgaPins_Fpga_CPU_imm_a3[5:0]  :
                                          FpgaPins_Fpga_CPU_is_srli_a3    ?  FpgaPins_Fpga_CPU_src1_value_a3 >> FpgaPins_Fpga_CPU_imm_a3[5:0]  :
                                          FpgaPins_Fpga_CPU_is_and_a3     ?  FpgaPins_Fpga_CPU_src1_value_a3 & FpgaPins_Fpga_CPU_src2_value_a3 :
                                          FpgaPins_Fpga_CPU_is_or_a3      ?  FpgaPins_Fpga_CPU_src1_value_a3 | FpgaPins_Fpga_CPU_src2_value_a3 :
                                          FpgaPins_Fpga_CPU_is_xor_a3     ?  FpgaPins_Fpga_CPU_src1_value_a3 ^ FpgaPins_Fpga_CPU_src2_value_a3 :
                                          FpgaPins_Fpga_CPU_is_add_a3     ?  FpgaPins_Fpga_CPU_src1_value_a3 + FpgaPins_Fpga_CPU_src2_value_a3 :
                                          FpgaPins_Fpga_CPU_is_sub_a3     ?  FpgaPins_Fpga_CPU_src1_value_a3 - FpgaPins_Fpga_CPU_src2_value_a3 :
                                          FpgaPins_Fpga_CPU_is_sll_a3     ?  FpgaPins_Fpga_CPU_src1_value_a3 << FpgaPins_Fpga_CPU_src2_value_a3[4:0] :
                                          FpgaPins_Fpga_CPU_is_srl_a3     ?  FpgaPins_Fpga_CPU_src1_value_a3 >> FpgaPins_Fpga_CPU_src2_value_a3[4:0] :
                                          FpgaPins_Fpga_CPU_is_sltu_a3    ?  FpgaPins_Fpga_CPU_sltu_rslt_a3 :
                                          FpgaPins_Fpga_CPU_is_sltiu_a3   ?  FpgaPins_Fpga_CPU_sltiu_rslt_a3 :
                                          FpgaPins_Fpga_CPU_is_lui_a3     ?  {FpgaPins_Fpga_CPU_imm_a3[31:12], 12'b0} :
                                          FpgaPins_Fpga_CPU_is_auipc_a3   ?  FpgaPins_Fpga_CPU_pc_a3 + FpgaPins_Fpga_CPU_imm_a3 :
                                          FpgaPins_Fpga_CPU_is_jal_a3     ?  FpgaPins_Fpga_CPU_pc_a3 + 32'd4 :
                                          FpgaPins_Fpga_CPU_is_jalr_a3    ?  FpgaPins_Fpga_CPU_pc_a3 + 32'd4 :
                                          FpgaPins_Fpga_CPU_is_srai_a3    ?  {{32{FpgaPins_Fpga_CPU_src1_value_a3[31]}}, FpgaPins_Fpga_CPU_src1_value_a3} >> FpgaPins_Fpga_CPU_imm_a3[4:0] :
                                          FpgaPins_Fpga_CPU_is_slt_a3     ?  ((FpgaPins_Fpga_CPU_src1_value_a3[31] == FpgaPins_Fpga_CPU_src2_value_a3[31]) ? FpgaPins_Fpga_CPU_sltu_rslt_a3  : {31'b0, FpgaPins_Fpga_CPU_src1_value_a3[31]}) :
                                          FpgaPins_Fpga_CPU_is_slti_a3    ?  ((FpgaPins_Fpga_CPU_src1_value_a3[31] == FpgaPins_Fpga_CPU_imm_a3[31])        ? FpgaPins_Fpga_CPU_sltiu_rslt_a3 : {31'b0, FpgaPins_Fpga_CPU_src1_value_a3[31]}) :
                                          FpgaPins_Fpga_CPU_is_sra_a3     ?  {{32{FpgaPins_Fpga_CPU_src1_value_a3[31]}}, FpgaPins_Fpga_CPU_src1_value_a3} >> FpgaPins_Fpga_CPU_src2_value_a3[4:0] :
                                                         32'bx;
                     
               
                     /* verilator lint_on WIDTH */
               
                     
                     //_@3
                        assign FpgaPins_Fpga_CPU_taken_br_a3   =  FpgaPins_Fpga_CPU_is_beq_a3  ? (FpgaPins_Fpga_CPU_src1_value_a3 == FpgaPins_Fpga_CPU_src2_value_a3) :
                                       FpgaPins_Fpga_CPU_is_bne_a3  ? (FpgaPins_Fpga_CPU_src1_value_a3 != FpgaPins_Fpga_CPU_src2_value_a3) :
                                       FpgaPins_Fpga_CPU_is_blt_a3  ? ((FpgaPins_Fpga_CPU_src1_value_a3 < FpgaPins_Fpga_CPU_src2_value_a3)  ^ (FpgaPins_Fpga_CPU_src1_value_a3[31] != FpgaPins_Fpga_CPU_src2_value_a3[31])) :
                                       FpgaPins_Fpga_CPU_is_bge_a3  ? ((FpgaPins_Fpga_CPU_src1_value_a3 >= FpgaPins_Fpga_CPU_src2_value_a3) ^ (FpgaPins_Fpga_CPU_src1_value_a3[31] != FpgaPins_Fpga_CPU_src2_value_a3[31])) :
                                       FpgaPins_Fpga_CPU_is_bltu_a3 ? (FpgaPins_Fpga_CPU_src1_value_a3 < FpgaPins_Fpga_CPU_src2_value_a3)  :
                                       FpgaPins_Fpga_CPU_is_bgeu_a3 ? (FpgaPins_Fpga_CPU_src1_value_a3 >= FpgaPins_Fpga_CPU_src2_value_a3) :
                                                  1'b0;
                        //`BOGUS_USE($taken_br)
                     
               
                     
                     
                        
                        
                                 
                                          
                     
                     
                        
                     
                     
                        
                                   
                     
                     //_@3
                        assign FpgaPins_Fpga_CPU_valid_a3 = !(FpgaPins_Fpga_CPU_valid_taken_br_a4 || FpgaPins_Fpga_CPU_valid_taken_br_a5 ||
                                   FpgaPins_Fpga_CPU_valid_load_a4     || FpgaPins_Fpga_CPU_valid_load_a5     ||
                                   FpgaPins_Fpga_CPU_valid_jump_a4     || FpgaPins_Fpga_CPU_valid_jump_a5);
                     
               
                     //_@1
                        
                        
                        
                        //*passed = |cpu/xreg[15]>>5$value == (1+2+3+4+5+6+7+8+9);
                        
                        
                        
               
               
                  assign failed = 1'b0;
               
                  //_|cpu
                     
                     // IMem
                     `line 19 "/raw.githubusercontent.com/efabless/chipcraftmestcourse/main/tlvlib/riscvshelllib.tlv" 1
                        // Instruction Memory containing program.
                        //_@1
                           /*SV_plus*/
                              // The program in an instruction memory.
                              logic [31:0] instrs [0:10-1];
                              assign instrs[0] = {7'b0000000, 5'd0, 5'd0, 3'b000, 5'd10, 7'b0110011}; assign instrs[1] = {7'b0000000, 5'd0, 5'd10, 3'b000, 5'd14, 7'b0110011}; assign instrs[2] = {12'b000000001010, 5'd10, 3'b000, 5'd12, 7'b0010011}; assign instrs[3] = {7'b0000000, 5'd0, 5'd10, 3'b000, 5'd13, 7'b0110011}; assign instrs[4] = {7'b0000000, 5'd14, 5'd13, 3'b000, 5'd14, 7'b0110011}; assign instrs[5] = {12'b000000000001, 5'd13, 3'b000, 5'd13, 7'b0010011}; assign instrs[6] = {1'b1, 6'b111111, 5'd12, 5'd13, 3'b100, 4'b1100, 1'b1, 7'b1100011}; assign instrs[7] = {7'b0000000, 5'd0, 5'd14, 3'b000, 5'd10, 7'b0110011}; assign instrs[8] = {7'b0000000, 5'd10, 5'd0, 3'b010, 5'b00100, 7'b0100011}; assign instrs[9] = {12'b000000000100, 5'd0, 3'b010, 5'd15, 7'b0000011}; 
                           for (imem = 0; imem <= 9; imem++) begin : L1_FpgaPins_Fpga_CPU_Imem //_/imem
                              assign FpgaPins_Fpga_CPU_Imem_instr_a1[imem][31:0] = instrs[imem]; end
                           //_?$imem_rd_en
                              assign FpgaPins_Fpga_CPU_imem_rd_data_a1[31:0] = FpgaPins_Fpga_CPU_Imem_instr_a1[FpgaPins_Fpga_CPU_imem_rd_addr_a1];
                     //_\end_source    // Args: (read stage)
                     `line 669 "/raw.githubusercontent.com/stevehoover/immutable/master/MESTcourse/solutions.tlv" 2
                     
               
                     // Args: (read stage, write stage) - if equal, no register bypass is required
                     
                     `line 34 "/raw.githubusercontent.com/efabless/chipcraftmestcourse/main/tlvlib/riscvshelllib.tlv" 1
                        // Reg File
                        //_@3
                           for (xreg = 0; xreg <= 15; xreg++) begin : L1_FpgaPins_Fpga_CPU_Xreg logic L1_wr_a3; //_/xreg
                              assign L1_wr_a3 = FpgaPins_Fpga_CPU_rf_wr_en_a3 && (FpgaPins_Fpga_CPU_rf_wr_index_a3 != 5'b0) && (FpgaPins_Fpga_CPU_rf_wr_index_a3 == xreg);
                              assign FpgaPins_Fpga_CPU_Xreg_value_a3[xreg][31:0] = FpgaPins_Fpga_CPU_reset_a3 ?   xreg           :
                                             L1_wr_a3        ?   FpgaPins_Fpga_CPU_rf_wr_data_a3 :
                                                            FpgaPins_Fpga_CPU_Xreg_value_a4[xreg][31:0]; end
                        //_@2
                           //_?$rf_rd_en1
                              assign FpgaPins_Fpga_CPU_rf_rd_data1_a2[31:0] = FpgaPins_Fpga_CPU_Xreg_value_a4[FpgaPins_Fpga_CPU_rf_rd_index1_a2[3:0]];
                           //_?$rf_rd_en2
                              assign FpgaPins_Fpga_CPU_rf_rd_data2_a2[31:0] = FpgaPins_Fpga_CPU_Xreg_value_a4[FpgaPins_Fpga_CPU_rf_rd_index2_a2[3:0]];
                           `BOGUS_USE(FpgaPins_Fpga_CPU_rf_rd_data1_a2 FpgaPins_Fpga_CPU_rf_rd_data2_a2)
                     //_\end_source
                     `line 674 "/raw.githubusercontent.com/stevehoover/immutable/master/MESTcourse/solutions.tlv" 2
                     
               
                  // ============================================================================================================
               
                  // Connect Tiny Tapeout outputs.
                  // Note that my_design will be under /fpga_pins/fpga.
                  assign uo_out = {6'b0, failed, passed};
                  
                  
               
                      // For visualisation, argument should be at least equal to the last stage of CPU logic. @4 would work for all labs.
               //_\end_source
               `line 105 "/raw.githubusercontent.com/stevehoover/immutable/master/MESTcourse/solutions.tlv" 2
            
            //_\end_source
            `line 341 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv" 2
   
      // LEDs.
      
   
      // 7-Segment
      `line 396 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv" 1
         for (digit = 0; digit <= 0; digit++) begin : L1_Digit //_/digit
            /* Viz omitted here */



















            for (leds = 0; leds <= 7; leds++) begin : L2_Leds logic L2_viz_lit_a0; //_/leds
               assign L2_viz_lit_a0 = (! L0_sseg_digit_n_a0[digit]) && ! ((leds == 7) ? L0_sseg_decimal_point_n_a0 : L0_sseg_segment_n_a0[leds % 7]);
               /* Viz omitted here */
































               end end
      //_\end_source
      `line 347 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv" 2
   
      // slideswitches
      `line 455 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv" 1
         for (switch = 0; switch <= 7; switch++) begin : L1_Switch logic L1_viz_switch_a0; //_/switch
            assign L1_viz_switch_a0 = L0_slideswitch_a0[switch];
            /* Viz omitted here */










































            end
      //_\end_source
      `line 350 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv" 2
   
      // pushbuttons
      
   //_\end_source
   `line 132 "top.tlv" 2
   // Label the switch inputs [0..7] (1..8 on the physical switch panel) (top-to-bottom).
   `line 83 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlvlib/tinytapeoutlib.tlv" 1
      for (input_label = 0; input_label <= 7; input_label++) begin : L1_InputLabel //_/input_label
         /* Viz omitted here */















         end
   //_\end_source
   `line 134 "top.tlv" 2

//_\SV
endmodule


// Undefine macros defined by SandPiper (in "top_gen.sv").
`undef BOGUS_USE
