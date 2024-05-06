/*
 * robotarm_student_2021a_Ebox_data.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "robotarm_student_2021a_Ebox".
 *
 * Model version              : 8.2
 * Simulink Coder version : 24.1 (R2024a) 19-Nov-2023
 * C source code generated on : Mon May  6 16:04:38 2024
 *
 * Target selection: ert.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: ARM Compatible->ARM Cortex
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "robotarm_student_2021a_Ebox.h"

/* Block parameters (default storage) */
P_robotarm_student_2021a_Ebox_T robotarm_student_2021a_Ebox_P = {
  /* Mask Parameter: DiscreteDerivative_ICPrevScaled
   * Referenced by: '<S55>/UD'
   */
  0.0,

  /* Mask Parameter: DiscreteDerivative_ICPrevScal_p
   * Referenced by: '<S45>/UD'
   */
  0.0,

  /* Mask Parameter: DiscreteDerivative_ICPrevSca_pr
   * Referenced by: '<S36>/UD'
   */
  0.0,

  /* Mask Parameter: CompareToConstant_const
   * Referenced by: '<S18>/Constant'
   */
  4.0,

  /* Mask Parameter: DetectChange_vinit
   * Referenced by: '<S10>/Delay Input1'
   */
  0.0,

  /* Computed Parameter: Delays_Y0
   * Referenced by: '<S11>/Delay [s]'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S1>/Suck'
   */
  0.0,

  /* Expression: 1
   * Referenced by: '<S1>/ Blow'
   */
  1.0,

  /* Computed Parameter: RobotV_Y0
   * Referenced by: '<S1>/Robot [V]'
   */
  0.0,

  /* Computed Parameter: ConveyorV_Y0
   * Referenced by: '<S1>/Conveyor [V] '
   */
  0.0,

  /* Computed Parameter: VacuumV_Y0
   * Referenced by: '<S1>/Vacuum [V] '
   */
  0.0,

  /* Computed Parameter: Blowsuck_Y0
   * Referenced by: '<S1>/Blow//suck [-]'
   */
  0.0,

  /* Expression: [0  0  0  0;0  0  0  0;0  0  0  0]
   * Referenced by: '<S3>/Object detection matrix'
   */
  { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },

  /* Expression: 0
   * Referenced by: '<S1>/Sine Wave2'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S1>/Sine Wave2'
   */
  0.0,

  /* Expression: 0.5
   * Referenced by: '<S1>/Sine Wave2'
   */
  0.5,

  /* Expression: 0
   * Referenced by: '<S1>/Sine Wave2'
   */
  0.0,

  /* Expression: 25
   * Referenced by: '<S5>/Gain1'
   */
  25.0,

  /* Computed Parameter: Dctintegrator_P1_Size
   * Referenced by: '<S5>/Dctintegrator'
   */
  { 1.0, 1.0 },

  /* Expression: f_num
   * Referenced by: '<S5>/Dctintegrator'
   */
  0.5,

  /* Computed Parameter: Dctintegrator_P2_Size
   * Referenced by: '<S5>/Dctintegrator'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S5>/Dctintegrator'
   */
  0.001,

  /* Computed Parameter: Dctleadlag_P1_Size
   * Referenced by: '<S5>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_num
   * Referenced by: '<S5>/Dctleadlag'
   */
  6.6667,

  /* Computed Parameter: Dctleadlag_P2_Size
   * Referenced by: '<S5>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S5>/Dctleadlag'
   */
  60.0,

  /* Computed Parameter: Dctleadlag_P3_Size
   * Referenced by: '<S5>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S5>/Dctleadlag'
   */
  0.001,

  /* Computed Parameter: Dct1lowpass_P1_Size
   * Referenced by: '<S5>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S5>/Dct1lowpass'
   */
  100.0,

  /* Computed Parameter: Dct1lowpass_P2_Size
   * Referenced by: '<S5>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S5>/Dct1lowpass'
   */
  0.001,

  /* Expression: 0
   * Referenced by: '<S1>/Sine Wave'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S1>/Sine Wave'
   */
  0.0,

  /* Expression: 0.5
   * Referenced by: '<S1>/Sine Wave'
   */
  0.5,

  /* Expression: 0
   * Referenced by: '<S1>/Sine Wave'
   */
  0.0,

  /* Expression: 20
   * Referenced by: '<S7>/Gain1'
   */
  20.0,

  /* Computed Parameter: Dctleadlag_P1_Size_d
   * Referenced by: '<S7>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_num
   * Referenced by: '<S7>/Dctleadlag'
   */
  10.0,

  /* Computed Parameter: Dctleadlag_P2_Size_d
   * Referenced by: '<S7>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S7>/Dctleadlag'
   */
  90.0,

  /* Computed Parameter: Dctleadlag_P3_Size_d
   * Referenced by: '<S7>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S7>/Dctleadlag'
   */
  0.001,

  /* Computed Parameter: Dct1lowpass_P1_Size_f
   * Referenced by: '<S7>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S7>/Dct1lowpass'
   */
  200.0,

  /* Computed Parameter: Dct1lowpass_P2_Size_e
   * Referenced by: '<S7>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S7>/Dct1lowpass'
   */
  0.001,

  /* Expression: 0
   * Referenced by: '<S1>/Sine Wave1'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S1>/Sine Wave1'
   */
  0.0,

  /* Expression: 0.1
   * Referenced by: '<S1>/Sine Wave1'
   */
  0.1,

  /* Expression: 0
   * Referenced by: '<S1>/Sine Wave1'
   */
  0.0,

  /* Expression: 25
   * Referenced by: '<S8>/Gain'
   */
  25.0,

  /* Computed Parameter: Dctleadlag_P1_Size_n
   * Referenced by: '<S8>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_num
   * Referenced by: '<S8>/Dctleadlag'
   */
  10.0,

  /* Computed Parameter: Dctleadlag_P2_Size_h
   * Referenced by: '<S8>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S8>/Dctleadlag'
   */
  90.0,

  /* Computed Parameter: Dctleadlag_P3_Size_b
   * Referenced by: '<S8>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S8>/Dctleadlag'
   */
  0.001,

  /* Computed Parameter: Dct1lowpass_P1_Size_m
   * Referenced by: '<S8>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S8>/Dct1lowpass'
   */
  200.0,

  /* Computed Parameter: Dct1lowpass_P2_Size_d
   * Referenced by: '<S8>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S8>/Dct1lowpass'
   */
  0.001,

  /* Computed Parameter: Discreteintegrator_gainval
   * Referenced by: '<S1>/Discrete  integrator'
   */
  0.00048828125,

  /* Expression: 0
   * Referenced by: '<S1>/Discrete  integrator'
   */
  0.0,

  /* Expression: 10*2.5/500
   * Referenced by: '<S4>/Gain1'
   */
  0.05,

  /* Computed Parameter: Dctintegrator3_P1_Size
   * Referenced by: '<S4>/Dctintegrator3'
   */
  { 1.0, 1.0 },

  /* Expression: f_num
   * Referenced by: '<S4>/Dctintegrator3'
   */
  0.0,

  /* Computed Parameter: Dctintegrator3_P2_Size
   * Referenced by: '<S4>/Dctintegrator3'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S4>/Dctintegrator3'
   */
  0.001,

  /* Computed Parameter: Dct1lowpass_P1_Size_l
   * Referenced by: '<S4>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S4>/Dct1lowpass'
   */
  30.0,

  /* Computed Parameter: Dct1lowpass_P2_Size_o
   * Referenced by: '<S4>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S4>/Dct1lowpass'
   */
  0.001,

  /* Computed Parameter: Dctleadlag_P1_Size_i
   * Referenced by: '<S4>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_num
   * Referenced by: '<S4>/Dctleadlag'
   */
  3.0,

  /* Computed Parameter: Dctleadlag_P2_Size_m
   * Referenced by: '<S4>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S4>/Dctleadlag'
   */
  20.0,

  /* Computed Parameter: Dctleadlag_P3_Size_h
   * Referenced by: '<S4>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S4>/Dctleadlag'
   */
  0.001,

  /* Expression: 0
   * Referenced by: '<S1>/Feedfoward Z [V]'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S1>/Feedfoward X [V]'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S1>/Feedfoward R [V]'
   */
  0.0,

  /* Expression: 5
   * Referenced by: '<S1>/Conveyor speed [mm//s]'
   */
  5.0,

  /* Expression: 100
   * Referenced by: '<S1>/Saturation '
   */
  100.0,

  /* Expression: -100
   * Referenced by: '<S1>/Saturation '
   */
  -100.0,

  /* Expression: -1
   * Referenced by: '<S1>/Reference Vacuum [bar]'
   */
  -1.0,

  /* Expression: -10
   * Referenced by: '<S6>/Gain1'
   */
  -10.0,

  /* Expression: 2
   * Referenced by: '<S1>/Object'
   */
  2.0,

  /* Expression: 0
   * Referenced by: '<S1>/Plot'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S1>/Stop'
   */
  0.0,

  /* Expression: 50
   * Referenced by: '<S20>/Homing Running Switch2'
   */
  50.0,

  /* Expression: 2.5
   * Referenced by: '<S20>/Homing Running Switch1'
   */
  2.5,

  /* Expression: 0.7
   * Referenced by: '<S21>/Saturation'
   */
  0.7,

  /* Expression: -0.7
   * Referenced by: '<S21>/Saturation'
   */
  -0.7,

  /* Expression: 0.5
   * Referenced by: '<S21>/Homing Running Switch'
   */
  0.5,

  /* Expression: 0.5
   * Referenced by: '<S22>/Homing Running Switch'
   */
  0.5,

  /* Expression: 0.5
   * Referenced by: '<S23>/Homing Running Switch'
   */
  0.5,

  /* Computed Parameter: SFunction_P1_Size
   * Referenced by: '<S17>/S-Function'
   */
  { 1.0, 1.0 },

  /* Expression: portid
   * Referenced by: '<S17>/S-Function'
   */
  0.0,

  /* Computed Parameter: SFunction_P2_Size
   * Referenced by: '<S17>/S-Function'
   */
  { 1.0, 1.0 },

  /* Expression: ectimeout
   * Referenced by: '<S17>/S-Function'
   */
  500.0,

  /* Computed Parameter: ec_Ebox_P1_Size
   * Referenced by: '<S14>/ec_Ebox'
   */
  { 1.0, 1.0 },

  /* Expression: link_id
   * Referenced by: '<S14>/ec_Ebox'
   */
  0.0,

  /* Computed Parameter: ec_Ebox_P1_Size_d
   * Referenced by: '<S15>/ec_Ebox'
   */
  { 1.0, 1.0 },

  /* Expression: link_id
   * Referenced by: '<S15>/ec_Ebox'
   */
  1.0,

  /* Computed Parameter: ec_Ebox_P1_Size_du
   * Referenced by: '<S16>/ec_Ebox'
   */
  { 1.0, 1.0 },

  /* Expression: link_id
   * Referenced by: '<S16>/ec_Ebox'
   */
  2.0,

  /* Expression: [1,0,0,0,0,0,0,0]
   * Referenced by: '<S12>/Enable//Ventiel'
   */
  { 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },

  /* Expression: 1/4000*9/150*2*pi
   * Referenced by: '<S12>/Gain'
   */
  9.4247779607693812E-5,

  /* Expression: -1/4000*9/100*2*pi
   * Referenced by: '<S12>/Gain1'
   */
  -0.00014137166941154071,

  /* Expression: 1/4000*9/100*2*pi
   * Referenced by: '<S12>/Gain2'
   */
  0.00014137166941154071,

  /* Expression: 0.25
   * Referenced by: '<S12>/Gain5'
   */
  0.25,

  /* Expression: 2
   * Referenced by: '<S12>/Homing Running Switch'
   */
  2.0,

  /* Expression: -1/16000*2*pi*2.07*10
   * Referenced by: '<S12>/Gain3'
   */
  -0.00812887099116359,

  /* Expression: -0.1
   * Referenced by: '<S12>/Gain6'
   */
  -0.1,

  /* Expression: 1
   * Referenced by: '<S19>/Constant'
   */
  1.0,

  /* Computed Parameter: DiscreteTimeIntegrator_gainval
   * Referenced by: '<S21>/Discrete-Time Integrator'
   */
  0.00048828125,

  /* Expression: 0
   * Referenced by: '<S21>/Discrete-Time Integrator'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S33>/Constant1'
   */
  0.0,

  /* Computed Parameter: DiscreteTimeIntegrator_gainva_b
   * Referenced by: '<S33>/Discrete-Time Integrator'
   */
  0.00048828125,

  /* Expression: -0.1
   * Referenced by: '<S21>/Constant'
   */
  -0.1,

  /* Expression: 0
   * Referenced by: '<S13>/Unit Delay'
   */
  0.0,

  /* Expression: 1.2844
   * Referenced by: '<S13>/set_robot_calibration_r'
   */
  1.2844,

  /* Computed Parameter: DiscreteTimeIntegrator_gainva_a
   * Referenced by: '<S22>/Discrete-Time Integrator'
   */
  0.00048828125,

  /* Expression: 0
   * Referenced by: '<S22>/Discrete-Time Integrator'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S39>/Constant1'
   */
  0.0,

  /* Computed Parameter: DiscreteTimeIntegrator_gainva_i
   * Referenced by: '<S39>/Discrete-Time Integrator'
   */
  0.00048828125,

  /* Expression: -0.1
   * Referenced by: '<S22>/Constant'
   */
  -0.1,

  /* Expression: 0.6434
   * Referenced by: '<S13>/set_robot_calibration_x'
   */
  0.6434,

  /* Computed Parameter: DiscreteTimeIntegrator_gainv_ip
   * Referenced by: '<S23>/Discrete-Time Integrator'
   */
  0.00048828125,

  /* Expression: 0
   * Referenced by: '<S23>/Discrete-Time Integrator'
   */
  0.0,

  /* Expression: 0
   * Referenced by: '<S49>/Constant1'
   */
  0.0,

  /* Computed Parameter: DiscreteTimeIntegrator_gainva_n
   * Referenced by: '<S49>/Discrete-Time Integrator'
   */
  0.00048828125,

  /* Expression: 0.1
   * Referenced by: '<S23>/Constant'
   */
  0.1,

  /* Expression: -0.4237
   * Referenced by: '<S13>/set_robot_calibration_z'
   */
  -0.4237,

  /* Expression: 3
   * Referenced by: '<S13>/Gain'
   */
  3.0,

  /* Expression: 5
   * Referenced by: '<S12>/Constant1'
   */
  5.0,

  /* Expression: 0.5
   * Referenced by: '<S12>/Homing Running Switch1'
   */
  0.5,

  /* Expression: 5
   * Referenced by: '<S12>/Saturation2'
   */
  5.0,

  /* Expression: 0
   * Referenced by: '<S12>/Saturation2'
   */
  0.0,

  /* Expression: 10
   * Referenced by: '<S16>/Saturation'
   */
  10.0,

  /* Expression: -10
   * Referenced by: '<S16>/Saturation'
   */
  -10.0,

  /* Expression: 25
   * Referenced by: '<S30>/Gain'
   */
  25.0,

  /* Computed Parameter: Dctintegrator_P1_Size_f
   * Referenced by: '<S30>/Dctintegrator'
   */
  { 1.0, 1.0 },

  /* Expression: f_num
   * Referenced by: '<S30>/Dctintegrator'
   */
  0.5,

  /* Computed Parameter: Dctintegrator_P2_Size_j
   * Referenced by: '<S30>/Dctintegrator'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S30>/Dctintegrator'
   */
  0.001,

  /* Computed Parameter: Dctleadlag_P1_Size_p
   * Referenced by: '<S30>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_num
   * Referenced by: '<S30>/Dctleadlag'
   */
  6.6667,

  /* Computed Parameter: Dctleadlag_P2_Size_p
   * Referenced by: '<S30>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S30>/Dctleadlag'
   */
  60.0,

  /* Computed Parameter: Dctleadlag_P3_Size_c
   * Referenced by: '<S30>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S30>/Dctleadlag'
   */
  0.001,

  /* Computed Parameter: Dct1lowpass_P1_Size_fg
   * Referenced by: '<S30>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S30>/Dct1lowpass'
   */
  100.0,

  /* Computed Parameter: Dct1lowpass_P2_Size_g
   * Referenced by: '<S30>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S30>/Dct1lowpass'
   */
  0.001,

  /* Expression: 25
   * Referenced by: '<S31>/Gain'
   */
  25.0,

  /* Computed Parameter: Dctleadlag_P1_Size_nt
   * Referenced by: '<S31>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_num
   * Referenced by: '<S31>/Dctleadlag'
   */
  6.6667,

  /* Computed Parameter: Dctleadlag_P2_Size_b
   * Referenced by: '<S31>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S31>/Dctleadlag'
   */
  60.0,

  /* Computed Parameter: Dctleadlag_P3_Size_dx
   * Referenced by: '<S31>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S31>/Dctleadlag'
   */
  0.001,

  /* Computed Parameter: Dct1lowpass_P1_Size_p
   * Referenced by: '<S31>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S31>/Dct1lowpass'
   */
  100.0,

  /* Computed Parameter: Dct1lowpass_P2_Size_gi
   * Referenced by: '<S31>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S31>/Dct1lowpass'
   */
  0.001,

  /* Expression: 2.5
   * Referenced by: '<S12>/Voltage middle'
   */
  2.5,

  /* Expression: 20
   * Referenced by: '<S37>/Gain1'
   */
  20.0,

  /* Computed Parameter: Dctintegrator_P1_Size_c
   * Referenced by: '<S37>/Dctintegrator'
   */
  { 1.0, 1.0 },

  /* Expression: f_num
   * Referenced by: '<S37>/Dctintegrator'
   */
  0.5,

  /* Computed Parameter: Dctintegrator_P2_Size_ja
   * Referenced by: '<S37>/Dctintegrator'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S37>/Dctintegrator'
   */
  0.001,

  /* Computed Parameter: Dctleadlag_P1_Size_ph
   * Referenced by: '<S37>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_num
   * Referenced by: '<S37>/Dctleadlag'
   */
  10.0,

  /* Computed Parameter: Dctleadlag_P2_Size_l
   * Referenced by: '<S37>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S37>/Dctleadlag'
   */
  90.0,

  /* Computed Parameter: Dctleadlag_P3_Size_j
   * Referenced by: '<S37>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S37>/Dctleadlag'
   */
  0.001,

  /* Computed Parameter: Dct1lowpass_P1_Size_mb
   * Referenced by: '<S37>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S37>/Dct1lowpass'
   */
  200.0,

  /* Computed Parameter: Dct1lowpass_P2_Size_i
   * Referenced by: '<S37>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S37>/Dct1lowpass'
   */
  0.001,

  /* Expression: 20
   * Referenced by: '<S38>/Gain1'
   */
  20.0,

  /* Computed Parameter: Dctleadlag_P1_Size_b
   * Referenced by: '<S38>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_num
   * Referenced by: '<S38>/Dctleadlag'
   */
  10.0,

  /* Computed Parameter: Dctleadlag_P2_Size_o
   * Referenced by: '<S38>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S38>/Dctleadlag'
   */
  90.0,

  /* Computed Parameter: Dctleadlag_P3_Size_a
   * Referenced by: '<S38>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S38>/Dctleadlag'
   */
  0.001,

  /* Computed Parameter: Dct1lowpass_P1_Size_i
   * Referenced by: '<S38>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S38>/Dct1lowpass'
   */
  200.0,

  /* Computed Parameter: Dct1lowpass_P2_Size_j
   * Referenced by: '<S38>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S38>/Dct1lowpass'
   */
  0.001,

  /* Expression: 5
   * Referenced by: '<S12>/Saturation'
   */
  5.0,

  /* Expression: 0
   * Referenced by: '<S12>/Saturation'
   */
  0.0,

  /* Expression: 10
   * Referenced by: '<S14>/Saturation'
   */
  10.0,

  /* Expression: -10
   * Referenced by: '<S14>/Saturation'
   */
  -10.0,

  /* Expression: 25
   * Referenced by: '<S46>/Gain'
   */
  25.0,

  /* Computed Parameter: Dctintegrator_P1_Size_j
   * Referenced by: '<S46>/Dctintegrator'
   */
  { 1.0, 1.0 },

  /* Expression: f_num
   * Referenced by: '<S46>/Dctintegrator'
   */
  0.5,

  /* Computed Parameter: Dctintegrator_P2_Size_n
   * Referenced by: '<S46>/Dctintegrator'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S46>/Dctintegrator'
   */
  0.001,

  /* Computed Parameter: Dctleadlag_P1_Size_o
   * Referenced by: '<S46>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_num
   * Referenced by: '<S46>/Dctleadlag'
   */
  10.0,

  /* Computed Parameter: Dctleadlag_P2_Size_o4
   * Referenced by: '<S46>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S46>/Dctleadlag'
   */
  90.0,

  /* Computed Parameter: Dctleadlag_P3_Size_l
   * Referenced by: '<S46>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S46>/Dctleadlag'
   */
  0.001,

  /* Computed Parameter: Dct1lowpass_P1_Size_g
   * Referenced by: '<S46>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S46>/Dct1lowpass'
   */
  200.0,

  /* Computed Parameter: Dct1lowpass_P2_Size_p
   * Referenced by: '<S46>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S46>/Dct1lowpass'
   */
  0.001,

  /* Expression: 30
   * Referenced by: '<S47>/Gain'
   */
  30.0,

  /* Computed Parameter: Dctleadlag_P1_Size_f
   * Referenced by: '<S47>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_num
   * Referenced by: '<S47>/Dctleadlag'
   */
  10.0,

  /* Computed Parameter: Dctleadlag_P2_Size_dd
   * Referenced by: '<S47>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S47>/Dctleadlag'
   */
  90.0,

  /* Computed Parameter: Dctleadlag_P3_Size_p
   * Referenced by: '<S47>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S47>/Dctleadlag'
   */
  0.001,

  /* Computed Parameter: Dct1lowpass_P1_Size_d
   * Referenced by: '<S47>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S47>/Dct1lowpass'
   */
  200.0,

  /* Computed Parameter: Dct1lowpass_P2_Size_k
   * Referenced by: '<S47>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S47>/Dct1lowpass'
   */
  0.001,

  /* Computed Parameter: DiscreteTimeIntegrator_gainva_c
   * Referenced by: '<S24>/Discrete-Time Integrator'
   */
  0.00048828125,

  /* Expression: 0
   * Referenced by: '<S24>/Discrete-Time Integrator'
   */
  0.0,

  /* Expression: 10*2.5/500
   * Referenced by: '<S56>/Gain1'
   */
  0.05,

  /* Computed Parameter: Dctintegrator3_P1_Size_e
   * Referenced by: '<S56>/Dctintegrator3'
   */
  { 1.0, 1.0 },

  /* Expression: f_num
   * Referenced by: '<S56>/Dctintegrator3'
   */
  0.01,

  /* Computed Parameter: Dctintegrator3_P2_Size_i
   * Referenced by: '<S56>/Dctintegrator3'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S56>/Dctintegrator3'
   */
  0.001,

  /* Computed Parameter: Dct1lowpass_P1_Size_ph
   * Referenced by: '<S56>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S56>/Dct1lowpass'
   */
  30.0,

  /* Computed Parameter: Dct1lowpass_P2_Size_p0
   * Referenced by: '<S56>/Dct1lowpass'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S56>/Dct1lowpass'
   */
  0.001,

  /* Computed Parameter: Dctleadlag_P1_Size_pu
   * Referenced by: '<S56>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_num
   * Referenced by: '<S56>/Dctleadlag'
   */
  3.0,

  /* Computed Parameter: Dctleadlag_P2_Size_n
   * Referenced by: '<S56>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: f_den
   * Referenced by: '<S56>/Dctleadlag'
   */
  20.0,

  /* Computed Parameter: Dctleadlag_P3_Size_f
   * Referenced by: '<S56>/Dctleadlag'
   */
  { 1.0, 1.0 },

  /* Expression: 0.001
   * Referenced by: '<S56>/Dctleadlag'
   */
  0.001,

  /* Expression: 0.5
   * Referenced by: '<S24>/Homing Running Switch'
   */
  0.5,

  /* Expression: 1
   * Referenced by: '<S12>/Gain4'
   */
  1.0,

  /* Expression: 5
   * Referenced by: '<S12>/Saturation1'
   */
  5.0,

  /* Expression: 0
   * Referenced by: '<S12>/Saturation1'
   */
  0.0,

  /* Expression: 10
   * Referenced by: '<S15>/Saturation'
   */
  10.0,

  /* Expression: -10
   * Referenced by: '<S15>/Saturation'
   */
  -10.0,

  /* Expression: 0
   * Referenced by: '<S13>/Unit Delay1'
   */
  0.0,

  /* Expression: 0.5
   * Referenced by: '<S20>/Homing Running Switch'
   */
  0.5,

  /* Expression: 0.2
   * Referenced by: '<S49>/Limit Speed'
   */
  0.2,

  /* Expression: -0.2
   * Referenced by: '<S49>/Limit Speed'
   */
  -0.2,

  /* Expression: 0
   * Referenced by: '<S49>/Limit Speed'
   */
  0.0,

  /* Computed Parameter: TSamp_WtEt
   * Referenced by: '<S55>/TSamp'
   */
  2048.0,

  /* Expression: 0.5
   * Referenced by: '<S49>/Limit Acceleration'
   */
  0.5,

  /* Expression: -0.5
   * Referenced by: '<S49>/Limit Acceleration'
   */
  -0.5,

  /* Expression: 0
   * Referenced by: '<S49>/Limit Acceleration'
   */
  0.0,

  /* Expression: 0.4
   * Referenced by: '<S39>/Limit Speed'
   */
  0.4,

  /* Expression: -0.4
   * Referenced by: '<S39>/Limit Speed'
   */
  -0.4,

  /* Expression: 0
   * Referenced by: '<S39>/Limit Speed'
   */
  0.0,

  /* Computed Parameter: TSamp_WtEt_h
   * Referenced by: '<S45>/TSamp'
   */
  2048.0,

  /* Expression: 0.5
   * Referenced by: '<S39>/Limit Acceleration'
   */
  0.5,

  /* Expression: -0.5
   * Referenced by: '<S39>/Limit Acceleration'
   */
  -0.5,

  /* Expression: 0
   * Referenced by: '<S39>/Limit Acceleration'
   */
  0.0,

  /* Expression: 0.6
   * Referenced by: '<S33>/Limit Speed'
   */
  0.6,

  /* Expression: -0.6
   * Referenced by: '<S33>/Limit Speed'
   */
  -0.6,

  /* Expression: 0
   * Referenced by: '<S33>/Limit Speed'
   */
  0.0,

  /* Computed Parameter: TSamp_WtEt_a
   * Referenced by: '<S36>/TSamp'
   */
  2048.0,

  /* Expression: 0.8
   * Referenced by: '<S33>/Limit Acceleration'
   */
  0.8,

  /* Expression: -0.8
   * Referenced by: '<S33>/Limit Acceleration'
   */
  -0.8,

  /* Expression: 0
   * Referenced by: '<S33>/Limit Acceleration'
   */
  0.0,

  /* Computed Parameter: ResetEncoderR_P1_Size
   * Referenced by: '<S21>/Reset EncoderR'
   */
  { 1.0, 1.0 },

  /* Expression: link_id
   * Referenced by: '<S21>/Reset EncoderR'
   */
  0.0,

  /* Computed Parameter: ResetEncoderR_P2_Size
   * Referenced by: '<S21>/Reset EncoderR'
   */
  { 1.0, 1.0 },

  /* Expression: chan_id
   * Referenced by: '<S21>/Reset EncoderR'
   */
  0.0,

  /* Computed Parameter: ResetEncoderX_P1_Size
   * Referenced by: '<S22>/Reset EncoderX'
   */
  { 1.0, 1.0 },

  /* Expression: link_id
   * Referenced by: '<S22>/Reset EncoderX'
   */
  0.0,

  /* Computed Parameter: ResetEncoderX_P2_Size
   * Referenced by: '<S22>/Reset EncoderX'
   */
  { 1.0, 1.0 },

  /* Expression: chan_id
   * Referenced by: '<S22>/Reset EncoderX'
   */
  1.0,

  /* Computed Parameter: ResetEncoderX_P1_Size_k
   * Referenced by: '<S23>/Reset EncoderX'
   */
  { 1.0, 1.0 },

  /* Expression: link_id
   * Referenced by: '<S23>/Reset EncoderX'
   */
  1.0,

  /* Computed Parameter: ResetEncoderX_P2_Size_k
   * Referenced by: '<S23>/Reset EncoderX'
   */
  { 1.0, 1.0 },

  /* Expression: chan_id
   * Referenced by: '<S23>/Reset EncoderX'
   */
  0.0,

  /* Computed Parameter: ResetEncoderConv_P1_Size
   * Referenced by: '<S24>/Reset EncoderConv'
   */
  { 1.0, 1.0 },

  /* Expression: link_id
   * Referenced by: '<S24>/Reset EncoderConv'
   */
  1.0,

  /* Computed Parameter: ResetEncoderConv_P2_Size
   * Referenced by: '<S24>/Reset EncoderConv'
   */
  { 1.0, 1.0 },

  /* Expression: chan_id
   * Referenced by: '<S24>/Reset EncoderConv'
   */
  1.0,

  /* Expression: 1/100
   * Referenced by: '<S14>/Gain'
   */
  0.01,

  /* Expression: 1/100
   * Referenced by: '<S15>/Gain'
   */
  0.01,

  /* Expression: 1/100
   * Referenced by: '<S16>/Gain'
   */
  0.01,

  /* Computed Parameter: LEDRing_Y0
   * Referenced by: '<S1>/LED Ring [-]'
   */
  "",

  /* Expression: 'black'
   * Referenced by: '<S1>/Color; set with string; black or white'
   */
  "black",

  /* Expression: '0072bd'
   * Referenced by: '<S1>/Color; specified in 6 hex digits, rrggbb'
   */
  "0072bd",

  /* Expression: 'color '
   * Referenced by: '<S29>/String Constant3'
   */
  "color ",

  /* Expression: 'white'
   * Referenced by: '<S27>/String Constant4'
   */
  "white",

  /* Expression: 'black'
   * Referenced by: '<S27>/String Constant1'
   */
  "black",

  /* Expression: '0000FF00'
   * Referenced by: '<S13>/Ready Green'
   */
  "0000FF00",

  /* Expression: '00FF0000'
   * Referenced by: '<S13>/Airbag Red'
   */
  "00FF0000",

  /* Expression: '00FF3900'
   * Referenced by: '<S13>/Homing Orange'
   */
  "00FF3900",

  /* Computed Parameter: Delay_InitialCondition
   * Referenced by: '<S26>/Delay'
   */
  "",

  /* Computed Parameter: ManualSwitch_CurrentSetting
   * Referenced by: '<S1>/Manual Switch'
   */
  1U,

  /* Computed Parameter: ManualSwitch1_CurrentSetting
   * Referenced by: '<S1>/Manual Switch1'
   */
  1U,

  /* Computed Parameter: Constant1_Value_b
   * Referenced by: '<S28>/Constant1'
   */
  13U,

  /* Computed Parameter: Constant_Value_c
   * Referenced by: '<S29>/Constant'
   */
  13U
};
