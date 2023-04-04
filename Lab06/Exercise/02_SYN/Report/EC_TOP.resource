 
****************************************
Report : resources
Design : EC_TOP
Version: R-2020.09
Date   : Mon Apr  3 10:32:27 2023
****************************************


Resource Report for this hierarchy in file ./../01_RTL/EC_TOP.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| rem_1          | DW_div_uns     | a_width=14 | rem_64 (EC_TOP.v:64)       |
|                |                | b_width=6  |                            |
| gt_x_3         | DW_cmp         | width=6    | gt_136 (EC_TOP.v:136)      |
| gt_x_28        | DW_cmp         | width=6    | inv0/gt_70 (INV_IP.v:70)   |
| div_33         | DW_div_uns     | a_width=6  | inv0/div_93 (INV_IP.v:93)  |
|                |                | b_width=6  |                            |
| div_34         | DW_div_uns     | a_width=6  | inv0/div_112_G2 (INV_IP.v:112) |
             |                | b_width=5  |                            |
| div_38         | DW_div_uns     | a_width=5  | inv0/div_130_G3 (INV_IP.v:130) |
             |                | b_width=5  |                            |
| div_43         | DW_div_uns     | a_width=5  | inv0/div_149_G4 (INV_IP.v:149) |
             |                | b_width=4  |                            |
| div_50         | DW_div_uns     | a_width=4  | inv0/div_169_G5 (INV_IP.v:169) |
             |                | b_width=3  |                            |
| div_53         | DW_div_uns     | a_width=3  | inv0/div_190_G6 (INV_IP.v:190) |
             |                | b_width=2  |                            |
| mult_x_55      | DW_mult_uns    | a_width=1  | inv0/mult_193_G6 (INV_IP.v:193) |
            |                | b_width=1  |                            |
| add_x_59       | DW01_add       | width=6    | inv0/add_204 (INV_IP.v:204) |
| eq_x_61        | DW_cmp         | width=6    | eq_149 (EC_TOP.v:149)      |
|                |                |            | eq_162 (EC_TOP.v:162)      |
| eq_x_62        | DW_cmp         | width=6    | eq_149_2 (EC_TOP.v:149)    |
|                |                |            | eq_162_2 (EC_TOP.v:162)    |
| eq_x_63        | DW_cmp         | width=5    | inv0/eq_114_G2 (INV_IP.v:114) |
              |                |            | inv0/eq_115_G2 (INV_IP.v:115) |
| DP_OP_131J1_122_4235            |            |                            |
|                | DP_OP_131J1_122_4235 |      |                            |
| DP_OP_132J1_123_6322            |            |                            |
|                | DP_OP_132J1_123_6322 |      |                            |
| DP_OP_133J1_124_9811            |            |                            |
|                | DP_OP_133J1_124_9811 |      |                            |
| DP_OP_134J1_125_5085            |            |                            |
|                | DP_OP_134J1_125_5085 |      |                            |
| DP_OP_135J1_126_9530            |            |                            |
|                | DP_OP_135J1_126_9530 |      |                            |
| DP_OP_136J1_127_3566            |            |                            |
|                | DP_OP_136J1_127_3566 |      |                            |
| DP_OP_137J1_128_1265            |            |                            |
|                | DP_OP_137J1_128_1265 |      |                            |
| DP_OP_138J1_129_445             |            |                            |
|                | DP_OP_138J1_129_445 |       |                            |
=============================================================================

Datapath Report for DP_OP_131J1_122_4235
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_131J1_122_4235 | sub_136 (EC_TOP.v:136) add_136 (EC_TOP.v:136)       |
|                      | sub_136_2 (EC_TOP.v:136)                            |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 6     |                                          |
| I2    | PI   | Unsigned | 6     |                                          |
| I3    | PI   | Unsigned | 6     |                                          |
| O1    | PO   | Signed   | 7     | I1 - I2 (EC_TOP.v:136)                   |
| O2    | PO   | Signed   | 8     | I3 + O1 (EC_TOP.v:136)                   |
==============================================================================

Datapath Report for DP_OP_132J1_123_6322
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_132J1_123_6322 | mult_56 (EC_TOP.v:56) C611 (EC_TOP.v:162)           |
|                      | C615 (EC_TOP.v:147) add_64 (EC_TOP.v:64)            |
|                      | sub_64 (EC_TOP.v:64) sub_64_2 (EC_TOP.v:64)         |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 6     |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| I4    | PI   | Signed   | 14    |                                          |
| I5    | PI   | Unsigned | 1     |                                          |
| I6    | PI   | Unsigned | 7     |                                          |
| I7    | PI   | Unsigned | 6     |                                          |
| I8    | PI   | Unsigned | 6     |                                          |
| T129  | IFO  | Signed   | 14    | { I3, I5 } ? O1 : I4 ( EC_TOP.v:147 EC_TOP.v:162 ) |
| O1    | PO   | Unsigned | 14    | I1 * I2 (EC_TOP.v:56)                    |
| O2    | PO   | Signed   | 14    | T129 + I6 - I7 - I8 (EC_TOP.v:64)        |
==============================================================================

Datapath Report for DP_OP_133J1_124_9811
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_133J1_124_9811 | inv0/sub_mult_94 (INV_IP.v:94)                      |
|                      | inv0/mult_113_G2 (INV_IP.v:113)                     |
|                      | inv0/sub_113_G2 (INV_IP.v:113)                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 5     |                                          |
| I2    | PI   | Signed   | 5     |                                          |
| T90   | IFO  | Signed   | 5     | O1[4:0]                                  |
| T42   | IFO  | Unsigned | 5     | I2 * T90 (INV_IP.v:113)                  |
| O1    | PO   | Signed   | 6     | $signed(1'b0) - I1 (INV_IP.v:94)         |
| O2    | PO   | Signed   | 5     | $unsigned(1'b1) - T42 (INV_IP.v:113)     |
==============================================================================

Datapath Report for DP_OP_134J1_125_5085
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_134J1_125_5085 | inv0/mult_97 (INV_IP.v:97)                          |
|                      | inv0/sub_97 (INV_IP.v:97)                           |
|                      | inv0/mult_115_G2 (INV_IP.v:115)                     |
|                      | inv0/sub_115_G2 (INV_IP.v:115)                      |
|                      | inv0/sub_133_G3 (INV_IP.v:133)                      |
|                      | inv0/mult_133_G3 (INV_IP.v:133)                     |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 5     |                                          |
| I2    | PI   | Unsigned | 5     |                                          |
| I3    | PI   | Unsigned | 5     |                                          |
| I4    | PI   | Unsigned | 5     |                                          |
| I5    | PI   | Unsigned | 4     |                                          |
| I6    | PI   | Unsigned | 4     |                                          |
| T39   | IFO  | Unsigned | 5     | I1 * I2 (INV_IP.v:97)                    |
| T47   | IFO  | Unsigned | 5     | I4 * O1 (INV_IP.v:115)                   |
| T93   | IFO  | Signed   | 4     | O1[3:0]                                  |
| T54   | IFO  | Unsigned | 4     | I5 * I6 (INV_IP.v:133)                   |
| O1    | PO   | Signed   | 5     | I3 - T39 (INV_IP.v:97)                   |
| O2    | PO   | Signed   | 5     | I2 - T47 (INV_IP.v:115)                  |
| O3    | PO   | Signed   | 4     | T93 - T54 (INV_IP.v:133)                 |
==============================================================================

Datapath Report for DP_OP_135J1_126_9530
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_135J1_126_9530 | inv0/mult_131_G3 (INV_IP.v:131)                     |
|                      | inv0/sub_131_G3 (INV_IP.v:131)                      |
|                      | inv0/mult_150_G4 (INV_IP.v:150)                     |
|                      | inv0/sub_150_G4 (INV_IP.v:150)                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 4     |                                          |
| I2    | PI   | Unsigned | 5     |                                          |
| I3    | PI   | Signed   | 6     |                                          |
| I4    | PI   | Unsigned | 4     |                                          |
| I5    | PI   | Signed   | 5     |                                          |
| T51   | IFO  | Unsigned | 6     | I1 * I2 (INV_IP.v:131)                   |
| T95   | IFO  | Signed   | 5     | O1[4:0]                                  |
| T58   | IFO  | Unsigned | 5     | I4 * T95 (INV_IP.v:150)                  |
| O1    | PO   | Signed   | 6     | I3 - T51 (INV_IP.v:131)                  |
| O2    | PO   | Signed   | 5     | I5 - T58 (INV_IP.v:150)                  |
==============================================================================

Datapath Report for DP_OP_136J1_127_3566
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_136J1_127_3566 | inv0/mult_152_G4 (INV_IP.v:152)                     |
|                      | inv0/sub_152_G4 (INV_IP.v:152)                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 3     |                                          |
| I2    | PI   | Unsigned | 3     |                                          |
| I3    | PI   | Unsigned | 3     |                                          |
| T61   | IFO  | Unsigned | 3     | I1 * I2 (INV_IP.v:152)                   |
| O1    | PO   | Signed   | 3     | I3 - T61 (INV_IP.v:152)                  |
==============================================================================

Datapath Report for DP_OP_137J1_128_1265
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_137J1_128_1265 | inv0/mult_170_G5 (INV_IP.v:170)                     |
|                      | inv0/sub_170_G5 (INV_IP.v:170)                      |
|                      | inv0/mult_191_G6 (INV_IP.v:191)                     |
|                      | inv0/sub_191_G6 (INV_IP.v:191)                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 3     |                                          |
| I2    | PI   | Unsigned | 5     |                                          |
| I3    | PI   | Signed   | 6     |                                          |
| I4    | PI   | Unsigned | 2     |                                          |
| I5    | PI   | Signed   | 5     |                                          |
| T65   | IFO  | Unsigned | 6     | I1 * I2 (INV_IP.v:170)                   |
| T105  | IFO  | Signed   | 5     | O1[4:0]                                  |
| T72   | IFO  | Unsigned | 5     | I4 * T105 (INV_IP.v:191)                 |
| O1    | PO   | Signed   | 6     | I3 - T65 (INV_IP.v:170)                  |
| O2    | PO   | Signed   | 5     | I5 - T72 (INV_IP.v:191)                  |
==============================================================================

Datapath Report for DP_OP_138J1_129_445
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_138J1_129_445  | inv0/mult_172_G5 (INV_IP.v:172)                     |
|                      | inv0/sub_172_G5 (INV_IP.v:172)                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 2     |                                          |
| I2    | PI   | Unsigned | 2     |                                          |
| I3    | PI   | Unsigned | 2     |                                          |
| T68   | IFO  | Unsigned | 2     | I1 * I2 (INV_IP.v:172)                   |
| O1    | PO   | Signed   | 2     | I3 - T68 (INV_IP.v:172)                  |
==============================================================================


Resource Report for Ungrouped Hierarchy div_53
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_50
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_43
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_38
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_34
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_33
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy rem_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'inv0/sub_mult_94 (INV_IP.v:94)' in design 'EC_TOP' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'inv0/div_93 (INV_IP.v:93)'.  (HDL-120)

Information: Operator associated with resources 'inv0/sub_113_G2 (INV_IP.v:113)' in design 'EC_TOP' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'inv0/mult_131_G3 (INV_IP.v:131)'.  (HDL-120)

Information: Operator associated with resources 'inv0/sub_115_G2 (INV_IP.v:115)' in design 'EC_TOP' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'inv0/C179 (INV_IP.v:115)'.  (HDL-120)

Information: Operator associated with resources 'inv0/mult_131_G3 (INV_IP.v:131)' in design 'EC_TOP' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'inv0/div_130_G3 (INV_IP.v:130)'.  (HDL-120)

Information: Operator associated with resources 'inv0/sub_133_G3 (INV_IP.v:133)' in design 'EC_TOP' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'inv0/C181 (INV_IP.v:133)'.  (HDL-120)

Information: Operator associated with resources 'inv0/mult_150_G4 (INV_IP.v:150)' in design 'EC_TOP' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'inv0/div_149_G4 (INV_IP.v:149)'.  (HDL-120)

Information: Operator associated with resources 'inv0/sub_150_G4 (INV_IP.v:150)' in design 'EC_TOP' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'inv0/mult_170_G5 (INV_IP.v:170)'.  (HDL-120)

Information: Operator associated with resources 'inv0/sub_152_G4 (INV_IP.v:152)' in design 'EC_TOP' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'inv0/C183 (INV_IP.v:152)'.  (HDL-120)

Information: Operator associated with resources 'inv0/mult_170_G5 (INV_IP.v:170)' in design 'EC_TOP' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'inv0/div_169_G5 (INV_IP.v:169)'.  (HDL-120)

Information: Operator associated with resources 'inv0/sub_172_G5 (INV_IP.v:172)' in design 'EC_TOP' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'inv0/C185 (INV_IP.v:172)'.  (HDL-120)

Information: Operator associated with resources 'inv0/mult_191_G6 (INV_IP.v:191)' in design 'EC_TOP' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'inv0/div_190_G6 (INV_IP.v:190)'.  (HDL-120)

Information: Operator associated with resources 'inv0/sub_191_G6 (INV_IP.v:191)' in design 'EC_TOP' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'inv0/C188 (INV_IP.v:198)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| rem_1              | DW_div_uns       | cla2               |                |
| gt_x_3             | DW_cmp           | apparch (area)     |                |
| gt_x_28            | DW_cmp           | apparch (area)     |                |
| div_33             | DW_div_uns       | cla2               |                |
| div_34             | DW_div_uns       | cla2               |                |
| div_38             | DW_div_uns       | cla3               |                |
| div_43             | DW_div_uns       | cla2               |                |
| div_50             | DW_div_uns       | cla2               |                |
| div_53             | DW_div_uns       | cla                |                |
| mult_x_55          | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| add_x_59           | DW01_add         | pparch (area,speed)                 |
| eq_x_61            | DW_cmp           | apparch (area)     |                |
| eq_x_62            | DW_cmp           | apparch (area)     |                |
| eq_x_63            | DW_cmp           | apparch (area)     |                |
| DP_OP_131J1_122_4235                  |                    |                |
|                    | DP_OP_131J1_122_4235 | str (area,speed)                |
| DP_OP_132J1_123_6322                  |                    |                |
|                    | DP_OP_132J1_123_6322 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_133J1_124_9811                  |                    |                |
|                    | DP_OP_133J1_124_9811 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_134J1_125_5085                  |                    |                |
|                    | DP_OP_134J1_125_5085 | str (area,speed)                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_135J1_126_9530                  |                    |                |
|                    | DP_OP_135J1_126_9530 | str (area,speed)                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_136J1_127_3566                  |                    |                |
|                    | DP_OP_136J1_127_3566 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_137J1_128_1265                  |                    |                |
|                    | DP_OP_137J1_128_1265 | str (area,speed)                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_138J1_129_445                   |                    |                |
|                    | DP_OP_138J1_129_445 | str (area)      |                |
|                    |                  | mult_arch: and     |                |
===============================================================================

1
