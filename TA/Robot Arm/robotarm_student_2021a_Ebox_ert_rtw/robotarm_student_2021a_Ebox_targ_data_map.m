    function targMap = targDataMap(),

    ;%***********************
    ;% Create Parameter Map *
    ;%***********************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 3;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc paramMap
        ;%
        paramMap.nSections           = nTotSects;
        paramMap.sectIdxOffset       = sectIdxOffset;
            paramMap.sections(nTotSects) = dumSection; %prealloc
        paramMap.nTotData            = -1;

        ;%
        ;% Auto data (robotarm_student_2021a_Ebox_P)
        ;%
            section.nData     = 290;
            section.data(290)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_P.DiscreteDerivative_ICPrevScaled
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% robotarm_student_2021a_Ebox_P.DiscreteDerivative_ICPrevScal_p
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% robotarm_student_2021a_Ebox_P.DiscreteDerivative_ICPrevSca_pr
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% robotarm_student_2021a_Ebox_P.CompareToConstant_const
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 3;

                    ;% robotarm_student_2021a_Ebox_P.DetectChange_vinit
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 4;

                    ;% robotarm_student_2021a_Ebox_P.Delays_Y0
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 5;

                    ;% robotarm_student_2021a_Ebox_P.Suck_Value
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 6;

                    ;% robotarm_student_2021a_Ebox_P.Blow_Value
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 7;

                    ;% robotarm_student_2021a_Ebox_P.RobotV_Y0
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 8;

                    ;% robotarm_student_2021a_Ebox_P.ConveyorV_Y0
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 9;

                    ;% robotarm_student_2021a_Ebox_P.VacuumV_Y0
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 10;

                    ;% robotarm_student_2021a_Ebox_P.Blowsuck_Y0
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 11;

                    ;% robotarm_student_2021a_Ebox_P.Objectdetectionmatrix_Value
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 12;

                    ;% robotarm_student_2021a_Ebox_P.SineWave2_Amp
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 24;

                    ;% robotarm_student_2021a_Ebox_P.SineWave2_Bias
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 25;

                    ;% robotarm_student_2021a_Ebox_P.SineWave2_Freq
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 26;

                    ;% robotarm_student_2021a_Ebox_P.SineWave2_Phase
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 27;

                    ;% robotarm_student_2021a_Ebox_P.Gain1_Gain
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 28;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator_P1_Size
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 29;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator_P1
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 31;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator_P2_Size
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 32;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator_P2
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 34;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_Size
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 35;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 37;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_Size
                    section.data(25).logicalSrcIdx = 24;
                    section.data(25).dtTransOffset = 38;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2
                    section.data(26).logicalSrcIdx = 25;
                    section.data(26).dtTransOffset = 40;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_Size
                    section.data(27).logicalSrcIdx = 26;
                    section.data(27).dtTransOffset = 41;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3
                    section.data(28).logicalSrcIdx = 27;
                    section.data(28).dtTransOffset = 43;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_Size
                    section.data(29).logicalSrcIdx = 28;
                    section.data(29).dtTransOffset = 44;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1
                    section.data(30).logicalSrcIdx = 29;
                    section.data(30).dtTransOffset = 46;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_Size
                    section.data(31).logicalSrcIdx = 30;
                    section.data(31).dtTransOffset = 47;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2
                    section.data(32).logicalSrcIdx = 31;
                    section.data(32).dtTransOffset = 49;

                    ;% robotarm_student_2021a_Ebox_P.SineWave_Amp
                    section.data(33).logicalSrcIdx = 32;
                    section.data(33).dtTransOffset = 50;

                    ;% robotarm_student_2021a_Ebox_P.SineWave_Bias
                    section.data(34).logicalSrcIdx = 33;
                    section.data(34).dtTransOffset = 51;

                    ;% robotarm_student_2021a_Ebox_P.SineWave_Freq
                    section.data(35).logicalSrcIdx = 34;
                    section.data(35).dtTransOffset = 52;

                    ;% robotarm_student_2021a_Ebox_P.SineWave_Phase
                    section.data(36).logicalSrcIdx = 35;
                    section.data(36).dtTransOffset = 53;

                    ;% robotarm_student_2021a_Ebox_P.Gain1_Gain_p
                    section.data(37).logicalSrcIdx = 36;
                    section.data(37).dtTransOffset = 54;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_Size_d
                    section.data(38).logicalSrcIdx = 37;
                    section.data(38).dtTransOffset = 55;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_h
                    section.data(39).logicalSrcIdx = 38;
                    section.data(39).dtTransOffset = 57;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_Size_d
                    section.data(40).logicalSrcIdx = 39;
                    section.data(40).dtTransOffset = 58;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_f
                    section.data(41).logicalSrcIdx = 40;
                    section.data(41).dtTransOffset = 60;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_Size_d
                    section.data(42).logicalSrcIdx = 41;
                    section.data(42).dtTransOffset = 61;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_p
                    section.data(43).logicalSrcIdx = 42;
                    section.data(43).dtTransOffset = 63;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_Size_f
                    section.data(44).logicalSrcIdx = 43;
                    section.data(44).dtTransOffset = 64;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_p
                    section.data(45).logicalSrcIdx = 44;
                    section.data(45).dtTransOffset = 66;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_Size_e
                    section.data(46).logicalSrcIdx = 45;
                    section.data(46).dtTransOffset = 67;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_i
                    section.data(47).logicalSrcIdx = 46;
                    section.data(47).dtTransOffset = 69;

                    ;% robotarm_student_2021a_Ebox_P.SineWave1_Amp
                    section.data(48).logicalSrcIdx = 47;
                    section.data(48).dtTransOffset = 70;

                    ;% robotarm_student_2021a_Ebox_P.SineWave1_Bias
                    section.data(49).logicalSrcIdx = 48;
                    section.data(49).dtTransOffset = 71;

                    ;% robotarm_student_2021a_Ebox_P.SineWave1_Freq
                    section.data(50).logicalSrcIdx = 49;
                    section.data(50).dtTransOffset = 72;

                    ;% robotarm_student_2021a_Ebox_P.SineWave1_Phase
                    section.data(51).logicalSrcIdx = 50;
                    section.data(51).dtTransOffset = 73;

                    ;% robotarm_student_2021a_Ebox_P.Gain_Gain
                    section.data(52).logicalSrcIdx = 51;
                    section.data(52).dtTransOffset = 74;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_Size_n
                    section.data(53).logicalSrcIdx = 52;
                    section.data(53).dtTransOffset = 75;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_n
                    section.data(54).logicalSrcIdx = 53;
                    section.data(54).dtTransOffset = 77;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_Size_h
                    section.data(55).logicalSrcIdx = 54;
                    section.data(55).dtTransOffset = 78;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_j
                    section.data(56).logicalSrcIdx = 55;
                    section.data(56).dtTransOffset = 80;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_Size_b
                    section.data(57).logicalSrcIdx = 56;
                    section.data(57).dtTransOffset = 81;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_n
                    section.data(58).logicalSrcIdx = 57;
                    section.data(58).dtTransOffset = 83;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_Size_m
                    section.data(59).logicalSrcIdx = 58;
                    section.data(59).dtTransOffset = 84;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_f
                    section.data(60).logicalSrcIdx = 59;
                    section.data(60).dtTransOffset = 86;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_Size_d
                    section.data(61).logicalSrcIdx = 60;
                    section.data(61).dtTransOffset = 87;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_m
                    section.data(62).logicalSrcIdx = 61;
                    section.data(62).dtTransOffset = 89;

                    ;% robotarm_student_2021a_Ebox_P.Discreteintegrator_gainval
                    section.data(63).logicalSrcIdx = 62;
                    section.data(63).dtTransOffset = 90;

                    ;% robotarm_student_2021a_Ebox_P.Discreteintegrator_IC
                    section.data(64).logicalSrcIdx = 63;
                    section.data(64).dtTransOffset = 91;

                    ;% robotarm_student_2021a_Ebox_P.Gain1_Gain_g
                    section.data(65).logicalSrcIdx = 64;
                    section.data(65).dtTransOffset = 92;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator3_P1_Size
                    section.data(66).logicalSrcIdx = 65;
                    section.data(66).dtTransOffset = 93;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator3_P1
                    section.data(67).logicalSrcIdx = 66;
                    section.data(67).dtTransOffset = 95;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator3_P2_Size
                    section.data(68).logicalSrcIdx = 67;
                    section.data(68).dtTransOffset = 96;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator3_P2
                    section.data(69).logicalSrcIdx = 68;
                    section.data(69).dtTransOffset = 98;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_Size_l
                    section.data(70).logicalSrcIdx = 69;
                    section.data(70).dtTransOffset = 99;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_o
                    section.data(71).logicalSrcIdx = 70;
                    section.data(71).dtTransOffset = 101;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_Size_o
                    section.data(72).logicalSrcIdx = 71;
                    section.data(72).dtTransOffset = 102;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_d
                    section.data(73).logicalSrcIdx = 72;
                    section.data(73).dtTransOffset = 104;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_Size_i
                    section.data(74).logicalSrcIdx = 73;
                    section.data(74).dtTransOffset = 105;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_m
                    section.data(75).logicalSrcIdx = 74;
                    section.data(75).dtTransOffset = 107;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_Size_m
                    section.data(76).logicalSrcIdx = 75;
                    section.data(76).dtTransOffset = 108;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_f1
                    section.data(77).logicalSrcIdx = 76;
                    section.data(77).dtTransOffset = 110;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_Size_h
                    section.data(78).logicalSrcIdx = 77;
                    section.data(78).dtTransOffset = 111;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_j
                    section.data(79).logicalSrcIdx = 78;
                    section.data(79).dtTransOffset = 113;

                    ;% robotarm_student_2021a_Ebox_P.FeedfowardZV_Value
                    section.data(80).logicalSrcIdx = 79;
                    section.data(80).dtTransOffset = 114;

                    ;% robotarm_student_2021a_Ebox_P.FeedfowardXV_Value
                    section.data(81).logicalSrcIdx = 80;
                    section.data(81).dtTransOffset = 115;

                    ;% robotarm_student_2021a_Ebox_P.FeedfowardRV_Value
                    section.data(82).logicalSrcIdx = 81;
                    section.data(82).dtTransOffset = 116;

                    ;% robotarm_student_2021a_Ebox_P.Conveyorspeedmms_Value
                    section.data(83).logicalSrcIdx = 82;
                    section.data(83).dtTransOffset = 117;

                    ;% robotarm_student_2021a_Ebox_P.Saturation_UpperSat
                    section.data(84).logicalSrcIdx = 83;
                    section.data(84).dtTransOffset = 118;

                    ;% robotarm_student_2021a_Ebox_P.Saturation_LowerSat
                    section.data(85).logicalSrcIdx = 84;
                    section.data(85).dtTransOffset = 119;

                    ;% robotarm_student_2021a_Ebox_P.ReferenceVacuumbar_Value
                    section.data(86).logicalSrcIdx = 85;
                    section.data(86).dtTransOffset = 120;

                    ;% robotarm_student_2021a_Ebox_P.Gain1_Gain_b
                    section.data(87).logicalSrcIdx = 86;
                    section.data(87).dtTransOffset = 121;

                    ;% robotarm_student_2021a_Ebox_P.Object_Value
                    section.data(88).logicalSrcIdx = 87;
                    section.data(88).dtTransOffset = 122;

                    ;% robotarm_student_2021a_Ebox_P.Plot_Value
                    section.data(89).logicalSrcIdx = 88;
                    section.data(89).dtTransOffset = 123;

                    ;% robotarm_student_2021a_Ebox_P.Stop_Value
                    section.data(90).logicalSrcIdx = 89;
                    section.data(90).dtTransOffset = 124;

                    ;% robotarm_student_2021a_Ebox_P.HomingRunningSwitch2_Threshold
                    section.data(91).logicalSrcIdx = 90;
                    section.data(91).dtTransOffset = 125;

                    ;% robotarm_student_2021a_Ebox_P.HomingRunningSwitch1_Threshold
                    section.data(92).logicalSrcIdx = 91;
                    section.data(92).dtTransOffset = 126;

                    ;% robotarm_student_2021a_Ebox_P.Saturation_UpperSat_i
                    section.data(93).logicalSrcIdx = 92;
                    section.data(93).dtTransOffset = 127;

                    ;% robotarm_student_2021a_Ebox_P.Saturation_LowerSat_m
                    section.data(94).logicalSrcIdx = 93;
                    section.data(94).dtTransOffset = 128;

                    ;% robotarm_student_2021a_Ebox_P.HomingRunningSwitch_Threshold
                    section.data(95).logicalSrcIdx = 94;
                    section.data(95).dtTransOffset = 129;

                    ;% robotarm_student_2021a_Ebox_P.HomingRunningSwitch_Threshold_o
                    section.data(96).logicalSrcIdx = 95;
                    section.data(96).dtTransOffset = 130;

                    ;% robotarm_student_2021a_Ebox_P.HomingRunningSwitch_Threshold_j
                    section.data(97).logicalSrcIdx = 96;
                    section.data(97).dtTransOffset = 131;

                    ;% robotarm_student_2021a_Ebox_P.SFunction_P1_Size
                    section.data(98).logicalSrcIdx = 97;
                    section.data(98).dtTransOffset = 132;

                    ;% robotarm_student_2021a_Ebox_P.SFunction_P1
                    section.data(99).logicalSrcIdx = 98;
                    section.data(99).dtTransOffset = 134;

                    ;% robotarm_student_2021a_Ebox_P.SFunction_P2_Size
                    section.data(100).logicalSrcIdx = 99;
                    section.data(100).dtTransOffset = 135;

                    ;% robotarm_student_2021a_Ebox_P.SFunction_P2
                    section.data(101).logicalSrcIdx = 100;
                    section.data(101).dtTransOffset = 137;

                    ;% robotarm_student_2021a_Ebox_P.ec_Ebox_P1_Size
                    section.data(102).logicalSrcIdx = 101;
                    section.data(102).dtTransOffset = 138;

                    ;% robotarm_student_2021a_Ebox_P.ec_Ebox_P1
                    section.data(103).logicalSrcIdx = 102;
                    section.data(103).dtTransOffset = 140;

                    ;% robotarm_student_2021a_Ebox_P.ec_Ebox_P1_Size_d
                    section.data(104).logicalSrcIdx = 103;
                    section.data(104).dtTransOffset = 141;

                    ;% robotarm_student_2021a_Ebox_P.ec_Ebox_P1_e
                    section.data(105).logicalSrcIdx = 104;
                    section.data(105).dtTransOffset = 143;

                    ;% robotarm_student_2021a_Ebox_P.ec_Ebox_P1_Size_du
                    section.data(106).logicalSrcIdx = 105;
                    section.data(106).dtTransOffset = 144;

                    ;% robotarm_student_2021a_Ebox_P.ec_Ebox_P1_i
                    section.data(107).logicalSrcIdx = 106;
                    section.data(107).dtTransOffset = 146;

                    ;% robotarm_student_2021a_Ebox_P.EnableVentiel_Value
                    section.data(108).logicalSrcIdx = 107;
                    section.data(108).dtTransOffset = 147;

                    ;% robotarm_student_2021a_Ebox_P.Gain_Gain_p
                    section.data(109).logicalSrcIdx = 108;
                    section.data(109).dtTransOffset = 155;

                    ;% robotarm_student_2021a_Ebox_P.Gain1_Gain_c
                    section.data(110).logicalSrcIdx = 109;
                    section.data(110).dtTransOffset = 156;

                    ;% robotarm_student_2021a_Ebox_P.Gain2_Gain
                    section.data(111).logicalSrcIdx = 110;
                    section.data(111).dtTransOffset = 157;

                    ;% robotarm_student_2021a_Ebox_P.Gain5_Gain
                    section.data(112).logicalSrcIdx = 111;
                    section.data(112).dtTransOffset = 158;

                    ;% robotarm_student_2021a_Ebox_P.HomingRunningSwitch_Threshold_d
                    section.data(113).logicalSrcIdx = 112;
                    section.data(113).dtTransOffset = 159;

                    ;% robotarm_student_2021a_Ebox_P.Gain3_Gain
                    section.data(114).logicalSrcIdx = 113;
                    section.data(114).dtTransOffset = 160;

                    ;% robotarm_student_2021a_Ebox_P.Gain6_Gain
                    section.data(115).logicalSrcIdx = 114;
                    section.data(115).dtTransOffset = 161;

                    ;% robotarm_student_2021a_Ebox_P.Constant_Value
                    section.data(116).logicalSrcIdx = 115;
                    section.data(116).dtTransOffset = 162;

                    ;% robotarm_student_2021a_Ebox_P.DiscreteTimeIntegrator_gainval
                    section.data(117).logicalSrcIdx = 116;
                    section.data(117).dtTransOffset = 163;

                    ;% robotarm_student_2021a_Ebox_P.DiscreteTimeIntegrator_IC
                    section.data(118).logicalSrcIdx = 117;
                    section.data(118).dtTransOffset = 164;

                    ;% robotarm_student_2021a_Ebox_P.Constant1_Value
                    section.data(119).logicalSrcIdx = 118;
                    section.data(119).dtTransOffset = 165;

                    ;% robotarm_student_2021a_Ebox_P.DiscreteTimeIntegrator_gainva_b
                    section.data(120).logicalSrcIdx = 119;
                    section.data(120).dtTransOffset = 166;

                    ;% robotarm_student_2021a_Ebox_P.Constant_Value_g
                    section.data(121).logicalSrcIdx = 120;
                    section.data(121).dtTransOffset = 167;

                    ;% robotarm_student_2021a_Ebox_P.UnitDelay_InitialCondition
                    section.data(122).logicalSrcIdx = 121;
                    section.data(122).dtTransOffset = 168;

                    ;% robotarm_student_2021a_Ebox_P.set_robot_calibration_r_Value
                    section.data(123).logicalSrcIdx = 122;
                    section.data(123).dtTransOffset = 169;

                    ;% robotarm_student_2021a_Ebox_P.DiscreteTimeIntegrator_gainva_a
                    section.data(124).logicalSrcIdx = 123;
                    section.data(124).dtTransOffset = 170;

                    ;% robotarm_student_2021a_Ebox_P.DiscreteTimeIntegrator_IC_i
                    section.data(125).logicalSrcIdx = 124;
                    section.data(125).dtTransOffset = 171;

                    ;% robotarm_student_2021a_Ebox_P.Constant1_Value_c
                    section.data(126).logicalSrcIdx = 125;
                    section.data(126).dtTransOffset = 172;

                    ;% robotarm_student_2021a_Ebox_P.DiscreteTimeIntegrator_gainva_i
                    section.data(127).logicalSrcIdx = 126;
                    section.data(127).dtTransOffset = 173;

                    ;% robotarm_student_2021a_Ebox_P.Constant_Value_n
                    section.data(128).logicalSrcIdx = 127;
                    section.data(128).dtTransOffset = 174;

                    ;% robotarm_student_2021a_Ebox_P.set_robot_calibration_x_Value
                    section.data(129).logicalSrcIdx = 128;
                    section.data(129).dtTransOffset = 175;

                    ;% robotarm_student_2021a_Ebox_P.DiscreteTimeIntegrator_gainv_ip
                    section.data(130).logicalSrcIdx = 129;
                    section.data(130).dtTransOffset = 176;

                    ;% robotarm_student_2021a_Ebox_P.DiscreteTimeIntegrator_IC_d
                    section.data(131).logicalSrcIdx = 130;
                    section.data(131).dtTransOffset = 177;

                    ;% robotarm_student_2021a_Ebox_P.Constant1_Value_e
                    section.data(132).logicalSrcIdx = 131;
                    section.data(132).dtTransOffset = 178;

                    ;% robotarm_student_2021a_Ebox_P.DiscreteTimeIntegrator_gainva_n
                    section.data(133).logicalSrcIdx = 132;
                    section.data(133).dtTransOffset = 179;

                    ;% robotarm_student_2021a_Ebox_P.Constant_Value_p
                    section.data(134).logicalSrcIdx = 133;
                    section.data(134).dtTransOffset = 180;

                    ;% robotarm_student_2021a_Ebox_P.set_robot_calibration_z_Value
                    section.data(135).logicalSrcIdx = 134;
                    section.data(135).dtTransOffset = 181;

                    ;% robotarm_student_2021a_Ebox_P.Gain_Gain_l
                    section.data(136).logicalSrcIdx = 135;
                    section.data(136).dtTransOffset = 182;

                    ;% robotarm_student_2021a_Ebox_P.Constant1_Value_f
                    section.data(137).logicalSrcIdx = 136;
                    section.data(137).dtTransOffset = 183;

                    ;% robotarm_student_2021a_Ebox_P.HomingRunningSwitch1_Threshol_k
                    section.data(138).logicalSrcIdx = 137;
                    section.data(138).dtTransOffset = 184;

                    ;% robotarm_student_2021a_Ebox_P.Saturation2_UpperSat
                    section.data(139).logicalSrcIdx = 138;
                    section.data(139).dtTransOffset = 185;

                    ;% robotarm_student_2021a_Ebox_P.Saturation2_LowerSat
                    section.data(140).logicalSrcIdx = 139;
                    section.data(140).dtTransOffset = 186;

                    ;% robotarm_student_2021a_Ebox_P.Saturation_UpperSat_g
                    section.data(141).logicalSrcIdx = 140;
                    section.data(141).dtTransOffset = 187;

                    ;% robotarm_student_2021a_Ebox_P.Saturation_LowerSat_k
                    section.data(142).logicalSrcIdx = 141;
                    section.data(142).dtTransOffset = 188;

                    ;% robotarm_student_2021a_Ebox_P.Gain_Gain_ph
                    section.data(143).logicalSrcIdx = 142;
                    section.data(143).dtTransOffset = 189;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator_P1_Size_f
                    section.data(144).logicalSrcIdx = 143;
                    section.data(144).dtTransOffset = 190;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator_P1_g
                    section.data(145).logicalSrcIdx = 144;
                    section.data(145).dtTransOffset = 192;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator_P2_Size_j
                    section.data(146).logicalSrcIdx = 145;
                    section.data(146).dtTransOffset = 193;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator_P2_b
                    section.data(147).logicalSrcIdx = 146;
                    section.data(147).dtTransOffset = 195;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_Size_p
                    section.data(148).logicalSrcIdx = 147;
                    section.data(148).dtTransOffset = 196;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_c
                    section.data(149).logicalSrcIdx = 148;
                    section.data(149).dtTransOffset = 198;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_Size_p
                    section.data(150).logicalSrcIdx = 149;
                    section.data(150).dtTransOffset = 199;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_i
                    section.data(151).logicalSrcIdx = 150;
                    section.data(151).dtTransOffset = 201;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_Size_c
                    section.data(152).logicalSrcIdx = 151;
                    section.data(152).dtTransOffset = 202;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_m
                    section.data(153).logicalSrcIdx = 152;
                    section.data(153).dtTransOffset = 204;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_Size_fg
                    section.data(154).logicalSrcIdx = 153;
                    section.data(154).dtTransOffset = 205;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_m
                    section.data(155).logicalSrcIdx = 154;
                    section.data(155).dtTransOffset = 207;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_Size_g
                    section.data(156).logicalSrcIdx = 155;
                    section.data(156).dtTransOffset = 208;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_l
                    section.data(157).logicalSrcIdx = 156;
                    section.data(157).dtTransOffset = 210;

                    ;% robotarm_student_2021a_Ebox_P.Gain_Gain_j
                    section.data(158).logicalSrcIdx = 157;
                    section.data(158).dtTransOffset = 211;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_Size_nt
                    section.data(159).logicalSrcIdx = 158;
                    section.data(159).dtTransOffset = 212;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_p
                    section.data(160).logicalSrcIdx = 159;
                    section.data(160).dtTransOffset = 214;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_Size_b
                    section.data(161).logicalSrcIdx = 160;
                    section.data(161).dtTransOffset = 215;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_o
                    section.data(162).logicalSrcIdx = 161;
                    section.data(162).dtTransOffset = 217;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_Size_dx
                    section.data(163).logicalSrcIdx = 162;
                    section.data(163).dtTransOffset = 218;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_c
                    section.data(164).logicalSrcIdx = 163;
                    section.data(164).dtTransOffset = 220;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_Size_p
                    section.data(165).logicalSrcIdx = 164;
                    section.data(165).dtTransOffset = 221;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_d
                    section.data(166).logicalSrcIdx = 165;
                    section.data(166).dtTransOffset = 223;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_Size_gi
                    section.data(167).logicalSrcIdx = 166;
                    section.data(167).dtTransOffset = 224;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_n
                    section.data(168).logicalSrcIdx = 167;
                    section.data(168).dtTransOffset = 226;

                    ;% robotarm_student_2021a_Ebox_P.Voltagemiddle_Value
                    section.data(169).logicalSrcIdx = 168;
                    section.data(169).dtTransOffset = 227;

                    ;% robotarm_student_2021a_Ebox_P.Gain1_Gain_h
                    section.data(170).logicalSrcIdx = 169;
                    section.data(170).dtTransOffset = 228;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator_P1_Size_c
                    section.data(171).logicalSrcIdx = 170;
                    section.data(171).dtTransOffset = 229;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator_P1_h
                    section.data(172).logicalSrcIdx = 171;
                    section.data(172).dtTransOffset = 231;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator_P2_Size_ja
                    section.data(173).logicalSrcIdx = 172;
                    section.data(173).dtTransOffset = 232;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator_P2_c
                    section.data(174).logicalSrcIdx = 173;
                    section.data(174).dtTransOffset = 234;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_Size_ph
                    section.data(175).logicalSrcIdx = 174;
                    section.data(175).dtTransOffset = 235;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_f
                    section.data(176).logicalSrcIdx = 175;
                    section.data(176).dtTransOffset = 237;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_Size_l
                    section.data(177).logicalSrcIdx = 176;
                    section.data(177).dtTransOffset = 238;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_p
                    section.data(178).logicalSrcIdx = 177;
                    section.data(178).dtTransOffset = 240;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_Size_j
                    section.data(179).logicalSrcIdx = 178;
                    section.data(179).dtTransOffset = 241;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_f
                    section.data(180).logicalSrcIdx = 179;
                    section.data(180).dtTransOffset = 243;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_Size_mb
                    section.data(181).logicalSrcIdx = 180;
                    section.data(181).dtTransOffset = 244;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_do
                    section.data(182).logicalSrcIdx = 181;
                    section.data(182).dtTransOffset = 246;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_Size_i
                    section.data(183).logicalSrcIdx = 182;
                    section.data(183).dtTransOffset = 247;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_nr
                    section.data(184).logicalSrcIdx = 183;
                    section.data(184).dtTransOffset = 249;

                    ;% robotarm_student_2021a_Ebox_P.Gain1_Gain_d
                    section.data(185).logicalSrcIdx = 184;
                    section.data(185).dtTransOffset = 250;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_Size_b
                    section.data(186).logicalSrcIdx = 185;
                    section.data(186).dtTransOffset = 251;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_j
                    section.data(187).logicalSrcIdx = 186;
                    section.data(187).dtTransOffset = 253;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_Size_o
                    section.data(188).logicalSrcIdx = 187;
                    section.data(188).dtTransOffset = 254;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_b
                    section.data(189).logicalSrcIdx = 188;
                    section.data(189).dtTransOffset = 256;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_Size_a
                    section.data(190).logicalSrcIdx = 189;
                    section.data(190).dtTransOffset = 257;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_g
                    section.data(191).logicalSrcIdx = 190;
                    section.data(191).dtTransOffset = 259;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_Size_i
                    section.data(192).logicalSrcIdx = 191;
                    section.data(192).dtTransOffset = 260;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_db
                    section.data(193).logicalSrcIdx = 192;
                    section.data(193).dtTransOffset = 262;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_Size_j
                    section.data(194).logicalSrcIdx = 193;
                    section.data(194).dtTransOffset = 263;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_ns
                    section.data(195).logicalSrcIdx = 194;
                    section.data(195).dtTransOffset = 265;

                    ;% robotarm_student_2021a_Ebox_P.Saturation_UpperSat_k
                    section.data(196).logicalSrcIdx = 195;
                    section.data(196).dtTransOffset = 266;

                    ;% robotarm_student_2021a_Ebox_P.Saturation_LowerSat_i
                    section.data(197).logicalSrcIdx = 196;
                    section.data(197).dtTransOffset = 267;

                    ;% robotarm_student_2021a_Ebox_P.Saturation_UpperSat_j
                    section.data(198).logicalSrcIdx = 197;
                    section.data(198).dtTransOffset = 268;

                    ;% robotarm_student_2021a_Ebox_P.Saturation_LowerSat_f
                    section.data(199).logicalSrcIdx = 198;
                    section.data(199).dtTransOffset = 269;

                    ;% robotarm_student_2021a_Ebox_P.Gain_Gain_d
                    section.data(200).logicalSrcIdx = 199;
                    section.data(200).dtTransOffset = 270;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator_P1_Size_j
                    section.data(201).logicalSrcIdx = 200;
                    section.data(201).dtTransOffset = 271;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator_P1_d
                    section.data(202).logicalSrcIdx = 201;
                    section.data(202).dtTransOffset = 273;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator_P2_Size_n
                    section.data(203).logicalSrcIdx = 202;
                    section.data(203).dtTransOffset = 274;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator_P2_f
                    section.data(204).logicalSrcIdx = 203;
                    section.data(204).dtTransOffset = 276;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_Size_o
                    section.data(205).logicalSrcIdx = 204;
                    section.data(205).dtTransOffset = 277;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_g
                    section.data(206).logicalSrcIdx = 205;
                    section.data(206).dtTransOffset = 279;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_Size_o4
                    section.data(207).logicalSrcIdx = 206;
                    section.data(207).dtTransOffset = 280;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_e
                    section.data(208).logicalSrcIdx = 207;
                    section.data(208).dtTransOffset = 282;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_Size_l
                    section.data(209).logicalSrcIdx = 208;
                    section.data(209).dtTransOffset = 283;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_mc
                    section.data(210).logicalSrcIdx = 209;
                    section.data(210).dtTransOffset = 285;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_Size_g
                    section.data(211).logicalSrcIdx = 210;
                    section.data(211).dtTransOffset = 286;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_a
                    section.data(212).logicalSrcIdx = 211;
                    section.data(212).dtTransOffset = 288;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_Size_p
                    section.data(213).logicalSrcIdx = 212;
                    section.data(213).dtTransOffset = 289;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_o
                    section.data(214).logicalSrcIdx = 213;
                    section.data(214).dtTransOffset = 291;

                    ;% robotarm_student_2021a_Ebox_P.Gain_Gain_pq
                    section.data(215).logicalSrcIdx = 214;
                    section.data(215).dtTransOffset = 292;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_Size_f
                    section.data(216).logicalSrcIdx = 215;
                    section.data(216).dtTransOffset = 293;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_hw
                    section.data(217).logicalSrcIdx = 216;
                    section.data(217).dtTransOffset = 295;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_Size_dd
                    section.data(218).logicalSrcIdx = 217;
                    section.data(218).dtTransOffset = 296;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_l
                    section.data(219).logicalSrcIdx = 218;
                    section.data(219).dtTransOffset = 298;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_Size_p
                    section.data(220).logicalSrcIdx = 219;
                    section.data(220).dtTransOffset = 299;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_l
                    section.data(221).logicalSrcIdx = 220;
                    section.data(221).dtTransOffset = 301;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_Size_d
                    section.data(222).logicalSrcIdx = 221;
                    section.data(222).dtTransOffset = 302;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_g
                    section.data(223).logicalSrcIdx = 222;
                    section.data(223).dtTransOffset = 304;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_Size_k
                    section.data(224).logicalSrcIdx = 223;
                    section.data(224).dtTransOffset = 305;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_f
                    section.data(225).logicalSrcIdx = 224;
                    section.data(225).dtTransOffset = 307;

                    ;% robotarm_student_2021a_Ebox_P.DiscreteTimeIntegrator_gainva_c
                    section.data(226).logicalSrcIdx = 225;
                    section.data(226).dtTransOffset = 308;

                    ;% robotarm_student_2021a_Ebox_P.DiscreteTimeIntegrator_IC_f
                    section.data(227).logicalSrcIdx = 226;
                    section.data(227).dtTransOffset = 309;

                    ;% robotarm_student_2021a_Ebox_P.Gain1_Gain_pj
                    section.data(228).logicalSrcIdx = 227;
                    section.data(228).dtTransOffset = 310;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator3_P1_Size_e
                    section.data(229).logicalSrcIdx = 228;
                    section.data(229).dtTransOffset = 311;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator3_P1_e
                    section.data(230).logicalSrcIdx = 229;
                    section.data(230).dtTransOffset = 313;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator3_P2_Size_i
                    section.data(231).logicalSrcIdx = 230;
                    section.data(231).dtTransOffset = 314;

                    ;% robotarm_student_2021a_Ebox_P.Dctintegrator3_P2_a
                    section.data(232).logicalSrcIdx = 231;
                    section.data(232).dtTransOffset = 316;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_Size_ph
                    section.data(233).logicalSrcIdx = 232;
                    section.data(233).dtTransOffset = 317;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P1_j
                    section.data(234).logicalSrcIdx = 233;
                    section.data(234).dtTransOffset = 319;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_Size_p0
                    section.data(235).logicalSrcIdx = 234;
                    section.data(235).dtTransOffset = 320;

                    ;% robotarm_student_2021a_Ebox_P.Dct1lowpass_P2_p
                    section.data(236).logicalSrcIdx = 235;
                    section.data(236).dtTransOffset = 322;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_Size_pu
                    section.data(237).logicalSrcIdx = 236;
                    section.data(237).dtTransOffset = 323;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P1_je
                    section.data(238).logicalSrcIdx = 237;
                    section.data(238).dtTransOffset = 325;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_Size_n
                    section.data(239).logicalSrcIdx = 238;
                    section.data(239).dtTransOffset = 326;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P2_m
                    section.data(240).logicalSrcIdx = 239;
                    section.data(240).dtTransOffset = 328;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_Size_f
                    section.data(241).logicalSrcIdx = 240;
                    section.data(241).dtTransOffset = 329;

                    ;% robotarm_student_2021a_Ebox_P.Dctleadlag_P3_i
                    section.data(242).logicalSrcIdx = 241;
                    section.data(242).dtTransOffset = 331;

                    ;% robotarm_student_2021a_Ebox_P.HomingRunningSwitch_Threshold_c
                    section.data(243).logicalSrcIdx = 242;
                    section.data(243).dtTransOffset = 332;

                    ;% robotarm_student_2021a_Ebox_P.Gain4_Gain
                    section.data(244).logicalSrcIdx = 243;
                    section.data(244).dtTransOffset = 333;

                    ;% robotarm_student_2021a_Ebox_P.Saturation1_UpperSat
                    section.data(245).logicalSrcIdx = 244;
                    section.data(245).dtTransOffset = 334;

                    ;% robotarm_student_2021a_Ebox_P.Saturation1_LowerSat
                    section.data(246).logicalSrcIdx = 245;
                    section.data(246).dtTransOffset = 335;

                    ;% robotarm_student_2021a_Ebox_P.Saturation_UpperSat_e
                    section.data(247).logicalSrcIdx = 246;
                    section.data(247).dtTransOffset = 336;

                    ;% robotarm_student_2021a_Ebox_P.Saturation_LowerSat_o
                    section.data(248).logicalSrcIdx = 247;
                    section.data(248).dtTransOffset = 337;

                    ;% robotarm_student_2021a_Ebox_P.UnitDelay1_InitialCondition
                    section.data(249).logicalSrcIdx = 248;
                    section.data(249).dtTransOffset = 338;

                    ;% robotarm_student_2021a_Ebox_P.HomingRunningSwitch_Threshold_f
                    section.data(250).logicalSrcIdx = 249;
                    section.data(250).dtTransOffset = 339;

                    ;% robotarm_student_2021a_Ebox_P.LimitSpeed_RisingLim
                    section.data(251).logicalSrcIdx = 250;
                    section.data(251).dtTransOffset = 340;

                    ;% robotarm_student_2021a_Ebox_P.LimitSpeed_FallingLim
                    section.data(252).logicalSrcIdx = 251;
                    section.data(252).dtTransOffset = 341;

                    ;% robotarm_student_2021a_Ebox_P.LimitSpeed_IC
                    section.data(253).logicalSrcIdx = 252;
                    section.data(253).dtTransOffset = 342;

                    ;% robotarm_student_2021a_Ebox_P.TSamp_WtEt
                    section.data(254).logicalSrcIdx = 253;
                    section.data(254).dtTransOffset = 343;

                    ;% robotarm_student_2021a_Ebox_P.LimitAcceleration_RisingLim
                    section.data(255).logicalSrcIdx = 254;
                    section.data(255).dtTransOffset = 344;

                    ;% robotarm_student_2021a_Ebox_P.LimitAcceleration_FallingLim
                    section.data(256).logicalSrcIdx = 255;
                    section.data(256).dtTransOffset = 345;

                    ;% robotarm_student_2021a_Ebox_P.LimitAcceleration_IC
                    section.data(257).logicalSrcIdx = 256;
                    section.data(257).dtTransOffset = 346;

                    ;% robotarm_student_2021a_Ebox_P.LimitSpeed_RisingLim_d
                    section.data(258).logicalSrcIdx = 257;
                    section.data(258).dtTransOffset = 347;

                    ;% robotarm_student_2021a_Ebox_P.LimitSpeed_FallingLim_j
                    section.data(259).logicalSrcIdx = 258;
                    section.data(259).dtTransOffset = 348;

                    ;% robotarm_student_2021a_Ebox_P.LimitSpeed_IC_g
                    section.data(260).logicalSrcIdx = 259;
                    section.data(260).dtTransOffset = 349;

                    ;% robotarm_student_2021a_Ebox_P.TSamp_WtEt_h
                    section.data(261).logicalSrcIdx = 260;
                    section.data(261).dtTransOffset = 350;

                    ;% robotarm_student_2021a_Ebox_P.LimitAcceleration_RisingLim_c
                    section.data(262).logicalSrcIdx = 261;
                    section.data(262).dtTransOffset = 351;

                    ;% robotarm_student_2021a_Ebox_P.LimitAcceleration_FallingLim_m
                    section.data(263).logicalSrcIdx = 262;
                    section.data(263).dtTransOffset = 352;

                    ;% robotarm_student_2021a_Ebox_P.LimitAcceleration_IC_f
                    section.data(264).logicalSrcIdx = 263;
                    section.data(264).dtTransOffset = 353;

                    ;% robotarm_student_2021a_Ebox_P.LimitSpeed_RisingLim_m
                    section.data(265).logicalSrcIdx = 264;
                    section.data(265).dtTransOffset = 354;

                    ;% robotarm_student_2021a_Ebox_P.LimitSpeed_FallingLim_jk
                    section.data(266).logicalSrcIdx = 265;
                    section.data(266).dtTransOffset = 355;

                    ;% robotarm_student_2021a_Ebox_P.LimitSpeed_IC_h
                    section.data(267).logicalSrcIdx = 266;
                    section.data(267).dtTransOffset = 356;

                    ;% robotarm_student_2021a_Ebox_P.TSamp_WtEt_a
                    section.data(268).logicalSrcIdx = 267;
                    section.data(268).dtTransOffset = 357;

                    ;% robotarm_student_2021a_Ebox_P.LimitAcceleration_RisingLim_a
                    section.data(269).logicalSrcIdx = 268;
                    section.data(269).dtTransOffset = 358;

                    ;% robotarm_student_2021a_Ebox_P.LimitAcceleration_FallingLim_o
                    section.data(270).logicalSrcIdx = 269;
                    section.data(270).dtTransOffset = 359;

                    ;% robotarm_student_2021a_Ebox_P.LimitAcceleration_IC_a
                    section.data(271).logicalSrcIdx = 270;
                    section.data(271).dtTransOffset = 360;

                    ;% robotarm_student_2021a_Ebox_P.ResetEncoderR_P1_Size
                    section.data(272).logicalSrcIdx = 271;
                    section.data(272).dtTransOffset = 361;

                    ;% robotarm_student_2021a_Ebox_P.ResetEncoderR_P1
                    section.data(273).logicalSrcIdx = 272;
                    section.data(273).dtTransOffset = 363;

                    ;% robotarm_student_2021a_Ebox_P.ResetEncoderR_P2_Size
                    section.data(274).logicalSrcIdx = 273;
                    section.data(274).dtTransOffset = 364;

                    ;% robotarm_student_2021a_Ebox_P.ResetEncoderR_P2
                    section.data(275).logicalSrcIdx = 274;
                    section.data(275).dtTransOffset = 366;

                    ;% robotarm_student_2021a_Ebox_P.ResetEncoderX_P1_Size
                    section.data(276).logicalSrcIdx = 275;
                    section.data(276).dtTransOffset = 367;

                    ;% robotarm_student_2021a_Ebox_P.ResetEncoderX_P1
                    section.data(277).logicalSrcIdx = 276;
                    section.data(277).dtTransOffset = 369;

                    ;% robotarm_student_2021a_Ebox_P.ResetEncoderX_P2_Size
                    section.data(278).logicalSrcIdx = 277;
                    section.data(278).dtTransOffset = 370;

                    ;% robotarm_student_2021a_Ebox_P.ResetEncoderX_P2
                    section.data(279).logicalSrcIdx = 278;
                    section.data(279).dtTransOffset = 372;

                    ;% robotarm_student_2021a_Ebox_P.ResetEncoderX_P1_Size_k
                    section.data(280).logicalSrcIdx = 279;
                    section.data(280).dtTransOffset = 373;

                    ;% robotarm_student_2021a_Ebox_P.ResetEncoderX_P1_j
                    section.data(281).logicalSrcIdx = 280;
                    section.data(281).dtTransOffset = 375;

                    ;% robotarm_student_2021a_Ebox_P.ResetEncoderX_P2_Size_k
                    section.data(282).logicalSrcIdx = 281;
                    section.data(282).dtTransOffset = 376;

                    ;% robotarm_student_2021a_Ebox_P.ResetEncoderX_P2_j
                    section.data(283).logicalSrcIdx = 282;
                    section.data(283).dtTransOffset = 378;

                    ;% robotarm_student_2021a_Ebox_P.ResetEncoderConv_P1_Size
                    section.data(284).logicalSrcIdx = 283;
                    section.data(284).dtTransOffset = 379;

                    ;% robotarm_student_2021a_Ebox_P.ResetEncoderConv_P1
                    section.data(285).logicalSrcIdx = 284;
                    section.data(285).dtTransOffset = 381;

                    ;% robotarm_student_2021a_Ebox_P.ResetEncoderConv_P2_Size
                    section.data(286).logicalSrcIdx = 285;
                    section.data(286).dtTransOffset = 382;

                    ;% robotarm_student_2021a_Ebox_P.ResetEncoderConv_P2
                    section.data(287).logicalSrcIdx = 286;
                    section.data(287).dtTransOffset = 384;

                    ;% robotarm_student_2021a_Ebox_P.Gain_Gain_jz
                    section.data(288).logicalSrcIdx = 287;
                    section.data(288).dtTransOffset = 385;

                    ;% robotarm_student_2021a_Ebox_P.Gain_Gain_ll
                    section.data(289).logicalSrcIdx = 288;
                    section.data(289).dtTransOffset = 386;

                    ;% robotarm_student_2021a_Ebox_P.Gain_Gain_n
                    section.data(290).logicalSrcIdx = 289;
                    section.data(290).dtTransOffset = 387;

            nTotData = nTotData + section.nData;
            paramMap.sections(1) = section;
            clear section

            section.nData     = 10;
            section.data(10)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_P.LEDRing_Y0
                    section.data(1).logicalSrcIdx = 290;
                    section.data(1).dtTransOffset = 0;

                    ;% robotarm_student_2021a_Ebox_P.Colorsetwithstringblackorwhite_
                    section.data(2).logicalSrcIdx = 291;
                    section.data(2).dtTransOffset = 1;

                    ;% robotarm_student_2021a_Ebox_P.Colorspecifiedin6hexdigitsrrggb
                    section.data(3).logicalSrcIdx = 292;
                    section.data(3).dtTransOffset = 2;

                    ;% robotarm_student_2021a_Ebox_P.StringConstant3_String
                    section.data(4).logicalSrcIdx = 293;
                    section.data(4).dtTransOffset = 3;

                    ;% robotarm_student_2021a_Ebox_P.StringConstant4_String
                    section.data(5).logicalSrcIdx = 294;
                    section.data(5).dtTransOffset = 4;

                    ;% robotarm_student_2021a_Ebox_P.StringConstant1_String
                    section.data(6).logicalSrcIdx = 295;
                    section.data(6).dtTransOffset = 5;

                    ;% robotarm_student_2021a_Ebox_P.ReadyGreen_String
                    section.data(7).logicalSrcIdx = 296;
                    section.data(7).dtTransOffset = 6;

                    ;% robotarm_student_2021a_Ebox_P.AirbagRed_String
                    section.data(8).logicalSrcIdx = 297;
                    section.data(8).dtTransOffset = 7;

                    ;% robotarm_student_2021a_Ebox_P.HomingOrange_String
                    section.data(9).logicalSrcIdx = 298;
                    section.data(9).dtTransOffset = 8;

                    ;% robotarm_student_2021a_Ebox_P.Delay_InitialCondition
                    section.data(10).logicalSrcIdx = 299;
                    section.data(10).dtTransOffset = 9;

            nTotData = nTotData + section.nData;
            paramMap.sections(2) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_P.ManualSwitch_CurrentSetting
                    section.data(1).logicalSrcIdx = 300;
                    section.data(1).dtTransOffset = 0;

                    ;% robotarm_student_2021a_Ebox_P.ManualSwitch1_CurrentSetting
                    section.data(2).logicalSrcIdx = 301;
                    section.data(2).dtTransOffset = 1;

                    ;% robotarm_student_2021a_Ebox_P.Constant1_Value_b
                    section.data(3).logicalSrcIdx = 302;
                    section.data(3).dtTransOffset = 2;

                    ;% robotarm_student_2021a_Ebox_P.Constant_Value_c
                    section.data(4).logicalSrcIdx = 303;
                    section.data(4).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            paramMap.sections(3) = section;
            clear section


            ;%
            ;% Non-auto Data (parameter)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        paramMap.nTotData = nTotData;



    ;%**************************
    ;% Create Block Output Map *
    ;%**************************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 4;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc sigMap
        ;%
        sigMap.nSections           = nTotSects;
        sigMap.sectIdxOffset       = sectIdxOffset;
            sigMap.sections(nTotSects) = dumSection; %prealloc
        sigMap.nTotData            = -1;

        ;%
        ;% Auto data (robotarm_student_2021a_Ebox_B)
        ;%
            section.nData     = 8;
            section.data(8)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_B.ec_Ebox_o2
                    section.data(1).logicalSrcIdx = 3;
                    section.data(1).dtTransOffset = 0;

                    ;% robotarm_student_2021a_Ebox_B.ec_Ebox_o3
                    section.data(2).logicalSrcIdx = 4;
                    section.data(2).dtTransOffset = 2;

                    ;% robotarm_student_2021a_Ebox_B.ec_Ebox_o1_h
                    section.data(3).logicalSrcIdx = 5;
                    section.data(3).dtTransOffset = 10;

                    ;% robotarm_student_2021a_Ebox_B.ec_Ebox_o2_o
                    section.data(4).logicalSrcIdx = 6;
                    section.data(4).dtTransOffset = 12;

                    ;% robotarm_student_2021a_Ebox_B.ec_Ebox_o3_p
                    section.data(5).logicalSrcIdx = 7;
                    section.data(5).dtTransOffset = 14;

                    ;% robotarm_student_2021a_Ebox_B.ec_Ebox_o1_o
                    section.data(6).logicalSrcIdx = 8;
                    section.data(6).dtTransOffset = 22;

                    ;% robotarm_student_2021a_Ebox_B.ec_Ebox_o2_p
                    section.data(7).logicalSrcIdx = 9;
                    section.data(7).dtTransOffset = 24;

                    ;% robotarm_student_2021a_Ebox_B.ec_Ebox_o3_j
                    section.data(8).logicalSrcIdx = 10;
                    section.data(8).dtTransOffset = 26;

            nTotData = nTotData + section.nData;
            sigMap.sections(1) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_B.ManualSwitch1
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(2) = section;
            clear section

            section.nData     = 119;
            section.data(119)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_B.SFunction
                    section.data(1).logicalSrcIdx = 1;
                    section.data(1).dtTransOffset = 0;

                    ;% robotarm_student_2021a_Ebox_B.ec_Ebox_o1
                    section.data(2).logicalSrcIdx = 2;
                    section.data(2).dtTransOffset = 1;

                    ;% robotarm_student_2021a_Ebox_B.Gain
                    section.data(3).logicalSrcIdx = 11;
                    section.data(3).dtTransOffset = 3;

                    ;% robotarm_student_2021a_Ebox_B.Gain1
                    section.data(4).logicalSrcIdx = 12;
                    section.data(4).dtTransOffset = 4;

                    ;% robotarm_student_2021a_Ebox_B.Gain2
                    section.data(5).logicalSrcIdx = 13;
                    section.data(5).dtTransOffset = 5;

                    ;% robotarm_student_2021a_Ebox_B.Gain5
                    section.data(6).logicalSrcIdx = 14;
                    section.data(6).dtTransOffset = 6;

                    ;% robotarm_student_2021a_Ebox_B.HomingRunningSwitch
                    section.data(7).logicalSrcIdx = 15;
                    section.data(7).dtTransOffset = 9;

                    ;% robotarm_student_2021a_Ebox_B.Gain3
                    section.data(8).logicalSrcIdx = 16;
                    section.data(8).dtTransOffset = 12;

                    ;% robotarm_student_2021a_Ebox_B.Gain6
                    section.data(9).logicalSrcIdx = 17;
                    section.data(9).dtTransOffset = 13;

                    ;% robotarm_student_2021a_Ebox_B.Constant1
                    section.data(10).logicalSrcIdx = 18;
                    section.data(10).dtTransOffset = 14;

                    ;% robotarm_student_2021a_Ebox_B.Sum
                    section.data(11).logicalSrcIdx = 19;
                    section.data(11).dtTransOffset = 15;

                    ;% robotarm_student_2021a_Ebox_B.set_robot_calibration_r
                    section.data(12).logicalSrcIdx = 20;
                    section.data(12).dtTransOffset = 16;

                    ;% robotarm_student_2021a_Ebox_B.Constant1_c
                    section.data(13).logicalSrcIdx = 21;
                    section.data(13).dtTransOffset = 17;

                    ;% robotarm_student_2021a_Ebox_B.Sum_a
                    section.data(14).logicalSrcIdx = 22;
                    section.data(14).dtTransOffset = 18;

                    ;% robotarm_student_2021a_Ebox_B.set_robot_calibration_x
                    section.data(15).logicalSrcIdx = 23;
                    section.data(15).dtTransOffset = 19;

                    ;% robotarm_student_2021a_Ebox_B.Constant1_k
                    section.data(16).logicalSrcIdx = 24;
                    section.data(16).dtTransOffset = 20;

                    ;% robotarm_student_2021a_Ebox_B.Sum_g
                    section.data(17).logicalSrcIdx = 25;
                    section.data(17).dtTransOffset = 21;

                    ;% robotarm_student_2021a_Ebox_B.set_robot_calibration_z
                    section.data(18).logicalSrcIdx = 26;
                    section.data(18).dtTransOffset = 22;

                    ;% robotarm_student_2021a_Ebox_B.Add1
                    section.data(19).logicalSrcIdx = 27;
                    section.data(19).dtTransOffset = 23;

                    ;% robotarm_student_2021a_Ebox_B.Assignment
                    section.data(20).logicalSrcIdx = 28;
                    section.data(20).dtTransOffset = 24;

                    ;% robotarm_student_2021a_Ebox_B.Saturation
                    section.data(21).logicalSrcIdx = 29;
                    section.data(21).dtTransOffset = 32;

                    ;% robotarm_student_2021a_Ebox_B.Gain_c
                    section.data(22).logicalSrcIdx = 30;
                    section.data(22).dtTransOffset = 34;

                    ;% robotarm_student_2021a_Ebox_B.Dctintegrator
                    section.data(23).logicalSrcIdx = 31;
                    section.data(23).dtTransOffset = 35;

                    ;% robotarm_student_2021a_Ebox_B.Dctleadlag
                    section.data(24).logicalSrcIdx = 32;
                    section.data(24).dtTransOffset = 36;

                    ;% robotarm_student_2021a_Ebox_B.Dct1lowpass
                    section.data(25).logicalSrcIdx = 33;
                    section.data(25).dtTransOffset = 37;

                    ;% robotarm_student_2021a_Ebox_B.Gain_f
                    section.data(26).logicalSrcIdx = 34;
                    section.data(26).dtTransOffset = 38;

                    ;% robotarm_student_2021a_Ebox_B.Dctleadlag_j
                    section.data(27).logicalSrcIdx = 35;
                    section.data(27).dtTransOffset = 39;

                    ;% robotarm_student_2021a_Ebox_B.Dct1lowpass_n
                    section.data(28).logicalSrcIdx = 36;
                    section.data(28).dtTransOffset = 40;

                    ;% robotarm_student_2021a_Ebox_B.Gain1_n
                    section.data(29).logicalSrcIdx = 37;
                    section.data(29).dtTransOffset = 41;

                    ;% robotarm_student_2021a_Ebox_B.Dctintegrator_i
                    section.data(30).logicalSrcIdx = 38;
                    section.data(30).dtTransOffset = 42;

                    ;% robotarm_student_2021a_Ebox_B.Dctleadlag_n
                    section.data(31).logicalSrcIdx = 39;
                    section.data(31).dtTransOffset = 43;

                    ;% robotarm_student_2021a_Ebox_B.Dct1lowpass_f
                    section.data(32).logicalSrcIdx = 40;
                    section.data(32).dtTransOffset = 44;

                    ;% robotarm_student_2021a_Ebox_B.Gain1_p
                    section.data(33).logicalSrcIdx = 41;
                    section.data(33).dtTransOffset = 45;

                    ;% robotarm_student_2021a_Ebox_B.Dctleadlag_e
                    section.data(34).logicalSrcIdx = 42;
                    section.data(34).dtTransOffset = 46;

                    ;% robotarm_student_2021a_Ebox_B.Dct1lowpass_o
                    section.data(35).logicalSrcIdx = 43;
                    section.data(35).dtTransOffset = 47;

                    ;% robotarm_student_2021a_Ebox_B.Saturation_p
                    section.data(36).logicalSrcIdx = 44;
                    section.data(36).dtTransOffset = 48;

                    ;% robotarm_student_2021a_Ebox_B.Gain_e
                    section.data(37).logicalSrcIdx = 45;
                    section.data(37).dtTransOffset = 50;

                    ;% robotarm_student_2021a_Ebox_B.Dctintegrator_g
                    section.data(38).logicalSrcIdx = 46;
                    section.data(38).dtTransOffset = 51;

                    ;% robotarm_student_2021a_Ebox_B.Dctleadlag_eg
                    section.data(39).logicalSrcIdx = 47;
                    section.data(39).dtTransOffset = 52;

                    ;% robotarm_student_2021a_Ebox_B.Dct1lowpass_ft
                    section.data(40).logicalSrcIdx = 48;
                    section.data(40).dtTransOffset = 53;

                    ;% robotarm_student_2021a_Ebox_B.Gain_i
                    section.data(41).logicalSrcIdx = 49;
                    section.data(41).dtTransOffset = 54;

                    ;% robotarm_student_2021a_Ebox_B.Dctleadlag_i
                    section.data(42).logicalSrcIdx = 50;
                    section.data(42).dtTransOffset = 55;

                    ;% robotarm_student_2021a_Ebox_B.Dct1lowpass_a
                    section.data(43).logicalSrcIdx = 51;
                    section.data(43).dtTransOffset = 56;

                    ;% robotarm_student_2021a_Ebox_B.Gain1_nc
                    section.data(44).logicalSrcIdx = 52;
                    section.data(44).dtTransOffset = 57;

                    ;% robotarm_student_2021a_Ebox_B.Dctintegrator3
                    section.data(45).logicalSrcIdx = 53;
                    section.data(45).dtTransOffset = 58;

                    ;% robotarm_student_2021a_Ebox_B.Dct1lowpass_p
                    section.data(46).logicalSrcIdx = 54;
                    section.data(46).dtTransOffset = 59;

                    ;% robotarm_student_2021a_Ebox_B.Dctleadlag_f
                    section.data(47).logicalSrcIdx = 55;
                    section.data(47).dtTransOffset = 60;

                    ;% robotarm_student_2021a_Ebox_B.Saturation_f
                    section.data(48).logicalSrcIdx = 56;
                    section.data(48).dtTransOffset = 61;

                    ;% robotarm_student_2021a_Ebox_B.Gain_ct
                    section.data(49).logicalSrcIdx = 57;
                    section.data(49).dtTransOffset = 63;

                    ;% robotarm_student_2021a_Ebox_B.Gain_j
                    section.data(50).logicalSrcIdx = 58;
                    section.data(50).dtTransOffset = 65;

                    ;% robotarm_student_2021a_Ebox_B.Gain_n
                    section.data(51).logicalSrcIdx = 59;
                    section.data(51).dtTransOffset = 67;

                    ;% robotarm_student_2021a_Ebox_B.jogSpeed
                    section.data(52).logicalSrcIdx = 60;
                    section.data(52).dtTransOffset = 69;

                    ;% robotarm_student_2021a_Ebox_B.homeControllerEnabled
                    section.data(53).logicalSrcIdx = 61;
                    section.data(53).dtTransOffset = 70;

                    ;% robotarm_student_2021a_Ebox_B.resetEnc
                    section.data(54).logicalSrcIdx = 62;
                    section.data(54).dtTransOffset = 71;

                    ;% robotarm_student_2021a_Ebox_B.homingBusy
                    section.data(55).logicalSrcIdx = 63;
                    section.data(55).dtTransOffset = 72;

                    ;% robotarm_student_2021a_Ebox_B.Ready
                    section.data(56).logicalSrcIdx = 64;
                    section.data(56).dtTransOffset = 73;

                    ;% robotarm_student_2021a_Ebox_B.StopSim
                    section.data(57).logicalSrcIdx = 65;
                    section.data(57).dtTransOffset = 74;

                    ;% robotarm_student_2021a_Ebox_B.jogSpeed_f
                    section.data(58).logicalSrcIdx = 66;
                    section.data(58).dtTransOffset = 75;

                    ;% robotarm_student_2021a_Ebox_B.toPoint
                    section.data(59).logicalSrcIdx = 67;
                    section.data(59).dtTransOffset = 76;

                    ;% robotarm_student_2021a_Ebox_B.homeControllerEnabled_l
                    section.data(60).logicalSrcIdx = 68;
                    section.data(60).dtTransOffset = 77;

                    ;% robotarm_student_2021a_Ebox_B.resetEnc_o
                    section.data(61).logicalSrcIdx = 69;
                    section.data(61).dtTransOffset = 78;

                    ;% robotarm_student_2021a_Ebox_B.homingBusy_i
                    section.data(62).logicalSrcIdx = 70;
                    section.data(62).dtTransOffset = 79;

                    ;% robotarm_student_2021a_Ebox_B.airBagEnabled
                    section.data(63).logicalSrcIdx = 71;
                    section.data(63).dtTransOffset = 80;

                    ;% robotarm_student_2021a_Ebox_B.airBagRef
                    section.data(64).logicalSrcIdx = 72;
                    section.data(64).dtTransOffset = 81;

                    ;% robotarm_student_2021a_Ebox_B.controlEnabled
                    section.data(65).logicalSrcIdx = 73;
                    section.data(65).dtTransOffset = 82;

                    ;% robotarm_student_2021a_Ebox_B.Ready_e
                    section.data(66).logicalSrcIdx = 74;
                    section.data(66).dtTransOffset = 83;

                    ;% robotarm_student_2021a_Ebox_B.StopSim_e
                    section.data(67).logicalSrcIdx = 75;
                    section.data(67).dtTransOffset = 84;

                    ;% robotarm_student_2021a_Ebox_B.y
                    section.data(68).logicalSrcIdx = 76;
                    section.data(68).dtTransOffset = 85;

                    ;% robotarm_student_2021a_Ebox_B.jogSpeed_a
                    section.data(69).logicalSrcIdx = 77;
                    section.data(69).dtTransOffset = 86;

                    ;% robotarm_student_2021a_Ebox_B.toPoint_a
                    section.data(70).logicalSrcIdx = 78;
                    section.data(70).dtTransOffset = 87;

                    ;% robotarm_student_2021a_Ebox_B.homeControllerEnabled_j
                    section.data(71).logicalSrcIdx = 79;
                    section.data(71).dtTransOffset = 88;

                    ;% robotarm_student_2021a_Ebox_B.resetEnc_c
                    section.data(72).logicalSrcIdx = 80;
                    section.data(72).dtTransOffset = 89;

                    ;% robotarm_student_2021a_Ebox_B.homingBusy_o
                    section.data(73).logicalSrcIdx = 81;
                    section.data(73).dtTransOffset = 90;

                    ;% robotarm_student_2021a_Ebox_B.airBagEnabled_c
                    section.data(74).logicalSrcIdx = 82;
                    section.data(74).dtTransOffset = 91;

                    ;% robotarm_student_2021a_Ebox_B.airBagRef_k
                    section.data(75).logicalSrcIdx = 83;
                    section.data(75).dtTransOffset = 92;

                    ;% robotarm_student_2021a_Ebox_B.controlEnabled_h
                    section.data(76).logicalSrcIdx = 84;
                    section.data(76).dtTransOffset = 93;

                    ;% robotarm_student_2021a_Ebox_B.Ready_j
                    section.data(77).logicalSrcIdx = 85;
                    section.data(77).dtTransOffset = 94;

                    ;% robotarm_student_2021a_Ebox_B.StopSim_l
                    section.data(78).logicalSrcIdx = 86;
                    section.data(78).dtTransOffset = 95;

                    ;% robotarm_student_2021a_Ebox_B.jogSpeed_b
                    section.data(79).logicalSrcIdx = 87;
                    section.data(79).dtTransOffset = 96;

                    ;% robotarm_student_2021a_Ebox_B.toPoint_o
                    section.data(80).logicalSrcIdx = 88;
                    section.data(80).dtTransOffset = 97;

                    ;% robotarm_student_2021a_Ebox_B.homeControllerEnabled_n
                    section.data(81).logicalSrcIdx = 89;
                    section.data(81).dtTransOffset = 98;

                    ;% robotarm_student_2021a_Ebox_B.resetEnc_k
                    section.data(82).logicalSrcIdx = 90;
                    section.data(82).dtTransOffset = 99;

                    ;% robotarm_student_2021a_Ebox_B.homingBusy_m
                    section.data(83).logicalSrcIdx = 91;
                    section.data(83).dtTransOffset = 100;

                    ;% robotarm_student_2021a_Ebox_B.airBagEnabled_m
                    section.data(84).logicalSrcIdx = 92;
                    section.data(84).dtTransOffset = 101;

                    ;% robotarm_student_2021a_Ebox_B.airBagRef_i
                    section.data(85).logicalSrcIdx = 93;
                    section.data(85).dtTransOffset = 102;

                    ;% robotarm_student_2021a_Ebox_B.controlEnabled_c
                    section.data(86).logicalSrcIdx = 94;
                    section.data(86).dtTransOffset = 103;

                    ;% robotarm_student_2021a_Ebox_B.Ready_d
                    section.data(87).logicalSrcIdx = 95;
                    section.data(87).dtTransOffset = 104;

                    ;% robotarm_student_2021a_Ebox_B.StopSim_g
                    section.data(88).logicalSrcIdx = 96;
                    section.data(88).dtTransOffset = 105;

                    ;% robotarm_student_2021a_Ebox_B.y_f
                    section.data(89).logicalSrcIdx = 97;
                    section.data(89).dtTransOffset = 106;

                    ;% robotarm_student_2021a_Ebox_B.Selector2
                    section.data(90).logicalSrcIdx = 98;
                    section.data(90).dtTransOffset = 107;

                    ;% robotarm_student_2021a_Ebox_B.Selector
                    section.data(91).logicalSrcIdx = 99;
                    section.data(91).dtTransOffset = 116;

                    ;% robotarm_student_2021a_Ebox_B.SignalConversion2
                    section.data(92).logicalSrcIdx = 100;
                    section.data(92).dtTransOffset = 119;

                    ;% robotarm_student_2021a_Ebox_B.Gain1_h
                    section.data(93).logicalSrcIdx = 101;
                    section.data(93).dtTransOffset = 120;

                    ;% robotarm_student_2021a_Ebox_B.Dctintegrator_j
                    section.data(94).logicalSrcIdx = 102;
                    section.data(94).dtTransOffset = 121;

                    ;% robotarm_student_2021a_Ebox_B.Dctleadlag_fi
                    section.data(95).logicalSrcIdx = 103;
                    section.data(95).dtTransOffset = 122;

                    ;% robotarm_student_2021a_Ebox_B.Dct1lowpass_az
                    section.data(96).logicalSrcIdx = 104;
                    section.data(96).dtTransOffset = 123;

                    ;% robotarm_student_2021a_Ebox_B.SignalConversion1
                    section.data(97).logicalSrcIdx = 105;
                    section.data(97).dtTransOffset = 124;

                    ;% robotarm_student_2021a_Ebox_B.Gain1_n5
                    section.data(98).logicalSrcIdx = 106;
                    section.data(98).dtTransOffset = 125;

                    ;% robotarm_student_2021a_Ebox_B.Dctleadlag_h
                    section.data(99).logicalSrcIdx = 107;
                    section.data(99).dtTransOffset = 126;

                    ;% robotarm_student_2021a_Ebox_B.Dct1lowpass_m
                    section.data(100).logicalSrcIdx = 108;
                    section.data(100).dtTransOffset = 127;

                    ;% robotarm_student_2021a_Ebox_B.SignalConversion
                    section.data(101).logicalSrcIdx = 109;
                    section.data(101).dtTransOffset = 128;

                    ;% robotarm_student_2021a_Ebox_B.Gain_d
                    section.data(102).logicalSrcIdx = 110;
                    section.data(102).dtTransOffset = 129;

                    ;% robotarm_student_2021a_Ebox_B.Dctleadlag_l
                    section.data(103).logicalSrcIdx = 111;
                    section.data(103).dtTransOffset = 130;

                    ;% robotarm_student_2021a_Ebox_B.Dct1lowpass_mi
                    section.data(104).logicalSrcIdx = 112;
                    section.data(104).dtTransOffset = 131;

                    ;% robotarm_student_2021a_Ebox_B.Gain1_g
                    section.data(105).logicalSrcIdx = 113;
                    section.data(105).dtTransOffset = 132;

                    ;% robotarm_student_2021a_Ebox_B.Dctintegrator3_n
                    section.data(106).logicalSrcIdx = 114;
                    section.data(106).dtTransOffset = 133;

                    ;% robotarm_student_2021a_Ebox_B.Dct1lowpass_ab
                    section.data(107).logicalSrcIdx = 115;
                    section.data(107).dtTransOffset = 134;

                    ;% robotarm_student_2021a_Ebox_B.Dctleadlag_d
                    section.data(108).logicalSrcIdx = 116;
                    section.data(108).dtTransOffset = 135;

                    ;% robotarm_student_2021a_Ebox_B.SFunctionBuilder
                    section.data(109).logicalSrcIdx = 117;
                    section.data(109).dtTransOffset = 136;

                    ;% robotarm_student_2021a_Ebox_B.Sum_m
                    section.data(110).logicalSrcIdx = 118;
                    section.data(110).dtTransOffset = 137;

                    ;% robotarm_student_2021a_Ebox_B.Sum6
                    section.data(111).logicalSrcIdx = 119;
                    section.data(111).dtTransOffset = 138;

                    ;% robotarm_student_2021a_Ebox_B.Sum5
                    section.data(112).logicalSrcIdx = 120;
                    section.data(112).dtTransOffset = 139;

                    ;% robotarm_student_2021a_Ebox_B.Sum4
                    section.data(113).logicalSrcIdx = 121;
                    section.data(113).dtTransOffset = 140;

                    ;% robotarm_student_2021a_Ebox_B.Gain1_o
                    section.data(114).logicalSrcIdx = 122;
                    section.data(114).dtTransOffset = 141;

                    ;% robotarm_student_2021a_Ebox_B.Doubleclickswitch
                    section.data(115).logicalSrcIdx = 123;
                    section.data(115).dtTransOffset = 142;

                    ;% robotarm_student_2021a_Ebox_B.Object
                    section.data(116).logicalSrcIdx = 124;
                    section.data(116).dtTransOffset = 143;

                    ;% robotarm_student_2021a_Ebox_B.Plot
                    section.data(117).logicalSrcIdx = 125;
                    section.data(117).dtTransOffset = 144;

                    ;% robotarm_student_2021a_Ebox_B.Stop
                    section.data(118).logicalSrcIdx = 126;
                    section.data(118).dtTransOffset = 145;

                    ;% robotarm_student_2021a_Ebox_B.In1
                    section.data(119).logicalSrcIdx = 133;
                    section.data(119).dtTransOffset = 146;

            nTotData = nTotData + section.nData;
            sigMap.sections(3) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_B.RelationalOperator
                    section.data(1).logicalSrcIdx = 134;
                    section.data(1).dtTransOffset = 0;

                    ;% robotarm_student_2021a_Ebox_B.Compare
                    section.data(2).logicalSrcIdx = 135;
                    section.data(2).dtTransOffset = 1;

                    ;% robotarm_student_2021a_Ebox_B.RelationalOperator_o
                    section.data(3).logicalSrcIdx = 136;
                    section.data(3).dtTransOffset = 2;

                    ;% robotarm_student_2021a_Ebox_B.RelationalOperator_n
                    section.data(4).logicalSrcIdx = 137;
                    section.data(4).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            sigMap.sections(4) = section;
            clear section


            ;%
            ;% Non-auto Data (signal)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        sigMap.nTotData = nTotData;



    ;%*******************
    ;% Create DWork Map *
    ;%*******************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 13;
        sectIdxOffset = 4;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc dworkMap
        ;%
        dworkMap.nSections           = nTotSects;
        dworkMap.sectIdxOffset       = sectIdxOffset;
            dworkMap.sections(nTotSects) = dumSection; %prealloc
        dworkMap.nTotData            = -1;

        ;%
        ;% Auto data (robotarm_student_2021a_Ebox_DW)
        ;%
            section.nData     = 14;
            section.data(14)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_DW.DiscreteTimeIntegrator_DSTATE
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% robotarm_student_2021a_Ebox_DW.DiscreteTimeIntegrator_DSTATE_n
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% robotarm_student_2021a_Ebox_DW.UnitDelay_DSTATE
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% robotarm_student_2021a_Ebox_DW.DiscreteTimeIntegrator_DSTATE_p
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 3;

                    ;% robotarm_student_2021a_Ebox_DW.DiscreteTimeIntegrator_DSTAT_pn
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 4;

                    ;% robotarm_student_2021a_Ebox_DW.DiscreteTimeIntegrator_DSTATE_c
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 5;

                    ;% robotarm_student_2021a_Ebox_DW.DiscreteTimeIntegrator_DSTATE_i
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 6;

                    ;% robotarm_student_2021a_Ebox_DW.DiscreteTimeIntegrator_DSTATE_k
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 7;

                    ;% robotarm_student_2021a_Ebox_DW.UnitDelay1_DSTATE
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 8;

                    ;% robotarm_student_2021a_Ebox_DW.UD_DSTATE
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 9;

                    ;% robotarm_student_2021a_Ebox_DW.UD_DSTATE_n
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 10;

                    ;% robotarm_student_2021a_Ebox_DW.UD_DSTATE_h
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 11;

                    ;% robotarm_student_2021a_Ebox_DW.DelayInput1_DSTATE
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 12;

                    ;% robotarm_student_2021a_Ebox_DW.Discreteintegrator_DSTATE
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 24;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_DW.Delay_DSTATE
                    section.data(1).logicalSrcIdx = 14;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 37;
            section.data(37)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_DW.PrevY
                    section.data(1).logicalSrcIdx = 15;
                    section.data(1).dtTransOffset = 0;

                    ;% robotarm_student_2021a_Ebox_DW.PrevY_m
                    section.data(2).logicalSrcIdx = 16;
                    section.data(2).dtTransOffset = 1;

                    ;% robotarm_student_2021a_Ebox_DW.PrevY_h
                    section.data(3).logicalSrcIdx = 17;
                    section.data(3).dtTransOffset = 2;

                    ;% robotarm_student_2021a_Ebox_DW.PrevY_mh
                    section.data(4).logicalSrcIdx = 18;
                    section.data(4).dtTransOffset = 3;

                    ;% robotarm_student_2021a_Ebox_DW.PrevY_d
                    section.data(5).logicalSrcIdx = 19;
                    section.data(5).dtTransOffset = 4;

                    ;% robotarm_student_2021a_Ebox_DW.PrevY_n
                    section.data(6).logicalSrcIdx = 20;
                    section.data(6).dtTransOffset = 5;

                    ;% robotarm_student_2021a_Ebox_DW.currentcarPos
                    section.data(7).logicalSrcIdx = 21;
                    section.data(7).dtTransOffset = 6;

                    ;% robotarm_student_2021a_Ebox_DW.currentcarPos_o
                    section.data(8).logicalSrcIdx = 22;
                    section.data(8).dtTransOffset = 7;

                    ;% robotarm_student_2021a_Ebox_DW.currentcarPos_e
                    section.data(9).logicalSrcIdx = 23;
                    section.data(9).dtTransOffset = 8;

                    ;% robotarm_student_2021a_Ebox_DW.Dctintegrator_RWORK
                    section.data(10).logicalSrcIdx = 24;
                    section.data(10).dtTransOffset = 9;

                    ;% robotarm_student_2021a_Ebox_DW.Dctleadlag_RWORK
                    section.data(11).logicalSrcIdx = 25;
                    section.data(11).dtTransOffset = 11;

                    ;% robotarm_student_2021a_Ebox_DW.Dct1lowpass_RWORK
                    section.data(12).logicalSrcIdx = 26;
                    section.data(12).dtTransOffset = 13;

                    ;% robotarm_student_2021a_Ebox_DW.Dctleadlag_RWORK_b
                    section.data(13).logicalSrcIdx = 27;
                    section.data(13).dtTransOffset = 15;

                    ;% robotarm_student_2021a_Ebox_DW.Dct1lowpass_RWORK_g
                    section.data(14).logicalSrcIdx = 28;
                    section.data(14).dtTransOffset = 17;

                    ;% robotarm_student_2021a_Ebox_DW.Dctintegrator_RWORK_b
                    section.data(15).logicalSrcIdx = 29;
                    section.data(15).dtTransOffset = 19;

                    ;% robotarm_student_2021a_Ebox_DW.Dctleadlag_RWORK_a
                    section.data(16).logicalSrcIdx = 30;
                    section.data(16).dtTransOffset = 21;

                    ;% robotarm_student_2021a_Ebox_DW.Dct1lowpass_RWORK_m
                    section.data(17).logicalSrcIdx = 31;
                    section.data(17).dtTransOffset = 23;

                    ;% robotarm_student_2021a_Ebox_DW.Dctleadlag_RWORK_f
                    section.data(18).logicalSrcIdx = 32;
                    section.data(18).dtTransOffset = 25;

                    ;% robotarm_student_2021a_Ebox_DW.Dct1lowpass_RWORK_k
                    section.data(19).logicalSrcIdx = 33;
                    section.data(19).dtTransOffset = 27;

                    ;% robotarm_student_2021a_Ebox_DW.Dctintegrator_RWORK_m
                    section.data(20).logicalSrcIdx = 34;
                    section.data(20).dtTransOffset = 29;

                    ;% robotarm_student_2021a_Ebox_DW.Dctleadlag_RWORK_p
                    section.data(21).logicalSrcIdx = 35;
                    section.data(21).dtTransOffset = 31;

                    ;% robotarm_student_2021a_Ebox_DW.Dct1lowpass_RWORK_p
                    section.data(22).logicalSrcIdx = 36;
                    section.data(22).dtTransOffset = 33;

                    ;% robotarm_student_2021a_Ebox_DW.Dctleadlag_RWORK_o
                    section.data(23).logicalSrcIdx = 37;
                    section.data(23).dtTransOffset = 35;

                    ;% robotarm_student_2021a_Ebox_DW.Dct1lowpass_RWORK_gb
                    section.data(24).logicalSrcIdx = 38;
                    section.data(24).dtTransOffset = 37;

                    ;% robotarm_student_2021a_Ebox_DW.Dctintegrator3_RWORK
                    section.data(25).logicalSrcIdx = 39;
                    section.data(25).dtTransOffset = 39;

                    ;% robotarm_student_2021a_Ebox_DW.Dct1lowpass_RWORK_n
                    section.data(26).logicalSrcIdx = 40;
                    section.data(26).dtTransOffset = 41;

                    ;% robotarm_student_2021a_Ebox_DW.Dctleadlag_RWORK_l
                    section.data(27).logicalSrcIdx = 41;
                    section.data(27).dtTransOffset = 43;

                    ;% robotarm_student_2021a_Ebox_DW.Dctintegrator_RWORK_d
                    section.data(28).logicalSrcIdx = 42;
                    section.data(28).dtTransOffset = 45;

                    ;% robotarm_student_2021a_Ebox_DW.Dctleadlag_RWORK_k
                    section.data(29).logicalSrcIdx = 43;
                    section.data(29).dtTransOffset = 47;

                    ;% robotarm_student_2021a_Ebox_DW.Dct1lowpass_RWORK_a
                    section.data(30).logicalSrcIdx = 44;
                    section.data(30).dtTransOffset = 49;

                    ;% robotarm_student_2021a_Ebox_DW.Dctleadlag_RWORK_n
                    section.data(31).logicalSrcIdx = 45;
                    section.data(31).dtTransOffset = 51;

                    ;% robotarm_student_2021a_Ebox_DW.Dct1lowpass_RWORK_d
                    section.data(32).logicalSrcIdx = 46;
                    section.data(32).dtTransOffset = 53;

                    ;% robotarm_student_2021a_Ebox_DW.Dctleadlag_RWORK_d
                    section.data(33).logicalSrcIdx = 47;
                    section.data(33).dtTransOffset = 55;

                    ;% robotarm_student_2021a_Ebox_DW.Dct1lowpass_RWORK_az
                    section.data(34).logicalSrcIdx = 48;
                    section.data(34).dtTransOffset = 57;

                    ;% robotarm_student_2021a_Ebox_DW.Dctintegrator3_RWORK_g
                    section.data(35).logicalSrcIdx = 49;
                    section.data(35).dtTransOffset = 59;

                    ;% robotarm_student_2021a_Ebox_DW.Dct1lowpass_RWORK_c
                    section.data(36).logicalSrcIdx = 50;
                    section.data(36).dtTransOffset = 61;

                    ;% robotarm_student_2021a_Ebox_DW.Dctleadlag_RWORK_g
                    section.data(37).logicalSrcIdx = 51;
                    section.data(37).dtTransOffset = 63;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 7;
            section.data(7)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_DW.sfEvent
                    section.data(1).logicalSrcIdx = 52;
                    section.data(1).dtTransOffset = 0;

                    ;% robotarm_student_2021a_Ebox_DW.sfEvent_c
                    section.data(2).logicalSrcIdx = 53;
                    section.data(2).dtTransOffset = 1;

                    ;% robotarm_student_2021a_Ebox_DW.sfEvent_o
                    section.data(3).logicalSrcIdx = 54;
                    section.data(3).dtTransOffset = 2;

                    ;% robotarm_student_2021a_Ebox_DW.sfEvent_d
                    section.data(4).logicalSrcIdx = 55;
                    section.data(4).dtTransOffset = 3;

                    ;% robotarm_student_2021a_Ebox_DW.sfEvent_m
                    section.data(5).logicalSrcIdx = 56;
                    section.data(5).dtTransOffset = 4;

                    ;% robotarm_student_2021a_Ebox_DW.sfEvent_n
                    section.data(6).logicalSrcIdx = 57;
                    section.data(6).dtTransOffset = 5;

                    ;% robotarm_student_2021a_Ebox_DW.sfEvent_a
                    section.data(7).logicalSrcIdx = 58;
                    section.data(7).dtTransOffset = 6;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section

            section.nData     = 8;
            section.data(8)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_DW.is_c4_robotarm_student_2021a_Eb
                    section.data(1).logicalSrcIdx = 59;
                    section.data(1).dtTransOffset = 0;

                    ;% robotarm_student_2021a_Ebox_DW.is_c7_robotarm_student_2021a_Eb
                    section.data(2).logicalSrcIdx = 60;
                    section.data(2).dtTransOffset = 1;

                    ;% robotarm_student_2021a_Ebox_DW.is_c6_robotarm_student_2021a_Eb
                    section.data(3).logicalSrcIdx = 61;
                    section.data(3).dtTransOffset = 2;

                    ;% robotarm_student_2021a_Ebox_DW.is_c5_robotarm_student_2021a_Eb
                    section.data(4).logicalSrcIdx = 62;
                    section.data(4).dtTransOffset = 3;

                    ;% robotarm_student_2021a_Ebox_DW.is_Object_Detection
                    section.data(5).logicalSrcIdx = 63;
                    section.data(5).dtTransOffset = 4;

                    ;% robotarm_student_2021a_Ebox_DW.is_Belt
                    section.data(6).logicalSrcIdx = 64;
                    section.data(6).dtTransOffset = 5;

                    ;% robotarm_student_2021a_Ebox_DW.is_Robot_Arm
                    section.data(7).logicalSrcIdx = 65;
                    section.data(7).dtTransOffset = 6;

                    ;% robotarm_student_2021a_Ebox_DW.is_Vacuum
                    section.data(8).logicalSrcIdx = 66;
                    section.data(8).dtTransOffset = 7;

            nTotData = nTotData + section.nData;
            dworkMap.sections(5) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_DW.temporalCounter_i1
                    section.data(1).logicalSrcIdx = 67;
                    section.data(1).dtTransOffset = 0;

                    ;% robotarm_student_2021a_Ebox_DW.temporalCounter_i1_b
                    section.data(2).logicalSrcIdx = 68;
                    section.data(2).dtTransOffset = 1;

                    ;% robotarm_student_2021a_Ebox_DW.temporalCounter_i1_j
                    section.data(3).logicalSrcIdx = 69;
                    section.data(3).dtTransOffset = 2;

                    ;% robotarm_student_2021a_Ebox_DW.temporalCounter_i1_a
                    section.data(4).logicalSrcIdx = 70;
                    section.data(4).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            dworkMap.sections(6) = section;
            clear section

            section.nData     = 5;
            section.data(5)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_DW.Subsystem3_SubsysRanBC
                    section.data(1).logicalSrcIdx = 71;
                    section.data(1).dtTransOffset = 0;

                    ;% robotarm_student_2021a_Ebox_DW.IfActionSubsystem1_SubsysRanBC
                    section.data(2).logicalSrcIdx = 72;
                    section.data(2).dtTransOffset = 1;

                    ;% robotarm_student_2021a_Ebox_DW.IfActionSubsystem_SubsysRanBC
                    section.data(3).logicalSrcIdx = 73;
                    section.data(3).dtTransOffset = 2;

                    ;% robotarm_student_2021a_Ebox_DW.Controller_SubsysRanBC
                    section.data(4).logicalSrcIdx = 74;
                    section.data(4).dtTransOffset = 3;

                    ;% robotarm_student_2021a_Ebox_DW.EnabledSubsystem_SubsysRanBC
                    section.data(5).logicalSrcIdx = 75;
                    section.data(5).dtTransOffset = 4;

            nTotData = nTotData + section.nData;
            dworkMap.sections(7) = section;
            clear section

            section.nData     = 9;
            section.data(9)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_DW.is_active_c4_robotarm_student_2
                    section.data(1).logicalSrcIdx = 76;
                    section.data(1).dtTransOffset = 0;

                    ;% robotarm_student_2021a_Ebox_DW.is_active_c7_robotarm_student_2
                    section.data(2).logicalSrcIdx = 77;
                    section.data(2).dtTransOffset = 1;

                    ;% robotarm_student_2021a_Ebox_DW.is_active_c6_robotarm_student_2
                    section.data(3).logicalSrcIdx = 78;
                    section.data(3).dtTransOffset = 2;

                    ;% robotarm_student_2021a_Ebox_DW.is_active_c5_robotarm_student_2
                    section.data(4).logicalSrcIdx = 79;
                    section.data(4).dtTransOffset = 3;

                    ;% robotarm_student_2021a_Ebox_DW.is_active_c3_robotarm_student_2
                    section.data(5).logicalSrcIdx = 80;
                    section.data(5).dtTransOffset = 4;

                    ;% robotarm_student_2021a_Ebox_DW.is_active_Object_Detection
                    section.data(6).logicalSrcIdx = 81;
                    section.data(6).dtTransOffset = 5;

                    ;% robotarm_student_2021a_Ebox_DW.is_active_Belt
                    section.data(7).logicalSrcIdx = 82;
                    section.data(7).dtTransOffset = 6;

                    ;% robotarm_student_2021a_Ebox_DW.is_active_Robot_Arm
                    section.data(8).logicalSrcIdx = 83;
                    section.data(8).dtTransOffset = 7;

                    ;% robotarm_student_2021a_Ebox_DW.is_active_Vacuum
                    section.data(9).logicalSrcIdx = 84;
                    section.data(9).dtTransOffset = 8;

            nTotData = nTotData + section.nData;
            dworkMap.sections(8) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_DW.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 85;
                    section.data(1).dtTransOffset = 0;

                    ;% robotarm_student_2021a_Ebox_DW.doneDoubleBufferReInit_j
                    section.data(2).logicalSrcIdx = 86;
                    section.data(2).dtTransOffset = 1;

                    ;% robotarm_student_2021a_Ebox_DW.doneDoubleBufferReInit_g
                    section.data(3).logicalSrcIdx = 87;
                    section.data(3).dtTransOffset = 2;

                    ;% robotarm_student_2021a_Ebox_DW.Controller_MODE
                    section.data(4).logicalSrcIdx = 88;
                    section.data(4).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            dworkMap.sections(9) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_DW.SerialWrite.obj
                    section.data(1).logicalSrcIdx = 89;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(10) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_DW.SerialWrite.objisempty
                    section.data(1).logicalSrcIdx = 90;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(11) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_DW.SerialWrite1.obj
                    section.data(1).logicalSrcIdx = 91;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(12) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% robotarm_student_2021a_Ebox_DW.SerialWrite1.objisempty
                    section.data(1).logicalSrcIdx = 92;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(13) = section;
            clear section


            ;%
            ;% Non-auto Data (dwork)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        dworkMap.nTotData = nTotData;



    ;%
    ;% Add individual maps to base struct.
    ;%

    targMap.paramMap  = paramMap;
    targMap.signalMap = sigMap;
    targMap.dworkMap  = dworkMap;

    ;%
    ;% Add checksums to base struct.
    ;%


    targMap.checksum0 = 3936406311;
    targMap.checksum1 = 2157213751;
    targMap.checksum2 = 377215610;
    targMap.checksum3 = 1123800291;

