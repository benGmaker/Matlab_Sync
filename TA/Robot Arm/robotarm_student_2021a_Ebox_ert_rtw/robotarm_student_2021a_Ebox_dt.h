/*
 * robotarm_student_2021a_Ebox_dt.h
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

#include "ext_types.h"

/* data type size table */
static uint_T rtDataTypeSizes[] = {
  sizeof(real_T),
  sizeof(real32_T),
  sizeof(int8_T),
  sizeof(uint8_T),
  sizeof(int16_T),
  sizeof(uint16_T),
  sizeof(int32_T),
  sizeof(uint32_T),
  sizeof(boolean_T),
  sizeof(fcn_call_T),
  sizeof(int_T),
  sizeof(pointer_T),
  sizeof(action_T),
  2*sizeof(uint32_T),
  sizeof(int32_T),
  sizeof(int64_T),
  sizeof(uint64_T),
  8,
  256,
  sizeof(codertarget_raspi_internal_SC_T),
  sizeof(uint64_T),
  sizeof(int64_T),
  sizeof(uint_T),
  sizeof(char_T),
  sizeof(uchar_T),
  sizeof(time_T)
};

/* data type name table */
static const char_T * rtDataTypeNames[] = {
  "real_T",
  "real32_T",
  "int8_T",
  "uint8_T",
  "int16_T",
  "uint16_T",
  "int32_T",
  "uint32_T",
  "boolean_T",
  "fcn_call_T",
  "int_T",
  "pointer_T",
  "action_T",
  "timer_uint32_pair_T",
  "physical_connection",
  "int64_T",
  "uint64_T",
  "string",
  "char_T",
  "codertarget_raspi_internal_SC_T",
  "uint64_T",
  "int64_T",
  "uint_T",
  "char_T",
  "uchar_T",
  "time_T"
};

/* data type transitions for block I/O structure */
static DataTypeTransition rtBTransitions[] = {
  { (char_T *)(&robotarm_student_2021a_Ebox_B.ec_Ebox_o2[0]), 0, 0, 34 },

  { (char_T *)(&robotarm_student_2021a_Ebox_B.ManualSwitch1[0]), 18, 0, 256 },

  { (char_T *)(&robotarm_student_2021a_Ebox_B.SFunction), 0, 0, 147 },

  { (char_T *)(&robotarm_student_2021a_Ebox_B.RelationalOperator), 8, 0, 4 }
  ,

  { (char_T *)(&robotarm_student_2021a_Ebox_DW.DiscreteTimeIntegrator_DSTATE), 0,
    0, 25 },

  { (char_T *)(&robotarm_student_2021a_Ebox_DW.Delay_DSTATE[0]), 18, 0, 1 },

  { (char_T *)(&robotarm_student_2021a_Ebox_DW.PrevY), 0, 0, 65 },

  { (char_T *)(&robotarm_student_2021a_Ebox_DW.sfEvent), 6, 0, 7 },

  { (char_T *)(&robotarm_student_2021a_Ebox_DW.is_c4_robotarm_student_2021a_Eb),
    7, 0, 8 },

  { (char_T *)(&robotarm_student_2021a_Ebox_DW.temporalCounter_i1), 5, 0, 4 },

  { (char_T *)(&robotarm_student_2021a_Ebox_DW.Subsystem3_SubsysRanBC), 2, 0, 5
  },

  { (char_T *)(&robotarm_student_2021a_Ebox_DW.is_active_c4_robotarm_student_2),
    3, 0, 9 },

  { (char_T *)(&robotarm_student_2021a_Ebox_DW.doneDoubleBufferReInit), 8, 0, 4
  },

  { (char_T *)(&robotarm_student_2021a_Ebox_DW.SerialWrite.obj), 19, 0, 1 },

  { (char_T *)(&robotarm_student_2021a_Ebox_DW.SerialWrite.objisempty), 8, 0, 1
  },

  { (char_T *)(&robotarm_student_2021a_Ebox_DW.SerialWrite1.obj), 19, 0, 1 },

  { (char_T *)(&robotarm_student_2021a_Ebox_DW.SerialWrite1.objisempty), 8, 0, 1
  }
};

/* data type transition table for block I/O structure */
static DataTypeTransitionTable rtBTransTable = {
  17U,
  rtBTransitions
};

/* data type transitions for Parameters structure */
static DataTypeTransition rtPTransitions[] = {
  { (char_T *)(&robotarm_student_2021a_Ebox_P.DiscreteDerivative_ICPrevScaled),
    0, 0, 388 },

  { (char_T *)(&robotarm_student_2021a_Ebox_P.LEDRing_Y0[0]), 17, 0, 2560 },

  { (char_T *)(&robotarm_student_2021a_Ebox_P.ManualSwitch_CurrentSetting), 3, 0,
    4 }
};

/* data type transition table for Parameters structure */
static DataTypeTransitionTable rtPTransTable = {
  3U,
  rtPTransitions
};

/* [EOF] robotarm_student_2021a_Ebox_dt.h */
