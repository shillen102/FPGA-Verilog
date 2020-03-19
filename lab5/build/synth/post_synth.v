// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Thu Feb 27 18:08:36 2020
// Host        : shillen-Inspiron-5547 running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -file post_synth.v
// Design      : z1top
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7z020clg400-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module button_parser
   (D,
    Q,
    \SATURATE_COUNTER[1].switchOut_reg[1] ,
    \SATURATE_COUNTER[0].switchOut_reg[0] ,
    \SATURATE_COUNTER[2].switchOut_reg[2] ,
    O,
    \cycles_reg[9] ,
    \cycles_reg[17] ,
    \cycles_reg[19] ,
    \cycles_reg[19]_0 ,
    CLK_125MHZ_FPGA_IBUF_BUFG,
    SWITCHES_IBUF,
    cycles_reg,
    \q1_reg[3] );
  output [2:0]D;
  output [2:0]Q;
  output \SATURATE_COUNTER[1].switchOut_reg[1] ;
  output \SATURATE_COUNTER[0].switchOut_reg[0] ;
  output \SATURATE_COUNTER[2].switchOut_reg[2] ;
  output [3:0]O;
  output [3:0]\cycles_reg[9] ;
  output [3:0]\cycles_reg[17] ;
  output [3:0]\cycles_reg[19] ;
  output [1:0]\cycles_reg[19]_0 ;
  input CLK_125MHZ_FPGA_IBUF_BUFG;
  input [0:0]SWITCHES_IBUF;
  input [17:0]cycles_reg;
  input [3:0]\q1_reg[3] ;

  wire CLK_125MHZ_FPGA_IBUF_BUFG;
  wire [2:0]D;
  wire [3:0]O;
  wire [2:0]Q;
  wire \SATURATE_COUNTER[0].switchOut_reg[0] ;
  wire \SATURATE_COUNTER[1].switchOut_reg[1] ;
  wire \SATURATE_COUNTER[2].switchOut_reg[2] ;
  wire [0:0]SWITCHES_IBUF;
  wire button_edge_detector_n_10;
  wire button_edge_detector_n_11;
  wire button_edge_detector_n_12;
  wire button_edge_detector_n_13;
  wire button_edge_detector_n_14;
  wire button_edge_detector_n_5;
  wire button_edge_detector_n_6;
  wire button_edge_detector_n_7;
  wire button_edge_detector_n_8;
  wire button_edge_detector_n_9;
  wire [17:0]cycles_reg;
  wire [3:0]\cycles_reg[17] ;
  wire [3:0]\cycles_reg[19] ;
  wire [1:0]\cycles_reg[19]_0 ;
  wire [3:0]\cycles_reg[9] ;
  wire [0:0]debounced_signals;
  wire [0:0]prev;
  wire [3:0]\q1_reg[3] ;
  wire [3:0]synchronized_signals;
  wire tempo_up;

  debouncer button_debouncer
       (.CLK_125MHZ_FPGA_IBUF_BUFG(CLK_125MHZ_FPGA_IBUF_BUFG),
        .D({D,debounced_signals}),
        .DI({button_edge_detector_n_5,button_edge_detector_n_6,button_edge_detector_n_7}),
        .O(O),
        .Q(synchronized_signals),
        .\SATURATE_COUNTER[0].switchOut_reg[0]_0 (\SATURATE_COUNTER[0].switchOut_reg[0] ),
        .\SATURATE_COUNTER[1].switchOut_reg[1]_0 (\SATURATE_COUNTER[1].switchOut_reg[1] ),
        .\SATURATE_COUNTER[2].switchOut_reg[2]_0 (\SATURATE_COUNTER[2].switchOut_reg[2] ),
        .SWITCHES_IBUF(SWITCHES_IBUF),
        .\current_state_reg[2] ({Q[1:0],prev}),
        .cycles_reg(cycles_reg),
        .\cycles_reg[13] ({button_edge_detector_n_8,button_edge_detector_n_9,button_edge_detector_n_10,button_edge_detector_n_11}),
        .\cycles_reg[17] (\cycles_reg[17] ),
        .\cycles_reg[17]_0 (button_edge_detector_n_12),
        .\cycles_reg[19] (\cycles_reg[19] ),
        .\cycles_reg[19]_0 (\cycles_reg[19]_0 ),
        .\cycles_reg[21] ({button_edge_detector_n_13,button_edge_detector_n_14}),
        .\cycles_reg[23] (tempo_up),
        .\cycles_reg[9] (\cycles_reg[9] ));
  edge_detector button_edge_detector
       (.CLK_125MHZ_FPGA_IBUF_BUFG(CLK_125MHZ_FPGA_IBUF_BUFG),
        .D({D,debounced_signals}),
        .DI({button_edge_detector_n_5,button_edge_detector_n_6,button_edge_detector_n_7}),
        .Q({Q,prev}),
        .SWITCHES_IBUF(SWITCHES_IBUF),
        .\prev_reg[1]_0 (tempo_up),
        .\prev_reg[1]_1 ({button_edge_detector_n_8,button_edge_detector_n_9,button_edge_detector_n_10,button_edge_detector_n_11}),
        .\prev_reg[1]_2 (button_edge_detector_n_12),
        .\prev_reg[1]_3 ({button_edge_detector_n_13,button_edge_detector_n_14}));
  synchronizer button_synchronizer
       (.CLK_125MHZ_FPGA_IBUF_BUFG(CLK_125MHZ_FPGA_IBUF_BUFG),
        .Q(synchronized_signals),
        .\q1_reg[3]_0 (\q1_reg[3] ));
endmodule

module debouncer
   (D,
    \SATURATE_COUNTER[1].switchOut_reg[1]_0 ,
    \SATURATE_COUNTER[0].switchOut_reg[0]_0 ,
    \SATURATE_COUNTER[2].switchOut_reg[2]_0 ,
    O,
    \cycles_reg[9] ,
    \cycles_reg[17] ,
    \cycles_reg[19] ,
    \cycles_reg[19]_0 ,
    CLK_125MHZ_FPGA_IBUF_BUFG,
    Q,
    \current_state_reg[2] ,
    SWITCHES_IBUF,
    cycles_reg,
    DI,
    \cycles_reg[13] ,
    \cycles_reg[17]_0 ,
    \cycles_reg[21] ,
    \cycles_reg[23] );
  output [3:0]D;
  output \SATURATE_COUNTER[1].switchOut_reg[1]_0 ;
  output \SATURATE_COUNTER[0].switchOut_reg[0]_0 ;
  output \SATURATE_COUNTER[2].switchOut_reg[2]_0 ;
  output [3:0]O;
  output [3:0]\cycles_reg[9] ;
  output [3:0]\cycles_reg[17] ;
  output [3:0]\cycles_reg[19] ;
  output [1:0]\cycles_reg[19]_0 ;
  input CLK_125MHZ_FPGA_IBUF_BUFG;
  input [3:0]Q;
  input [2:0]\current_state_reg[2] ;
  input [0:0]SWITCHES_IBUF;
  input [17:0]cycles_reg;
  input [2:0]DI;
  input [3:0]\cycles_reg[13] ;
  input [0:0]\cycles_reg[17]_0 ;
  input [1:0]\cycles_reg[21] ;
  input [0:0]\cycles_reg[23] ;

  wire \<const0> ;
  wire \<const1> ;
  wire CLK_125MHZ_FPGA_IBUF_BUFG;
  wire [3:0]D;
  wire [2:0]DI;
  wire [3:0]O;
  wire [3:0]Q;
  wire \SATURATE_COUNTER[0].s_counters[0][7]_i_1_n_0 ;
  wire \SATURATE_COUNTER[0].s_counters[0][7]_i_4_n_0 ;
  wire \SATURATE_COUNTER[0].s_counters[0][7]_i_5_n_0 ;
  wire [7:0]\SATURATE_COUNTER[0].s_counters_reg[0]_0 ;
  wire \SATURATE_COUNTER[0].switchOut[0]_i_1_n_0 ;
  wire \SATURATE_COUNTER[0].switchOut_reg[0]_0 ;
  wire \SATURATE_COUNTER[1].s_counters[1][7]_i_1_n_0 ;
  wire \SATURATE_COUNTER[1].s_counters[1][7]_i_2_n_0 ;
  wire \SATURATE_COUNTER[1].s_counters[1][7]_i_4_n_0 ;
  wire \SATURATE_COUNTER[1].s_counters[1][7]_i_5_n_0 ;
  wire [7:0]\SATURATE_COUNTER[1].s_counters_reg[1]_1 ;
  wire \SATURATE_COUNTER[1].switchOut[1]_i_1_n_0 ;
  wire \SATURATE_COUNTER[1].switchOut_reg[1]_0 ;
  wire \SATURATE_COUNTER[2].s_counters[2][7]_i_1_n_0 ;
  wire \SATURATE_COUNTER[2].s_counters[2][7]_i_2_n_0 ;
  wire \SATURATE_COUNTER[2].s_counters[2][7]_i_4_n_0 ;
  wire \SATURATE_COUNTER[2].s_counters[2][7]_i_5_n_0 ;
  wire [7:0]\SATURATE_COUNTER[2].s_counters_reg[2]_2 ;
  wire \SATURATE_COUNTER[2].switchOut[2]_i_1_n_0 ;
  wire \SATURATE_COUNTER[2].switchOut_reg[2]_0 ;
  wire \SATURATE_COUNTER[3].s_counters[3][7]_i_1_n_0 ;
  wire \SATURATE_COUNTER[3].s_counters[3][7]_i_2_n_0 ;
  wire \SATURATE_COUNTER[3].s_counters[3][7]_i_4_n_0 ;
  wire \SATURATE_COUNTER[3].s_counters[3][7]_i_5_n_0 ;
  wire [7:0]\SATURATE_COUNTER[3].s_counters_reg[3]_3 ;
  wire \SATURATE_COUNTER[3].switchOut[3]_i_1_n_0 ;
  wire [0:0]SWITCHES_IBUF;
  wire [2:0]\current_state_reg[2] ;
  wire \cycles[10]_i_6_n_0 ;
  wire \cycles[10]_i_7_n_0 ;
  wire \cycles[10]_i_8_n_0 ;
  wire \cycles[10]_i_9_n_0 ;
  wire \cycles[14]_i_3_n_0 ;
  wire \cycles[14]_i_4_n_0 ;
  wire \cycles[14]_i_5_n_0 ;
  wire \cycles[14]_i_6_n_0 ;
  wire \cycles[18]_i_4_n_0 ;
  wire \cycles[18]_i_5_n_0 ;
  wire \cycles[18]_i_6_n_0 ;
  wire \cycles[18]_i_7_n_0 ;
  wire \cycles[22]_i_3_n_0 ;
  wire \cycles[22]_i_4_n_0 ;
  wire \cycles[6]_i_10_n_0 ;
  wire \cycles[6]_i_3_n_0 ;
  wire \cycles[6]_i_7_n_0 ;
  wire \cycles[6]_i_8_n_0 ;
  wire \cycles[6]_i_9_n_0 ;
  wire [17:0]cycles_reg;
  wire \cycles_reg[10]_i_1_n_0 ;
  wire \cycles_reg[10]_i_1_n_1 ;
  wire \cycles_reg[10]_i_1_n_2 ;
  wire \cycles_reg[10]_i_1_n_3 ;
  wire [3:0]\cycles_reg[13] ;
  wire \cycles_reg[14]_i_1_n_0 ;
  wire \cycles_reg[14]_i_1_n_1 ;
  wire \cycles_reg[14]_i_1_n_2 ;
  wire \cycles_reg[14]_i_1_n_3 ;
  wire [3:0]\cycles_reg[17] ;
  wire [0:0]\cycles_reg[17]_0 ;
  wire \cycles_reg[18]_i_1_n_0 ;
  wire \cycles_reg[18]_i_1_n_1 ;
  wire \cycles_reg[18]_i_1_n_2 ;
  wire \cycles_reg[18]_i_1_n_3 ;
  wire [3:0]\cycles_reg[19] ;
  wire [1:0]\cycles_reg[19]_0 ;
  wire [1:0]\cycles_reg[21] ;
  wire \cycles_reg[22]_i_1_n_3 ;
  wire [0:0]\cycles_reg[23] ;
  wire \cycles_reg[6]_i_2_n_0 ;
  wire \cycles_reg[6]_i_2_n_1 ;
  wire \cycles_reg[6]_i_2_n_2 ;
  wire \cycles_reg[6]_i_2_n_3 ;
  wire [3:0]\cycles_reg[9] ;
  wire [15:1]data0;
  wire [7:0]p_0_in;
  wire [7:0]p_0_in__0;
  wire [7:0]p_0_in__1;
  wire [7:0]p_0_in__2;
  wire s_counters;
  wire [15:0]sample_counter;
  wire sample_counter0_carry__0_n_0;
  wire sample_counter0_carry__0_n_1;
  wire sample_counter0_carry__0_n_2;
  wire sample_counter0_carry__0_n_3;
  wire sample_counter0_carry__1_n_0;
  wire sample_counter0_carry__1_n_1;
  wire sample_counter0_carry__1_n_2;
  wire sample_counter0_carry__1_n_3;
  wire sample_counter0_carry__2_n_2;
  wire sample_counter0_carry__2_n_3;
  wire sample_counter0_carry_n_0;
  wire sample_counter0_carry_n_1;
  wire sample_counter0_carry_n_2;
  wire sample_counter0_carry_n_3;
  wire \sample_counter[0]_i_2_n_0 ;
  wire \sample_counter[0]_i_3_n_0 ;
  wire \sample_counter[0]_i_4_n_0 ;
  wire \sample_counter[0]_i_5_n_0 ;
  wire \sample_counter[15]_i_1_n_0 ;
  wire [0:0]sample_counter_0;
  wire sample_pulse_reg_n_0;

  GND GND
       (.G(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \SATURATE_COUNTER[0].s_counters[0][0]_i_1 
       (.I0(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \SATURATE_COUNTER[0].s_counters[0][1]_i_1 
       (.I0(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [0]),
        .I1(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \SATURATE_COUNTER[0].s_counters[0][2]_i_1 
       (.I0(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [2]),
        .I1(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [1]),
        .I2(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [0]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \SATURATE_COUNTER[0].s_counters[0][3]_i_1 
       (.I0(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [3]),
        .I1(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [2]),
        .I2(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [0]),
        .I3(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [1]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \SATURATE_COUNTER[0].s_counters[0][4]_i_1 
       (.I0(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [2]),
        .I1(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [0]),
        .I2(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [1]),
        .I3(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [3]),
        .I4(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \SATURATE_COUNTER[0].s_counters[0][5]_i_1 
       (.I0(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [5]),
        .I1(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [2]),
        .I2(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [0]),
        .I3(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [1]),
        .I4(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [3]),
        .I5(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [4]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \SATURATE_COUNTER[0].s_counters[0][6]_i_1 
       (.I0(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [6]),
        .I1(\SATURATE_COUNTER[0].s_counters[0][7]_i_5_n_0 ),
        .I2(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [5]),
        .O(p_0_in[6]));
  LUT2 #(
    .INIT(4'h2)) 
    \SATURATE_COUNTER[0].s_counters[0][7]_i_1 
       (.I0(sample_pulse_reg_n_0),
        .I1(Q[0]),
        .O(\SATURATE_COUNTER[0].s_counters[0][7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hA8AAAAAA)) 
    \SATURATE_COUNTER[0].s_counters[0][7]_i_2 
       (.I0(sample_pulse_reg_n_0),
        .I1(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [1]),
        .I2(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [0]),
        .I3(Q[0]),
        .I4(\SATURATE_COUNTER[0].s_counters[0][7]_i_4_n_0 ),
        .O(s_counters));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \SATURATE_COUNTER[0].s_counters[0][7]_i_3 
       (.I0(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [7]),
        .I1(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [5]),
        .I2(\SATURATE_COUNTER[0].s_counters[0][7]_i_5_n_0 ),
        .I3(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [6]),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    \SATURATE_COUNTER[0].s_counters[0][7]_i_4 
       (.I0(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [3]),
        .I1(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [2]),
        .I2(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [4]),
        .I3(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [5]),
        .I4(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [7]),
        .I5(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [6]),
        .O(\SATURATE_COUNTER[0].s_counters[0][7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \SATURATE_COUNTER[0].s_counters[0][7]_i_5 
       (.I0(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [4]),
        .I1(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [3]),
        .I2(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [1]),
        .I3(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [0]),
        .I4(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [2]),
        .O(\SATURATE_COUNTER[0].s_counters[0][7]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[0].s_counters_reg[0][0] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(s_counters),
        .D(p_0_in[0]),
        .Q(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [0]),
        .R(\SATURATE_COUNTER[0].s_counters[0][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[0].s_counters_reg[0][1] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(s_counters),
        .D(p_0_in[1]),
        .Q(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [1]),
        .R(\SATURATE_COUNTER[0].s_counters[0][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[0].s_counters_reg[0][2] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(s_counters),
        .D(p_0_in[2]),
        .Q(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [2]),
        .R(\SATURATE_COUNTER[0].s_counters[0][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[0].s_counters_reg[0][3] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(s_counters),
        .D(p_0_in[3]),
        .Q(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [3]),
        .R(\SATURATE_COUNTER[0].s_counters[0][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[0].s_counters_reg[0][4] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(s_counters),
        .D(p_0_in[4]),
        .Q(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [4]),
        .R(\SATURATE_COUNTER[0].s_counters[0][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[0].s_counters_reg[0][5] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(s_counters),
        .D(p_0_in[5]),
        .Q(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [5]),
        .R(\SATURATE_COUNTER[0].s_counters[0][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[0].s_counters_reg[0][6] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(s_counters),
        .D(p_0_in[6]),
        .Q(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [6]),
        .R(\SATURATE_COUNTER[0].s_counters[0][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[0].s_counters_reg[0][7] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(s_counters),
        .D(p_0_in[7]),
        .Q(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [7]),
        .R(\SATURATE_COUNTER[0].s_counters[0][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h444F444444444444)) 
    \SATURATE_COUNTER[0].switchOut[0]_i_1 
       (.I0(sample_pulse_reg_n_0),
        .I1(D[0]),
        .I2(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [1]),
        .I3(\SATURATE_COUNTER[0].s_counters_reg[0]_0 [0]),
        .I4(Q[0]),
        .I5(\SATURATE_COUNTER[0].s_counters[0][7]_i_4_n_0 ),
        .O(\SATURATE_COUNTER[0].switchOut[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[0].switchOut_reg[0] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\SATURATE_COUNTER[0].switchOut[0]_i_1_n_0 ),
        .Q(D[0]),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \SATURATE_COUNTER[1].s_counters[1][0]_i_1 
       (.I0(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \SATURATE_COUNTER[1].s_counters[1][1]_i_1 
       (.I0(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [0]),
        .I1(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \SATURATE_COUNTER[1].s_counters[1][2]_i_1 
       (.I0(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [2]),
        .I1(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [1]),
        .I2(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [0]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \SATURATE_COUNTER[1].s_counters[1][3]_i_1 
       (.I0(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [3]),
        .I1(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [2]),
        .I2(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [0]),
        .I3(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [1]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \SATURATE_COUNTER[1].s_counters[1][4]_i_1 
       (.I0(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [2]),
        .I1(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [0]),
        .I2(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [1]),
        .I3(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [3]),
        .I4(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [4]),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \SATURATE_COUNTER[1].s_counters[1][5]_i_1 
       (.I0(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [5]),
        .I1(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [2]),
        .I2(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [0]),
        .I3(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [1]),
        .I4(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [3]),
        .I5(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [4]),
        .O(p_0_in__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \SATURATE_COUNTER[1].s_counters[1][6]_i_1 
       (.I0(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [6]),
        .I1(\SATURATE_COUNTER[1].s_counters[1][7]_i_5_n_0 ),
        .I2(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [5]),
        .O(p_0_in__0[6]));
  LUT2 #(
    .INIT(4'h2)) 
    \SATURATE_COUNTER[1].s_counters[1][7]_i_1 
       (.I0(sample_pulse_reg_n_0),
        .I1(Q[1]),
        .O(\SATURATE_COUNTER[1].s_counters[1][7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAA8AAAA)) 
    \SATURATE_COUNTER[1].s_counters[1][7]_i_2 
       (.I0(sample_pulse_reg_n_0),
        .I1(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [2]),
        .I2(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [1]),
        .I3(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [0]),
        .I4(\SATURATE_COUNTER[1].s_counters[1][7]_i_4_n_0 ),
        .O(\SATURATE_COUNTER[1].s_counters[1][7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \SATURATE_COUNTER[1].s_counters[1][7]_i_3 
       (.I0(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [7]),
        .I1(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [5]),
        .I2(\SATURATE_COUNTER[1].s_counters[1][7]_i_5_n_0 ),
        .I3(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [6]),
        .O(p_0_in__0[7]));
  LUT6 #(
    .INIT(64'h0020000000000000)) 
    \SATURATE_COUNTER[1].s_counters[1][7]_i_4 
       (.I0(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [3]),
        .I1(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [4]),
        .I2(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [6]),
        .I3(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [5]),
        .I4(Q[1]),
        .I5(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [7]),
        .O(\SATURATE_COUNTER[1].s_counters[1][7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \SATURATE_COUNTER[1].s_counters[1][7]_i_5 
       (.I0(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [4]),
        .I1(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [3]),
        .I2(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [1]),
        .I3(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [0]),
        .I4(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [2]),
        .O(\SATURATE_COUNTER[1].s_counters[1][7]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[1].s_counters_reg[1][0] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[1].s_counters[1][7]_i_2_n_0 ),
        .D(p_0_in__0[0]),
        .Q(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [0]),
        .R(\SATURATE_COUNTER[1].s_counters[1][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[1].s_counters_reg[1][1] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[1].s_counters[1][7]_i_2_n_0 ),
        .D(p_0_in__0[1]),
        .Q(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [1]),
        .R(\SATURATE_COUNTER[1].s_counters[1][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[1].s_counters_reg[1][2] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[1].s_counters[1][7]_i_2_n_0 ),
        .D(p_0_in__0[2]),
        .Q(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [2]),
        .R(\SATURATE_COUNTER[1].s_counters[1][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[1].s_counters_reg[1][3] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[1].s_counters[1][7]_i_2_n_0 ),
        .D(p_0_in__0[3]),
        .Q(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [3]),
        .R(\SATURATE_COUNTER[1].s_counters[1][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[1].s_counters_reg[1][4] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[1].s_counters[1][7]_i_2_n_0 ),
        .D(p_0_in__0[4]),
        .Q(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [4]),
        .R(\SATURATE_COUNTER[1].s_counters[1][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[1].s_counters_reg[1][5] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[1].s_counters[1][7]_i_2_n_0 ),
        .D(p_0_in__0[5]),
        .Q(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [5]),
        .R(\SATURATE_COUNTER[1].s_counters[1][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[1].s_counters_reg[1][6] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[1].s_counters[1][7]_i_2_n_0 ),
        .D(p_0_in__0[6]),
        .Q(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [6]),
        .R(\SATURATE_COUNTER[1].s_counters[1][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[1].s_counters_reg[1][7] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[1].s_counters[1][7]_i_2_n_0 ),
        .D(p_0_in__0[7]),
        .Q(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [7]),
        .R(\SATURATE_COUNTER[1].s_counters[1][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4444444F44444444)) 
    \SATURATE_COUNTER[1].switchOut[1]_i_1 
       (.I0(sample_pulse_reg_n_0),
        .I1(D[1]),
        .I2(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [2]),
        .I3(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [1]),
        .I4(\SATURATE_COUNTER[1].s_counters_reg[1]_1 [0]),
        .I5(\SATURATE_COUNTER[1].s_counters[1][7]_i_4_n_0 ),
        .O(\SATURATE_COUNTER[1].switchOut[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[1].switchOut_reg[1] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\SATURATE_COUNTER[1].switchOut[1]_i_1_n_0 ),
        .Q(D[1]),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \SATURATE_COUNTER[2].s_counters[2][0]_i_1 
       (.I0(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [0]),
        .O(p_0_in__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \SATURATE_COUNTER[2].s_counters[2][1]_i_1 
       (.I0(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [0]),
        .I1(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [1]),
        .O(p_0_in__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \SATURATE_COUNTER[2].s_counters[2][2]_i_1 
       (.I0(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [2]),
        .I1(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [1]),
        .I2(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [0]),
        .O(p_0_in__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \SATURATE_COUNTER[2].s_counters[2][3]_i_1 
       (.I0(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [3]),
        .I1(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [2]),
        .I2(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [0]),
        .I3(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [1]),
        .O(p_0_in__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \SATURATE_COUNTER[2].s_counters[2][4]_i_1 
       (.I0(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [2]),
        .I1(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [0]),
        .I2(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [1]),
        .I3(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [3]),
        .I4(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [4]),
        .O(p_0_in__1[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \SATURATE_COUNTER[2].s_counters[2][5]_i_1 
       (.I0(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [5]),
        .I1(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [2]),
        .I2(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [0]),
        .I3(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [1]),
        .I4(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [3]),
        .I5(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [4]),
        .O(p_0_in__1[5]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \SATURATE_COUNTER[2].s_counters[2][6]_i_1 
       (.I0(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [6]),
        .I1(\SATURATE_COUNTER[2].s_counters[2][7]_i_5_n_0 ),
        .I2(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [5]),
        .O(p_0_in__1[6]));
  LUT2 #(
    .INIT(4'h2)) 
    \SATURATE_COUNTER[2].s_counters[2][7]_i_1 
       (.I0(sample_pulse_reg_n_0),
        .I1(Q[2]),
        .O(\SATURATE_COUNTER[2].s_counters[2][7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAA8AAAA)) 
    \SATURATE_COUNTER[2].s_counters[2][7]_i_2 
       (.I0(sample_pulse_reg_n_0),
        .I1(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [2]),
        .I2(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [1]),
        .I3(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [0]),
        .I4(\SATURATE_COUNTER[2].s_counters[2][7]_i_4_n_0 ),
        .O(\SATURATE_COUNTER[2].s_counters[2][7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \SATURATE_COUNTER[2].s_counters[2][7]_i_3 
       (.I0(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [7]),
        .I1(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [5]),
        .I2(\SATURATE_COUNTER[2].s_counters[2][7]_i_5_n_0 ),
        .I3(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [6]),
        .O(p_0_in__1[7]));
  LUT6 #(
    .INIT(64'h0020000000000000)) 
    \SATURATE_COUNTER[2].s_counters[2][7]_i_4 
       (.I0(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [3]),
        .I1(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [4]),
        .I2(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [6]),
        .I3(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [5]),
        .I4(Q[2]),
        .I5(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [7]),
        .O(\SATURATE_COUNTER[2].s_counters[2][7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \SATURATE_COUNTER[2].s_counters[2][7]_i_5 
       (.I0(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [4]),
        .I1(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [3]),
        .I2(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [1]),
        .I3(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [0]),
        .I4(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [2]),
        .O(\SATURATE_COUNTER[2].s_counters[2][7]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[2].s_counters_reg[2][0] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[2].s_counters[2][7]_i_2_n_0 ),
        .D(p_0_in__1[0]),
        .Q(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [0]),
        .R(\SATURATE_COUNTER[2].s_counters[2][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[2].s_counters_reg[2][1] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[2].s_counters[2][7]_i_2_n_0 ),
        .D(p_0_in__1[1]),
        .Q(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [1]),
        .R(\SATURATE_COUNTER[2].s_counters[2][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[2].s_counters_reg[2][2] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[2].s_counters[2][7]_i_2_n_0 ),
        .D(p_0_in__1[2]),
        .Q(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [2]),
        .R(\SATURATE_COUNTER[2].s_counters[2][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[2].s_counters_reg[2][3] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[2].s_counters[2][7]_i_2_n_0 ),
        .D(p_0_in__1[3]),
        .Q(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [3]),
        .R(\SATURATE_COUNTER[2].s_counters[2][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[2].s_counters_reg[2][4] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[2].s_counters[2][7]_i_2_n_0 ),
        .D(p_0_in__1[4]),
        .Q(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [4]),
        .R(\SATURATE_COUNTER[2].s_counters[2][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[2].s_counters_reg[2][5] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[2].s_counters[2][7]_i_2_n_0 ),
        .D(p_0_in__1[5]),
        .Q(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [5]),
        .R(\SATURATE_COUNTER[2].s_counters[2][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[2].s_counters_reg[2][6] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[2].s_counters[2][7]_i_2_n_0 ),
        .D(p_0_in__1[6]),
        .Q(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [6]),
        .R(\SATURATE_COUNTER[2].s_counters[2][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[2].s_counters_reg[2][7] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[2].s_counters[2][7]_i_2_n_0 ),
        .D(p_0_in__1[7]),
        .Q(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [7]),
        .R(\SATURATE_COUNTER[2].s_counters[2][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4444444F44444444)) 
    \SATURATE_COUNTER[2].switchOut[2]_i_1 
       (.I0(sample_pulse_reg_n_0),
        .I1(D[2]),
        .I2(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [2]),
        .I3(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [1]),
        .I4(\SATURATE_COUNTER[2].s_counters_reg[2]_2 [0]),
        .I5(\SATURATE_COUNTER[2].s_counters[2][7]_i_4_n_0 ),
        .O(\SATURATE_COUNTER[2].switchOut[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[2].switchOut_reg[2] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\SATURATE_COUNTER[2].switchOut[2]_i_1_n_0 ),
        .Q(D[2]),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \SATURATE_COUNTER[3].s_counters[3][0]_i_1 
       (.I0(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [0]),
        .O(p_0_in__2[0]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \SATURATE_COUNTER[3].s_counters[3][1]_i_1 
       (.I0(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [0]),
        .I1(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [1]),
        .O(p_0_in__2[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \SATURATE_COUNTER[3].s_counters[3][2]_i_1 
       (.I0(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [2]),
        .I1(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [1]),
        .I2(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [0]),
        .O(p_0_in__2[2]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \SATURATE_COUNTER[3].s_counters[3][3]_i_1 
       (.I0(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [3]),
        .I1(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [2]),
        .I2(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [0]),
        .I3(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [1]),
        .O(p_0_in__2[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \SATURATE_COUNTER[3].s_counters[3][4]_i_1 
       (.I0(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [2]),
        .I1(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [0]),
        .I2(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [1]),
        .I3(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [3]),
        .I4(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [4]),
        .O(p_0_in__2[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \SATURATE_COUNTER[3].s_counters[3][5]_i_1 
       (.I0(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [5]),
        .I1(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [2]),
        .I2(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [0]),
        .I3(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [1]),
        .I4(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [3]),
        .I5(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [4]),
        .O(p_0_in__2[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \SATURATE_COUNTER[3].s_counters[3][6]_i_1 
       (.I0(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [6]),
        .I1(\SATURATE_COUNTER[3].s_counters[3][7]_i_5_n_0 ),
        .I2(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [5]),
        .O(p_0_in__2[6]));
  LUT2 #(
    .INIT(4'h2)) 
    \SATURATE_COUNTER[3].s_counters[3][7]_i_1 
       (.I0(sample_pulse_reg_n_0),
        .I1(Q[3]),
        .O(\SATURATE_COUNTER[3].s_counters[3][7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAA8AAAA)) 
    \SATURATE_COUNTER[3].s_counters[3][7]_i_2 
       (.I0(sample_pulse_reg_n_0),
        .I1(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [2]),
        .I2(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [1]),
        .I3(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [0]),
        .I4(\SATURATE_COUNTER[3].s_counters[3][7]_i_4_n_0 ),
        .O(\SATURATE_COUNTER[3].s_counters[3][7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \SATURATE_COUNTER[3].s_counters[3][7]_i_3 
       (.I0(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [7]),
        .I1(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [5]),
        .I2(\SATURATE_COUNTER[3].s_counters[3][7]_i_5_n_0 ),
        .I3(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [6]),
        .O(p_0_in__2[7]));
  LUT6 #(
    .INIT(64'h0020000000000000)) 
    \SATURATE_COUNTER[3].s_counters[3][7]_i_4 
       (.I0(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [3]),
        .I1(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [4]),
        .I2(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [6]),
        .I3(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [5]),
        .I4(Q[3]),
        .I5(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [7]),
        .O(\SATURATE_COUNTER[3].s_counters[3][7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \SATURATE_COUNTER[3].s_counters[3][7]_i_5 
       (.I0(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [4]),
        .I1(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [3]),
        .I2(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [1]),
        .I3(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [0]),
        .I4(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [2]),
        .O(\SATURATE_COUNTER[3].s_counters[3][7]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[3].s_counters_reg[3][0] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[3].s_counters[3][7]_i_2_n_0 ),
        .D(p_0_in__2[0]),
        .Q(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [0]),
        .R(\SATURATE_COUNTER[3].s_counters[3][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[3].s_counters_reg[3][1] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[3].s_counters[3][7]_i_2_n_0 ),
        .D(p_0_in__2[1]),
        .Q(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [1]),
        .R(\SATURATE_COUNTER[3].s_counters[3][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[3].s_counters_reg[3][2] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[3].s_counters[3][7]_i_2_n_0 ),
        .D(p_0_in__2[2]),
        .Q(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [2]),
        .R(\SATURATE_COUNTER[3].s_counters[3][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[3].s_counters_reg[3][3] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[3].s_counters[3][7]_i_2_n_0 ),
        .D(p_0_in__2[3]),
        .Q(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [3]),
        .R(\SATURATE_COUNTER[3].s_counters[3][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[3].s_counters_reg[3][4] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[3].s_counters[3][7]_i_2_n_0 ),
        .D(p_0_in__2[4]),
        .Q(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [4]),
        .R(\SATURATE_COUNTER[3].s_counters[3][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[3].s_counters_reg[3][5] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[3].s_counters[3][7]_i_2_n_0 ),
        .D(p_0_in__2[5]),
        .Q(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [5]),
        .R(\SATURATE_COUNTER[3].s_counters[3][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[3].s_counters_reg[3][6] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[3].s_counters[3][7]_i_2_n_0 ),
        .D(p_0_in__2[6]),
        .Q(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [6]),
        .R(\SATURATE_COUNTER[3].s_counters[3][7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[3].s_counters_reg[3][7] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\SATURATE_COUNTER[3].s_counters[3][7]_i_2_n_0 ),
        .D(p_0_in__2[7]),
        .Q(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [7]),
        .R(\SATURATE_COUNTER[3].s_counters[3][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4444444F44444444)) 
    \SATURATE_COUNTER[3].switchOut[3]_i_1 
       (.I0(sample_pulse_reg_n_0),
        .I1(D[3]),
        .I2(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [2]),
        .I3(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [1]),
        .I4(\SATURATE_COUNTER[3].s_counters_reg[3]_3 [0]),
        .I5(\SATURATE_COUNTER[3].s_counters[3][7]_i_4_n_0 ),
        .O(\SATURATE_COUNTER[3].switchOut[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SATURATE_COUNTER[3].switchOut_reg[3] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\SATURATE_COUNTER[3].switchOut[3]_i_1_n_0 ),
        .Q(D[3]),
        .R(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT2 #(
    .INIT(4'h2)) 
    \address_rep[9]_i_5 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .O(\SATURATE_COUNTER[1].switchOut_reg[1]_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \current_state[2]_i_3 
       (.I0(D[2]),
        .I1(\current_state_reg[2] [2]),
        .O(\SATURATE_COUNTER[2].switchOut_reg[2]_0 ));
  LUT4 #(
    .INIT(16'hDF20)) 
    \cycles[10]_i_6 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .I2(SWITCHES_IBUF),
        .I3(cycles_reg[7]),
        .O(\cycles[10]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hDF20)) 
    \cycles[10]_i_7 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .I2(SWITCHES_IBUF),
        .I3(cycles_reg[6]),
        .O(\cycles[10]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hDF20)) 
    \cycles[10]_i_8 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .I2(SWITCHES_IBUF),
        .I3(cycles_reg[5]),
        .O(\cycles[10]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hDF20)) 
    \cycles[10]_i_9 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .I2(SWITCHES_IBUF),
        .I3(cycles_reg[4]),
        .O(\cycles[10]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'h20DF)) 
    \cycles[14]_i_3 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .I2(SWITCHES_IBUF),
        .I3(cycles_reg[11]),
        .O(\cycles[14]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h20DF)) 
    \cycles[14]_i_4 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .I2(SWITCHES_IBUF),
        .I3(cycles_reg[10]),
        .O(\cycles[14]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hDF20)) 
    \cycles[14]_i_5 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .I2(SWITCHES_IBUF),
        .I3(cycles_reg[9]),
        .O(\cycles[14]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h20DF)) 
    \cycles[14]_i_6 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .I2(SWITCHES_IBUF),
        .I3(cycles_reg[8]),
        .O(\cycles[14]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hDF20)) 
    \cycles[18]_i_4 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .I2(SWITCHES_IBUF),
        .I3(cycles_reg[15]),
        .O(\cycles[18]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hDF20)) 
    \cycles[18]_i_5 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .I2(SWITCHES_IBUF),
        .I3(cycles_reg[14]),
        .O(\cycles[18]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h20DF)) 
    \cycles[18]_i_6 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .I2(SWITCHES_IBUF),
        .I3(cycles_reg[13]),
        .O(\cycles[18]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h20DF)) 
    \cycles[18]_i_7 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .I2(SWITCHES_IBUF),
        .I3(cycles_reg[12]),
        .O(\cycles[18]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hA6AA)) 
    \cycles[22]_i_3 
       (.I0(cycles_reg[17]),
        .I1(D[1]),
        .I2(\current_state_reg[2] [1]),
        .I3(SWITCHES_IBUF),
        .O(\cycles[22]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hDF20)) 
    \cycles[22]_i_4 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .I2(SWITCHES_IBUF),
        .I3(cycles_reg[16]),
        .O(\cycles[22]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hDF20)) 
    \cycles[6]_i_10 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .I2(SWITCHES_IBUF),
        .I3(cycles_reg[0]),
        .O(\cycles[6]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'hDF)) 
    \cycles[6]_i_3 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .I2(SWITCHES_IBUF),
        .O(\cycles[6]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h20DF)) 
    \cycles[6]_i_7 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .I2(SWITCHES_IBUF),
        .I3(cycles_reg[3]),
        .O(\cycles[6]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hDF20)) 
    \cycles[6]_i_8 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .I2(SWITCHES_IBUF),
        .I3(cycles_reg[2]),
        .O(\cycles[6]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hDF20)) 
    \cycles[6]_i_9 
       (.I0(D[1]),
        .I1(\current_state_reg[2] [1]),
        .I2(SWITCHES_IBUF),
        .I3(cycles_reg[1]),
        .O(\cycles[6]_i_9_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \cycles_reg[10]_i_1 
       (.CI(\cycles_reg[6]_i_2_n_0 ),
        .CO({\cycles_reg[10]_i_1_n_0 ,\cycles_reg[10]_i_1_n_1 ,\cycles_reg[10]_i_1_n_2 ,\cycles_reg[10]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI(\cycles_reg[13] ),
        .O(\cycles_reg[9] ),
        .S({\cycles[10]_i_6_n_0 ,\cycles[10]_i_7_n_0 ,\cycles[10]_i_8_n_0 ,\cycles[10]_i_9_n_0 }));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \cycles_reg[14]_i_1 
       (.CI(\cycles_reg[10]_i_1_n_0 ),
        .CO({\cycles_reg[14]_i_1_n_0 ,\cycles_reg[14]_i_1_n_1 ,\cycles_reg[14]_i_1_n_2 ,\cycles_reg[14]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({cycles_reg[11:10],\cycles_reg[17]_0 ,cycles_reg[8]}),
        .O(\cycles_reg[17] ),
        .S({\cycles[14]_i_3_n_0 ,\cycles[14]_i_4_n_0 ,\cycles[14]_i_5_n_0 ,\cycles[14]_i_6_n_0 }));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \cycles_reg[18]_i_1 
       (.CI(\cycles_reg[14]_i_1_n_0 ),
        .CO({\cycles_reg[18]_i_1_n_0 ,\cycles_reg[18]_i_1_n_1 ,\cycles_reg[18]_i_1_n_2 ,\cycles_reg[18]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\cycles_reg[21] ,cycles_reg[13:12]}),
        .O(\cycles_reg[19] ),
        .S({\cycles[18]_i_4_n_0 ,\cycles[18]_i_5_n_0 ,\cycles[18]_i_6_n_0 ,\cycles[18]_i_7_n_0 }));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \cycles_reg[22]_i_1 
       (.CI(\cycles_reg[18]_i_1_n_0 ),
        .CO(\cycles_reg[22]_i_1_n_3 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\cycles_reg[23] }),
        .O(\cycles_reg[19]_0 ),
        .S({\<const0> ,\<const0> ,\cycles[22]_i_3_n_0 ,\cycles[22]_i_4_n_0 }));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \cycles_reg[6]_i_2 
       (.CI(\<const0> ),
        .CO({\cycles_reg[6]_i_2_n_0 ,\cycles_reg[6]_i_2_n_1 ,\cycles_reg[6]_i_2_n_2 ,\cycles_reg[6]_i_2_n_3 }),
        .CYINIT(\cycles[6]_i_3_n_0 ),
        .DI({cycles_reg[3],DI}),
        .O(O),
        .S({\cycles[6]_i_7_n_0 ,\cycles[6]_i_8_n_0 ,\cycles[6]_i_9_n_0 ,\cycles[6]_i_10_n_0 }));
  CARRY4 sample_counter0_carry
       (.CI(\<const0> ),
        .CO({sample_counter0_carry_n_0,sample_counter0_carry_n_1,sample_counter0_carry_n_2,sample_counter0_carry_n_3}),
        .CYINIT(sample_counter[0]),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[4:1]),
        .S(sample_counter[4:1]));
  CARRY4 sample_counter0_carry__0
       (.CI(sample_counter0_carry_n_0),
        .CO({sample_counter0_carry__0_n_0,sample_counter0_carry__0_n_1,sample_counter0_carry__0_n_2,sample_counter0_carry__0_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[8:5]),
        .S(sample_counter[8:5]));
  CARRY4 sample_counter0_carry__1
       (.CI(sample_counter0_carry__0_n_0),
        .CO({sample_counter0_carry__1_n_0,sample_counter0_carry__1_n_1,sample_counter0_carry__1_n_2,sample_counter0_carry__1_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[12:9]),
        .S(sample_counter[12:9]));
  CARRY4 sample_counter0_carry__2
       (.CI(sample_counter0_carry__1_n_0),
        .CO({sample_counter0_carry__2_n_2,sample_counter0_carry__2_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(data0[15:13]),
        .S({\<const0> ,sample_counter[15:13]}));
  LUT2 #(
    .INIT(4'h2)) 
    \sample_counter[0]_i_1 
       (.I0(\sample_counter[0]_i_2_n_0 ),
        .I1(sample_counter[0]),
        .O(sample_counter_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEFFF)) 
    \sample_counter[0]_i_2 
       (.I0(\sample_counter[0]_i_3_n_0 ),
        .I1(\sample_counter[0]_i_4_n_0 ),
        .I2(sample_counter[15]),
        .I3(sample_counter[14]),
        .I4(sample_counter[1]),
        .I5(\sample_counter[0]_i_5_n_0 ),
        .O(\sample_counter[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \sample_counter[0]_i_3 
       (.I0(sample_counter[7]),
        .I1(sample_counter[6]),
        .I2(sample_counter[9]),
        .I3(sample_counter[8]),
        .O(\sample_counter[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \sample_counter[0]_i_4 
       (.I0(sample_counter[2]),
        .I1(sample_counter[3]),
        .I2(sample_counter[5]),
        .I3(sample_counter[4]),
        .O(\sample_counter[0]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hDFFF)) 
    \sample_counter[0]_i_5 
       (.I0(sample_counter[10]),
        .I1(sample_counter[11]),
        .I2(sample_counter[13]),
        .I3(sample_counter[12]),
        .O(\sample_counter[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \sample_counter[15]_i_1 
       (.I0(\sample_counter[0]_i_2_n_0 ),
        .I1(sample_counter[0]),
        .O(\sample_counter[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_counter_reg[0] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(sample_counter_0),
        .Q(sample_counter[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_counter_reg[10] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(data0[10]),
        .Q(sample_counter[10]),
        .R(\sample_counter[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_counter_reg[11] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(data0[11]),
        .Q(sample_counter[11]),
        .R(\sample_counter[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_counter_reg[12] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(data0[12]),
        .Q(sample_counter[12]),
        .R(\sample_counter[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_counter_reg[13] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(data0[13]),
        .Q(sample_counter[13]),
        .R(\sample_counter[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_counter_reg[14] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(data0[14]),
        .Q(sample_counter[14]),
        .R(\sample_counter[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_counter_reg[15] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(data0[15]),
        .Q(sample_counter[15]),
        .R(\sample_counter[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_counter_reg[1] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(data0[1]),
        .Q(sample_counter[1]),
        .R(\sample_counter[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_counter_reg[2] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(data0[2]),
        .Q(sample_counter[2]),
        .R(\sample_counter[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_counter_reg[3] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(data0[3]),
        .Q(sample_counter[3]),
        .R(\sample_counter[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_counter_reg[4] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(data0[4]),
        .Q(sample_counter[4]),
        .R(\sample_counter[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_counter_reg[5] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(data0[5]),
        .Q(sample_counter[5]),
        .R(\sample_counter[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_counter_reg[6] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(data0[6]),
        .Q(sample_counter[6]),
        .R(\sample_counter[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_counter_reg[7] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(data0[7]),
        .Q(sample_counter[7]),
        .R(\sample_counter[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_counter_reg[8] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(data0[8]),
        .Q(sample_counter[8]),
        .R(\sample_counter[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sample_counter_reg[9] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(data0[9]),
        .Q(sample_counter[9]),
        .R(\sample_counter[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    sample_pulse_reg
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\sample_counter[15]_i_1_n_0 ),
        .Q(sample_pulse_reg_n_0),
        .R(\<const0> ));
  LUT2 #(
    .INIT(4'h2)) 
    serial_out_reg_i_1
       (.I0(D[0]),
        .I1(\current_state_reg[2] [0]),
        .O(\SATURATE_COUNTER[0].switchOut_reg[0]_0 ));
endmodule

module edge_detector
   (\prev_reg[1]_0 ,
    Q,
    DI,
    \prev_reg[1]_1 ,
    \prev_reg[1]_2 ,
    \prev_reg[1]_3 ,
    SWITCHES_IBUF,
    D,
    CLK_125MHZ_FPGA_IBUF_BUFG);
  output [0:0]\prev_reg[1]_0 ;
  output [3:0]Q;
  output [2:0]DI;
  output [3:0]\prev_reg[1]_1 ;
  output [0:0]\prev_reg[1]_2 ;
  output [1:0]\prev_reg[1]_3 ;
  input [0:0]SWITCHES_IBUF;
  input [3:0]D;
  input CLK_125MHZ_FPGA_IBUF_BUFG;

  wire \<const0> ;
  wire \<const1> ;
  wire CLK_125MHZ_FPGA_IBUF_BUFG;
  wire [3:0]D;
  wire [2:0]DI;
  wire [3:0]Q;
  wire [0:0]SWITCHES_IBUF;
  wire [0:0]\prev_reg[1]_0 ;
  wire [3:0]\prev_reg[1]_1 ;
  wire [0:0]\prev_reg[1]_2 ;
  wire [1:0]\prev_reg[1]_3 ;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT3 #(
    .INIT(8'h20)) 
    \cycles[10]_i_2 
       (.I0(SWITCHES_IBUF),
        .I1(Q[1]),
        .I2(D[1]),
        .O(\prev_reg[1]_1 [3]));
  LUT3 #(
    .INIT(8'h20)) 
    \cycles[10]_i_3 
       (.I0(SWITCHES_IBUF),
        .I1(Q[1]),
        .I2(D[1]),
        .O(\prev_reg[1]_1 [2]));
  LUT3 #(
    .INIT(8'h20)) 
    \cycles[10]_i_4 
       (.I0(SWITCHES_IBUF),
        .I1(Q[1]),
        .I2(D[1]),
        .O(\prev_reg[1]_1 [1]));
  LUT3 #(
    .INIT(8'h20)) 
    \cycles[10]_i_5 
       (.I0(SWITCHES_IBUF),
        .I1(Q[1]),
        .I2(D[1]),
        .O(\prev_reg[1]_1 [0]));
  LUT3 #(
    .INIT(8'h20)) 
    \cycles[14]_i_2 
       (.I0(SWITCHES_IBUF),
        .I1(Q[1]),
        .I2(D[1]),
        .O(\prev_reg[1]_2 ));
  LUT3 #(
    .INIT(8'h20)) 
    \cycles[18]_i_2 
       (.I0(SWITCHES_IBUF),
        .I1(Q[1]),
        .I2(D[1]),
        .O(\prev_reg[1]_3 [1]));
  LUT3 #(
    .INIT(8'h20)) 
    \cycles[18]_i_3 
       (.I0(SWITCHES_IBUF),
        .I1(Q[1]),
        .I2(D[1]),
        .O(\prev_reg[1]_3 [0]));
  LUT3 #(
    .INIT(8'h20)) 
    \cycles[22]_i_2 
       (.I0(SWITCHES_IBUF),
        .I1(Q[1]),
        .I2(D[1]),
        .O(\prev_reg[1]_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \cycles[6]_i_4 
       (.I0(SWITCHES_IBUF),
        .I1(Q[1]),
        .I2(D[1]),
        .O(DI[2]));
  LUT3 #(
    .INIT(8'h20)) 
    \cycles[6]_i_5 
       (.I0(SWITCHES_IBUF),
        .I1(Q[1]),
        .I2(D[1]),
        .O(DI[1]));
  LUT3 #(
    .INIT(8'h20)) 
    \cycles[6]_i_6 
       (.I0(SWITCHES_IBUF),
        .I1(Q[1]),
        .I2(D[1]),
        .O(DI[0]));
  FDRE #(
    .INIT(1'b0)) 
    \prev_reg[0] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(D[0]),
        .Q(Q[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \prev_reg[1] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(D[1]),
        .Q(Q[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \prev_reg[2] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(D[2]),
        .Q(Q[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \prev_reg[3] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(D[3]),
        .Q(Q[3]),
        .R(\<const0> ));
endmodule

module music_streamer
   (cycles_reg,
    in_good,
    \address_reg_rep[6]_0 ,
    \address_reg_rep[6]_1 ,
    LEDS_OBUF,
    \address_reg_rep[7]_0 ,
    \address_reg_rep[6]_2 ,
    \address_reg_rep[6]_3 ,
    \address_reg_rep[7]_1 ,
    \address_reg_rep[6]_4 ,
    \address_reg_rep[7]_2 ,
    \address_reg_rep[7]_3 ,
    \address_reg_rep[6]_5 ,
    \address_reg_rep[6]_6 ,
    \address_reg_rep[6]_7 ,
    \address_reg_rep[6]_8 ,
    \address_reg_rep[7]_4 ,
    \address_reg_rep[6]_9 ,
    \address_reg_rep[7]_5 ,
    \BUTTONS[0] ,
    S,
    \counter_reg[16] ,
    \counter_reg[13] ,
    \counter_reg[15] ,
    \counter_reg[7] ,
    \counter_reg[3] ,
    \cycles_reg[6]_0 ,
    O,
    CLK,
    \cycles_reg[13]_0 ,
    \cycles_reg[17]_0 ,
    \cycles_reg[21]_0 ,
    \cycles_reg[23]_0 ,
    Q,
    D,
    \address_reg_rep[0]_0 ,
    \current_state_reg[2]_0 ,
    out);
  output [17:0]cycles_reg;
  output in_good;
  output \address_reg_rep[6]_0 ;
  output \address_reg_rep[6]_1 ;
  output [2:0]LEDS_OBUF;
  output \address_reg_rep[7]_0 ;
  output \address_reg_rep[6]_2 ;
  output \address_reg_rep[6]_3 ;
  output \address_reg_rep[7]_1 ;
  output \address_reg_rep[6]_4 ;
  output \address_reg_rep[7]_2 ;
  output \address_reg_rep[7]_3 ;
  output \address_reg_rep[6]_5 ;
  output \address_reg_rep[6]_6 ;
  output \address_reg_rep[6]_7 ;
  output \address_reg_rep[6]_8 ;
  output \address_reg_rep[7]_4 ;
  output \address_reg_rep[6]_9 ;
  output \address_reg_rep[7]_5 ;
  output \BUTTONS[0] ;
  output [2:0]S;
  output [1:0]\counter_reg[16] ;
  output [0:0]\counter_reg[13] ;
  output [0:0]\counter_reg[15] ;
  output [1:0]\counter_reg[7] ;
  output [0:0]\counter_reg[3] ;
  input [0:0]\cycles_reg[6]_0 ;
  input [3:0]O;
  input CLK;
  input [3:0]\cycles_reg[13]_0 ;
  input [3:0]\cycles_reg[17]_0 ;
  input [3:0]\cycles_reg[21]_0 ;
  input [1:0]\cycles_reg[23]_0 ;
  input [2:0]Q;
  input [2:0]D;
  input \address_reg_rep[0]_0 ;
  input \current_state_reg[2]_0 ;
  input [14:0]out;

  wire \<const0> ;
  wire \<const1> ;
  wire \BUTTONS[0] ;
  wire CLK;
  wire [2:0]D;
  wire [2:0]LEDS_OBUF;
  wire [3:0]O;
  wire [2:0]Q;
  wire [2:0]S;
  wire [9:0]address;
  wire address0__0_i_1_n_0;
  wire address0__0_i_2_n_0;
  wire address0__0_i_3_n_0;
  wire address0__0_i_4_n_0;
  wire address0__0_n_0;
  wire address0__0_n_1;
  wire address0__0_n_2;
  wire address0__0_n_3;
  wire address0__1_i_1_n_0;
  wire address0_carry__0_i_1_n_0;
  wire address0_carry__0_i_2_n_0;
  wire address0_carry__0_i_3_n_0;
  wire address0_carry__0_i_4_n_0;
  wire address0_carry__0_n_0;
  wire address0_carry__0_n_1;
  wire address0_carry__0_n_2;
  wire address0_carry__0_n_3;
  wire address0_carry__1_i_1_n_0;
  wire address0_carry_i_1_n_0;
  wire address0_carry_i_2_n_0;
  wire address0_carry_i_3_n_0;
  wire address0_carry_i_4_n_0;
  wire address0_carry_i_5_n_0;
  wire address0_carry_n_0;
  wire address0_carry_n_1;
  wire address0_carry_n_2;
  wire address0_carry_n_3;
  wire address0_i_1_n_0;
  wire address0_i_2_n_0;
  wire address0_i_3_n_0;
  wire address0_i_4_n_0;
  wire address0_i_5_n_0;
  wire address0_n_0;
  wire address0_n_1;
  wire address0_n_2;
  wire address0_n_3;
  wire address12_out;
  wire \address[1]_i_1_n_0 ;
  wire \address[2]_i_1_n_0 ;
  wire \address[3]_i_1_n_0 ;
  wire \address[4]_i_1_n_0 ;
  wire \address[5]_i_1_n_0 ;
  wire \address[6]_i_1_n_0 ;
  wire \address[7]_i_1_n_0 ;
  wire \address[8]_i_1_n_0 ;
  wire \address[9]_i_1_n_0 ;
  wire [9:1]address__0;
  wire [9:1]address__1;
  wire [9:0]address_reg;
  wire \address_reg_rep[0]_0 ;
  wire \address_reg_rep[6]_0 ;
  wire \address_reg_rep[6]_1 ;
  wire \address_reg_rep[6]_2 ;
  wire \address_reg_rep[6]_3 ;
  wire \address_reg_rep[6]_4 ;
  wire \address_reg_rep[6]_5 ;
  wire \address_reg_rep[6]_6 ;
  wire \address_reg_rep[6]_7 ;
  wire \address_reg_rep[6]_8 ;
  wire \address_reg_rep[6]_9 ;
  wire \address_reg_rep[7]_0 ;
  wire \address_reg_rep[7]_1 ;
  wire \address_reg_rep[7]_2 ;
  wire \address_reg_rep[7]_3 ;
  wire \address_reg_rep[7]_4 ;
  wire \address_reg_rep[7]_5 ;
  wire \address_rep[0]_i_1_n_0 ;
  wire \address_rep[1]_i_1_n_0 ;
  wire \address_rep[2]_i_1_n_0 ;
  wire \address_rep[3]_i_1_n_0 ;
  wire \address_rep[4]_i_1_n_0 ;
  wire \address_rep[5]_i_1_n_0 ;
  wire \address_rep[6]_i_1_n_0 ;
  wire \address_rep[7]_i_1_n_0 ;
  wire \address_rep[8]_i_1_n_0 ;
  wire \address_rep[9]_i_1_n_0 ;
  wire \address_rep[9]_i_2_n_0 ;
  wire \address_rep[9]_i_3_n_0 ;
  wire \address_rep[9]_i_4_n_0 ;
  wire \address_rep[9]_i_7_n_0 ;
  wire \address_rep[9]_i_8_n_0 ;
  wire \address_rep[9]_i_9_n_0 ;
  wire count;
  wire count0_carry__0_i_1_n_0;
  wire count0_carry__0_i_2_n_0;
  wire count0_carry__0_i_3_n_0;
  wire count0_carry__0_i_4_n_0;
  wire count0_carry__0_i_5_n_0;
  wire count0_carry__0_i_6_n_0;
  wire count0_carry__0_i_7_n_0;
  wire count0_carry__0_i_8_n_0;
  wire count0_carry__0_n_0;
  wire count0_carry__0_n_1;
  wire count0_carry__0_n_2;
  wire count0_carry__0_n_3;
  wire count0_carry__1_i_1_n_0;
  wire count0_carry__1_i_2_n_0;
  wire count0_carry__1_i_3_n_0;
  wire count0_carry__1_i_4_n_0;
  wire count0_carry__1_i_5_n_0;
  wire count0_carry__1_i_6_n_0;
  wire count0_carry__1_i_7_n_0;
  wire count0_carry__1_i_8_n_0;
  wire count0_carry__1_n_0;
  wire count0_carry__1_n_1;
  wire count0_carry__1_n_2;
  wire count0_carry__1_n_3;
  wire count0_carry_i_1_n_0;
  wire count0_carry_i_2_n_0;
  wire count0_carry_i_3_n_0;
  wire count0_carry_i_4_n_0;
  wire count0_carry_i_5_n_0;
  wire count0_carry_i_6_n_0;
  wire count0_carry_i_7_n_0;
  wire count0_carry_i_8_n_0;
  wire count0_carry_n_0;
  wire count0_carry_n_1;
  wire count0_carry_n_2;
  wire count0_carry_n_3;
  wire \count[0]_i_1_n_0 ;
  wire \count[0]_i_4_n_0 ;
  wire [23:0]count_reg;
  wire \count_reg[0]_i_3_n_0 ;
  wire \count_reg[0]_i_3_n_1 ;
  wire \count_reg[0]_i_3_n_2 ;
  wire \count_reg[0]_i_3_n_3 ;
  wire \count_reg[0]_i_3_n_4 ;
  wire \count_reg[0]_i_3_n_5 ;
  wire \count_reg[0]_i_3_n_6 ;
  wire \count_reg[0]_i_3_n_7 ;
  wire \count_reg[12]_i_1_n_0 ;
  wire \count_reg[12]_i_1_n_1 ;
  wire \count_reg[12]_i_1_n_2 ;
  wire \count_reg[12]_i_1_n_3 ;
  wire \count_reg[12]_i_1_n_4 ;
  wire \count_reg[12]_i_1_n_5 ;
  wire \count_reg[12]_i_1_n_6 ;
  wire \count_reg[12]_i_1_n_7 ;
  wire \count_reg[16]_i_1_n_0 ;
  wire \count_reg[16]_i_1_n_1 ;
  wire \count_reg[16]_i_1_n_2 ;
  wire \count_reg[16]_i_1_n_3 ;
  wire \count_reg[16]_i_1_n_4 ;
  wire \count_reg[16]_i_1_n_5 ;
  wire \count_reg[16]_i_1_n_6 ;
  wire \count_reg[16]_i_1_n_7 ;
  wire \count_reg[20]_i_1_n_1 ;
  wire \count_reg[20]_i_1_n_2 ;
  wire \count_reg[20]_i_1_n_3 ;
  wire \count_reg[20]_i_1_n_4 ;
  wire \count_reg[20]_i_1_n_5 ;
  wire \count_reg[20]_i_1_n_6 ;
  wire \count_reg[20]_i_1_n_7 ;
  wire \count_reg[4]_i_1_n_0 ;
  wire \count_reg[4]_i_1_n_1 ;
  wire \count_reg[4]_i_1_n_2 ;
  wire \count_reg[4]_i_1_n_3 ;
  wire \count_reg[4]_i_1_n_4 ;
  wire \count_reg[4]_i_1_n_5 ;
  wire \count_reg[4]_i_1_n_6 ;
  wire \count_reg[4]_i_1_n_7 ;
  wire \count_reg[8]_i_1_n_0 ;
  wire \count_reg[8]_i_1_n_1 ;
  wire \count_reg[8]_i_1_n_2 ;
  wire \count_reg[8]_i_1_n_3 ;
  wire \count_reg[8]_i_1_n_4 ;
  wire \count_reg[8]_i_1_n_5 ;
  wire \count_reg[8]_i_1_n_6 ;
  wire \count_reg[8]_i_1_n_7 ;
  wire counter0_carry_i_51_n_0;
  wire [0:0]\counter_reg[13] ;
  wire [0:0]\counter_reg[15] ;
  wire [1:0]\counter_reg[16] ;
  wire [0:0]\counter_reg[3] ;
  wire [1:0]\counter_reg[7] ;
  wire [2:0]current_state;
  wire \current_state[0]_i_1_n_0 ;
  wire \current_state[1]_i_1_n_0 ;
  wire \current_state[2]_i_1_n_0 ;
  wire \current_state[2]_i_2_n_0 ;
  wire \current_state_reg[2]_0 ;
  wire cycles;
  wire [17:0]cycles_reg;
  wire [3:0]\cycles_reg[13]_0 ;
  wire [3:0]\cycles_reg[17]_0 ;
  wire [3:0]\cycles_reg[21]_0 ;
  wire [1:0]\cycles_reg[23]_0 ;
  wire [0:0]\cycles_reg[6]_0 ;
  wire in_good;
  wire in_good_i_3_n_0;
  wire in_good_i_4_n_0;
  wire in_good_i_5_n_0;
  wire in_good_i_6_n_0;
  wire memory_n_0;
  wire memory_n_1;
  wire memory_n_10;
  wire memory_n_11;
  wire memory_n_12;
  wire memory_n_13;
  wire memory_n_14;
  wire memory_n_15;
  wire memory_n_16;
  wire memory_n_17;
  wire memory_n_18;
  wire memory_n_19;
  wire memory_n_2;
  wire memory_n_20;
  wire memory_n_21;
  wire memory_n_22;
  wire memory_n_23;
  wire memory_n_24;
  wire memory_n_25;
  wire memory_n_26;
  wire memory_n_27;
  wire memory_n_28;
  wire memory_n_29;
  wire memory_n_3;
  wire memory_n_30;
  wire memory_n_31;
  wire memory_n_32;
  wire memory_n_33;
  wire memory_n_34;
  wire memory_n_35;
  wire memory_n_36;
  wire memory_n_37;
  wire memory_n_38;
  wire memory_n_39;
  wire memory_n_4;
  wire memory_n_40;
  wire memory_n_41;
  wire memory_n_42;
  wire memory_n_43;
  wire memory_n_44;
  wire memory_n_45;
  wire memory_n_46;
  wire memory_n_47;
  wire memory_n_48;
  wire memory_n_5;
  wire memory_n_6;
  wire memory_n_7;
  wire memory_n_8;
  wire memory_n_9;
  wire [14:0]out;

  GND GND
       (.G(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \LEDS_OBUF[0]_inst_i_1 
       (.I0(current_state[0]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(LEDS_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \LEDS_OBUF[1]_inst_i_1 
       (.I0(current_state[1]),
        .I1(current_state[2]),
        .I2(current_state[0]),
        .O(LEDS_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \LEDS_OBUF[2]_inst_i_1 
       (.I0(current_state[2]),
        .I1(current_state[0]),
        .I2(current_state[1]),
        .O(LEDS_OBUF[2]));
  VCC VCC
       (.P(\<const1> ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 address0
       (.CI(\<const0> ),
        .CO({address0_n_0,address0_n_1,address0_n_2,address0_n_3}),
        .CYINIT(address_reg[0]),
        .DI({address_reg[3:1],address0_i_1_n_0}),
        .O(address__0[4:1]),
        .S({address0_i_2_n_0,address0_i_3_n_0,address0_i_4_n_0,address0_i_5_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 address0__0
       (.CI(address0_n_0),
        .CO({address0__0_n_0,address0__0_n_1,address0__0_n_2,address0__0_n_3}),
        .CYINIT(\<const0> ),
        .DI(address_reg[7:4]),
        .O(address__0[8:5]),
        .S({address0__0_i_1_n_0,address0__0_i_2_n_0,address0__0_i_3_n_0,address0__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    address0__0_i_1
       (.I0(address_reg[7]),
        .I1(address_reg[8]),
        .O(address0__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    address0__0_i_2
       (.I0(address_reg[6]),
        .I1(address_reg[7]),
        .O(address0__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    address0__0_i_3
       (.I0(address_reg[5]),
        .I1(address_reg[6]),
        .O(address0__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    address0__0_i_4
       (.I0(address_reg[4]),
        .I1(address_reg[5]),
        .O(address0__0_i_4_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 address0__1
       (.CI(address0__0_n_0),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(address__0[9]),
        .S({\<const0> ,\<const0> ,\<const0> ,address0__1_i_1_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    address0__1_i_1
       (.I0(address_reg[8]),
        .I1(address_reg[9]),
        .O(address0__1_i_1_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 address0_carry
       (.CI(\<const0> ),
        .CO({address0_carry_n_0,address0_carry_n_1,address0_carry_n_2,address0_carry_n_3}),
        .CYINIT(address_reg[0]),
        .DI({address_reg[3:1],address0_carry_i_1_n_0}),
        .O(address__1[4:1]),
        .S({address0_carry_i_2_n_0,address0_carry_i_3_n_0,address0_carry_i_4_n_0,address0_carry_i_5_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 address0_carry__0
       (.CI(address0_carry_n_0),
        .CO({address0_carry__0_n_0,address0_carry__0_n_1,address0_carry__0_n_2,address0_carry__0_n_3}),
        .CYINIT(\<const0> ),
        .DI(address_reg[7:4]),
        .O(address__1[8:5]),
        .S({address0_carry__0_i_1_n_0,address0_carry__0_i_2_n_0,address0_carry__0_i_3_n_0,address0_carry__0_i_4_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    address0_carry__0_i_1
       (.I0(address_reg[7]),
        .I1(address_reg[8]),
        .O(address0_carry__0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    address0_carry__0_i_2
       (.I0(address_reg[6]),
        .I1(address_reg[7]),
        .O(address0_carry__0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    address0_carry__0_i_3
       (.I0(address_reg[5]),
        .I1(address_reg[6]),
        .O(address0_carry__0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    address0_carry__0_i_4
       (.I0(address_reg[4]),
        .I1(address_reg[5]),
        .O(address0_carry__0_i_4_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 address0_carry__1
       (.CI(address0_carry__0_n_0),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(address__1[9]),
        .S({\<const0> ,\<const0> ,\<const0> ,address0_carry__1_i_1_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    address0_carry__1_i_1
       (.I0(address_reg[8]),
        .I1(address_reg[9]),
        .O(address0_carry__1_i_1_n_0));
  LUT3 #(
    .INIT(8'h02)) 
    address0_carry_i_1
       (.I0(current_state[0]),
        .I1(current_state[1]),
        .I2(current_state[2]),
        .O(address0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    address0_carry_i_2
       (.I0(address_reg[3]),
        .I1(address_reg[4]),
        .O(address0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    address0_carry_i_3
       (.I0(address_reg[2]),
        .I1(address_reg[3]),
        .O(address0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    address0_carry_i_4
       (.I0(address_reg[1]),
        .I1(address_reg[2]),
        .O(address0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h5655)) 
    address0_carry_i_5
       (.I0(address_reg[1]),
        .I1(current_state[2]),
        .I2(current_state[1]),
        .I3(current_state[0]),
        .O(address0_carry_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    address0_i_1
       (.I0(address_reg[1]),
        .O(address0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    address0_i_2
       (.I0(address_reg[3]),
        .I1(address_reg[4]),
        .O(address0_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    address0_i_3
       (.I0(address_reg[2]),
        .I1(address_reg[3]),
        .O(address0_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    address0_i_4
       (.I0(address_reg[1]),
        .I1(address_reg[2]),
        .O(address0_i_4_n_0));
  LUT4 #(
    .INIT(16'h5655)) 
    address0_i_5
       (.I0(address_reg[1]),
        .I1(current_state[2]),
        .I2(current_state[1]),
        .I3(current_state[0]),
        .O(address0_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \address[1]_i_1 
       (.I0(address__1[1]),
        .I1(address12_out),
        .O(\address[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \address[2]_i_1 
       (.I0(address__1[2]),
        .I1(address12_out),
        .O(\address[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \address[3]_i_1 
       (.I0(address__1[3]),
        .I1(address12_out),
        .O(\address[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \address[4]_i_1 
       (.I0(address__1[4]),
        .I1(address12_out),
        .O(\address[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \address[5]_i_1 
       (.I0(address__1[5]),
        .I1(address12_out),
        .O(\address[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \address[6]_i_1 
       (.I0(address__1[6]),
        .I1(address12_out),
        .O(\address[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \address[7]_i_1 
       (.I0(address__1[7]),
        .I1(address12_out),
        .O(\address[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \address[8]_i_1 
       (.I0(address__1[8]),
        .I1(address12_out),
        .O(\address[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \address[9]_i_1 
       (.I0(address__1[9]),
        .I1(address12_out),
        .O(\address[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[0] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address_rep[0]_i_1_n_0 ),
        .Q(address_reg[0]),
        .R(\address_rep[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[1] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address[1]_i_1_n_0 ),
        .Q(address_reg[1]),
        .R(\address_rep[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[2] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address[2]_i_1_n_0 ),
        .Q(address_reg[2]),
        .R(\address_rep[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[3] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address[3]_i_1_n_0 ),
        .Q(address_reg[3]),
        .R(\address_rep[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[4] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address[4]_i_1_n_0 ),
        .Q(address_reg[4]),
        .R(\address_rep[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[5] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address[5]_i_1_n_0 ),
        .Q(address_reg[5]),
        .R(\address_rep[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[6] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address[6]_i_1_n_0 ),
        .Q(address_reg[6]),
        .R(\address_rep[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[7] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address[7]_i_1_n_0 ),
        .Q(address_reg[7]),
        .R(\address_rep[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[8] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address[8]_i_1_n_0 ),
        .Q(address_reg[8]),
        .R(\address_rep[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[9] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address[9]_i_1_n_0 ),
        .Q(address_reg[9]),
        .R(\address_rep[9]_i_1_n_0 ));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \address_reg_rep[0] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address_rep[0]_i_1_n_0 ),
        .Q(address[0]),
        .R(\address_rep[9]_i_1_n_0 ));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \address_reg_rep[1] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address_rep[1]_i_1_n_0 ),
        .Q(address[1]),
        .R(\address_rep[9]_i_1_n_0 ));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \address_reg_rep[2] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address_rep[2]_i_1_n_0 ),
        .Q(address[2]),
        .R(\address_rep[9]_i_1_n_0 ));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \address_reg_rep[3] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address_rep[3]_i_1_n_0 ),
        .Q(address[3]),
        .R(\address_rep[9]_i_1_n_0 ));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \address_reg_rep[4] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address_rep[4]_i_1_n_0 ),
        .Q(address[4]),
        .R(\address_rep[9]_i_1_n_0 ));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \address_reg_rep[5] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address_rep[5]_i_1_n_0 ),
        .Q(address[5]),
        .R(\address_rep[9]_i_1_n_0 ));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \address_reg_rep[6] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address_rep[6]_i_1_n_0 ),
        .Q(address[6]),
        .R(\address_rep[9]_i_1_n_0 ));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \address_reg_rep[7] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address_rep[7]_i_1_n_0 ),
        .Q(address[7]),
        .R(\address_rep[9]_i_1_n_0 ));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \address_reg_rep[8] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address_rep[8]_i_1_n_0 ),
        .Q(address[8]),
        .R(\address_rep[9]_i_1_n_0 ));
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \address_reg_rep[9] 
       (.C(CLK),
        .CE(\address_rep[9]_i_2_n_0 ),
        .D(\address_rep[9]_i_3_n_0 ),
        .Q(address[9]),
        .R(\address_rep[9]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \address_rep[0]_i_1 
       (.I0(address_reg[0]),
        .I1(address12_out),
        .O(\address_rep[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \address_rep[1]_i_1 
       (.I0(address12_out),
        .I1(address__0[1]),
        .O(\address_rep[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \address_rep[2]_i_1 
       (.I0(address__0[2]),
        .I1(address12_out),
        .O(\address_rep[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \address_rep[3]_i_1 
       (.I0(address12_out),
        .I1(address__0[3]),
        .O(\address_rep[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \address_rep[4]_i_1 
       (.I0(address12_out),
        .I1(address__0[4]),
        .O(\address_rep[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \address_rep[5]_i_1 
       (.I0(address12_out),
        .I1(address__0[5]),
        .O(\address_rep[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \address_rep[6]_i_1 
       (.I0(address12_out),
        .I1(address__0[6]),
        .O(\address_rep[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \address_rep[7]_i_1 
       (.I0(address12_out),
        .I1(address__0[7]),
        .O(\address_rep[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \address_rep[8]_i_1 
       (.I0(address__0[8]),
        .I1(address12_out),
        .O(\address_rep[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0004)) 
    \address_rep[9]_i_1 
       (.I0(\address_rep[9]_i_4_n_0 ),
        .I1(current_state[0]),
        .I2(current_state[1]),
        .I3(current_state[2]),
        .I4(\cycles_reg[6]_0 ),
        .O(\address_rep[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00140000)) 
    \address_rep[9]_i_2 
       (.I0(current_state[2]),
        .I1(current_state[1]),
        .I2(current_state[0]),
        .I3(\address_reg_rep[0]_0 ),
        .I4(count0_carry__1_n_0),
        .I5(address12_out),
        .O(\address_rep[9]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \address_rep[9]_i_3 
       (.I0(address__0[9]),
        .I1(address12_out),
        .O(\address_rep[9]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h1011111111111111)) 
    \address_rep[9]_i_4 
       (.I0(address_reg[9]),
        .I1(address_reg[8]),
        .I2(\address_rep[9]_i_7_n_0 ),
        .I3(address_reg[6]),
        .I4(address_reg[4]),
        .I5(address_reg[3]),
        .O(\address_rep[9]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000100000000)) 
    \address_rep[9]_i_6 
       (.I0(\address_rep[9]_i_8_n_0 ),
        .I1(address_reg[1]),
        .I2(address_reg[0]),
        .I3(address_reg[3]),
        .I4(address_reg[2]),
        .I5(\address_rep[9]_i_9_n_0 ),
        .O(address12_out));
  LUT4 #(
    .INIT(16'h777F)) 
    \address_rep[9]_i_7 
       (.I0(address_reg[7]),
        .I1(address_reg[5]),
        .I2(address_reg[2]),
        .I3(address_reg[1]),
        .O(\address_rep[9]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hFD)) 
    \address_rep[9]_i_8 
       (.I0(current_state[1]),
        .I1(current_state[0]),
        .I2(current_state[2]),
        .O(\address_rep[9]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \address_rep[9]_i_9 
       (.I0(address_reg[4]),
        .I1(address_reg[5]),
        .I2(address_reg[6]),
        .I3(address_reg[7]),
        .I4(address_reg[9]),
        .I5(address_reg[8]),
        .O(\address_rep[9]_i_9_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 count0_carry
       (.CI(\<const0> ),
        .CO({count0_carry_n_0,count0_carry_n_1,count0_carry_n_2,count0_carry_n_3}),
        .CYINIT(\<const1> ),
        .DI({count0_carry_i_1_n_0,count0_carry_i_2_n_0,count0_carry_i_3_n_0,count0_carry_i_4_n_0}),
        .S({count0_carry_i_5_n_0,count0_carry_i_6_n_0,count0_carry_i_7_n_0,count0_carry_i_8_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 count0_carry__0
       (.CI(count0_carry_n_0),
        .CO({count0_carry__0_n_0,count0_carry__0_n_1,count0_carry__0_n_2,count0_carry__0_n_3}),
        .CYINIT(\<const0> ),
        .DI({count0_carry__0_i_1_n_0,count0_carry__0_i_2_n_0,count0_carry__0_i_3_n_0,count0_carry__0_i_4_n_0}),
        .S({count0_carry__0_i_5_n_0,count0_carry__0_i_6_n_0,count0_carry__0_i_7_n_0,count0_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    count0_carry__0_i_1
       (.I0(count_reg[14]),
        .I1(cycles_reg[8]),
        .I2(cycles_reg[9]),
        .I3(count_reg[15]),
        .O(count0_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count0_carry__0_i_2
       (.I0(count_reg[12]),
        .I1(cycles_reg[6]),
        .I2(cycles_reg[7]),
        .I3(count_reg[13]),
        .O(count0_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count0_carry__0_i_3
       (.I0(count_reg[10]),
        .I1(cycles_reg[4]),
        .I2(cycles_reg[5]),
        .I3(count_reg[11]),
        .O(count0_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count0_carry__0_i_4
       (.I0(count_reg[8]),
        .I1(cycles_reg[2]),
        .I2(cycles_reg[3]),
        .I3(count_reg[9]),
        .O(count0_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count0_carry__0_i_5
       (.I0(count_reg[15]),
        .I1(cycles_reg[9]),
        .I2(cycles_reg[8]),
        .I3(count_reg[14]),
        .O(count0_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count0_carry__0_i_6
       (.I0(count_reg[13]),
        .I1(cycles_reg[7]),
        .I2(cycles_reg[6]),
        .I3(count_reg[12]),
        .O(count0_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count0_carry__0_i_7
       (.I0(count_reg[11]),
        .I1(cycles_reg[5]),
        .I2(cycles_reg[4]),
        .I3(count_reg[10]),
        .O(count0_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count0_carry__0_i_8
       (.I0(count_reg[9]),
        .I1(cycles_reg[3]),
        .I2(cycles_reg[2]),
        .I3(count_reg[8]),
        .O(count0_carry__0_i_8_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 count0_carry__1
       (.CI(count0_carry__0_n_0),
        .CO({count0_carry__1_n_0,count0_carry__1_n_1,count0_carry__1_n_2,count0_carry__1_n_3}),
        .CYINIT(\<const0> ),
        .DI({count0_carry__1_i_1_n_0,count0_carry__1_i_2_n_0,count0_carry__1_i_3_n_0,count0_carry__1_i_4_n_0}),
        .S({count0_carry__1_i_5_n_0,count0_carry__1_i_6_n_0,count0_carry__1_i_7_n_0,count0_carry__1_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    count0_carry__1_i_1
       (.I0(count_reg[22]),
        .I1(cycles_reg[16]),
        .I2(cycles_reg[17]),
        .I3(count_reg[23]),
        .O(count0_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count0_carry__1_i_2
       (.I0(count_reg[20]),
        .I1(cycles_reg[14]),
        .I2(cycles_reg[15]),
        .I3(count_reg[21]),
        .O(count0_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count0_carry__1_i_3
       (.I0(count_reg[18]),
        .I1(cycles_reg[12]),
        .I2(cycles_reg[13]),
        .I3(count_reg[19]),
        .O(count0_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count0_carry__1_i_4
       (.I0(count_reg[16]),
        .I1(cycles_reg[10]),
        .I2(cycles_reg[11]),
        .I3(count_reg[17]),
        .O(count0_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count0_carry__1_i_5
       (.I0(cycles_reg[17]),
        .I1(count_reg[23]),
        .I2(cycles_reg[16]),
        .I3(count_reg[22]),
        .O(count0_carry__1_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count0_carry__1_i_6
       (.I0(count_reg[21]),
        .I1(cycles_reg[15]),
        .I2(cycles_reg[14]),
        .I3(count_reg[20]),
        .O(count0_carry__1_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count0_carry__1_i_7
       (.I0(count_reg[19]),
        .I1(cycles_reg[13]),
        .I2(cycles_reg[12]),
        .I3(count_reg[18]),
        .O(count0_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count0_carry__1_i_8
       (.I0(count_reg[17]),
        .I1(cycles_reg[11]),
        .I2(cycles_reg[10]),
        .I3(count_reg[16]),
        .O(count0_carry__1_i_8_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    count0_carry_i_1
       (.I0(count_reg[6]),
        .I1(cycles_reg[0]),
        .I2(cycles_reg[1]),
        .I3(count_reg[7]),
        .O(count0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    count0_carry_i_2
       (.I0(count_reg[4]),
        .I1(count_reg[5]),
        .O(count0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    count0_carry_i_3
       (.I0(count_reg[2]),
        .I1(count_reg[3]),
        .O(count0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    count0_carry_i_4
       (.I0(count_reg[0]),
        .I1(count_reg[1]),
        .O(count0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    count0_carry_i_5
       (.I0(count_reg[7]),
        .I1(cycles_reg[1]),
        .I2(cycles_reg[0]),
        .I3(count_reg[6]),
        .O(count0_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    count0_carry_i_6
       (.I0(count_reg[5]),
        .I1(count_reg[4]),
        .O(count0_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    count0_carry_i_7
       (.I0(count_reg[3]),
        .I1(count_reg[2]),
        .O(count0_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    count0_carry_i_8
       (.I0(count_reg[1]),
        .I1(count_reg[0]),
        .O(count0_carry_i_8_n_0));
  LUT5 #(
    .INIT(32'hBAAABABA)) 
    \count[0]_i_1 
       (.I0(\cycles_reg[6]_0 ),
        .I1(LEDS_OBUF[1]),
        .I2(count0_carry__1_n_0),
        .I3(Q[0]),
        .I4(D[0]),
        .O(\count[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBBBBB0BB)) 
    \count[0]_i_2 
       (.I0(Q[0]),
        .I1(D[0]),
        .I2(current_state[0]),
        .I3(current_state[2]),
        .I4(current_state[1]),
        .O(count));
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_4 
       (.I0(count_reg[0]),
        .O(\count[0]_i_4_n_0 ));
  FDRE \count_reg[0] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[0]_i_3_n_7 ),
        .Q(count_reg[0]),
        .R(\count[0]_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \count_reg[0]_i_3 
       (.CI(\<const0> ),
        .CO({\count_reg[0]_i_3_n_0 ,\count_reg[0]_i_3_n_1 ,\count_reg[0]_i_3_n_2 ,\count_reg[0]_i_3_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .O({\count_reg[0]_i_3_n_4 ,\count_reg[0]_i_3_n_5 ,\count_reg[0]_i_3_n_6 ,\count_reg[0]_i_3_n_7 }),
        .S({count_reg[3:1],\count[0]_i_4_n_0 }));
  FDRE \count_reg[10] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[8]_i_1_n_5 ),
        .Q(count_reg[10]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[11] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[8]_i_1_n_4 ),
        .Q(count_reg[11]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[12] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[12]_i_1_n_7 ),
        .Q(count_reg[12]),
        .R(\count[0]_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \count_reg[12]_i_1 
       (.CI(\count_reg[8]_i_1_n_0 ),
        .CO({\count_reg[12]_i_1_n_0 ,\count_reg[12]_i_1_n_1 ,\count_reg[12]_i_1_n_2 ,\count_reg[12]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[12]_i_1_n_4 ,\count_reg[12]_i_1_n_5 ,\count_reg[12]_i_1_n_6 ,\count_reg[12]_i_1_n_7 }),
        .S(count_reg[15:12]));
  FDRE \count_reg[13] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[12]_i_1_n_6 ),
        .Q(count_reg[13]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[14] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[12]_i_1_n_5 ),
        .Q(count_reg[14]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[15] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[12]_i_1_n_4 ),
        .Q(count_reg[15]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[16] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[16]_i_1_n_7 ),
        .Q(count_reg[16]),
        .R(\count[0]_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \count_reg[16]_i_1 
       (.CI(\count_reg[12]_i_1_n_0 ),
        .CO({\count_reg[16]_i_1_n_0 ,\count_reg[16]_i_1_n_1 ,\count_reg[16]_i_1_n_2 ,\count_reg[16]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[16]_i_1_n_4 ,\count_reg[16]_i_1_n_5 ,\count_reg[16]_i_1_n_6 ,\count_reg[16]_i_1_n_7 }),
        .S(count_reg[19:16]));
  FDRE \count_reg[17] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[16]_i_1_n_6 ),
        .Q(count_reg[17]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[18] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[16]_i_1_n_5 ),
        .Q(count_reg[18]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[19] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[16]_i_1_n_4 ),
        .Q(count_reg[19]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[1] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[0]_i_3_n_6 ),
        .Q(count_reg[1]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[20] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[20]_i_1_n_7 ),
        .Q(count_reg[20]),
        .R(\count[0]_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \count_reg[20]_i_1 
       (.CI(\count_reg[16]_i_1_n_0 ),
        .CO({\count_reg[20]_i_1_n_1 ,\count_reg[20]_i_1_n_2 ,\count_reg[20]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[20]_i_1_n_4 ,\count_reg[20]_i_1_n_5 ,\count_reg[20]_i_1_n_6 ,\count_reg[20]_i_1_n_7 }),
        .S(count_reg[23:20]));
  FDRE \count_reg[21] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[20]_i_1_n_6 ),
        .Q(count_reg[21]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[22] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[20]_i_1_n_5 ),
        .Q(count_reg[22]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[23] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[20]_i_1_n_4 ),
        .Q(count_reg[23]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[2] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[0]_i_3_n_5 ),
        .Q(count_reg[2]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[3] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[0]_i_3_n_4 ),
        .Q(count_reg[3]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[4] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[4]_i_1_n_7 ),
        .Q(count_reg[4]),
        .R(\count[0]_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \count_reg[4]_i_1 
       (.CI(\count_reg[0]_i_3_n_0 ),
        .CO({\count_reg[4]_i_1_n_0 ,\count_reg[4]_i_1_n_1 ,\count_reg[4]_i_1_n_2 ,\count_reg[4]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[4]_i_1_n_4 ,\count_reg[4]_i_1_n_5 ,\count_reg[4]_i_1_n_6 ,\count_reg[4]_i_1_n_7 }),
        .S(count_reg[7:4]));
  FDRE \count_reg[5] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[4]_i_1_n_6 ),
        .Q(count_reg[5]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[6] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[4]_i_1_n_5 ),
        .Q(count_reg[6]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[7] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[4]_i_1_n_4 ),
        .Q(count_reg[7]),
        .R(\count[0]_i_1_n_0 ));
  FDRE \count_reg[8] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[8]_i_1_n_7 ),
        .Q(count_reg[8]),
        .R(\count[0]_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \count_reg[8]_i_1 
       (.CI(\count_reg[4]_i_1_n_0 ),
        .CO({\count_reg[8]_i_1_n_0 ,\count_reg[8]_i_1_n_1 ,\count_reg[8]_i_1_n_2 ,\count_reg[8]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\count_reg[8]_i_1_n_4 ,\count_reg[8]_i_1_n_5 ,\count_reg[8]_i_1_n_6 ,\count_reg[8]_i_1_n_7 }),
        .S(count_reg[11:8]));
  FDRE \count_reg[9] 
       (.C(CLK),
        .CE(count),
        .D(\count_reg[8]_i_1_n_6 ),
        .Q(count_reg[9]),
        .R(\count[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFE200E2)) 
    counter0_carry__0_i_10
       (.I0(memory_n_13),
        .I1(address[7]),
        .I2(memory_n_12),
        .I3(address[6]),
        .I4(memory_n_35),
        .I5(LEDS_OBUF[1]),
        .O(\address_reg_rep[7]_2 ));
  LUT5 #(
    .INIT(32'h00005808)) 
    counter0_carry__0_i_11
       (.I0(address[7]),
        .I1(memory_n_25),
        .I2(address[6]),
        .I3(memory_n_19),
        .I4(LEDS_OBUF[1]),
        .O(\address_reg_rep[7]_0 ));
  LUT6 #(
    .INIT(64'hE2E2E2E2E200E2E2)) 
    counter0_carry__0_i_12
       (.I0(memory_n_8),
        .I1(address[6]),
        .I2(memory_n_29),
        .I3(current_state[0]),
        .I4(current_state[2]),
        .I5(current_state[1]),
        .O(\address_reg_rep[6]_4 ));
  LUT6 #(
    .INIT(64'h00000000EEE222E2)) 
    counter0_carry__0_i_13
       (.I0(memory_n_4),
        .I1(address[6]),
        .I2(memory_n_31),
        .I3(address[7]),
        .I4(memory_n_32),
        .I5(LEDS_OBUF[1]),
        .O(\address_reg_rep[6]_3 ));
  LUT6 #(
    .INIT(64'h00000000FFE200E2)) 
    counter0_carry__0_i_14
       (.I0(memory_n_7),
        .I1(address[7]),
        .I2(memory_n_37),
        .I3(address[6]),
        .I4(memory_n_41),
        .I5(LEDS_OBUF[1]),
        .O(\address_reg_rep[7]_5 ));
  LUT6 #(
    .INIT(64'hE2E2E2E2E200E2E2)) 
    counter0_carry__0_i_15
       (.I0(memory_n_2),
        .I1(address[6]),
        .I2(memory_n_42),
        .I3(current_state[0]),
        .I4(current_state[2]),
        .I5(current_state[1]),
        .O(\address_reg_rep[6]_2 ));
  LUT4 #(
    .INIT(16'h9009)) 
    counter0_carry__0_i_6
       (.I0(\address_reg_rep[6]_4 ),
        .I1(out[10]),
        .I2(\address_reg_rep[7]_0 ),
        .I3(out[9]),
        .O(\counter_reg[13] ));
  LUT6 #(
    .INIT(64'hE2E2E2E2E200E2E2)) 
    counter0_carry__0_i_9
       (.I0(memory_n_28),
        .I1(address[6]),
        .I2(memory_n_33),
        .I3(current_state[0]),
        .I4(current_state[2]),
        .I5(current_state[1]),
        .O(\address_reg_rep[6]_9 ));
  LUT6 #(
    .INIT(64'h00000000FFE200E2)) 
    counter0_carry__1_i_10
       (.I0(memory_n_15),
        .I1(address[7]),
        .I2(memory_n_9),
        .I3(address[6]),
        .I4(memory_n_48),
        .I5(LEDS_OBUF[1]),
        .O(\address_reg_rep[7]_1 ));
  LUT6 #(
    .INIT(64'h00000000EEE222E2)) 
    counter0_carry__1_i_9
       (.I0(memory_n_22),
        .I1(address[6]),
        .I2(memory_n_39),
        .I3(address[7]),
        .I4(memory_n_40),
        .I5(LEDS_OBUF[1]),
        .O(\address_reg_rep[6]_7 ));
  LUT6 #(
    .INIT(64'h00000000EEE222E2)) 
    counter0_carry_i_10
       (.I0(memory_n_23),
        .I1(address[6]),
        .I2(memory_n_43),
        .I3(address[7]),
        .I4(memory_n_46),
        .I5(LEDS_OBUF[1]),
        .O(\address_reg_rep[6]_8 ));
  LUT6 #(
    .INIT(64'h00000000EEE222E2)) 
    counter0_carry_i_11
       (.I0(memory_n_20),
        .I1(address[6]),
        .I2(memory_n_19),
        .I3(address[7]),
        .I4(memory_n_18),
        .I5(LEDS_OBUF[1]),
        .O(\address_reg_rep[6]_6 ));
  LUT6 #(
    .INIT(64'h00000000EEE222E2)) 
    counter0_carry_i_12
       (.I0(memory_n_10),
        .I1(address[6]),
        .I2(memory_n_44),
        .I3(address[7]),
        .I4(memory_n_47),
        .I5(LEDS_OBUF[1]),
        .O(\address_reg_rep[6]_1 ));
  LUT6 #(
    .INIT(64'h00000000FFE200E2)) 
    counter0_carry_i_13
       (.I0(memory_n_15),
        .I1(address[7]),
        .I2(memory_n_12),
        .I3(address[6]),
        .I4(memory_n_34),
        .I5(LEDS_OBUF[1]),
        .O(\address_reg_rep[7]_3 ));
  LUT6 #(
    .INIT(64'hE2E2E2E2E200E2E2)) 
    counter0_carry_i_14
       (.I0(memory_n_16),
        .I1(address[6]),
        .I2(memory_n_45),
        .I3(current_state[0]),
        .I4(current_state[2]),
        .I5(current_state[1]),
        .O(\address_reg_rep[6]_5 ));
  LUT6 #(
    .INIT(64'h00000000FFE200E2)) 
    counter0_carry_i_15
       (.I0(memory_n_26),
        .I1(address[7]),
        .I2(memory_n_25),
        .I3(address[6]),
        .I4(memory_n_30),
        .I5(LEDS_OBUF[1]),
        .O(\address_reg_rep[7]_4 ));
  LUT4 #(
    .INIT(16'h9009)) 
    counter0_carry_i_5
       (.I0(\address_reg_rep[6]_8 ),
        .I1(out[7]),
        .I2(\address_reg_rep[6]_0 ),
        .I3(out[6]),
        .O(\counter_reg[7] [1]));
  LUT2 #(
    .INIT(4'h1)) 
    counter0_carry_i_51
       (.I0(address[8]),
        .I1(address[9]),
        .O(counter0_carry_i_51_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter0_carry_i_7
       (.I0(\address_reg_rep[6]_5 ),
        .I1(out[3]),
        .I2(out[2]),
        .I3(\address_reg_rep[7]_3 ),
        .O(\counter_reg[7] [0]));
  LUT6 #(
    .INIT(64'h00000000EEE222E2)) 
    counter0_carry_i_9
       (.I0(memory_n_0),
        .I1(address[6]),
        .I2(memory_n_6),
        .I3(address[7]),
        .I4(memory_n_38),
        .I5(LEDS_OBUF[1]),
        .O(\address_reg_rep[6]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEAE6EEE6)) 
    \current_state[0]_i_1 
       (.I0(current_state[0]),
        .I1(\current_state[2]_i_2_n_0 ),
        .I2(current_state[2]),
        .I3(current_state[1]),
        .I4(\current_state_reg[2]_0 ),
        .I5(\cycles_reg[6]_0 ),
        .O(\current_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EE2E2222)) 
    \current_state[1]_i_1 
       (.I0(current_state[1]),
        .I1(\current_state[2]_i_2_n_0 ),
        .I2(D[1]),
        .I3(Q[1]),
        .I4(LEDS_OBUF[0]),
        .I5(\cycles_reg[6]_0 ),
        .O(\current_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000026622222)) 
    \current_state[2]_i_1 
       (.I0(current_state[2]),
        .I1(\current_state[2]_i_2_n_0 ),
        .I2(current_state[1]),
        .I3(current_state[0]),
        .I4(\current_state_reg[2]_0 ),
        .I5(\cycles_reg[6]_0 ),
        .O(\current_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFAAFFBAFF75)) 
    \current_state[2]_i_2 
       (.I0(current_state[0]),
        .I1(Q[2]),
        .I2(D[2]),
        .I3(\current_state_reg[2]_0 ),
        .I4(current_state[1]),
        .I5(current_state[2]),
        .O(\current_state[2]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "REVERSE_PLAY:010,REGULAR_PLAY:001,PAUSED:100" *) 
  FDRE \current_state_reg[0] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\current_state[0]_i_1_n_0 ),
        .Q(current_state[0]),
        .R(\<const0> ));
  (* FSM_ENCODED_STATES = "REVERSE_PLAY:010,REGULAR_PLAY:001,PAUSED:100" *) 
  FDRE \current_state_reg[1] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\current_state[1]_i_1_n_0 ),
        .Q(current_state[1]),
        .R(\<const0> ));
  (* FSM_ENCODED_STATES = "REVERSE_PLAY:010,REGULAR_PLAY:001,PAUSED:100" *) 
  FDRE \current_state_reg[2] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\current_state[2]_i_1_n_0 ),
        .Q(current_state[2]),
        .R(\<const0> ));
  LUT5 #(
    .INIT(32'h44444044)) 
    \cycles[6]_i_1 
       (.I0(Q[0]),
        .I1(D[0]),
        .I2(current_state[0]),
        .I3(current_state[2]),
        .I4(current_state[1]),
        .O(cycles));
  FDRE #(
    .INIT(1'b0)) 
    \cycles_reg[10] 
       (.C(CLK),
        .CE(cycles),
        .D(\cycles_reg[13]_0 [0]),
        .Q(cycles_reg[4]),
        .R(\cycles_reg[6]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \cycles_reg[11] 
       (.C(CLK),
        .CE(cycles),
        .D(\cycles_reg[13]_0 [1]),
        .Q(cycles_reg[5]),
        .S(\cycles_reg[6]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycles_reg[12] 
       (.C(CLK),
        .CE(cycles),
        .D(\cycles_reg[13]_0 [2]),
        .Q(cycles_reg[6]),
        .R(\cycles_reg[6]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycles_reg[13] 
       (.C(CLK),
        .CE(cycles),
        .D(\cycles_reg[13]_0 [3]),
        .Q(cycles_reg[7]),
        .R(\cycles_reg[6]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \cycles_reg[14] 
       (.C(CLK),
        .CE(cycles),
        .D(\cycles_reg[17]_0 [0]),
        .Q(cycles_reg[8]),
        .S(\cycles_reg[6]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycles_reg[15] 
       (.C(CLK),
        .CE(cycles),
        .D(\cycles_reg[17]_0 [1]),
        .Q(cycles_reg[9]),
        .R(\cycles_reg[6]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycles_reg[16] 
       (.C(CLK),
        .CE(cycles),
        .D(\cycles_reg[17]_0 [2]),
        .Q(cycles_reg[10]),
        .R(\cycles_reg[6]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycles_reg[17] 
       (.C(CLK),
        .CE(cycles),
        .D(\cycles_reg[17]_0 [3]),
        .Q(cycles_reg[11]),
        .R(\cycles_reg[6]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \cycles_reg[18] 
       (.C(CLK),
        .CE(cycles),
        .D(\cycles_reg[21]_0 [0]),
        .Q(cycles_reg[12]),
        .S(\cycles_reg[6]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \cycles_reg[19] 
       (.C(CLK),
        .CE(cycles),
        .D(\cycles_reg[21]_0 [1]),
        .Q(cycles_reg[13]),
        .S(\cycles_reg[6]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycles_reg[20] 
       (.C(CLK),
        .CE(cycles),
        .D(\cycles_reg[21]_0 [2]),
        .Q(cycles_reg[14]),
        .R(\cycles_reg[6]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycles_reg[21] 
       (.C(CLK),
        .CE(cycles),
        .D(\cycles_reg[21]_0 [3]),
        .Q(cycles_reg[15]),
        .R(\cycles_reg[6]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \cycles_reg[22] 
       (.C(CLK),
        .CE(cycles),
        .D(\cycles_reg[23]_0 [0]),
        .Q(cycles_reg[16]),
        .S(\cycles_reg[6]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycles_reg[23] 
       (.C(CLK),
        .CE(cycles),
        .D(\cycles_reg[23]_0 [1]),
        .Q(cycles_reg[17]),
        .R(\cycles_reg[6]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \cycles_reg[6] 
       (.C(CLK),
        .CE(cycles),
        .D(O[0]),
        .Q(cycles_reg[0]),
        .S(\cycles_reg[6]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycles_reg[7] 
       (.C(CLK),
        .CE(cycles),
        .D(O[1]),
        .Q(cycles_reg[1]),
        .R(\cycles_reg[6]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \cycles_reg[8] 
       (.C(CLK),
        .CE(cycles),
        .D(O[2]),
        .Q(cycles_reg[2]),
        .S(\cycles_reg[6]_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \cycles_reg[9] 
       (.C(CLK),
        .CE(cycles),
        .D(O[3]),
        .Q(cycles_reg[3]),
        .S(\cycles_reg[6]_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_3
       (.I0(\address_reg_rep[7]_1 ),
        .I1(out[13]),
        .I2(\address_reg_rep[6]_7 ),
        .I3(out[14]),
        .I4(\address_reg_rep[6]_3 ),
        .I5(out[12]),
        .O(\counter_reg[16] [1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry__0_i_4
       (.I0(\address_reg_rep[6]_4 ),
        .I1(out[9]),
        .I2(\address_reg_rep[7]_2 ),
        .I3(out[11]),
        .I4(\address_reg_rep[6]_9 ),
        .I5(out[10]),
        .O(\counter_reg[16] [0]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_2
       (.I0(\address_reg_rep[6]_8 ),
        .I1(out[6]),
        .I2(\address_reg_rep[6]_2 ),
        .I3(out[8]),
        .I4(\address_reg_rep[7]_5 ),
        .I5(out[7]),
        .O(S[2]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_3
       (.I0(\address_reg_rep[6]_1 ),
        .I1(out[4]),
        .I2(\address_reg_rep[6]_0 ),
        .I3(out[5]),
        .I4(\address_reg_rep[6]_6 ),
        .I5(out[3]),
        .O(S[1]));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_4
       (.I0(\address_reg_rep[7]_3 ),
        .I1(out[1]),
        .I2(\address_reg_rep[6]_5 ),
        .I3(out[2]),
        .I4(\address_reg_rep[7]_4 ),
        .I5(out[0]),
        .O(S[0]));
  LUT2 #(
    .INIT(4'hE)) 
    in_good_i_1
       (.I0(in_good),
        .I1(\cycles_reg[6]_0 ),
        .O(\BUTTONS[0] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    in_good_i_2
       (.I0(in_good_i_3_n_0),
        .I1(in_good_i_4_n_0),
        .I2(in_good_i_5_n_0),
        .I3(\address_reg_rep[6]_0 ),
        .I4(\address_reg_rep[6]_1 ),
        .I5(in_good_i_6_n_0),
        .O(in_good));
  LUT5 #(
    .INIT(32'hF0F0FFFE)) 
    in_good_i_3
       (.I0(memory_n_1),
        .I1(memory_n_27),
        .I2(\address_reg_rep[7]_0 ),
        .I3(memory_n_3),
        .I4(LEDS_OBUF[1]),
        .O(in_good_i_3_n_0));
  LUT5 #(
    .INIT(32'hCCFFCCFE)) 
    in_good_i_4
       (.I0(memory_n_21),
        .I1(\address_reg_rep[7]_1 ),
        .I2(memory_n_5),
        .I3(LEDS_OBUF[1]),
        .I4(memory_n_11),
        .O(in_good_i_4_n_0));
  LUT5 #(
    .INIT(32'hF0F0FFFE)) 
    in_good_i_5
       (.I0(memory_n_17),
        .I1(memory_n_14),
        .I2(\address_reg_rep[7]_3 ),
        .I3(memory_n_24),
        .I4(LEDS_OBUF[1]),
        .O(in_good_i_5_n_0));
  LUT5 #(
    .INIT(32'hBABBBAAA)) 
    in_good_i_6
       (.I0(\address_reg_rep[6]_8 ),
        .I1(LEDS_OBUF[1]),
        .I2(memory_n_41),
        .I3(address[6]),
        .I4(memory_n_36),
        .O(in_good_i_6_n_0));
  rom memory
       (.Q(address),
        .\address_reg_rep[3] (memory_n_6),
        .\address_reg_rep[3]_0 (memory_n_7),
        .\address_reg_rep[3]_1 (memory_n_9),
        .\address_reg_rep[3]_2 (memory_n_15),
        .\address_reg_rep[3]_3 (memory_n_32),
        .\address_reg_rep[4] (memory_n_12),
        .\address_reg_rep[4]_0 (memory_n_23),
        .\address_reg_rep[4]_1 (memory_n_26),
        .\address_reg_rep[4]_2 (memory_n_29),
        .\address_reg_rep[4]_3 (memory_n_37),
        .\address_reg_rep[4]_4 (memory_n_41),
        .\address_reg_rep[4]_5 (memory_n_46),
        .\address_reg_rep[5] (memory_n_8),
        .\address_reg_rep[5]_0 (memory_n_13),
        .\address_reg_rep[5]_1 (memory_n_16),
        .\address_reg_rep[5]_10 (memory_n_39),
        .\address_reg_rep[5]_11 (memory_n_40),
        .\address_reg_rep[5]_12 (memory_n_44),
        .\address_reg_rep[5]_13 (memory_n_47),
        .\address_reg_rep[5]_2 (memory_n_18),
        .\address_reg_rep[5]_3 (memory_n_19),
        .\address_reg_rep[5]_4 (memory_n_20),
        .\address_reg_rep[5]_5 (memory_n_25),
        .\address_reg_rep[5]_6 (memory_n_28),
        .\address_reg_rep[5]_7 (memory_n_31),
        .\address_reg_rep[5]_8 (memory_n_36),
        .\address_reg_rep[5]_9 (memory_n_38),
        .\address_reg_rep[6] (memory_n_1),
        .\address_reg_rep[6]_0 (memory_n_3),
        .\address_reg_rep[6]_1 (memory_n_5),
        .\address_reg_rep[6]_2 (memory_n_11),
        .\address_reg_rep[6]_3 (memory_n_14),
        .\address_reg_rep[6]_4 (memory_n_17),
        .\address_reg_rep[6]_5 (memory_n_21),
        .\address_reg_rep[6]_6 (memory_n_24),
        .\address_reg_rep[6]_7 (memory_n_27),
        .\address_reg_rep[7] (memory_n_0),
        .\address_reg_rep[7]_0 (memory_n_2),
        .\address_reg_rep[7]_1 (memory_n_4),
        .\address_reg_rep[7]_10 (memory_n_48),
        .\address_reg_rep[7]_2 (memory_n_10),
        .\address_reg_rep[7]_3 (memory_n_22),
        .\address_reg_rep[7]_4 (memory_n_30),
        .\address_reg_rep[7]_5 (memory_n_33),
        .\address_reg_rep[7]_6 (memory_n_34),
        .\address_reg_rep[7]_7 (memory_n_35),
        .\address_reg_rep[7]_8 (memory_n_42),
        .\address_reg_rep[7]_9 (memory_n_45),
        .\address_reg_rep[8] (memory_n_43),
        .counter0_carry__0_i_29_0(counter0_carry_i_51_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    out1_carry__0_i_3
       (.I0(\address_reg_rep[7]_2 ),
        .I1(out[12]),
        .I2(out[14]),
        .I3(\address_reg_rep[7]_1 ),
        .I4(\address_reg_rep[6]_3 ),
        .I5(out[13]),
        .O(\counter_reg[15] ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    out1_carry_i_3
       (.I0(\address_reg_rep[6]_5 ),
        .I1(out[3]),
        .I2(out[5]),
        .I3(\address_reg_rep[6]_1 ),
        .I4(out[4]),
        .I5(\address_reg_rep[6]_6 ),
        .O(\counter_reg[3] ));
endmodule

module rom
   (\address_reg_rep[7] ,
    \address_reg_rep[6] ,
    \address_reg_rep[7]_0 ,
    \address_reg_rep[6]_0 ,
    \address_reg_rep[7]_1 ,
    \address_reg_rep[6]_1 ,
    \address_reg_rep[3] ,
    \address_reg_rep[3]_0 ,
    \address_reg_rep[5] ,
    \address_reg_rep[3]_1 ,
    \address_reg_rep[7]_2 ,
    \address_reg_rep[6]_2 ,
    \address_reg_rep[4] ,
    \address_reg_rep[5]_0 ,
    \address_reg_rep[6]_3 ,
    \address_reg_rep[3]_2 ,
    \address_reg_rep[5]_1 ,
    \address_reg_rep[6]_4 ,
    \address_reg_rep[5]_2 ,
    \address_reg_rep[5]_3 ,
    \address_reg_rep[5]_4 ,
    \address_reg_rep[6]_5 ,
    \address_reg_rep[7]_3 ,
    \address_reg_rep[4]_0 ,
    \address_reg_rep[6]_6 ,
    \address_reg_rep[5]_5 ,
    \address_reg_rep[4]_1 ,
    \address_reg_rep[6]_7 ,
    \address_reg_rep[5]_6 ,
    \address_reg_rep[4]_2 ,
    \address_reg_rep[7]_4 ,
    \address_reg_rep[5]_7 ,
    \address_reg_rep[3]_3 ,
    \address_reg_rep[7]_5 ,
    \address_reg_rep[7]_6 ,
    \address_reg_rep[7]_7 ,
    \address_reg_rep[5]_8 ,
    \address_reg_rep[4]_3 ,
    \address_reg_rep[5]_9 ,
    \address_reg_rep[5]_10 ,
    \address_reg_rep[5]_11 ,
    \address_reg_rep[4]_4 ,
    \address_reg_rep[7]_8 ,
    \address_reg_rep[8] ,
    \address_reg_rep[5]_12 ,
    \address_reg_rep[7]_9 ,
    \address_reg_rep[4]_5 ,
    \address_reg_rep[5]_13 ,
    \address_reg_rep[7]_10 ,
    Q,
    counter0_carry__0_i_29_0);
  output \address_reg_rep[7] ;
  output \address_reg_rep[6] ;
  output \address_reg_rep[7]_0 ;
  output \address_reg_rep[6]_0 ;
  output \address_reg_rep[7]_1 ;
  output \address_reg_rep[6]_1 ;
  output \address_reg_rep[3] ;
  output \address_reg_rep[3]_0 ;
  output \address_reg_rep[5] ;
  output \address_reg_rep[3]_1 ;
  output \address_reg_rep[7]_2 ;
  output \address_reg_rep[6]_2 ;
  output \address_reg_rep[4] ;
  output \address_reg_rep[5]_0 ;
  output \address_reg_rep[6]_3 ;
  output \address_reg_rep[3]_2 ;
  output \address_reg_rep[5]_1 ;
  output \address_reg_rep[6]_4 ;
  output \address_reg_rep[5]_2 ;
  output \address_reg_rep[5]_3 ;
  output \address_reg_rep[5]_4 ;
  output \address_reg_rep[6]_5 ;
  output \address_reg_rep[7]_3 ;
  output \address_reg_rep[4]_0 ;
  output \address_reg_rep[6]_6 ;
  output \address_reg_rep[5]_5 ;
  output \address_reg_rep[4]_1 ;
  output \address_reg_rep[6]_7 ;
  output \address_reg_rep[5]_6 ;
  output \address_reg_rep[4]_2 ;
  output \address_reg_rep[7]_4 ;
  output \address_reg_rep[5]_7 ;
  output \address_reg_rep[3]_3 ;
  output \address_reg_rep[7]_5 ;
  output \address_reg_rep[7]_6 ;
  output \address_reg_rep[7]_7 ;
  output \address_reg_rep[5]_8 ;
  output \address_reg_rep[4]_3 ;
  output \address_reg_rep[5]_9 ;
  output \address_reg_rep[5]_10 ;
  output \address_reg_rep[5]_11 ;
  output \address_reg_rep[4]_4 ;
  output \address_reg_rep[7]_8 ;
  output \address_reg_rep[8] ;
  output \address_reg_rep[5]_12 ;
  output \address_reg_rep[7]_9 ;
  output \address_reg_rep[4]_5 ;
  output \address_reg_rep[5]_13 ;
  output \address_reg_rep[7]_10 ;
  input [9:0]Q;
  input counter0_carry__0_i_29_0;

  wire [9:0]Q;
  wire \address_reg_rep[3] ;
  wire \address_reg_rep[3]_0 ;
  wire \address_reg_rep[3]_1 ;
  wire \address_reg_rep[3]_2 ;
  wire \address_reg_rep[3]_3 ;
  wire \address_reg_rep[4] ;
  wire \address_reg_rep[4]_0 ;
  wire \address_reg_rep[4]_1 ;
  wire \address_reg_rep[4]_2 ;
  wire \address_reg_rep[4]_3 ;
  wire \address_reg_rep[4]_4 ;
  wire \address_reg_rep[4]_5 ;
  wire \address_reg_rep[5] ;
  wire \address_reg_rep[5]_0 ;
  wire \address_reg_rep[5]_1 ;
  wire \address_reg_rep[5]_10 ;
  wire \address_reg_rep[5]_11 ;
  wire \address_reg_rep[5]_12 ;
  wire \address_reg_rep[5]_13 ;
  wire \address_reg_rep[5]_2 ;
  wire \address_reg_rep[5]_3 ;
  wire \address_reg_rep[5]_4 ;
  wire \address_reg_rep[5]_5 ;
  wire \address_reg_rep[5]_6 ;
  wire \address_reg_rep[5]_7 ;
  wire \address_reg_rep[5]_8 ;
  wire \address_reg_rep[5]_9 ;
  wire \address_reg_rep[6] ;
  wire \address_reg_rep[6]_0 ;
  wire \address_reg_rep[6]_1 ;
  wire \address_reg_rep[6]_2 ;
  wire \address_reg_rep[6]_3 ;
  wire \address_reg_rep[6]_4 ;
  wire \address_reg_rep[6]_5 ;
  wire \address_reg_rep[6]_6 ;
  wire \address_reg_rep[6]_7 ;
  wire \address_reg_rep[7] ;
  wire \address_reg_rep[7]_0 ;
  wire \address_reg_rep[7]_1 ;
  wire \address_reg_rep[7]_10 ;
  wire \address_reg_rep[7]_2 ;
  wire \address_reg_rep[7]_3 ;
  wire \address_reg_rep[7]_4 ;
  wire \address_reg_rep[7]_5 ;
  wire \address_reg_rep[7]_6 ;
  wire \address_reg_rep[7]_7 ;
  wire \address_reg_rep[7]_8 ;
  wire \address_reg_rep[7]_9 ;
  wire \address_reg_rep[8] ;
  wire counter0_carry__0_i_29_0;
  wire counter0_carry__0_i_30_n_0;
  wire counter0_carry__0_i_31_n_0;
  wire counter0_carry__0_i_32_n_0;
  wire counter0_carry__0_i_33_n_0;
  wire counter0_carry__0_i_34_n_0;
  wire counter0_carry__0_i_35_n_0;
  wire counter0_carry__0_i_36_n_0;
  wire counter0_carry__0_i_37_n_0;
  wire counter0_carry__0_i_38_n_0;
  wire counter0_carry__0_i_39_n_0;
  wire counter0_carry__0_i_40_n_0;
  wire counter0_carry__0_i_41_n_0;
  wire counter0_carry__0_i_42_n_0;
  wire counter0_carry__0_i_43_n_0;
  wire counter0_carry__0_i_44_n_0;
  wire counter0_carry__0_i_45_n_0;
  wire counter0_carry__0_i_46_n_0;
  wire counter0_carry__0_i_47_n_0;
  wire counter0_carry__0_i_48_n_0;
  wire counter0_carry__0_i_49_n_0;
  wire counter0_carry__0_i_50_n_0;
  wire counter0_carry__1_i_16_n_0;
  wire counter0_carry__1_i_17_n_0;
  wire counter0_carry__1_i_18_n_0;
  wire counter0_carry__1_i_19_n_0;
  wire counter0_carry__1_i_20_n_0;
  wire counter0_carry__1_i_21_n_0;
  wire counter0_carry__1_i_22_n_0;
  wire counter0_carry__1_i_23_n_0;
  wire counter0_carry__1_i_24_n_0;
  wire counter0_carry__1_i_25_n_0;
  wire counter0_carry__1_i_26_n_0;
  wire counter0_carry_i_36_n_0;
  wire counter0_carry_i_37_n_0;
  wire counter0_carry_i_38_n_0;
  wire counter0_carry_i_39_n_0;
  wire counter0_carry_i_40_n_0;
  wire counter0_carry_i_41_n_0;
  wire counter0_carry_i_42_n_0;
  wire counter0_carry_i_43_n_0;
  wire counter0_carry_i_44_n_0;
  wire counter0_carry_i_45_n_0;
  wire counter0_carry_i_46_n_0;
  wire counter0_carry_i_47_n_0;
  wire counter0_carry_i_48_n_0;
  wire counter0_carry_i_49_n_0;
  wire counter0_carry_i_50_n_0;
  wire counter0_carry_i_52_n_0;
  wire counter0_carry_i_53_n_0;
  wire counter0_carry_i_54_n_0;
  wire counter0_carry_i_55_n_0;
  wire counter0_carry_i_56_n_0;
  wire counter0_carry_i_57_n_0;
  wire counter0_carry_i_58_n_0;
  wire counter0_carry_i_59_n_0;
  wire counter0_carry_i_60_n_0;
  wire counter0_carry_i_61_n_0;
  wire counter0_carry_i_62_n_0;
  wire counter0_carry_i_63_n_0;
  wire counter0_carry_i_64_n_0;
  wire counter0_carry_i_65_n_0;
  wire counter0_carry_i_66_n_0;
  wire counter0_carry_i_67_n_0;
  wire counter0_carry_i_68_n_0;
  wire counter0_carry_i_69_n_0;
  wire counter0_carry_i_70_n_0;
  wire counter0_carry_i_71_n_0;
  wire counter0_carry_i_72_n_0;
  wire counter0_carry_i_73_n_0;
  wire in_good_i_17_n_0;
  wire in_good_i_18_n_0;
  wire in_good_i_19_n_0;
  wire in_good_i_20_n_0;
  wire in_good_i_21_n_0;
  wire in_good_i_22_n_0;
  wire in_good_i_23_n_0;
  wire in_good_i_26_n_0;
  wire in_good_i_27_n_0;
  wire in_good_i_28_n_0;
  wire in_good_i_29_n_0;
  wire in_good_i_30_n_0;
  wire in_good_i_31_n_0;
  wire in_good_i_32_n_0;
  wire in_good_i_33_n_0;
  wire in_good_i_34_n_0;
  wire in_good_i_35_n_0;
  wire in_good_i_36_n_0;
  wire in_good_i_37_n_0;
  wire in_good_i_38_n_0;
  wire in_good_i_39_n_0;
  wire in_good_i_40_n_0;
  wire in_good_i_41_n_0;
  wire in_good_i_42_n_0;
  wire in_good_reg_i_24_n_0;
  wire in_good_reg_i_25_n_0;

  LUT5 #(
    .INIT(32'hB8FFB800)) 
    counter0_carry__0_i_16
       (.I0(counter0_carry_i_48_n_0),
        .I1(Q[5]),
        .I2(counter0_carry_i_55_n_0),
        .I3(Q[7]),
        .I4(\address_reg_rep[4]_1 ),
        .O(\address_reg_rep[5]_6 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    counter0_carry__0_i_17
       (.I0(counter0_carry__0_i_30_n_0),
        .I1(Q[7]),
        .I2(counter0_carry_i_69_n_0),
        .I3(Q[5]),
        .I4(counter0_carry__0_i_31_n_0),
        .O(\address_reg_rep[7]_5 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    counter0_carry__0_i_18
       (.I0(counter0_carry_i_56_n_0),
        .I1(Q[5]),
        .I2(counter0_carry_i_60_n_0),
        .I3(Q[4]),
        .I4(counter0_carry_i_61_n_0),
        .O(\address_reg_rep[5]_0 ));
  LUT5 #(
    .INIT(32'hA0A0CFC0)) 
    counter0_carry__0_i_19
       (.I0(counter0_carry_i_43_n_0),
        .I1(counter0_carry__0_i_32_n_0),
        .I2(Q[7]),
        .I3(counter0_carry__0_i_33_n_0),
        .I4(Q[5]),
        .O(\address_reg_rep[7]_7 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    counter0_carry__0_i_20
       (.I0(counter0_carry__0_i_34_n_0),
        .I1(Q[5]),
        .I2(counter0_carry_i_37_n_0),
        .I3(Q[7]),
        .I4(\address_reg_rep[3]_0 ),
        .O(\address_reg_rep[5] ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h04FF0400)) 
    counter0_carry__0_i_21
       (.I0(Q[4]),
        .I1(counter0_carry_i_45_n_0),
        .I2(Q[5]),
        .I3(Q[7]),
        .I4(\address_reg_rep[3] ),
        .O(\address_reg_rep[4]_2 ));
  MUXF7 counter0_carry__0_i_22
       (.I0(counter0_carry__0_i_35_n_0),
        .I1(counter0_carry__0_i_36_n_0),
        .O(\address_reg_rep[7]_1 ),
        .S(Q[7]));
  LUT6 #(
    .INIT(64'h8830333388300000)) 
    counter0_carry__0_i_23
       (.I0(counter0_carry_i_40_n_0),
        .I1(Q[5]),
        .I2(counter0_carry_i_63_n_0),
        .I3(Q[3]),
        .I4(Q[4]),
        .I5(counter0_carry__0_i_37_n_0),
        .O(\address_reg_rep[5]_7 ));
  LUT6 #(
    .INIT(64'h00000000FFE200E2)) 
    counter0_carry__0_i_24
       (.I0(counter0_carry__0_i_38_n_0),
        .I1(Q[3]),
        .I2(counter0_carry__0_i_39_n_0),
        .I3(Q[4]),
        .I4(counter0_carry__0_i_40_n_0),
        .I5(Q[5]),
        .O(\address_reg_rep[3]_3 ));
  LUT5 #(
    .INIT(32'hF8080000)) 
    counter0_carry__0_i_25
       (.I0(Q[3]),
        .I1(counter0_carry_i_58_n_0),
        .I2(Q[4]),
        .I3(counter0_carry__0_i_41_n_0),
        .I4(Q[5]),
        .O(\address_reg_rep[3]_0 ));
  LUT6 #(
    .INIT(64'h2090FFFF20900000)) 
    counter0_carry__0_i_26
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(counter0_carry__0_i_29_0),
        .I3(Q[3]),
        .I4(Q[5]),
        .I5(counter0_carry__0_i_42_n_0),
        .O(\address_reg_rep[4]_3 ));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    counter0_carry__0_i_27
       (.I0(Q[4]),
        .I1(counter0_carry__0_i_43_n_0),
        .I2(Q[7]),
        .I3(counter0_carry_i_72_n_0),
        .I4(Q[5]),
        .I5(counter0_carry__0_i_44_n_0),
        .O(\address_reg_rep[4]_4 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    counter0_carry__0_i_28
       (.I0(counter0_carry__0_i_45_n_0),
        .I1(counter0_carry_i_37_n_0),
        .I2(Q[7]),
        .I3(counter0_carry_i_38_n_0),
        .I4(Q[5]),
        .I5(counter0_carry_i_39_n_0),
        .O(\address_reg_rep[7]_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    counter0_carry__0_i_29
       (.I0(counter0_carry_i_43_n_0),
        .I1(counter0_carry__0_i_46_n_0),
        .I2(Q[7]),
        .I3(counter0_carry__0_i_47_n_0),
        .I4(Q[5]),
        .I5(counter0_carry__0_i_48_n_0),
        .O(\address_reg_rep[7]_8 ));
  LUT6 #(
    .INIT(64'h5040000000070000)) 
    counter0_carry__0_i_30
       (.I0(Q[4]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(counter0_carry__0_i_29_0),
        .I5(Q[2]),
        .O(counter0_carry__0_i_30_n_0));
  LUT6 #(
    .INIT(64'hCFC80000C0700000)) 
    counter0_carry__0_i_31
       (.I0(Q[0]),
        .I1(Q[4]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(counter0_carry__0_i_29_0),
        .I5(Q[2]),
        .O(counter0_carry__0_i_31_n_0));
  LUT6 #(
    .INIT(64'hFAEA0000AAA70000)) 
    counter0_carry__0_i_32
       (.I0(Q[4]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(counter0_carry__0_i_29_0),
        .I5(Q[2]),
        .O(counter0_carry__0_i_32_n_0));
  LUT6 #(
    .INIT(64'h0F08000000700000)) 
    counter0_carry__0_i_33
       (.I0(Q[0]),
        .I1(Q[4]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(counter0_carry__0_i_29_0),
        .I5(Q[2]),
        .O(counter0_carry__0_i_33_n_0));
  LUT6 #(
    .INIT(64'h0000008000000003)) 
    counter0_carry__0_i_34
       (.I0(Q[1]),
        .I1(Q[4]),
        .I2(Q[2]),
        .I3(Q[8]),
        .I4(Q[9]),
        .I5(Q[3]),
        .O(counter0_carry__0_i_34_n_0));
  LUT5 #(
    .INIT(32'hF8080000)) 
    counter0_carry__0_i_35
       (.I0(Q[3]),
        .I1(counter0_carry_i_40_n_0),
        .I2(Q[4]),
        .I3(counter0_carry__0_i_41_n_0),
        .I4(Q[5]),
        .O(counter0_carry__0_i_35_n_0));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    counter0_carry__0_i_36
       (.I0(Q[3]),
        .I1(counter0_carry__0_i_49_n_0),
        .I2(Q[5]),
        .I3(counter0_carry__0_i_50_n_0),
        .I4(Q[4]),
        .I5(counter0_carry__1_i_20_n_0),
        .O(counter0_carry__0_i_36_n_0));
  LUT6 #(
    .INIT(64'h000000000000FCBF)) 
    counter0_carry__0_i_37
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(counter0_carry__0_i_37_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h000E000A)) 
    counter0_carry__0_i_38
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[8]),
        .I3(Q[9]),
        .I4(Q[0]),
        .O(counter0_carry__0_i_38_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h000000BD)) 
    counter0_carry__0_i_39
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[8]),
        .I4(Q[9]),
        .O(counter0_carry__0_i_39_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    counter0_carry__0_i_40
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[8]),
        .I3(Q[9]),
        .I4(Q[0]),
        .I5(Q[3]),
        .O(counter0_carry__0_i_40_n_0));
  LUT6 #(
    .INIT(64'h000000000000ABFF)) 
    counter0_carry__0_i_41
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(counter0_carry__0_i_41_n_0));
  LUT6 #(
    .INIT(64'h7BDEE7FD00000000)) 
    counter0_carry__0_i_42
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(counter0_carry__0_i_29_0),
        .O(counter0_carry__0_i_42_n_0));
  LUT6 #(
    .INIT(64'h0000005600000066)) 
    counter0_carry__0_i_43
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[8]),
        .I4(Q[9]),
        .I5(Q[0]),
        .O(counter0_carry__0_i_43_n_0));
  LUT6 #(
    .INIT(64'hFF000000C87F0000)) 
    counter0_carry__0_i_44
       (.I0(Q[4]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(counter0_carry__0_i_29_0),
        .I5(Q[2]),
        .O(counter0_carry__0_i_44_n_0));
  LUT6 #(
    .INIT(64'h5154573700000000)) 
    counter0_carry__0_i_45
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(counter0_carry__0_i_29_0),
        .O(counter0_carry__0_i_45_n_0));
  LUT6 #(
    .INIT(64'hBBBC0000BEBC0000)) 
    counter0_carry__0_i_46
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(counter0_carry__0_i_29_0),
        .I5(Q[0]),
        .O(counter0_carry__0_i_46_n_0));
  LUT6 #(
    .INIT(64'hA8AA000000000000)) 
    counter0_carry__0_i_47
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(counter0_carry__0_i_29_0),
        .I5(Q[4]),
        .O(counter0_carry__0_i_47_n_0));
  LUT6 #(
    .INIT(64'h55000000407F0000)) 
    counter0_carry__0_i_48
       (.I0(Q[4]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(counter0_carry__0_i_29_0),
        .I5(Q[2]),
        .O(counter0_carry__0_i_48_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    counter0_carry__0_i_49
       (.I0(Q[9]),
        .I1(Q[8]),
        .I2(Q[2]),
        .O(counter0_carry__0_i_49_n_0));
  LUT6 #(
    .INIT(64'h0000007C0000008C)) 
    counter0_carry__0_i_50
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[8]),
        .I4(Q[9]),
        .I5(Q[2]),
        .O(counter0_carry__0_i_50_n_0));
  MUXF7 counter0_carry__1_i_11
       (.I0(counter0_carry__1_i_16_n_0),
        .I1(counter0_carry__1_i_17_n_0),
        .O(\address_reg_rep[7]_3 ),
        .S(Q[7]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    counter0_carry__1_i_12
       (.I0(counter0_carry_i_69_n_0),
        .I1(Q[5]),
        .I2(counter0_carry__1_i_18_n_0),
        .I3(Q[4]),
        .I4(counter0_carry__0_i_37_n_0),
        .O(\address_reg_rep[5]_10 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    counter0_carry__1_i_13
       (.I0(counter0_carry_i_43_n_0),
        .I1(Q[5]),
        .I2(counter0_carry_i_57_n_0),
        .I3(Q[4]),
        .I4(counter0_carry__1_i_19_n_0),
        .O(\address_reg_rep[5]_11 ));
  LUT6 #(
    .INIT(64'h22002200F0FFF000)) 
    counter0_carry__1_i_14
       (.I0(counter0_carry_i_63_n_0),
        .I1(Q[3]),
        .I2(counter0_carry_i_62_n_0),
        .I3(Q[5]),
        .I4(counter0_carry__1_i_20_n_0),
        .I5(Q[4]),
        .O(\address_reg_rep[3]_1 ));
  LUT6 #(
    .INIT(64'hAFA0A0A0C000C000)) 
    counter0_carry__1_i_15
       (.I0(counter0_carry_i_43_n_0),
        .I1(counter0_carry_i_44_n_0),
        .I2(Q[7]),
        .I3(Q[4]),
        .I4(counter0_carry__1_i_21_n_0),
        .I5(Q[5]),
        .O(\address_reg_rep[7]_10 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    counter0_carry__1_i_16
       (.I0(counter0_carry__0_i_41_n_0),
        .I1(counter0_carry__1_i_22_n_0),
        .I2(Q[5]),
        .I3(counter0_carry_i_60_n_0),
        .I4(Q[4]),
        .I5(counter0_carry_i_61_n_0),
        .O(counter0_carry__1_i_16_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    counter0_carry__1_i_17
       (.I0(counter0_carry__1_i_23_n_0),
        .I1(counter0_carry__1_i_24_n_0),
        .I2(Q[5]),
        .I3(counter0_carry__1_i_25_n_0),
        .I4(Q[4]),
        .I5(counter0_carry__1_i_26_n_0),
        .O(counter0_carry__1_i_17_n_0));
  LUT6 #(
    .INIT(64'h000000000000EDFB)) 
    counter0_carry__1_i_18
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(counter0_carry__1_i_18_n_0));
  LUT6 #(
    .INIT(64'h000000DE000000F7)) 
    counter0_carry__1_i_19
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[9]),
        .I4(Q[8]),
        .I5(Q[1]),
        .O(counter0_carry__1_i_19_n_0));
  LUT6 #(
    .INIT(64'h0000000000111101)) 
    counter0_carry__1_i_20
       (.I0(Q[9]),
        .I1(Q[8]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(counter0_carry__1_i_20_n_0));
  LUT6 #(
    .INIT(64'h1111110100000000)) 
    counter0_carry__1_i_21
       (.I0(Q[9]),
        .I1(Q[8]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(Q[3]),
        .O(counter0_carry__1_i_21_n_0));
  LUT6 #(
    .INIT(64'h000000000000CBFF)) 
    counter0_carry__1_i_22
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(counter0_carry__1_i_22_n_0));
  LUT6 #(
    .INIT(64'h000000000000E7F7)) 
    counter0_carry__1_i_23
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(counter0_carry__1_i_23_n_0));
  LUT6 #(
    .INIT(64'h000000000000DEF7)) 
    counter0_carry__1_i_24
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(counter0_carry__1_i_24_n_0));
  LUT6 #(
    .INIT(64'h0000007D000000BE)) 
    counter0_carry__1_i_25
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[9]),
        .I4(Q[8]),
        .I5(Q[1]),
        .O(counter0_carry__1_i_25_n_0));
  LUT6 #(
    .INIT(64'h000E000A0002000A)) 
    counter0_carry__1_i_26
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(Q[9]),
        .I3(Q[8]),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(counter0_carry__1_i_26_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    counter0_carry_i_16
       (.I0(counter0_carry_i_36_n_0),
        .I1(counter0_carry_i_37_n_0),
        .I2(Q[7]),
        .I3(counter0_carry_i_38_n_0),
        .I4(Q[5]),
        .I5(counter0_carry_i_39_n_0),
        .O(\address_reg_rep[7] ));
  LUT6 #(
    .INIT(64'h8F800F0F8F800000)) 
    counter0_carry_i_17
       (.I0(Q[3]),
        .I1(counter0_carry_i_40_n_0),
        .I2(Q[5]),
        .I3(counter0_carry_i_41_n_0),
        .I4(Q[4]),
        .I5(counter0_carry_i_42_n_0),
        .O(\address_reg_rep[3] ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    counter0_carry_i_18
       (.I0(counter0_carry_i_43_n_0),
        .I1(Q[5]),
        .I2(counter0_carry_i_44_n_0),
        .I3(Q[4]),
        .I4(counter0_carry_i_45_n_0),
        .O(\address_reg_rep[5]_9 ));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    counter0_carry_i_19
       (.I0(counter0_carry_i_46_n_0),
        .I1(Q[4]),
        .I2(counter0_carry_i_47_n_0),
        .I3(Q[5]),
        .I4(counter0_carry_i_48_n_0),
        .I5(Q[7]),
        .O(\address_reg_rep[4]_0 ));
  LUT6 #(
    .INIT(64'hAAFFAA0003000300)) 
    counter0_carry_i_20
       (.I0(counter0_carry_i_49_n_0),
        .I1(Q[8]),
        .I2(Q[9]),
        .I3(Q[5]),
        .I4(counter0_carry_i_50_n_0),
        .I5(Q[4]),
        .O(\address_reg_rep[8] ));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    counter0_carry_i_21
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(counter0_carry__0_i_29_0),
        .I3(Q[1]),
        .I4(Q[3]),
        .I5(Q[5]),
        .O(\address_reg_rep[4]_5 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    counter0_carry_i_22
       (.I0(counter0_carry_i_52_n_0),
        .I1(Q[5]),
        .I2(counter0_carry_i_53_n_0),
        .I3(Q[7]),
        .I4(\address_reg_rep[3]_2 ),
        .O(\address_reg_rep[5]_4 ));
  LUT6 #(
    .INIT(64'hAFA0A0A0C0C0C0C0)) 
    counter0_carry_i_23
       (.I0(counter0_carry_i_49_n_0),
        .I1(counter0_carry__0_i_29_0),
        .I2(Q[5]),
        .I3(Q[3]),
        .I4(counter0_carry_i_54_n_0),
        .I5(Q[4]),
        .O(\address_reg_rep[5]_3 ));
  LUT6 #(
    .INIT(64'h505050400020A0A0)) 
    counter0_carry_i_24
       (.I0(Q[5]),
        .I1(Q[1]),
        .I2(counter0_carry__0_i_29_0),
        .I3(Q[2]),
        .I4(Q[3]),
        .I5(Q[4]),
        .O(\address_reg_rep[5]_2 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    counter0_carry_i_25
       (.I0(counter0_carry_i_52_n_0),
        .I1(counter0_carry_i_55_n_0),
        .I2(Q[7]),
        .I3(counter0_carry_i_56_n_0),
        .I4(Q[5]),
        .I5(counter0_carry_i_39_n_0),
        .O(\address_reg_rep[7]_2 ));
  LUT6 #(
    .INIT(64'h63620000623A0000)) 
    counter0_carry_i_26
       (.I0(Q[5]),
        .I1(Q[4]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(counter0_carry__0_i_29_0),
        .I5(Q[2]),
        .O(\address_reg_rep[5]_12 ));
  LUT6 #(
    .INIT(64'hB8BBB888B888B888)) 
    counter0_carry_i_27
       (.I0(counter0_carry_i_43_n_0),
        .I1(Q[5]),
        .I2(counter0_carry_i_57_n_0),
        .I3(Q[4]),
        .I4(counter0_carry_i_58_n_0),
        .I5(Q[3]),
        .O(\address_reg_rep[5]_13 ));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    counter0_carry_i_28
       (.I0(Q[3]),
        .I1(counter0_carry_i_59_n_0),
        .I2(Q[5]),
        .I3(counter0_carry_i_60_n_0),
        .I4(Q[4]),
        .I5(counter0_carry_i_61_n_0),
        .O(\address_reg_rep[3]_2 ));
  LUT6 #(
    .INIT(64'hEEE222E200000000)) 
    counter0_carry_i_29
       (.I0(counter0_carry_i_62_n_0),
        .I1(Q[4]),
        .I2(counter0_carry_i_63_n_0),
        .I3(Q[3]),
        .I4(counter0_carry_i_64_n_0),
        .I5(Q[5]),
        .O(\address_reg_rep[4] ));
  LUT6 #(
    .INIT(64'hA0A0A0A0CFC0C0C0)) 
    counter0_carry_i_30
       (.I0(counter0_carry_i_43_n_0),
        .I1(counter0_carry_i_65_n_0),
        .I2(Q[7]),
        .I3(Q[4]),
        .I4(counter0_carry_i_66_n_0),
        .I5(Q[5]),
        .O(\address_reg_rep[7]_6 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    counter0_carry_i_31
       (.I0(counter0_carry_i_67_n_0),
        .I1(Q[5]),
        .I2(counter0_carry_i_55_n_0),
        .I3(Q[7]),
        .I4(\address_reg_rep[3]_2 ),
        .O(\address_reg_rep[5]_1 ));
  LUT6 #(
    .INIT(64'hB8BBB888B888B888)) 
    counter0_carry_i_32
       (.I0(counter0_carry_i_68_n_0),
        .I1(Q[7]),
        .I2(counter0_carry_i_69_n_0),
        .I3(Q[5]),
        .I4(counter0_carry_i_50_n_0),
        .I5(Q[4]),
        .O(\address_reg_rep[7]_9 ));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    counter0_carry_i_33
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[8]),
        .I3(Q[9]),
        .I4(Q[3]),
        .I5(Q[5]),
        .O(\address_reg_rep[4]_1 ));
  LUT5 #(
    .INIT(32'hB833B800)) 
    counter0_carry_i_34
       (.I0(counter0_carry_i_70_n_0),
        .I1(Q[5]),
        .I2(counter0_carry_i_47_n_0),
        .I3(Q[4]),
        .I4(counter0_carry_i_46_n_0),
        .O(\address_reg_rep[5]_5 ));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    counter0_carry_i_35
       (.I0(counter0_carry_i_71_n_0),
        .I1(Q[7]),
        .I2(counter0_carry_i_72_n_0),
        .I3(Q[5]),
        .I4(counter0_carry_i_73_n_0),
        .O(\address_reg_rep[7]_4 ));
  LUT6 #(
    .INIT(64'hD954573700000000)) 
    counter0_carry_i_36
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(counter0_carry__0_i_29_0),
        .O(counter0_carry_i_36_n_0));
  LUT6 #(
    .INIT(64'h0888808888444404)) 
    counter0_carry_i_37
       (.I0(Q[4]),
        .I1(counter0_carry__0_i_29_0),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(counter0_carry_i_37_n_0));
  LUT6 #(
    .INIT(64'hFAEF0F2F00000000)) 
    counter0_carry_i_38
       (.I0(Q[4]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(Q[2]),
        .I5(counter0_carry__0_i_29_0),
        .O(counter0_carry_i_38_n_0));
  LUT6 #(
    .INIT(64'hC87FFFFF00000000)) 
    counter0_carry_i_39
       (.I0(Q[4]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[3]),
        .I5(counter0_carry__0_i_29_0),
        .O(counter0_carry_i_39_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h000000EF)) 
    counter0_carry_i_40
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[8]),
        .I4(Q[9]),
        .O(counter0_carry_i_40_n_0));
  LUT6 #(
    .INIT(64'h0000000000004553)) 
    counter0_carry_i_41
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(counter0_carry_i_41_n_0));
  LUT6 #(
    .INIT(64'h000000F00000008F)) 
    counter0_carry_i_42
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[9]),
        .I4(Q[8]),
        .I5(Q[2]),
        .O(counter0_carry_i_42_n_0));
  LUT6 #(
    .INIT(64'h0000000001010111)) 
    counter0_carry_i_43
       (.I0(Q[9]),
        .I1(Q[8]),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(Q[1]),
        .I5(Q[4]),
        .O(counter0_carry_i_43_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h000F000E)) 
    counter0_carry_i_44
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[9]),
        .I3(Q[8]),
        .I4(Q[1]),
        .O(counter0_carry_i_44_n_0));
  LUT6 #(
    .INIT(64'h0000005600000077)) 
    counter0_carry_i_45
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[9]),
        .I4(Q[8]),
        .I5(Q[1]),
        .O(counter0_carry_i_45_n_0));
  LUT6 #(
    .INIT(64'h000000000000DEBF)) 
    counter0_carry_i_46
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(counter0_carry_i_46_n_0));
  LUT6 #(
    .INIT(64'h0000000000010302)) 
    counter0_carry_i_47
       (.I0(Q[1]),
        .I1(Q[8]),
        .I2(Q[9]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(counter0_carry_i_47_n_0));
  LUT6 #(
    .INIT(64'h0302010200000000)) 
    counter0_carry_i_48
       (.I0(Q[2]),
        .I1(Q[8]),
        .I2(Q[9]),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(Q[4]),
        .O(counter0_carry_i_48_n_0));
  LUT6 #(
    .INIT(64'h000000C8000000CF)) 
    counter0_carry_i_49
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[8]),
        .I4(Q[9]),
        .I5(Q[2]),
        .O(counter0_carry_i_49_n_0));
  LUT6 #(
    .INIT(64'h000F000E0008000A)) 
    counter0_carry_i_50
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[8]),
        .I3(Q[9]),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(counter0_carry_i_50_n_0));
  LUT6 #(
    .INIT(64'h77003600CA00EE00)) 
    counter0_carry_i_52
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(counter0_carry__0_i_29_0),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(counter0_carry_i_52_n_0));
  LUT6 #(
    .INIT(64'h5356477500000000)) 
    counter0_carry_i_53
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(counter0_carry__0_i_29_0),
        .O(counter0_carry_i_53_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h0302)) 
    counter0_carry_i_54
       (.I0(Q[2]),
        .I1(Q[9]),
        .I2(Q[8]),
        .I3(Q[1]),
        .O(counter0_carry_i_54_n_0));
  LUT6 #(
    .INIT(64'h5400460026006400)) 
    counter0_carry_i_55
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(counter0_carry__0_i_29_0),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(counter0_carry_i_55_n_0));
  LUT6 #(
    .INIT(64'h0000000001010111)) 
    counter0_carry_i_56
       (.I0(Q[9]),
        .I1(Q[8]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[3]),
        .I5(Q[4]),
        .O(counter0_carry_i_56_n_0));
  LUT6 #(
    .INIT(64'h000000000000FEFF)) 
    counter0_carry_i_57
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(counter0_carry_i_57_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h03020000)) 
    counter0_carry_i_58
       (.I0(Q[1]),
        .I1(Q[8]),
        .I2(Q[9]),
        .I3(Q[0]),
        .I4(Q[2]),
        .O(counter0_carry_i_58_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h0007)) 
    counter0_carry_i_59
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(Q[8]),
        .I3(Q[9]),
        .O(counter0_carry_i_59_n_0));
  LUT6 #(
    .INIT(64'h0000000000009DFF)) 
    counter0_carry_i_60
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(counter0_carry_i_60_n_0));
  LUT6 #(
    .INIT(64'h0000000000008FFF)) 
    counter0_carry_i_61
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(counter0_carry_i_61_n_0));
  LUT6 #(
    .INIT(64'h000F00060008000A)) 
    counter0_carry_i_62
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[8]),
        .I3(Q[9]),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(counter0_carry_i_62_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h00000111)) 
    counter0_carry_i_63
       (.I0(Q[9]),
        .I1(Q[8]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .O(counter0_carry_i_63_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    counter0_carry_i_64
       (.I0(Q[1]),
        .I1(Q[8]),
        .I2(Q[9]),
        .I3(Q[2]),
        .O(counter0_carry_i_64_n_0));
  LUT6 #(
    .INIT(64'h000A000A000A0009)) 
    counter0_carry_i_65
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[9]),
        .I3(Q[8]),
        .I4(Q[1]),
        .I5(Q[3]),
        .O(counter0_carry_i_65_n_0));
  LUT6 #(
    .INIT(64'h0005000400000002)) 
    counter0_carry_i_66
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[8]),
        .I3(Q[9]),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(counter0_carry_i_66_n_0));
  LUT6 #(
    .INIT(64'hF700B600CA00EE00)) 
    counter0_carry_i_67
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(counter0_carry__0_i_29_0),
        .I4(Q[0]),
        .I5(Q[2]),
        .O(counter0_carry_i_67_n_0));
  LUT6 #(
    .INIT(64'h4400460066006300)) 
    counter0_carry_i_68
       (.I0(Q[5]),
        .I1(Q[4]),
        .I2(Q[2]),
        .I3(counter0_carry__0_i_29_0),
        .I4(Q[1]),
        .I5(Q[3]),
        .O(counter0_carry_i_68_n_0));
  LUT6 #(
    .INIT(64'h00000000000001FF)) 
    counter0_carry_i_69
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[3]),
        .I3(Q[4]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(counter0_carry_i_69_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h0102)) 
    counter0_carry_i_70
       (.I0(Q[3]),
        .I1(Q[9]),
        .I2(Q[8]),
        .I3(Q[2]),
        .O(counter0_carry_i_70_n_0));
  LUT6 #(
    .INIT(64'h4400400000000200)) 
    counter0_carry_i_71
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(counter0_carry__0_i_29_0),
        .I4(Q[1]),
        .I5(Q[3]),
        .O(counter0_carry_i_71_n_0));
  LUT6 #(
    .INIT(64'hC8CFFFFF00000000)) 
    counter0_carry_i_72
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[4]),
        .I5(counter0_carry__0_i_29_0),
        .O(counter0_carry_i_72_n_0));
  LUT6 #(
    .INIT(64'h0000009800000084)) 
    counter0_carry_i_73
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[8]),
        .I4(Q[9]),
        .I5(Q[2]),
        .O(counter0_carry_i_73_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    in_good_i_11
       (.I0(in_good_i_26_n_0),
        .I1(\address_reg_rep[3] ),
        .I2(Q[6]),
        .I3(in_good_i_27_n_0),
        .I4(Q[7]),
        .I5(\address_reg_rep[3]_0 ),
        .O(\address_reg_rep[6]_1 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    in_good_i_12
       (.I0(in_good_i_28_n_0),
        .I1(in_good_i_29_n_0),
        .I2(Q[6]),
        .I3(\address_reg_rep[4] ),
        .I4(Q[7]),
        .I5(\address_reg_rep[5]_0 ),
        .O(\address_reg_rep[6]_2 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    in_good_i_13
       (.I0(\address_reg_rep[5]_2 ),
        .I1(\address_reg_rep[5]_3 ),
        .I2(Q[6]),
        .I3(in_good_i_30_n_0),
        .I4(Q[7]),
        .I5(\address_reg_rep[3]_2 ),
        .O(\address_reg_rep[6]_4 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    in_good_i_14
       (.I0(counter0_carry_i_68_n_0),
        .I1(in_good_i_31_n_0),
        .I2(Q[6]),
        .I3(in_good_i_32_n_0),
        .I4(Q[7]),
        .I5(\address_reg_rep[3]_2 ),
        .O(\address_reg_rep[6]_3 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    in_good_i_15
       (.I0(in_good_i_33_n_0),
        .I1(in_good_i_34_n_0),
        .I2(Q[6]),
        .I3(\address_reg_rep[5]_5 ),
        .I4(Q[7]),
        .I5(\address_reg_rep[4]_1 ),
        .O(\address_reg_rep[6]_6 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    in_good_i_16
       (.I0(in_good_i_35_n_0),
        .I1(Q[5]),
        .I2(counter0_carry__0_i_42_n_0),
        .I3(Q[7]),
        .I4(\address_reg_rep[3]_0 ),
        .O(\address_reg_rep[5]_8 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    in_good_i_17
       (.I0(counter0_carry_i_43_n_0),
        .I1(Q[5]),
        .I2(counter0_carry_i_44_n_0),
        .I3(Q[4]),
        .I4(counter0_carry__0_i_43_n_0),
        .O(in_good_i_17_n_0));
  LUT6 #(
    .INIT(64'h8830333388300000)) 
    in_good_i_18
       (.I0(counter0_carry_i_40_n_0),
        .I1(Q[5]),
        .I2(counter0_carry_i_63_n_0),
        .I3(Q[3]),
        .I4(Q[4]),
        .I5(counter0_carry_i_42_n_0),
        .O(in_good_i_18_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    in_good_i_19
       (.I0(in_good_i_36_n_0),
        .I1(counter0_carry__1_i_24_n_0),
        .I2(Q[5]),
        .I3(counter0_carry__0_i_50_n_0),
        .I4(Q[4]),
        .I5(counter0_carry__1_i_20_n_0),
        .O(in_good_i_19_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    in_good_i_20
       (.I0(counter0_carry__0_i_41_n_0),
        .I1(in_good_i_37_n_0),
        .I2(Q[5]),
        .I3(counter0_carry_i_60_n_0),
        .I4(Q[4]),
        .I5(counter0_carry_i_61_n_0),
        .O(in_good_i_20_n_0));
  LUT6 #(
    .INIT(64'h00000000FFE200E2)) 
    in_good_i_21
       (.I0(in_good_i_38_n_0),
        .I1(Q[3]),
        .I2(counter0_carry_i_58_n_0),
        .I3(Q[4]),
        .I4(counter0_carry__0_i_40_n_0),
        .I5(Q[5]),
        .O(in_good_i_21_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    in_good_i_22
       (.I0(counter0_carry_i_69_n_0),
        .I1(Q[5]),
        .I2(counter0_carry_i_50_n_0),
        .I3(Q[4]),
        .I4(in_good_i_39_n_0),
        .O(in_good_i_22_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    in_good_i_23
       (.I0(counter0_carry_i_48_n_0),
        .I1(Q[5]),
        .I2(counter0_carry_i_47_n_0),
        .I3(Q[4]),
        .I4(counter0_carry__1_i_26_n_0),
        .O(in_good_i_23_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h04)) 
    in_good_i_26
       (.I0(Q[4]),
        .I1(counter0_carry_i_45_n_0),
        .I2(Q[5]),
        .O(in_good_i_26_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    in_good_i_27
       (.I0(counter0_carry__0_i_34_n_0),
        .I1(Q[5]),
        .I2(counter0_carry__0_i_50_n_0),
        .I3(Q[4]),
        .I4(counter0_carry__1_i_20_n_0),
        .O(in_good_i_27_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    in_good_i_28
       (.I0(counter0_carry_i_43_n_0),
        .I1(Q[5]),
        .I2(counter0_carry_i_57_n_0),
        .I3(Q[4]),
        .I4(in_good_i_40_n_0),
        .O(in_good_i_28_n_0));
  LUT6 #(
    .INIT(64'h00000000EEE222E2)) 
    in_good_i_29
       (.I0(in_good_i_39_n_0),
        .I1(Q[4]),
        .I2(counter0_carry_i_58_n_0),
        .I3(Q[3]),
        .I4(in_good_i_41_n_0),
        .I5(Q[5]),
        .O(in_good_i_29_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    in_good_i_30
       (.I0(in_good_i_42_n_0),
        .I1(counter0_carry_i_62_n_0),
        .I2(Q[5]),
        .I3(counter0_carry_i_47_n_0),
        .I4(Q[4]),
        .I5(counter0_carry_i_46_n_0),
        .O(in_good_i_30_n_0));
  LUT6 #(
    .INIT(64'h22FF2200F000F000)) 
    in_good_i_31
       (.I0(in_good_i_38_n_0),
        .I1(Q[3]),
        .I2(counter0_carry__0_i_29_0),
        .I3(Q[5]),
        .I4(counter0_carry_i_50_n_0),
        .I5(Q[4]),
        .O(in_good_i_31_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    in_good_i_32
       (.I0(counter0_carry__1_i_23_n_0),
        .I1(counter0_carry_i_62_n_0),
        .I2(Q[5]),
        .I3(counter0_carry_i_47_n_0),
        .I4(Q[4]),
        .I5(counter0_carry__1_i_26_n_0),
        .O(in_good_i_32_n_0));
  LUT5 #(
    .INIT(32'h0000F808)) 
    in_good_i_33
       (.I0(Q[3]),
        .I1(counter0_carry_i_58_n_0),
        .I2(Q[4]),
        .I3(counter0_carry__0_i_40_n_0),
        .I4(Q[5]),
        .O(in_good_i_33_n_0));
  LUT6 #(
    .INIT(64'h888BFFFF888B0000)) 
    in_good_i_34
       (.I0(counter0_carry_i_49_n_0),
        .I1(Q[4]),
        .I2(Q[8]),
        .I3(Q[9]),
        .I4(Q[5]),
        .I5(counter0_carry_i_73_n_0),
        .O(in_good_i_34_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h00020009)) 
    in_good_i_35
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[8]),
        .I3(Q[9]),
        .I4(Q[3]),
        .O(in_good_i_35_n_0));
  LUT6 #(
    .INIT(64'h0000000000000015)) 
    in_good_i_36
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[8]),
        .I4(Q[9]),
        .I5(Q[3]),
        .O(in_good_i_36_n_0));
  LUT6 #(
    .INIT(64'h000000000000CB33)) 
    in_good_i_37
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(in_good_i_37_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    in_good_i_38
       (.I0(Q[1]),
        .I1(Q[8]),
        .I2(Q[9]),
        .I3(Q[2]),
        .O(in_good_i_38_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h00040002)) 
    in_good_i_39
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[8]),
        .I3(Q[9]),
        .I4(Q[2]),
        .O(in_good_i_39_n_0));
  LUT6 #(
    .INIT(64'h000000C800000003)) 
    in_good_i_40
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[8]),
        .I4(Q[9]),
        .I5(Q[2]),
        .O(in_good_i_40_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    in_good_i_41
       (.I0(Q[0]),
        .I1(Q[9]),
        .I2(Q[8]),
        .I3(Q[1]),
        .I4(Q[2]),
        .O(in_good_i_41_n_0));
  LUT6 #(
    .INIT(64'h0000000000006777)) 
    in_good_i_42
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(in_good_i_42_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    in_good_i_7
       (.I0(in_good_i_17_n_0),
        .I1(in_good_i_18_n_0),
        .I2(Q[6]),
        .I3(in_good_i_19_n_0),
        .I4(Q[7]),
        .I5(in_good_i_20_n_0),
        .O(\address_reg_rep[6] ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    in_good_i_8
       (.I0(in_good_i_21_n_0),
        .I1(in_good_i_22_n_0),
        .I2(Q[6]),
        .I3(in_good_i_23_n_0),
        .I4(Q[7]),
        .I5(\address_reg_rep[4]_1 ),
        .O(\address_reg_rep[6]_7 ));
  MUXF8 in_good_reg_i_10
       (.I0(\address_reg_rep[7]_3 ),
        .I1(in_good_reg_i_25_n_0),
        .O(\address_reg_rep[6]_5 ),
        .S(Q[6]));
  MUXF7 in_good_reg_i_24
       (.I0(\address_reg_rep[5]_7 ),
        .I1(\address_reg_rep[3]_3 ),
        .O(in_good_reg_i_24_n_0),
        .S(Q[7]));
  MUXF7 in_good_reg_i_25
       (.I0(\address_reg_rep[5]_10 ),
        .I1(\address_reg_rep[5]_11 ),
        .O(in_good_reg_i_25_n_0),
        .S(Q[7]));
  MUXF8 in_good_reg_i_9
       (.I0(\address_reg_rep[7]_1 ),
        .I1(in_good_reg_i_24_n_0),
        .O(\address_reg_rep[6]_0 ),
        .S(Q[6]));
endmodule

module synchronizer
   (Q,
    \q1_reg[3]_0 ,
    CLK_125MHZ_FPGA_IBUF_BUFG);
  output [3:0]Q;
  input [3:0]\q1_reg[3]_0 ;
  input CLK_125MHZ_FPGA_IBUF_BUFG;

  wire \<const0> ;
  wire \<const1> ;
  wire CLK_125MHZ_FPGA_IBUF_BUFG;
  wire [3:0]Q;
  wire [3:0]q1;
  wire [3:0]\q1_reg[3]_0 ;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  FDRE #(
    .INIT(1'b0)) 
    \q1_reg[0] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\q1_reg[3]_0 [0]),
        .Q(q1[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \q1_reg[1] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\q1_reg[3]_0 [1]),
        .Q(q1[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \q1_reg[2] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\q1_reg[3]_0 [2]),
        .Q(q1[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \q1_reg[3] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\q1_reg[3]_0 [3]),
        .Q(q1[3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \q2_reg[0] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(q1[0]),
        .Q(Q[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \q2_reg[1] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(q1[1]),
        .Q(Q[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \q2_reg[2] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(q1[2]),
        .Q(Q[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \q2_reg[3] 
       (.C(CLK_125MHZ_FPGA_IBUF_BUFG),
        .CE(\<const1> ),
        .D(q1[3]),
        .Q(Q[3]),
        .R(\<const0> ));
endmodule

module tone_generator
   (aud_pwm_OBUF,
    out,
    CLK,
    counter0_carry__0_0,
    counter0_carry__1_0,
    out1_carry__0_0,
    out_reg_0,
    S,
    out_reg_1,
    SWITCHES_IBUF,
    in_good_reg_0,
    out1_carry_0,
    out1_carry_1,
    counter0_carry__0_1,
    counter0_carry__0_2,
    \out1_inferred__0/i__carry_0 ,
    counter0_carry__1_1,
    \out1_inferred__0/i__carry_1 ,
    out1_carry__0_1,
    out1_carry__0_2,
    counter0_carry_0,
    counter0_carry_1,
    out1_carry__0_3,
    counter0_carry__0_3,
    out1_carry_2,
    counter0_carry_2,
    out1_carry__0_4,
    out_reg_2,
    in_good);
  output aud_pwm_OBUF;
  output [14:0]out;
  input CLK;
  input [1:0]counter0_carry__0_0;
  input [0:0]counter0_carry__1_0;
  input [0:0]out1_carry__0_0;
  input [0:0]out_reg_0;
  input [2:0]S;
  input [1:0]out_reg_1;
  input [0:0]SWITCHES_IBUF;
  input in_good_reg_0;
  input out1_carry_0;
  input out1_carry_1;
  input counter0_carry__0_1;
  input counter0_carry__0_2;
  input \out1_inferred__0/i__carry_0 ;
  input counter0_carry__1_1;
  input \out1_inferred__0/i__carry_1 ;
  input out1_carry__0_1;
  input out1_carry__0_2;
  input counter0_carry_0;
  input counter0_carry_1;
  input out1_carry__0_3;
  input counter0_carry__0_3;
  input out1_carry_2;
  input counter0_carry_2;
  input out1_carry__0_4;
  input [0:0]out_reg_2;
  input in_good;

  wire \<const0> ;
  wire \<const1> ;
  wire CLK;
  wire [2:0]S;
  wire [0:0]SWITCHES_IBUF;
  wire aud_pwm_OBUF;
  wire counter0_carry_0;
  wire counter0_carry_1;
  wire counter0_carry_2;
  wire [1:0]counter0_carry__0_0;
  wire counter0_carry__0_1;
  wire counter0_carry__0_2;
  wire counter0_carry__0_3;
  wire counter0_carry__0_i_1_n_0;
  wire counter0_carry__0_i_2_n_0;
  wire counter0_carry__0_i_3_n_0;
  wire counter0_carry__0_i_4_n_0;
  wire counter0_carry__0_i_5_n_0;
  wire counter0_carry__0_i_7_n_0;
  wire counter0_carry__0_i_8_n_0;
  wire counter0_carry__0_n_0;
  wire counter0_carry__0_n_1;
  wire counter0_carry__0_n_2;
  wire counter0_carry__0_n_3;
  wire [0:0]counter0_carry__1_0;
  wire counter0_carry__1_1;
  wire counter0_carry__1_i_1_n_0;
  wire counter0_carry__1_i_2_n_0;
  wire counter0_carry__1_i_3_n_0;
  wire counter0_carry__1_i_4_n_0;
  wire counter0_carry__1_i_5_n_0;
  wire counter0_carry__1_i_6_n_0;
  wire counter0_carry__1_i_7_n_0;
  wire counter0_carry__1_i_8_n_0;
  wire counter0_carry__1_n_0;
  wire counter0_carry__1_n_1;
  wire counter0_carry__1_n_2;
  wire counter0_carry__1_n_3;
  wire counter0_carry_i_1_n_0;
  wire counter0_carry_i_2_n_0;
  wire counter0_carry_i_3_n_0;
  wire counter0_carry_i_4_n_0;
  wire counter0_carry_i_6_n_0;
  wire counter0_carry_i_8_n_0;
  wire counter0_carry_n_0;
  wire counter0_carry_n_1;
  wire counter0_carry_n_2;
  wire counter0_carry_n_3;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[0]_i_3_n_0 ;
  wire [23:9]counter_reg;
  wire \counter_reg[0]_i_2_n_0 ;
  wire \counter_reg[0]_i_2_n_1 ;
  wire \counter_reg[0]_i_2_n_2 ;
  wire \counter_reg[0]_i_2_n_3 ;
  wire \counter_reg[0]_i_2_n_4 ;
  wire \counter_reg[0]_i_2_n_5 ;
  wire \counter_reg[0]_i_2_n_6 ;
  wire \counter_reg[0]_i_2_n_7 ;
  wire \counter_reg[12]_i_1_n_0 ;
  wire \counter_reg[12]_i_1_n_1 ;
  wire \counter_reg[12]_i_1_n_2 ;
  wire \counter_reg[12]_i_1_n_3 ;
  wire \counter_reg[12]_i_1_n_4 ;
  wire \counter_reg[12]_i_1_n_5 ;
  wire \counter_reg[12]_i_1_n_6 ;
  wire \counter_reg[12]_i_1_n_7 ;
  wire \counter_reg[16]_i_1_n_0 ;
  wire \counter_reg[16]_i_1_n_1 ;
  wire \counter_reg[16]_i_1_n_2 ;
  wire \counter_reg[16]_i_1_n_3 ;
  wire \counter_reg[16]_i_1_n_4 ;
  wire \counter_reg[16]_i_1_n_5 ;
  wire \counter_reg[16]_i_1_n_6 ;
  wire \counter_reg[16]_i_1_n_7 ;
  wire \counter_reg[20]_i_1_n_1 ;
  wire \counter_reg[20]_i_1_n_2 ;
  wire \counter_reg[20]_i_1_n_3 ;
  wire \counter_reg[20]_i_1_n_4 ;
  wire \counter_reg[20]_i_1_n_5 ;
  wire \counter_reg[20]_i_1_n_6 ;
  wire \counter_reg[20]_i_1_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_1 ;
  wire \counter_reg[4]_i_1_n_2 ;
  wire \counter_reg[4]_i_1_n_3 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_1 ;
  wire \counter_reg[8]_i_1_n_2 ;
  wire \counter_reg[8]_i_1_n_3 ;
  wire \counter_reg[8]_i_1_n_4 ;
  wire \counter_reg[8]_i_1_n_5 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry_i_1_n_0;
  wire in_good;
  wire in_good_reg_0;
  wire in_good_reg_n_0;
  wire [14:0]out;
  wire out1_carry_0;
  wire out1_carry_1;
  wire out1_carry_2;
  wire [0:0]out1_carry__0_0;
  wire out1_carry__0_1;
  wire out1_carry__0_2;
  wire out1_carry__0_3;
  wire out1_carry__0_4;
  wire out1_carry__0_i_1_n_0;
  wire out1_carry__0_i_2_n_0;
  wire out1_carry__0_i_4_n_0;
  wire out1_carry__0_n_0;
  wire out1_carry__0_n_1;
  wire out1_carry__0_n_2;
  wire out1_carry__0_n_3;
  wire out1_carry_i_1_n_0;
  wire out1_carry_i_2_n_0;
  wire out1_carry_i_4_n_0;
  wire out1_carry_n_0;
  wire out1_carry_n_1;
  wire out1_carry_n_2;
  wire out1_carry_n_3;
  wire \out1_inferred__0/i__carry_0 ;
  wire \out1_inferred__0/i__carry_1 ;
  wire \out1_inferred__0/i__carry__0_n_0 ;
  wire \out1_inferred__0/i__carry__0_n_1 ;
  wire \out1_inferred__0/i__carry__0_n_2 ;
  wire \out1_inferred__0/i__carry__0_n_3 ;
  wire \out1_inferred__0/i__carry_n_0 ;
  wire \out1_inferred__0/i__carry_n_1 ;
  wire \out1_inferred__0/i__carry_n_2 ;
  wire \out1_inferred__0/i__carry_n_3 ;
  wire out_i_1_n_0;
  wire [0:0]out_reg_0;
  wire [1:0]out_reg_1;
  wire [0:0]out_reg_2;
  wire out_reg_n_0;
  wire pwm;
  wire pwm_i_1_n_0;

  LUT4 #(
    .INIT(16'h8000)) 
    \/i_ 
       (.I0(out_reg_n_0),
        .I1(SWITCHES_IBUF),
        .I2(in_good_reg_n_0),
        .I3(pwm),
        .O(aud_pwm_OBUF));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 counter0_carry
       (.CI(\<const0> ),
        .CO({counter0_carry_n_0,counter0_carry_n_1,counter0_carry_n_2,counter0_carry_n_3}),
        .CYINIT(\<const1> ),
        .DI({counter0_carry_i_1_n_0,counter0_carry_i_2_n_0,counter0_carry_i_3_n_0,counter0_carry_i_4_n_0}),
        .S({counter0_carry__0_0[1],counter0_carry_i_6_n_0,counter0_carry__0_0[0],counter0_carry_i_8_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 counter0_carry__0
       (.CI(counter0_carry_n_0),
        .CO({counter0_carry__0_n_0,counter0_carry__0_n_1,counter0_carry__0_n_2,counter0_carry__0_n_3}),
        .CYINIT(\<const0> ),
        .DI({counter0_carry__0_i_1_n_0,counter0_carry__0_i_2_n_0,counter0_carry__0_i_3_n_0,counter0_carry__0_i_4_n_0}),
        .S({counter0_carry__0_i_5_n_0,counter0_carry__1_0,counter0_carry__0_i_7_n_0,counter0_carry__0_i_8_n_0}));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter0_carry__0_i_1
       (.I0(out[11]),
        .I1(out1_carry__0_3),
        .I2(counter0_carry__0_3),
        .I3(out[12]),
        .O(counter0_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter0_carry__0_i_2
       (.I0(out[9]),
        .I1(out1_carry__0_1),
        .I2(out1_carry__0_2),
        .I3(out[10]),
        .O(counter0_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter0_carry__0_i_3
       (.I0(counter_reg[10]),
        .I1(\out1_inferred__0/i__carry_1 ),
        .I2(\out1_inferred__0/i__carry_0 ),
        .I3(counter_reg[11]),
        .O(counter0_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter0_carry__0_i_4
       (.I0(out[8]),
        .I1(counter0_carry__0_1),
        .I2(counter0_carry__0_2),
        .I3(counter_reg[9]),
        .O(counter0_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter0_carry__0_i_5
       (.I0(out[11]),
        .I1(out1_carry__0_3),
        .I2(counter0_carry__0_3),
        .I3(out[12]),
        .O(counter0_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter0_carry__0_i_7
       (.I0(counter_reg[11]),
        .I1(\out1_inferred__0/i__carry_0 ),
        .I2(\out1_inferred__0/i__carry_1 ),
        .I3(counter_reg[10]),
        .O(counter0_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter0_carry__0_i_8
       (.I0(out[8]),
        .I1(counter0_carry__0_1),
        .I2(counter0_carry__0_2),
        .I3(counter_reg[9]),
        .O(counter0_carry__0_i_8_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 counter0_carry__1
       (.CI(counter0_carry__0_n_0),
        .CO({counter0_carry__1_n_0,counter0_carry__1_n_1,counter0_carry__1_n_2,counter0_carry__1_n_3}),
        .CYINIT(\<const0> ),
        .DI({counter0_carry__1_i_1_n_0,counter0_carry__1_i_2_n_0,counter0_carry__1_i_3_n_0,counter0_carry__1_i_4_n_0}),
        .S({counter0_carry__1_i_5_n_0,counter0_carry__1_i_6_n_0,counter0_carry__1_i_7_n_0,counter0_carry__1_i_8_n_0}));
  LUT2 #(
    .INIT(4'hE)) 
    counter0_carry__1_i_1
       (.I0(counter_reg[23]),
        .I1(counter_reg[22]),
        .O(counter0_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    counter0_carry__1_i_2
       (.I0(counter_reg[20]),
        .I1(counter_reg[21]),
        .O(counter0_carry__1_i_2_n_0));
  LUT3 #(
    .INIT(8'hF4)) 
    counter0_carry__1_i_3
       (.I0(out1_carry__0_4),
        .I1(counter_reg[18]),
        .I2(counter_reg[19]),
        .O(counter0_carry__1_i_3_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter0_carry__1_i_4
       (.I0(out[13]),
        .I1(\out1_inferred__0/i__carry_0 ),
        .I2(counter0_carry__1_1),
        .I3(out[14]),
        .O(counter0_carry__1_i_4_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    counter0_carry__1_i_5
       (.I0(counter_reg[22]),
        .I1(counter_reg[23]),
        .O(counter0_carry__1_i_5_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    counter0_carry__1_i_6
       (.I0(counter_reg[21]),
        .I1(counter_reg[20]),
        .O(counter0_carry__1_i_6_n_0));
  LUT3 #(
    .INIT(8'h09)) 
    counter0_carry__1_i_7
       (.I0(out1_carry__0_4),
        .I1(counter_reg[18]),
        .I2(counter_reg[19]),
        .O(counter0_carry__1_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter0_carry__1_i_8
       (.I0(out[14]),
        .I1(counter0_carry__1_1),
        .I2(\out1_inferred__0/i__carry_0 ),
        .I3(out[13]),
        .O(counter0_carry__1_i_8_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter0_carry_i_1
       (.I0(out[6]),
        .I1(out1_carry_0),
        .I2(out1_carry_1),
        .I3(out[7]),
        .O(counter0_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter0_carry_i_2
       (.I0(out[4]),
        .I1(counter0_carry_0),
        .I2(counter0_carry_1),
        .I3(out[5]),
        .O(counter0_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    counter0_carry_i_3
       (.I0(out[2]),
        .I1(out1_carry_2),
        .I2(counter0_carry_2),
        .I3(out[3]),
        .O(counter0_carry_i_3_n_0));
  LUT3 #(
    .INIT(8'hB2)) 
    counter0_carry_i_4
       (.I0(out[0]),
        .I1(\out1_inferred__0/i__carry_1 ),
        .I2(out[1]),
        .O(counter0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    counter0_carry_i_6
       (.I0(out[5]),
        .I1(counter0_carry_1),
        .I2(counter0_carry_0),
        .I3(out[4]),
        .O(counter0_carry_i_6_n_0));
  LUT3 #(
    .INIT(8'h09)) 
    counter0_carry_i_8
       (.I0(\out1_inferred__0/i__carry_1 ),
        .I1(out[1]),
        .I2(out[0]),
        .O(counter0_carry_i_8_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    \counter[0]_i_1 
       (.I0(counter0_carry__1_n_0),
        .I1(out_reg_2),
        .O(\counter[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_3 
       (.I0(out[0]),
        .O(\counter[0]_i_3_n_0 ));
  FDRE \counter_reg[0] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[0]_i_2_n_7 ),
        .Q(out[0]),
        .R(\counter[0]_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \counter_reg[0]_i_2 
       (.CI(\<const0> ),
        .CO({\counter_reg[0]_i_2_n_0 ,\counter_reg[0]_i_2_n_1 ,\counter_reg[0]_i_2_n_2 ,\counter_reg[0]_i_2_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .O({\counter_reg[0]_i_2_n_4 ,\counter_reg[0]_i_2_n_5 ,\counter_reg[0]_i_2_n_6 ,\counter_reg[0]_i_2_n_7 }),
        .S({out[3:1],\counter[0]_i_3_n_0 }));
  FDRE \counter_reg[10] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(counter_reg[10]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[11] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(counter_reg[11]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[12] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(out[9]),
        .R(\counter[0]_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\counter_reg[12]_i_1_n_0 ,\counter_reg[12]_i_1_n_1 ,\counter_reg[12]_i_1_n_2 ,\counter_reg[12]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\counter_reg[12]_i_1_n_4 ,\counter_reg[12]_i_1_n_5 ,\counter_reg[12]_i_1_n_6 ,\counter_reg[12]_i_1_n_7 }),
        .S(out[12:9]));
  FDRE \counter_reg[13] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(out[10]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[14] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[12]_i_1_n_5 ),
        .Q(out[11]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[15] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[12]_i_1_n_4 ),
        .Q(out[12]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[16] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[16]_i_1_n_7 ),
        .Q(out[13]),
        .R(\counter[0]_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \counter_reg[16]_i_1 
       (.CI(\counter_reg[12]_i_1_n_0 ),
        .CO({\counter_reg[16]_i_1_n_0 ,\counter_reg[16]_i_1_n_1 ,\counter_reg[16]_i_1_n_2 ,\counter_reg[16]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\counter_reg[16]_i_1_n_4 ,\counter_reg[16]_i_1_n_5 ,\counter_reg[16]_i_1_n_6 ,\counter_reg[16]_i_1_n_7 }),
        .S({counter_reg[19:18],out[14:13]}));
  FDRE \counter_reg[17] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[16]_i_1_n_6 ),
        .Q(out[14]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[18] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[16]_i_1_n_5 ),
        .Q(counter_reg[18]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[19] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[16]_i_1_n_4 ),
        .Q(counter_reg[19]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[1] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[0]_i_2_n_6 ),
        .Q(out[1]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[20] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[20]_i_1_n_7 ),
        .Q(counter_reg[20]),
        .R(\counter[0]_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \counter_reg[20]_i_1 
       (.CI(\counter_reg[16]_i_1_n_0 ),
        .CO({\counter_reg[20]_i_1_n_1 ,\counter_reg[20]_i_1_n_2 ,\counter_reg[20]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\counter_reg[20]_i_1_n_4 ,\counter_reg[20]_i_1_n_5 ,\counter_reg[20]_i_1_n_6 ,\counter_reg[20]_i_1_n_7 }),
        .S(counter_reg[23:20]));
  FDRE \counter_reg[21] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[20]_i_1_n_6 ),
        .Q(counter_reg[21]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[22] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[20]_i_1_n_5 ),
        .Q(counter_reg[22]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[23] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[20]_i_1_n_4 ),
        .Q(counter_reg[23]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[2] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[0]_i_2_n_5 ),
        .Q(out[2]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[3] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[0]_i_2_n_4 ),
        .Q(out[3]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[4] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(out[4]),
        .R(\counter[0]_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_2_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\counter_reg[4]_i_1_n_1 ,\counter_reg[4]_i_1_n_2 ,\counter_reg[4]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S(out[7:4]));
  FDRE \counter_reg[5] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(out[5]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[6] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(out[6]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[7] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(out[7]),
        .R(\counter[0]_i_1_n_0 ));
  FDRE \counter_reg[8] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(out[8]),
        .R(\counter[0]_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\counter_reg[8]_i_1_n_1 ,\counter_reg[8]_i_1_n_2 ,\counter_reg[8]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({\counter_reg[8]_i_1_n_4 ,\counter_reg[8]_i_1_n_5 ,\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S({counter_reg[11:9],out[8]}));
  FDRE \counter_reg[9] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(counter_reg[9]),
        .R(\counter[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    i__carry__0_i_1
       (.I0(counter_reg[23]),
        .I1(counter_reg[22]),
        .I2(counter_reg[21]),
        .O(i__carry__0_i_1_n_0));
  LUT3 #(
    .INIT(8'h01)) 
    i__carry__0_i_2
       (.I0(counter_reg[20]),
        .I1(counter_reg[19]),
        .I2(counter_reg[18]),
        .O(i__carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    i__carry_i_1
       (.I0(counter_reg[11]),
        .I1(out1_carry__0_1),
        .I2(\out1_inferred__0/i__carry_1 ),
        .I3(counter_reg[9]),
        .I4(\out1_inferred__0/i__carry_0 ),
        .I5(counter_reg[10]),
        .O(i__carry_i_1_n_0));
  FDRE in_good_reg
       (.C(CLK),
        .CE(\<const1> ),
        .D(in_good_reg_0),
        .Q(in_good_reg_n_0),
        .R(\<const0> ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 out1_carry
       (.CI(\<const0> ),
        .CO({out1_carry_n_0,out1_carry_n_1,out1_carry_n_2,out1_carry_n_3}),
        .CYINIT(\<const1> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({out1_carry_i_1_n_0,out1_carry_i_2_n_0,out1_carry__0_0,out1_carry_i_4_n_0}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 out1_carry__0
       (.CI(out1_carry_n_0),
        .CO({out1_carry__0_n_0,out1_carry__0_n_1,out1_carry__0_n_2,out1_carry__0_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({out1_carry__0_i_1_n_0,out1_carry__0_i_2_n_0,out_reg_0,out1_carry__0_i_4_n_0}));
  LUT3 #(
    .INIT(8'h01)) 
    out1_carry__0_i_1
       (.I0(counter_reg[23]),
        .I1(counter_reg[22]),
        .I2(counter_reg[21]),
        .O(out1_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h0009)) 
    out1_carry__0_i_2
       (.I0(out1_carry__0_4),
        .I1(counter_reg[18]),
        .I2(counter_reg[20]),
        .I3(counter_reg[19]),
        .O(out1_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    out1_carry__0_i_4
       (.I0(out[11]),
        .I1(out1_carry__0_3),
        .I2(out1_carry__0_2),
        .I3(out[10]),
        .I4(out[9]),
        .I5(out1_carry__0_1),
        .O(out1_carry__0_i_4_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    out1_carry_i_1
       (.I0(counter_reg[11]),
        .I1(\out1_inferred__0/i__carry_0 ),
        .I2(counter0_carry__0_2),
        .I3(counter_reg[9]),
        .I4(counter_reg[10]),
        .I5(\out1_inferred__0/i__carry_1 ),
        .O(out1_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    out1_carry_i_2
       (.I0(out[8]),
        .I1(counter0_carry__0_1),
        .I2(out1_carry_1),
        .I3(out[7]),
        .I4(out1_carry_0),
        .I5(out[6]),
        .O(out1_carry_i_2_n_0));
  LUT5 #(
    .INIT(32'h09000009)) 
    out1_carry_i_4
       (.I0(out[2]),
        .I1(out1_carry_2),
        .I2(out[0]),
        .I3(out[1]),
        .I4(\out1_inferred__0/i__carry_1 ),
        .O(out1_carry_i_4_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \out1_inferred__0/i__carry 
       (.CI(\<const0> ),
        .CO({\out1_inferred__0/i__carry_n_0 ,\out1_inferred__0/i__carry_n_1 ,\out1_inferred__0/i__carry_n_2 ,\out1_inferred__0/i__carry_n_3 }),
        .CYINIT(\<const1> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({i__carry_i_1_n_0,S}));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY4 \out1_inferred__0/i__carry__0 
       (.CI(\out1_inferred__0/i__carry_n_0 ),
        .CO({\out1_inferred__0/i__carry__0_n_0 ,\out1_inferred__0/i__carry__0_n_1 ,\out1_inferred__0/i__carry__0_n_2 ,\out1_inferred__0/i__carry__0_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,out_reg_1}));
  LUT5 #(
    .INIT(32'h000056AA)) 
    out_i_1
       (.I0(out_reg_n_0),
        .I1(out1_carry__0_n_0),
        .I2(\out1_inferred__0/i__carry__0_n_0 ),
        .I3(in_good),
        .I4(out_reg_2),
        .O(out_i_1_n_0));
  FDRE out_reg
       (.C(CLK),
        .CE(\<const1> ),
        .D(out_i_1_n_0),
        .Q(out_reg_n_0),
        .R(\<const0> ));
  LUT2 #(
    .INIT(4'h8)) 
    pwm_i_1
       (.I0(out[1]),
        .I1(out[0]),
        .O(pwm_i_1_n_0));
  FDRE pwm_reg
       (.C(CLK),
        .CE(\<const1> ),
        .D(pwm_i_1_n_0),
        .Q(pwm),
        .R(\<const0> ));
endmodule

module uart
   (FPGA_SERIAL_TX_OBUF,
    serial_out_reg_reg_0,
    CLK);
  output FPGA_SERIAL_TX_OBUF;
  input serial_out_reg_reg_0;
  input CLK;

  wire \<const0> ;
  wire \<const1> ;
  wire CLK;
  wire FPGA_SERIAL_TX_OBUF;
  wire serial_out_reg_reg_0;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  FDRE serial_out_reg_reg
       (.C(CLK),
        .CE(\<const1> ),
        .D(serial_out_reg_reg_0),
        .Q(FPGA_SERIAL_TX_OBUF),
        .R(\<const0> ));
endmodule

(* BAUD_RATE = "115200" *) (* B_PULSE_COUNT_MAX = "200" *) (* B_SAMPLE_COUNT_MAX = "62500" *) 
(* CLOCK_FREQ = "125000000" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module z1top
   (CLK_125MHZ_FPGA,
    BUTTONS,
    SWITCHES,
    LEDS,
    aud_pwm,
    aud_sd,
    FPGA_SERIAL_RX,
    FPGA_SERIAL_TX);
  input CLK_125MHZ_FPGA;
  input [3:0]BUTTONS;
  input [1:0]SWITCHES;
  output [5:0]LEDS;
  output aud_pwm;
  output aud_sd;
  input FPGA_SERIAL_RX;
  output FPGA_SERIAL_TX;

  wire \<const0> ;
  wire \<const1> ;
  wire [3:0]BUTTONS;
  wire [3:0]BUTTONS_IBUF;
  wire CLK_125MHZ_FPGA;
  wire CLK_125MHZ_FPGA_IBUF;
  wire CLK_125MHZ_FPGA_IBUF_BUFG;
  wire FPGA_SERIAL_TX;
  wire FPGA_SERIAL_TX_OBUF;
  wire [5:0]LEDS;
  wire [2:0]LEDS_OBUF;
  wire [1:0]SWITCHES;
  wire [1:0]SWITCHES_IBUF;
  wire aud_pwm;
  wire aud_pwm_OBUF;
  wire aud_sd;
  wire bp_n_10;
  wire bp_n_11;
  wire bp_n_12;
  wire bp_n_13;
  wire bp_n_14;
  wire bp_n_15;
  wire bp_n_16;
  wire bp_n_17;
  wire bp_n_18;
  wire bp_n_19;
  wire bp_n_20;
  wire bp_n_21;
  wire bp_n_22;
  wire bp_n_23;
  wire bp_n_24;
  wire bp_n_25;
  wire bp_n_26;
  wire bp_n_6;
  wire bp_n_7;
  wire bp_n_8;
  wire bp_n_9;
  wire [3:1]\button_edge_detector/prev ;
  wire [17:0]counter_reg;
  wire [23:6]cycles_reg;
  wire [3:1]debounced_signals;
  wire in_good;
  wire streamer_n_19;
  wire streamer_n_20;
  wire streamer_n_24;
  wire streamer_n_25;
  wire streamer_n_26;
  wire streamer_n_27;
  wire streamer_n_28;
  wire streamer_n_29;
  wire streamer_n_30;
  wire streamer_n_31;
  wire streamer_n_32;
  wire streamer_n_33;
  wire streamer_n_34;
  wire streamer_n_35;
  wire streamer_n_36;
  wire streamer_n_37;
  wire streamer_n_38;
  wire streamer_n_39;
  wire streamer_n_40;
  wire streamer_n_41;
  wire streamer_n_42;
  wire streamer_n_43;
  wire streamer_n_44;
  wire streamer_n_45;
  wire streamer_n_46;
  wire streamer_n_47;
  wire streamer_n_48;

  IBUF \BUTTONS_IBUF[0]_inst 
       (.I(BUTTONS[0]),
        .O(BUTTONS_IBUF[0]));
  IBUF \BUTTONS_IBUF[1]_inst 
       (.I(BUTTONS[1]),
        .O(BUTTONS_IBUF[1]));
  IBUF \BUTTONS_IBUF[2]_inst 
       (.I(BUTTONS[2]),
        .O(BUTTONS_IBUF[2]));
  IBUF \BUTTONS_IBUF[3]_inst 
       (.I(BUTTONS[3]),
        .O(BUTTONS_IBUF[3]));
  BUFG CLK_125MHZ_FPGA_IBUF_BUFG_inst
       (.I(CLK_125MHZ_FPGA_IBUF),
        .O(CLK_125MHZ_FPGA_IBUF_BUFG));
  IBUF CLK_125MHZ_FPGA_IBUF_inst
       (.I(CLK_125MHZ_FPGA),
        .O(CLK_125MHZ_FPGA_IBUF));
  OBUF FPGA_SERIAL_TX_OBUF_inst
       (.I(FPGA_SERIAL_TX_OBUF),
        .O(FPGA_SERIAL_TX));
  GND GND
       (.G(\<const0> ));
  OBUF \LEDS_OBUF[0]_inst 
       (.I(LEDS_OBUF[0]),
        .O(LEDS[0]));
  OBUF \LEDS_OBUF[1]_inst 
       (.I(LEDS_OBUF[1]),
        .O(LEDS[1]));
  OBUF \LEDS_OBUF[2]_inst 
       (.I(LEDS_OBUF[2]),
        .O(LEDS[2]));
  OBUFT \LEDS_OBUF[3]_inst 
       (.I(\<const0> ),
        .O(LEDS[3]),
        .T(\<const1> ));
  OBUFT \LEDS_OBUF[4]_inst 
       (.I(\<const0> ),
        .O(LEDS[4]),
        .T(\<const1> ));
  OBUFT \LEDS_OBUF[5]_inst 
       (.I(\<const0> ),
        .O(LEDS[5]),
        .T(\<const1> ));
  IBUF \SWITCHES_IBUF[0]_inst 
       (.I(SWITCHES[0]),
        .O(SWITCHES_IBUF[0]));
  IBUF \SWITCHES_IBUF[1]_inst 
       (.I(SWITCHES[1]),
        .O(SWITCHES_IBUF[1]));
  VCC VCC
       (.P(\<const1> ));
  OBUF aud_pwm_OBUF_inst
       (.I(aud_pwm_OBUF),
        .O(aud_pwm));
  OBUF aud_sd_OBUF_inst
       (.I(\<const1> ),
        .O(aud_sd));
  button_parser bp
       (.CLK_125MHZ_FPGA_IBUF_BUFG(CLK_125MHZ_FPGA_IBUF_BUFG),
        .D(debounced_signals),
        .O({bp_n_9,bp_n_10,bp_n_11,bp_n_12}),
        .Q(\button_edge_detector/prev ),
        .\SATURATE_COUNTER[0].switchOut_reg[0] (bp_n_7),
        .\SATURATE_COUNTER[1].switchOut_reg[1] (bp_n_6),
        .\SATURATE_COUNTER[2].switchOut_reg[2] (bp_n_8),
        .SWITCHES_IBUF(SWITCHES_IBUF[1]),
        .cycles_reg(cycles_reg),
        .\cycles_reg[17] ({bp_n_17,bp_n_18,bp_n_19,bp_n_20}),
        .\cycles_reg[19] ({bp_n_21,bp_n_22,bp_n_23,bp_n_24}),
        .\cycles_reg[19]_0 ({bp_n_25,bp_n_26}),
        .\cycles_reg[9] ({bp_n_13,bp_n_14,bp_n_15,bp_n_16}),
        .\q1_reg[3] (BUTTONS_IBUF));
  uart on_chip_uart
       (.CLK(CLK_125MHZ_FPGA_IBUF_BUFG),
        .FPGA_SERIAL_TX_OBUF(FPGA_SERIAL_TX_OBUF),
        .serial_out_reg_reg_0(bp_n_7));
  music_streamer streamer
       (.\BUTTONS[0] (streamer_n_38),
        .CLK(CLK_125MHZ_FPGA_IBUF_BUFG),
        .D(debounced_signals),
        .LEDS_OBUF(LEDS_OBUF),
        .O({bp_n_9,bp_n_10,bp_n_11,bp_n_12}),
        .Q(\button_edge_detector/prev ),
        .S({streamer_n_39,streamer_n_40,streamer_n_41}),
        .\address_reg_rep[0]_0 (bp_n_6),
        .\address_reg_rep[6]_0 (streamer_n_19),
        .\address_reg_rep[6]_1 (streamer_n_20),
        .\address_reg_rep[6]_2 (streamer_n_25),
        .\address_reg_rep[6]_3 (streamer_n_26),
        .\address_reg_rep[6]_4 (streamer_n_28),
        .\address_reg_rep[6]_5 (streamer_n_31),
        .\address_reg_rep[6]_6 (streamer_n_32),
        .\address_reg_rep[6]_7 (streamer_n_33),
        .\address_reg_rep[6]_8 (streamer_n_34),
        .\address_reg_rep[6]_9 (streamer_n_36),
        .\address_reg_rep[7]_0 (streamer_n_24),
        .\address_reg_rep[7]_1 (streamer_n_27),
        .\address_reg_rep[7]_2 (streamer_n_29),
        .\address_reg_rep[7]_3 (streamer_n_30),
        .\address_reg_rep[7]_4 (streamer_n_35),
        .\address_reg_rep[7]_5 (streamer_n_37),
        .\counter_reg[13] (streamer_n_44),
        .\counter_reg[15] (streamer_n_45),
        .\counter_reg[16] ({streamer_n_42,streamer_n_43}),
        .\counter_reg[3] (streamer_n_48),
        .\counter_reg[7] ({streamer_n_46,streamer_n_47}),
        .\current_state_reg[2]_0 (bp_n_8),
        .cycles_reg(cycles_reg),
        .\cycles_reg[13]_0 ({bp_n_13,bp_n_14,bp_n_15,bp_n_16}),
        .\cycles_reg[17]_0 ({bp_n_17,bp_n_18,bp_n_19,bp_n_20}),
        .\cycles_reg[21]_0 ({bp_n_21,bp_n_22,bp_n_23,bp_n_24}),
        .\cycles_reg[23]_0 ({bp_n_25,bp_n_26}),
        .\cycles_reg[6]_0 (BUTTONS_IBUF[0]),
        .in_good(in_good),
        .out({counter_reg[17:12],counter_reg[8:0]}));
  tone_generator tg
       (.CLK(CLK_125MHZ_FPGA_IBUF_BUFG),
        .S({streamer_n_39,streamer_n_40,streamer_n_41}),
        .SWITCHES_IBUF(SWITCHES_IBUF[0]),
        .aud_pwm_OBUF(aud_pwm_OBUF),
        .counter0_carry_0(streamer_n_32),
        .counter0_carry_1(streamer_n_20),
        .counter0_carry_2(streamer_n_31),
        .counter0_carry__0_0({streamer_n_46,streamer_n_47}),
        .counter0_carry__0_1(streamer_n_37),
        .counter0_carry__0_2(streamer_n_25),
        .counter0_carry__0_3(streamer_n_29),
        .counter0_carry__1_0(streamer_n_44),
        .counter0_carry__1_1(streamer_n_27),
        .in_good(in_good),
        .in_good_reg_0(streamer_n_38),
        .out({counter_reg[17:12],counter_reg[8:0]}),
        .out1_carry_0(streamer_n_19),
        .out1_carry_1(streamer_n_34),
        .out1_carry_2(streamer_n_30),
        .out1_carry__0_0(streamer_n_48),
        .out1_carry__0_1(streamer_n_24),
        .out1_carry__0_2(streamer_n_28),
        .out1_carry__0_3(streamer_n_36),
        .out1_carry__0_4(streamer_n_33),
        .\out1_inferred__0/i__carry_0 (streamer_n_26),
        .\out1_inferred__0/i__carry_1 (streamer_n_35),
        .out_reg_0(streamer_n_45),
        .out_reg_1({streamer_n_42,streamer_n_43}),
        .out_reg_2(BUTTONS_IBUF[0]));
endmodule
