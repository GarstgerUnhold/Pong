--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: J.40
--  \   \         Application: netgen
--  /   /         Filename: vga_synthesis.vhd
-- /___/   /\     Timestamp: Fri Jul 10 15:30:32 2009
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm vga -w -dir netgen/synthesis -ofmt vhdl -sim vga.ngc vga_synthesis.vhd 
-- Device	: xc3s200-4-ft256
-- Input file	: vga.ngc
-- Output file	: \\fs2\johannes.wollert$\workspace\VHDL\VHDL_tim\pong\netgen\synthesis\vga_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: vga
-- Xilinx	: C:\Xilinx92i
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Development System Reference Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity vga is
  port (
    vsync : out STD_LOGIC; 
    reset : in STD_LOGIC := 'X'; 
    clk50 : in STD_LOGIC := 'X'; 
    hsync : out STD_LOGIC; 
    rgb_out : out STD_LOGIC_VECTOR ( 2 downto 0 ) 
  );
end vga;

architecture Structure of vga is
  signal vsync_OBUF_0 : STD_LOGIC; 
  signal clk50_BUFGP_1 : STD_LOGIC; 
  signal clk25_i_2 : STD_LOGIC; 
  signal N0 : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal aus_RGB_or0000 : STD_LOGIC; 
  signal sigTime_Result_9_1 : STD_LOGIC; 
  signal sigTime_Result_8_1 : STD_LOGIC; 
  signal sigTime_Result_7_1 : STD_LOGIC; 
  signal sigTime_Result_6_1 : STD_LOGIC; 
  signal sigTime_Result_5_1 : STD_LOGIC; 
  signal sigTime_Result_4_1 : STD_LOGIC; 
  signal sigTime_Result_3_1 : STD_LOGIC; 
  signal sigTime_Result_2_1 : STD_LOGIC; 
  signal sigTime_Result_1_1 : STD_LOGIC; 
  signal sigTime_Result_0_1 : STD_LOGIC; 
  signal sigTime_vcounter_cmp_ge0000 : STD_LOGIC; 
  signal sigTime_vcounter_cmp_gt0000 : STD_LOGIC; 
  signal sigTime_vcounter_cmp_ge00002_map6 : STD_LOGIC; 
  signal sigTime_vcounter_cmp_gt00002_map0 : STD_LOGIC; 
  signal sigTime_vcounter_cmp_gt00002_map2 : STD_LOGIC; 
  signal sigTime_vcounter_cmp_gt00002_map4 : STD_LOGIC; 
  signal sigTime_vcounter_cmp_gt00002_map7 : STD_LOGIC; 
  signal aus_RGB_or0000_map2 : STD_LOGIC; 
  signal aus_RGB_or0000_map5 : STD_LOGIC; 
  signal aus_RGB_or0000_map21 : STD_LOGIC; 
  signal aus_RGB_or0000_map22 : STD_LOGIC; 
  signal aus_RGB_or0000_map28 : STD_LOGIC; 
  signal aus_RGB_or0000_map33 : STD_LOGIC; 
  signal aus_RGB_or0000_map37 : STD_LOGIC; 
  signal aus_RGB_or0000_map39 : STD_LOGIC; 
  signal aus_RGB_or0000_map41 : STD_LOGIC; 
  signal sigTime_Mcount_vcounter_cy_8_rt_3 : STD_LOGIC; 
  signal sigTime_Mcount_vcounter_cy_7_rt_4 : STD_LOGIC; 
  signal sigTime_Mcount_vcounter_cy_6_rt_5 : STD_LOGIC; 
  signal sigTime_Mcount_vcounter_cy_5_rt_6 : STD_LOGIC; 
  signal sigTime_Mcount_vcounter_cy_4_rt_7 : STD_LOGIC; 
  signal sigTime_Mcount_vcounter_cy_3_rt_8 : STD_LOGIC; 
  signal sigTime_Mcount_vcounter_cy_2_rt_9 : STD_LOGIC; 
  signal sigTime_Mcount_vcounter_cy_1_rt_10 : STD_LOGIC; 
  signal sigTime_Mcount_hcounter_cy_8_rt_11 : STD_LOGIC; 
  signal sigTime_Mcount_hcounter_cy_7_rt_12 : STD_LOGIC; 
  signal sigTime_Mcount_hcounter_cy_6_rt_13 : STD_LOGIC; 
  signal sigTime_Mcount_hcounter_cy_5_rt_14 : STD_LOGIC; 
  signal sigTime_Mcount_hcounter_cy_4_rt_15 : STD_LOGIC; 
  signal sigTime_Mcount_hcounter_cy_3_rt_16 : STD_LOGIC; 
  signal sigTime_Mcount_hcounter_cy_2_rt_17 : STD_LOGIC; 
  signal sigTime_Mcount_hcounter_cy_1_rt_18 : STD_LOGIC; 
  signal sigTime_Mcount_vcounter_xor_9_rt_19 : STD_LOGIC; 
  signal sigTime_Mcount_hcounter_xor_9_rt_20 : STD_LOGIC; 
  signal N135 : STD_LOGIC; 
  signal N137 : STD_LOGIC; 
  signal N139 : STD_LOGIC; 
  signal clk25_i1 : STD_LOGIC; 
  signal aus_RGB : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal sigTime_X : STD_LOGIC_VECTOR ( 9 downto 4 ); 
  signal sigTime_Y : STD_LOGIC_VECTOR ( 9 downto 0 ); 
  signal sigTime_Mcount_vcounter_cy : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal sigTime_Mcount_hcounter_cy : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal sigTime_Result : STD_LOGIC_VECTOR ( 9 downto 0 ); 
  signal sigTime_hcounter : STD_LOGIC_VECTOR ( 9 downto 0 ); 
  signal sigTime_vcounter : STD_LOGIC_VECTOR ( 9 downto 0 ); 
begin
  XST_VCC : VCC
    port map (
      P => N0
    );
  clk25_i : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk50_BUFGP_1,
      D => N0,
      R => clk25_i1,
      Q => clk25_i1
    );
  XST_GND : GND
    port map (
      G => N2
    );
  aus_RGB_0 : FDR
    port map (
      C => clk25_i_2,
      D => N0,
      R => aus_RGB_or0000,
      Q => aus_RGB(0)
    );
  sigTime_Mcount_vcounter_xor_9_Q : XORCY
    port map (
      CI => sigTime_Mcount_vcounter_cy(8),
      LI => sigTime_Mcount_vcounter_xor_9_rt_19,
      O => sigTime_Result_9_1
    );
  sigTime_Mcount_vcounter_xor_8_Q : XORCY
    port map (
      CI => sigTime_Mcount_vcounter_cy(7),
      LI => sigTime_Mcount_vcounter_cy_8_rt_3,
      O => sigTime_Result_8_1
    );
  sigTime_Mcount_vcounter_cy_8_Q : MUXCY
    port map (
      CI => sigTime_Mcount_vcounter_cy(7),
      DI => N2,
      S => sigTime_Mcount_vcounter_cy_8_rt_3,
      O => sigTime_Mcount_vcounter_cy(8)
    );
  sigTime_Mcount_vcounter_xor_7_Q : XORCY
    port map (
      CI => sigTime_Mcount_vcounter_cy(6),
      LI => sigTime_Mcount_vcounter_cy_7_rt_4,
      O => sigTime_Result_7_1
    );
  sigTime_Mcount_vcounter_cy_7_Q : MUXCY
    port map (
      CI => sigTime_Mcount_vcounter_cy(6),
      DI => N2,
      S => sigTime_Mcount_vcounter_cy_7_rt_4,
      O => sigTime_Mcount_vcounter_cy(7)
    );
  sigTime_Mcount_vcounter_xor_6_Q : XORCY
    port map (
      CI => sigTime_Mcount_vcounter_cy(5),
      LI => sigTime_Mcount_vcounter_cy_6_rt_5,
      O => sigTime_Result_6_1
    );
  sigTime_Mcount_vcounter_cy_6_Q : MUXCY
    port map (
      CI => sigTime_Mcount_vcounter_cy(5),
      DI => N2,
      S => sigTime_Mcount_vcounter_cy_6_rt_5,
      O => sigTime_Mcount_vcounter_cy(6)
    );
  sigTime_Mcount_vcounter_xor_5_Q : XORCY
    port map (
      CI => sigTime_Mcount_vcounter_cy(4),
      LI => sigTime_Mcount_vcounter_cy_5_rt_6,
      O => sigTime_Result_5_1
    );
  sigTime_Mcount_vcounter_cy_5_Q : MUXCY
    port map (
      CI => sigTime_Mcount_vcounter_cy(4),
      DI => N2,
      S => sigTime_Mcount_vcounter_cy_5_rt_6,
      O => sigTime_Mcount_vcounter_cy(5)
    );
  sigTime_Mcount_vcounter_xor_4_Q : XORCY
    port map (
      CI => sigTime_Mcount_vcounter_cy(3),
      LI => sigTime_Mcount_vcounter_cy_4_rt_7,
      O => sigTime_Result_4_1
    );
  sigTime_Mcount_vcounter_cy_4_Q : MUXCY
    port map (
      CI => sigTime_Mcount_vcounter_cy(3),
      DI => N2,
      S => sigTime_Mcount_vcounter_cy_4_rt_7,
      O => sigTime_Mcount_vcounter_cy(4)
    );
  sigTime_Mcount_vcounter_xor_3_Q : XORCY
    port map (
      CI => sigTime_Mcount_vcounter_cy(2),
      LI => sigTime_Mcount_vcounter_cy_3_rt_8,
      O => sigTime_Result_3_1
    );
  sigTime_Mcount_vcounter_cy_3_Q : MUXCY
    port map (
      CI => sigTime_Mcount_vcounter_cy(2),
      DI => N2,
      S => sigTime_Mcount_vcounter_cy_3_rt_8,
      O => sigTime_Mcount_vcounter_cy(3)
    );
  sigTime_Mcount_vcounter_xor_2_Q : XORCY
    port map (
      CI => sigTime_Mcount_vcounter_cy(1),
      LI => sigTime_Mcount_vcounter_cy_2_rt_9,
      O => sigTime_Result_2_1
    );
  sigTime_Mcount_vcounter_cy_2_Q : MUXCY
    port map (
      CI => sigTime_Mcount_vcounter_cy(1),
      DI => N2,
      S => sigTime_Mcount_vcounter_cy_2_rt_9,
      O => sigTime_Mcount_vcounter_cy(2)
    );
  sigTime_Mcount_vcounter_xor_1_Q : XORCY
    port map (
      CI => sigTime_Mcount_vcounter_cy(0),
      LI => sigTime_Mcount_vcounter_cy_1_rt_10,
      O => sigTime_Result_1_1
    );
  sigTime_Mcount_vcounter_cy_1_Q : MUXCY
    port map (
      CI => sigTime_Mcount_vcounter_cy(0),
      DI => N2,
      S => sigTime_Mcount_vcounter_cy_1_rt_10,
      O => sigTime_Mcount_vcounter_cy(1)
    );
  sigTime_Mcount_vcounter_cy_0_Q : MUXCY
    port map (
      CI => N2,
      DI => N0,
      S => sigTime_Result_0_1,
      O => sigTime_Mcount_vcounter_cy(0)
    );
  sigTime_Mcount_hcounter_xor_9_Q : XORCY
    port map (
      CI => sigTime_Mcount_hcounter_cy(8),
      LI => sigTime_Mcount_hcounter_xor_9_rt_20,
      O => sigTime_Result(9)
    );
  sigTime_Mcount_hcounter_xor_8_Q : XORCY
    port map (
      CI => sigTime_Mcount_hcounter_cy(7),
      LI => sigTime_Mcount_hcounter_cy_8_rt_11,
      O => sigTime_Result(8)
    );
  sigTime_Mcount_hcounter_cy_8_Q : MUXCY
    port map (
      CI => sigTime_Mcount_hcounter_cy(7),
      DI => N2,
      S => sigTime_Mcount_hcounter_cy_8_rt_11,
      O => sigTime_Mcount_hcounter_cy(8)
    );
  sigTime_Mcount_hcounter_xor_7_Q : XORCY
    port map (
      CI => sigTime_Mcount_hcounter_cy(6),
      LI => sigTime_Mcount_hcounter_cy_7_rt_12,
      O => sigTime_Result(7)
    );
  sigTime_Mcount_hcounter_cy_7_Q : MUXCY
    port map (
      CI => sigTime_Mcount_hcounter_cy(6),
      DI => N2,
      S => sigTime_Mcount_hcounter_cy_7_rt_12,
      O => sigTime_Mcount_hcounter_cy(7)
    );
  sigTime_Mcount_hcounter_xor_6_Q : XORCY
    port map (
      CI => sigTime_Mcount_hcounter_cy(5),
      LI => sigTime_Mcount_hcounter_cy_6_rt_13,
      O => sigTime_Result(6)
    );
  sigTime_Mcount_hcounter_cy_6_Q : MUXCY
    port map (
      CI => sigTime_Mcount_hcounter_cy(5),
      DI => N2,
      S => sigTime_Mcount_hcounter_cy_6_rt_13,
      O => sigTime_Mcount_hcounter_cy(6)
    );
  sigTime_Mcount_hcounter_xor_5_Q : XORCY
    port map (
      CI => sigTime_Mcount_hcounter_cy(4),
      LI => sigTime_Mcount_hcounter_cy_5_rt_14,
      O => sigTime_Result(5)
    );
  sigTime_Mcount_hcounter_cy_5_Q : MUXCY
    port map (
      CI => sigTime_Mcount_hcounter_cy(4),
      DI => N2,
      S => sigTime_Mcount_hcounter_cy_5_rt_14,
      O => sigTime_Mcount_hcounter_cy(5)
    );
  sigTime_Mcount_hcounter_xor_4_Q : XORCY
    port map (
      CI => sigTime_Mcount_hcounter_cy(3),
      LI => sigTime_Mcount_hcounter_cy_4_rt_15,
      O => sigTime_Result(4)
    );
  sigTime_Mcount_hcounter_cy_4_Q : MUXCY
    port map (
      CI => sigTime_Mcount_hcounter_cy(3),
      DI => N2,
      S => sigTime_Mcount_hcounter_cy_4_rt_15,
      O => sigTime_Mcount_hcounter_cy(4)
    );
  sigTime_Mcount_hcounter_xor_3_Q : XORCY
    port map (
      CI => sigTime_Mcount_hcounter_cy(2),
      LI => sigTime_Mcount_hcounter_cy_3_rt_16,
      O => sigTime_Result(3)
    );
  sigTime_Mcount_hcounter_cy_3_Q : MUXCY
    port map (
      CI => sigTime_Mcount_hcounter_cy(2),
      DI => N2,
      S => sigTime_Mcount_hcounter_cy_3_rt_16,
      O => sigTime_Mcount_hcounter_cy(3)
    );
  sigTime_Mcount_hcounter_xor_2_Q : XORCY
    port map (
      CI => sigTime_Mcount_hcounter_cy(1),
      LI => sigTime_Mcount_hcounter_cy_2_rt_17,
      O => sigTime_Result(2)
    );
  sigTime_Mcount_hcounter_cy_2_Q : MUXCY
    port map (
      CI => sigTime_Mcount_hcounter_cy(1),
      DI => N2,
      S => sigTime_Mcount_hcounter_cy_2_rt_17,
      O => sigTime_Mcount_hcounter_cy(2)
    );
  sigTime_Mcount_hcounter_xor_1_Q : XORCY
    port map (
      CI => sigTime_Mcount_hcounter_cy(0),
      LI => sigTime_Mcount_hcounter_cy_1_rt_18,
      O => sigTime_Result(1)
    );
  sigTime_Mcount_hcounter_cy_1_Q : MUXCY
    port map (
      CI => sigTime_Mcount_hcounter_cy(0),
      DI => N2,
      S => sigTime_Mcount_hcounter_cy_1_rt_18,
      O => sigTime_Mcount_hcounter_cy(1)
    );
  sigTime_Mcount_hcounter_cy_0_Q : MUXCY
    port map (
      CI => N2,
      DI => N0,
      S => sigTime_Result(0),
      O => sigTime_Mcount_hcounter_cy(0)
    );
  sigTime_vcounter_9 : FDRE
    port map (
      C => clk25_i_2,
      CE => sigTime_vcounter_cmp_gt0000,
      D => sigTime_Result_9_1,
      R => sigTime_vcounter_cmp_ge0000,
      Q => sigTime_vcounter(9)
    );
  sigTime_vcounter_8 : FDRE
    port map (
      C => clk25_i_2,
      CE => sigTime_vcounter_cmp_gt0000,
      D => sigTime_Result_8_1,
      R => sigTime_vcounter_cmp_ge0000,
      Q => sigTime_vcounter(8)
    );
  sigTime_vcounter_7 : FDRE
    port map (
      C => clk25_i_2,
      CE => sigTime_vcounter_cmp_gt0000,
      D => sigTime_Result_7_1,
      R => sigTime_vcounter_cmp_ge0000,
      Q => sigTime_vcounter(7)
    );
  sigTime_vcounter_6 : FDRE
    port map (
      C => clk25_i_2,
      CE => sigTime_vcounter_cmp_gt0000,
      D => sigTime_Result_6_1,
      R => sigTime_vcounter_cmp_ge0000,
      Q => sigTime_vcounter(6)
    );
  sigTime_vcounter_5 : FDRE
    port map (
      C => clk25_i_2,
      CE => sigTime_vcounter_cmp_gt0000,
      D => sigTime_Result_5_1,
      R => sigTime_vcounter_cmp_ge0000,
      Q => sigTime_vcounter(5)
    );
  sigTime_vcounter_4 : FDRE
    port map (
      C => clk25_i_2,
      CE => sigTime_vcounter_cmp_gt0000,
      D => sigTime_Result_4_1,
      R => sigTime_vcounter_cmp_ge0000,
      Q => sigTime_vcounter(4)
    );
  sigTime_vcounter_3 : FDRE
    port map (
      C => clk25_i_2,
      CE => sigTime_vcounter_cmp_gt0000,
      D => sigTime_Result_3_1,
      R => sigTime_vcounter_cmp_ge0000,
      Q => sigTime_vcounter(3)
    );
  sigTime_vcounter_2 : FDRE
    port map (
      C => clk25_i_2,
      CE => sigTime_vcounter_cmp_gt0000,
      D => sigTime_Result_2_1,
      R => sigTime_vcounter_cmp_ge0000,
      Q => sigTime_vcounter(2)
    );
  sigTime_vcounter_1 : FDRE
    port map (
      C => clk25_i_2,
      CE => sigTime_vcounter_cmp_gt0000,
      D => sigTime_Result_1_1,
      R => sigTime_vcounter_cmp_ge0000,
      Q => sigTime_vcounter(1)
    );
  sigTime_vcounter_0 : FDRE
    port map (
      C => clk25_i_2,
      CE => sigTime_vcounter_cmp_gt0000,
      D => sigTime_Result_0_1,
      R => sigTime_vcounter_cmp_ge0000,
      Q => sigTime_vcounter(0)
    );
  sigTime_hcounter_9 : FDR
    port map (
      C => clk25_i_2,
      D => sigTime_Result(9),
      R => sigTime_vcounter_cmp_gt0000,
      Q => sigTime_hcounter(9)
    );
  sigTime_hcounter_8 : FDR
    port map (
      C => clk25_i_2,
      D => sigTime_Result(8),
      R => sigTime_vcounter_cmp_gt0000,
      Q => sigTime_hcounter(8)
    );
  sigTime_hcounter_7 : FDR
    port map (
      C => clk25_i_2,
      D => sigTime_Result(7),
      R => sigTime_vcounter_cmp_gt0000,
      Q => sigTime_hcounter(7)
    );
  sigTime_hcounter_6 : FDR
    port map (
      C => clk25_i_2,
      D => sigTime_Result(6),
      R => sigTime_vcounter_cmp_gt0000,
      Q => sigTime_hcounter(6)
    );
  sigTime_hcounter_5 : FDR
    port map (
      C => clk25_i_2,
      D => sigTime_Result(5),
      R => sigTime_vcounter_cmp_gt0000,
      Q => sigTime_hcounter(5)
    );
  sigTime_hcounter_4 : FDR
    port map (
      C => clk25_i_2,
      D => sigTime_Result(4),
      R => sigTime_vcounter_cmp_gt0000,
      Q => sigTime_hcounter(4)
    );
  sigTime_hcounter_3 : FDR
    port map (
      C => clk25_i_2,
      D => sigTime_Result(3),
      R => sigTime_vcounter_cmp_gt0000,
      Q => sigTime_hcounter(3)
    );
  sigTime_hcounter_2 : FDR
    port map (
      C => clk25_i_2,
      D => sigTime_Result(2),
      R => sigTime_vcounter_cmp_gt0000,
      Q => sigTime_hcounter(2)
    );
  sigTime_hcounter_1 : FDR
    port map (
      C => clk25_i_2,
      D => sigTime_Result(1),
      R => sigTime_vcounter_cmp_gt0000,
      Q => sigTime_hcounter(1)
    );
  sigTime_hcounter_0 : FDR
    port map (
      C => clk25_i_2,
      D => sigTime_Result(0),
      R => sigTime_vcounter_cmp_gt0000,
      Q => sigTime_hcounter(0)
    );
  sigTime_Y_9 : FD
    port map (
      C => clk25_i_2,
      D => sigTime_vcounter(9),
      Q => sigTime_Y(9)
    );
  sigTime_Y_8 : FD
    port map (
      C => clk25_i_2,
      D => sigTime_vcounter(8),
      Q => sigTime_Y(8)
    );
  sigTime_Y_7 : FD
    port map (
      C => clk25_i_2,
      D => sigTime_vcounter(7),
      Q => sigTime_Y(7)
    );
  sigTime_Y_6 : FD
    port map (
      C => clk25_i_2,
      D => sigTime_vcounter(6),
      Q => sigTime_Y(6)
    );
  sigTime_Y_5 : FD
    port map (
      C => clk25_i_2,
      D => sigTime_vcounter(5),
      Q => sigTime_Y(5)
    );
  sigTime_Y_4 : FD
    port map (
      C => clk25_i_2,
      D => sigTime_vcounter(4),
      Q => sigTime_Y(4)
    );
  sigTime_Y_3 : FD
    port map (
      C => clk25_i_2,
      D => sigTime_vcounter(3),
      Q => sigTime_Y(3)
    );
  sigTime_Y_2 : FD
    port map (
      C => clk25_i_2,
      D => sigTime_vcounter(2),
      Q => sigTime_Y(2)
    );
  sigTime_Y_1 : FD
    port map (
      C => clk25_i_2,
      D => sigTime_vcounter(1),
      Q => sigTime_Y(1)
    );
  sigTime_Y_0 : FD
    port map (
      C => clk25_i_2,
      D => sigTime_vcounter(0),
      Q => sigTime_Y(0)
    );
  sigTime_X_9 : FD
    port map (
      C => clk25_i_2,
      D => sigTime_hcounter(9),
      Q => sigTime_X(9)
    );
  sigTime_X_8 : FD
    port map (
      C => clk25_i_2,
      D => sigTime_hcounter(8),
      Q => sigTime_X(8)
    );
  sigTime_X_7 : FD
    port map (
      C => clk25_i_2,
      D => sigTime_hcounter(7),
      Q => sigTime_X(7)
    );
  sigTime_X_6 : FD
    port map (
      C => clk25_i_2,
      D => sigTime_hcounter(6),
      Q => sigTime_X(6)
    );
  sigTime_X_5 : FD
    port map (
      C => clk25_i_2,
      D => sigTime_hcounter(5),
      Q => sigTime_X(5)
    );
  sigTime_X_4 : FD
    port map (
      C => clk25_i_2,
      D => sigTime_hcounter(4),
      Q => sigTime_X(4)
    );
  sigTime_vcounter_cmp_gt000020 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => sigTime_hcounter(6),
      I1 => sigTime_hcounter(7),
      O => sigTime_vcounter_cmp_gt00002_map0
    );
  sigTime_vcounter_cmp_gt000022 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => sigTime_hcounter(2),
      I1 => sigTime_hcounter(3),
      O => sigTime_vcounter_cmp_gt00002_map2
    );
  sigTime_vcounter_cmp_gt0000221 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sigTime_hcounter(8),
      I1 => sigTime_hcounter(9),
      O => sigTime_vcounter_cmp_gt00002_map7
    );
  sigTime_vcounter_cmp_gt0000224 : LUT4
    generic map(
      INIT => X"E0C0"
    )
    port map (
      I0 => sigTime_hcounter(5),
      I1 => sigTime_vcounter_cmp_gt00002_map0,
      I2 => sigTime_vcounter_cmp_gt00002_map7,
      I3 => sigTime_vcounter_cmp_gt00002_map4,
      O => sigTime_vcounter_cmp_gt0000
    );
  aus_RGB_or000049 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => sigTime_Y(5),
      I1 => sigTime_Y(6),
      I2 => sigTime_Y(7),
      I3 => sigTime_Y(8),
      O => aus_RGB_or0000_map21
    );
  aus_RGB_or000083 : LUT3
    generic map(
      INIT => X"57"
    )
    port map (
      I0 => sigTime_X(6),
      I1 => sigTime_X(5),
      I2 => sigTime_X(4),
      O => aus_RGB_or0000_map28
    );
  aus_RGB_or000092 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => sigTime_X(8),
      I1 => sigTime_X(9),
      I2 => sigTime_X(7),
      O => aus_RGB_or0000_map33
    );
  aus_RGB_or0000106 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => sigTime_Y(6),
      I1 => sigTime_Y(7),
      I2 => sigTime_Y(2),
      I3 => sigTime_Y(3),
      O => aus_RGB_or0000_map37
    );
  aus_RGB_or0000113 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => sigTime_Y(1),
      I1 => sigTime_Y(8),
      I2 => sigTime_Y(0),
      I3 => aus_RGB_or0000_map39,
      O => aus_RGB_or0000_map41
    );
  vsync_OBUF : OBUF
    port map (
      I => vsync_OBUF_0,
      O => vsync
    );
  hsync_OBUF : OBUF
    port map (
      I => clk25_i1,
      O => hsync
    );
  rgb_out_2_OBUF : OBUF
    port map (
      I => aus_RGB(0),
      O => rgb_out(2)
    );
  rgb_out_1_OBUF : OBUF
    port map (
      I => aus_RGB(0),
      O => rgb_out(1)
    );
  rgb_out_0_OBUF : OBUF
    port map (
      I => aus_RGB(0),
      O => rgb_out(0)
    );
  sigTime_Mcount_vcounter_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sigTime_vcounter(8),
      O => sigTime_Mcount_vcounter_cy_8_rt_3
    );
  sigTime_Mcount_vcounter_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sigTime_vcounter(7),
      O => sigTime_Mcount_vcounter_cy_7_rt_4
    );
  sigTime_Mcount_vcounter_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sigTime_vcounter(6),
      O => sigTime_Mcount_vcounter_cy_6_rt_5
    );
  sigTime_Mcount_vcounter_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sigTime_vcounter(5),
      O => sigTime_Mcount_vcounter_cy_5_rt_6
    );
  sigTime_Mcount_vcounter_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sigTime_vcounter(4),
      O => sigTime_Mcount_vcounter_cy_4_rt_7
    );
  sigTime_Mcount_vcounter_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sigTime_vcounter(3),
      O => sigTime_Mcount_vcounter_cy_3_rt_8
    );
  sigTime_Mcount_vcounter_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sigTime_vcounter(2),
      O => sigTime_Mcount_vcounter_cy_2_rt_9
    );
  sigTime_Mcount_vcounter_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sigTime_vcounter(1),
      O => sigTime_Mcount_vcounter_cy_1_rt_10
    );
  sigTime_Mcount_hcounter_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sigTime_hcounter(8),
      O => sigTime_Mcount_hcounter_cy_8_rt_11
    );
  sigTime_Mcount_hcounter_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sigTime_hcounter(7),
      O => sigTime_Mcount_hcounter_cy_7_rt_12
    );
  sigTime_Mcount_hcounter_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sigTime_hcounter(6),
      O => sigTime_Mcount_hcounter_cy_6_rt_13
    );
  sigTime_Mcount_hcounter_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sigTime_hcounter(5),
      O => sigTime_Mcount_hcounter_cy_5_rt_14
    );
  sigTime_Mcount_hcounter_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sigTime_hcounter(4),
      O => sigTime_Mcount_hcounter_cy_4_rt_15
    );
  sigTime_Mcount_hcounter_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sigTime_hcounter(3),
      O => sigTime_Mcount_hcounter_cy_3_rt_16
    );
  sigTime_Mcount_hcounter_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sigTime_hcounter(2),
      O => sigTime_Mcount_hcounter_cy_2_rt_17
    );
  sigTime_Mcount_hcounter_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sigTime_hcounter(1),
      O => sigTime_Mcount_hcounter_cy_1_rt_18
    );
  sigTime_Mcount_vcounter_xor_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sigTime_vcounter(9),
      O => sigTime_Mcount_vcounter_xor_9_rt_19
    );
  sigTime_Mcount_hcounter_xor_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => sigTime_hcounter(9),
      O => sigTime_Mcount_hcounter_xor_9_rt_20
    );
  aus_RGB_or0000139 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => aus_RGB_or0000_map5,
      I1 => aus_RGB_or0000_map41,
      I2 => aus_RGB_or0000_map37,
      I3 => N135,
      O => aus_RGB_or0000
    );
  aus_RGB_or000053 : LUT4
    generic map(
      INIT => X"7F00"
    )
    port map (
      I0 => sigTime_Y(3),
      I1 => sigTime_Y(4),
      I2 => N137,
      I3 => aus_RGB_or0000_map21,
      O => aus_RGB_or0000_map22
    );
  aus_RGB_or000012 : LUT4
    generic map(
      INIT => X"EAAA"
    )
    port map (
      I0 => sigTime_Y(9),
      I1 => sigTime_X(9),
      I2 => sigTime_X(8),
      I3 => aus_RGB_or0000_map2,
      O => aus_RGB_or0000_map5
    );
  sigTime_vcounter_cmp_ge0000224_SW0 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => sigTime_vcounter(7),
      I1 => sigTime_vcounter(6),
      I2 => sigTime_vcounter(5),
      I3 => sigTime_vcounter(4),
      O => N139
    );
  sigTime_vcounter_cmp_ge0000224 : LUT4
    generic map(
      INIT => X"AAA8"
    )
    port map (
      I0 => sigTime_vcounter(9),
      I1 => sigTime_vcounter_cmp_ge00002_map6,
      I2 => sigTime_vcounter(8),
      I3 => N139,
      O => sigTime_vcounter_cmp_ge0000
    );
  clk25_i_BUFG : BUFG
    port map (
      I => clk25_i1,
      O => clk25_i_2
    );
  clk50_BUFGP : BUFGP
    port map (
      I => clk50,
      O => clk50_BUFGP_1
    );
  sigTime_Mcount_vcounter_lut_0_INV_0 : INV
    port map (
      I => sigTime_vcounter(0),
      O => sigTime_Result_0_1
    );
  sigTime_Mcount_hcounter_lut_0_INV_0 : INV
    port map (
      I => sigTime_hcounter(0),
      O => sigTime_Result(0)
    );
  vsync1_INV_0 : INV
    port map (
      I => clk25_i1,
      O => vsync_OBUF_0
    );
  sigTime_vcounter_cmp_ge0000213 : LUT4_L
    generic map(
      INIT => X"AAA8"
    )
    port map (
      I0 => sigTime_vcounter(3),
      I1 => sigTime_vcounter(2),
      I2 => sigTime_vcounter(1),
      I3 => sigTime_vcounter(0),
      LO => sigTime_vcounter_cmp_ge00002_map6
    );
  sigTime_vcounter_cmp_gt000027 : LUT4_L
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => sigTime_hcounter(1),
      I1 => sigTime_hcounter(4),
      I2 => sigTime_hcounter(0),
      I3 => sigTime_vcounter_cmp_gt00002_map2,
      LO => sigTime_vcounter_cmp_gt00002_map4
    );
  aus_RGB_or00004 : LUT4_L
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => sigTime_X(4),
      I1 => sigTime_X(5),
      I2 => sigTime_X(6),
      I3 => sigTime_X(7),
      LO => aus_RGB_or0000_map2
    );
  aus_RGB_or0000108 : LUT2_L
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => sigTime_Y(4),
      I1 => sigTime_Y(5),
      LO => aus_RGB_or0000_map39
    );
  aus_RGB_or0000125_SW0 : LUT3_L
    generic map(
      INIT => X"F8"
    )
    port map (
      I0 => aus_RGB_or0000_map33,
      I1 => aus_RGB_or0000_map28,
      I2 => aus_RGB_or0000_map22,
      LO => N135
    );
  aus_RGB_or000053_SW0 : LUT3_L
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => sigTime_Y(1),
      I1 => sigTime_Y(0),
      I2 => sigTime_Y(2),
      LO => N137
    );

end Structure;

