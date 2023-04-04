 
****************************************
Report : resources
Design : NN
Version: R-2020.09
Date   : Mon Mar 20 18:57:51 2023
****************************************


Resource Report for this hierarchy in file ./../01_RTL/NN.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_3        | DW01_inc       | width=7    | add_183 (NN.v:183)         |
| gte_x_50       | DW_cmp         | width=7    | gte_493 (NN.v:493)         |
| lte_x_51       | DW_cmp         | width=7    | lte_493 (NN.v:493)         |
| gte_x_52       | DW_cmp         | width=7    | gte_495 (NN.v:495)         |
| lte_x_53       | DW_cmp         | width=7    | lte_495 (NN.v:495)         |
| gte_x_56       | DW_cmp         | width=7    | gte_510 (NN.v:510)         |
| lte_x_57       | DW_cmp         | width=7    | lte_510 (NN.v:510)         |
| gte_x_58       | DW_cmp         | width=7    | gte_510_2 (NN.v:510)       |
| lte_x_59       | DW_cmp         | width=7    | lte_510_2 (NN.v:510)       |
| gte_x_60       | DW_cmp         | width=7    | gte_521 (NN.v:521)         |
| lte_x_61       | DW_cmp         | width=7    | lte_521 (NN.v:521)         |
| gte_x_62       | DW_cmp         | width=7    | gte_521_2 (NN.v:521)       |
| lte_x_63       | DW_cmp         | width=7    | lte_521_2 (NN.v:521)       |
| MACU           | DW_fp_mac      | sig_width=23 | MACU (NN.v:127)          |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
| MACW           | DW_fp_mac      | sig_width=23 | MACW (NN.v:136)          |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
| EXP0           | DW_fp_exp      | sig_width=23 | EXP0 (NN.v:144)          |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
|                |                | arch=1     |                            |
| REC0           | DW_fp_recip    | sig_width=23 | REC0 (NN.v:150)          |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
|                |                | faithful_round=1 |                      |
| lt_x_76        | DW_cmp         | width=4    | lt_223 (NN.v:223)          |
|                |                |            | lt_244 (NN.v:244)          |
|                |                |            | lt_248 (NN.v:248)          |
|                |                |            | lt_383 (NN.v:383)          |
| gte_x_77       | DW_cmp         | width=7    | gte_231 (NN.v:231)         |
|                |                |            | gte_257 (NN.v:257)         |
|                |                |            | gte_266 (NN.v:266)         |
| lte_x_78       | DW_cmp         | width=7    | lte_231 (NN.v:231)         |
|                |                |            | lte_257 (NN.v:257)         |
|                |                |            | lte_266 (NN.v:266)         |
| lt_x_79        | DW_cmp         | width=4    | lt_311 (NN.v:311)          |
|                |                |            | lt_319 (NN.v:319)          |
|                |                |            | lt_379 (NN.v:379)          |
| add_x_5        | DW01_inc       | width=4    | add_191 (NN.v:191)         |
|                |                |            | add_192 (NN.v:192)         |
|                |                |            | add_193 (NN.v:193)         |
|                |                |            | add_194 (NN.v:194)         |
|                |                |            | add_195 (NN.v:195)         |
|                |                |            | add_196 (NN.v:196)         |
|                |                |            | add_197 (NN.v:197)         |
| add_x_24       | DW01_inc       | width=4    | add_275 (NN.v:275)         |
|                |                |            | add_276 (NN.v:276)         |
|                |                |            | add_277 (NN.v:277)         |
| DP_OP_216_168_3204              |            |                            |
|                | DP_OP_216_168_3204 |        |                            |
| DP_OP_216_169_3236              |            |                            |
|                | DP_OP_216_169_3236 |        |                            |
=============================================================================

Datapath Report for DP_OP_216_168_3204
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_216_168_3204   | add_392_4 sub_392_2 sub_405_4 sub_405_5 sub_432_7   |
|                      | add_439_6 add_405_6 sub_458_4 add_458_6 lt_377      |
|                      | add_462_2 sub_462_8                                 |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| I3    | PI   | Unsigned | 8     |                                          |
| I4    | PI   | Unsigned | 1     |                                          |
| I5    | PI   | Unsigned | 1     |                                          |
| I6    | PI   | Unsigned | 6     |                                          |
| I7    | PI   | Unsigned | 1     |                                          |
| T187  | IFO  | Unsigned | 9     | I1 + I2                                  |
| T174  | IFO  | Signed   | 10    | -$unsigned(7'b1111111) + T187            |
| T196  | IFO  | Signed   | 10    | -I3 + T187                               |
| T203  | IFO  | Unsigned | 10    | T187 + $unsigned(10'b1110000100)         |
| T211  | IFO  | Signed   | 10    | { I4, I5 } ? I3 : T203                   |
| O1    | PO   | Signed   | 1     | T174 < $signed(1'b0)                     |
| O2    | PO   | Unsigned | 10    | $unsigned(10'b1101001111) + T196         |
| O3    | PO   | Unsigned | 10    | $unsigned(10'b1110011011) + T196         |
| O4    | PO   | Unsigned | 10    | $unsigned(10'b1110000011) + T196         |
| O5    | PO   | Signed   | 10    | addsub(T211,I6,I7)                       |
==============================================================================

Datapath Report for DP_OP_216_169_3236
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_216_169_3236   | add_392_4 sub_392_2 sub_405_4 sub_405_5 sub_432_7   |
|                      | add_439_6 add_405_6 sub_458_4 add_458_6 lt_377      |
|                      | add_462_2 sub_462_8                                 |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| I3    | PI   | Unsigned | 8     |                                          |
| I4    | PI   | Unsigned | 1     |                                          |
| I5    | PI   | Unsigned | 1     |                                          |
| I6    | PI   | Unsigned | 6     |                                          |
| I7    | PI   | Unsigned | 1     |                                          |
| T187  | IFO  | Unsigned | 9     | I1 + I2                                  |
| T174  | IFO  | Signed   | 10    | -$unsigned(7'b1111111) + T187            |
| T196  | IFO  | Signed   | 10    | -I3 + T187                               |
| T203  | IFO  | Unsigned | 10    | T187 + $unsigned(10'b1110000100)         |
| T211  | IFO  | Signed   | 10    | { I4, I5 } ? I3 : T203                   |
| O1    | PO   | Signed   | 1     | T174 < $signed(1'b0)                     |
| O2    | PO   | Unsigned | 10    | $unsigned(10'b1101001111) + T196         |
| O3    | PO   | Unsigned | 10    | $unsigned(10'b1110011011) + T196         |
| O4    | PO   | Unsigned | 10    | $unsigned(10'b1110000011) + T196         |
| O5    | PO   | Signed   | 10    | addsub(T211,I6,I7)                       |
==============================================================================


Resource Report for Ungrouped Hierarchy REC0 in file ./DW_fp_recip__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| mult_x_2       | DW_mult_uns    | a_width=24 | mult_399                   |
|                |                | b_width=9  |                            |
| gte_x_5        | DW_cmp         | width=9    | gte_649                    |
| eq_x_9         | DW_cmp         | width=10   | eq_650 eq_678              |
| DP_OP_44J1_122_8319             |            |                            |
|                | DP_OP_44J1_122_8319 |       |                            |
| DP_OP_45J1_123_5453             |            |                            |
|                | DP_OP_45J1_123_5453 |       |                            |
=============================================================================

Datapath Report for DP_OP_44J1_122_8319
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_44J1_122_8319  | mult_403 add_410 add_431 mult_426 mult_418 add_468  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 9     |                                          |
| I2    | PI   | Unsigned | 25    |                                          |
| I3    | PI   | Unsigned | 27    |                                          |
| I4    | PI   | Unsigned | 13    |                                          |
| I5    | PI   | Unsigned | 13    |                                          |
| T4    | IFO  | Unsigned | 34    | I1 * I2                                  |
| T25   | IFO  | Unsigned | 20    | T4[33:14]                                |
| T6    | IFO  | Unsigned | 26    | I5 * I5                                  |
| T28   | IFO  | Unsigned | 13    | T6[25:13]                                |
| T7    | IFO  | Unsigned | 26    | I4 * T28                                 |
| T29   | IFO  | Unsigned | 13    | T7[25:13]                                |
| O1    | PO   | Unsigned | 27    | I3 + T25                                 |
| O2    | PO   | Unsigned | 27    | O1 + T29                                 |
| O3    | PO   | Unsigned | 27    | O2 + $unsigned(4'b1000)                  |
==============================================================================

Datapath Report for DP_OP_45J1_123_5453
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_45J1_123_5453  | sub_342 add_342 sub_574_ni                          |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Signed   | 10    | -I1 - I2 + $unsigned(10'b0011111110)     |
==============================================================================


Resource Report for Ungrouped Hierarchy EXP0/U2 in file ./DW_exp2__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| mult_x_91      | DW_mult_uns    | a_width=31 | mult_4987_2                |
|                |                | b_width=18 |                            |
| DP_OP_106J1_126_3223            |            |                            |
|                | DP_OP_106J1_126_3223 |      |                            |
| DP_OP_107J1_127_9769            |            |                            |
|                | DP_OP_107J1_127_9769 |      |                            |
=============================================================================

Datapath Report for DP_OP_106J1_126_3223
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_106J1_126_3223 | mult_4967 mult_4981_2                               |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 18    |                                          |
| I2    | PI   | Unsigned | 29    |                                          |
| T90   | IFO  | Unsigned | 36    | I1 * I1                                  |
| T98   | IFO  | Unsigned | 14    | T90[35:22]                               |
| O1    | PO   | Unsigned | 45    | I2 * T98                                 |
==============================================================================

Datapath Report for DP_OP_107J1_127_9769
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_107J1_127_9769 | add_4991_2 add_4991_3 add_4994                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Signed   | 15    |                                          |
| I2    | PI   | Signed   | 25    |                                          |
| I3    | PI   | Signed   | 31    |                                          |
| T105  | IFO  | Signed   | 31    | I1 + I2 + I3                             |
| T103  | IFO  | Signed   | 28    | T105[30:3]                               |
| O1    | PO   | Unsigned | 28    | T103 + $unsigned(1'b1)                   |
==============================================================================


Resource Report for Ungrouped Hierarchy EXP0 in file ./DW_fp_exp__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| mult_x_4       | DW_mult_uns    | a_width=33 | mult_219                   |
|                |                | b_width=33 |                            |
| sub_x_5        | DW01_sub       | width=9    | sub_221                    |
| gte_x_6        | DW_cmp         | width=9    | gte_232                    |
| add_x_9        | DW01_add       | width=26   | add_270                    |
| add_x_11       | DW01_inc       | width=24   | add_276_round              |
| U1             | DW01_ash       | A_width=41 | U1                         |
|                |                | SH_width=9 |                            |
| U2             | DW_exp2        | op_width=26 | U2                        |
|                |                | arch=1     |                            |
|                |                | err_range=1 |                           |
| sub_x_16       | DW01_sub       | width=10   | add_242 sub_242            |
| add_x_17       | DW01_dec       | width=2    | add_247_ni_ni sub_add_247  |
| sub_x_18       | DW01_sub       | width=26   | add_247_ni_ni sub_add_247  |
| add_x_19       | DW01_add       | width=8    | add_260 add_261            |
| add_x_20       | DW01_add       | width=10   | add_260 add_261            |
=============================================================================


Resource Report for Ungrouped Hierarchy *cell*25237/ULSD
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_lzod        | a_width=53 | U1                         |
|                |                | detect_1=0 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy *cell*25237/ULZD3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy MACW in file ./DW_fp_mac__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| eq_x_4         | DW_cmp         | width=7    | eq_462                     |
| sub_x_5        | DW01_sub       | width=8    | sub_462_2                  |
| eq_x_6         | DW_cmp         | width=32   | eq_462_2                   |
| ashr_13        | DW_rightsh     | A_width=75 | srl_536                    |
|                |                | SH_width=7 |                            |
| eq_x_17        | DW_cmp         | width=24   | eq_549                     |
| ash_19         | DW_leftsh      | A_width=53 | sll_562                    |
|                |                | SH_width=6 |                            |
| add_x_20       | DW01_add       | width=10   | add_580_aco                |
| eq_x_21        | DW_cmp         | width=28   | eq_621                     |
| add_x_29       | DW01_inc       | width=23   | add_653                    |
| eq_x_31        | DW_cmp         | width=23   | eq_655                     |
| UM1            | DW02_multp     | a_width=24 | UM1                        |
|                |                | b_width=24 |                            |
|                |                | out_width=50 |                          |
|                |                | verif_en=1 |                            |
| ULSD           | DW_lsd         | a_width=53 | ULSD                       |
| DP_OP_207_149_9016              |            |                            |
|                | DP_OP_207_149_9016 |        |                            |
| DP_OP_208_150_5508              |            |                            |
|                | DP_OP_208_150_5508 |        |                            |
| DP_OP_209_151_153               |            |                            |
|                | DP_OP_209_151_153 |         |                            |
| DP_OP_210_152_6827              |            |                            |
|                | DP_OP_210_152_6827 |        |                            |
=============================================================================

Datapath Report for DP_OP_207_149_9016
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_207_149_9016   | add_422_5 sub_422_4 sub_422_5 add_422_6             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Signed   | 7     |                                          |
| I2    | PI   | Signed   | 7     |                                          |
| I3    | PI   | Signed   | 7     |                                          |
| O1    | PO   | Signed   | 7     | I1 + I2 - I3 + $unsigned(7'b0011101)     |
==============================================================================

Datapath Report for DP_OP_208_150_5508
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_208_150_5508   | add_546 add_546_2 add_546_3 sub_add_552 add_552_ni  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 77    |                                          |
| I2    | PI   | Unsigned | 77    |                                          |
| I3    | PI   | Unsigned | 75    |                                          |
| I4    | PI   | Unsigned | 2     |                                          |
| I5    | PI   | Unsigned | 1     |                                          |
| T204  | IFO  | Unsigned | 53    | O1[76:24]                                |
| O1    | PO   | Unsigned | 77    | I1 + I2 + I3 + I4                        |
| O2    | PO   | Signed   | 53    | $signed(1'b1) - T204 + I5                |
==============================================================================

Datapath Report for DP_OP_209_151_153
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_209_151_153    | add_660 sub_660 gte_660                             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Signed   | 10    |                                          |
| I2    | PI   | Unsigned | 1     |                                          |
| T155  | IFO  | Signed   | 12    | I1 + I2 - $unsigned(8'b11111111)         |
| O1    | PO   | Signed   | 1     | T155 >= $signed(1'b0)                    |
==============================================================================

Datapath Report for DP_OP_210_152_6827
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_210_152_6827   | add_657_ni add_657_2                                |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 1     |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Unsigned | 8     | I1 + I2 + I3                             |
==============================================================================


Resource Report for Ungrouped Hierarchy *cell*47673/ULSD
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_lzod        | a_width=53 | U1                         |
|                |                | detect_1=0 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy *cell*47673/ULZD3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy MACU in file ./DW_fp_mac__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| eq_x_4         | DW_cmp         | width=7    | eq_462                     |
| sub_x_5        | DW01_sub       | width=8    | sub_462_2                  |
| eq_x_6         | DW_cmp         | width=32   | eq_462_2                   |
| ashr_13        | DW_rightsh     | A_width=75 | srl_536                    |
|                |                | SH_width=7 |                            |
| eq_x_17        | DW_cmp         | width=24   | eq_549                     |
| ash_19         | DW_leftsh      | A_width=53 | sll_562                    |
|                |                | SH_width=6 |                            |
| add_x_20       | DW01_add       | width=10   | add_580_aco                |
| eq_x_21        | DW_cmp         | width=28   | eq_621                     |
| add_x_29       | DW01_inc       | width=23   | add_653                    |
| eq_x_31        | DW_cmp         | width=23   | eq_655                     |
| UM1            | DW02_multp     | a_width=24 | UM1                        |
|                |                | b_width=24 |                            |
|                |                | out_width=50 |                          |
|                |                | verif_en=1 |                            |
| ULSD           | DW_lsd         | a_width=53 | ULSD                       |
| DP_OP_207_163_9016              |            |                            |
|                | DP_OP_207_163_9016 |        |                            |
| DP_OP_208_164_5508              |            |                            |
|                | DP_OP_208_164_5508 |        |                            |
| DP_OP_209_165_153               |            |                            |
|                | DP_OP_209_165_153 |         |                            |
| DP_OP_210_166_6827              |            |                            |
|                | DP_OP_210_166_6827 |        |                            |
=============================================================================

Datapath Report for DP_OP_207_163_9016
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_207_163_9016   | add_422_5 sub_422_4 sub_422_5 add_422_6             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Signed   | 7     |                                          |
| I2    | PI   | Signed   | 7     |                                          |
| I3    | PI   | Signed   | 7     |                                          |
| O1    | PO   | Signed   | 7     | I1 + I2 - I3 + $unsigned(7'b0011101)     |
==============================================================================

Datapath Report for DP_OP_208_164_5508
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_208_164_5508   | add_546 add_546_2 add_546_3 sub_add_552 add_552_ni  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 77    |                                          |
| I2    | PI   | Unsigned | 77    |                                          |
| I3    | PI   | Unsigned | 75    |                                          |
| I4    | PI   | Unsigned | 2     |                                          |
| I5    | PI   | Unsigned | 1     |                                          |
| T204  | IFO  | Unsigned | 53    | O1[76:24]                                |
| O1    | PO   | Unsigned | 77    | I1 + I2 + I3 + I4                        |
| O2    | PO   | Signed   | 53    | $signed(1'b1) - T204 + I5                |
==============================================================================

Datapath Report for DP_OP_209_165_153
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_209_165_153    | add_660 sub_660 gte_660                             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Signed   | 10    |                                          |
| I2    | PI   | Unsigned | 1     |                                          |
| T155  | IFO  | Signed   | 12    | I1 + I2 - $unsigned(8'b11111111)         |
| O1    | PO   | Signed   | 1     | T155 >= $signed(1'b0)                    |
==============================================================================

Datapath Report for DP_OP_210_166_6827
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_210_166_6827   | add_657_ni add_657_2                                |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 1     |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Unsigned | 8     | I1 + I2 + I3                             |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_x_3            | DW01_inc         | apparch (area)     |                |
| gte_x_50           | DW_cmp           | apparch (area)     |                |
| lte_x_51           | DW_cmp           | apparch (area)     |                |
| gte_x_52           | DW_cmp           | apparch (area)     |                |
| lte_x_53           | DW_cmp           | apparch (area)     |                |
| gte_x_56           | DW_cmp           | apparch (area)     |                |
| lte_x_57           | DW_cmp           | apparch (area)     |                |
| gte_x_58           | DW_cmp           | apparch (area)     |                |
| lte_x_59           | DW_cmp           | apparch (area)     |                |
| gte_x_60           | DW_cmp           | apparch (area)     |                |
| lte_x_61           | DW_cmp           | apparch (area)     |                |
| gte_x_62           | DW_cmp           | apparch (area)     |                |
| lte_x_63           | DW_cmp           | apparch (area)     |                |
| MACU               | DW_fp_mac        | str                |                |
| MACW               | DW_fp_mac        | str                |                |
| EXP0               | DW_fp_exp        | rtl                |                |
| REC0               | DW_fp_recip      | rtl                |                |
| lt_x_76            | DW_cmp           | apparch (area)     |                |
| gte_x_77           | DW_cmp           | apparch (area)     |                |
| lte_x_78           | DW_cmp           | apparch (area)     |                |
| lt_x_79            | DW_cmp           | apparch (area)     |                |
| add_x_5            | DW01_inc         | apparch (area)     |                |
| add_x_24           | DW01_inc         | apparch (area)     |                |
| mult_x_2           | DW_mult_uns      | pparch (speed)     |                |
|                    |                  | mult_arch: benc_radix4              |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| eq_x_9             | DW_cmp           | apparch (area)     |                |
| mult_x_91          | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| mult_x_4           | DW_mult_uns      | pparch (area,speed)                 |
| sub_x_5            | DW01_sub         | apparch (area)     |                |
| gte_x_6            | DW_cmp           | apparch (area)     |                |
| add_x_9            | DW01_add         | pparch (speed)     |                |
| add_x_11           | DW01_inc         | pparch (area,speed)                 |
| U1                 | DW01_ash         | astr (area)        |                |
| U2                 | DW_exp2          | rtl                |                |
| sub_x_16           | DW01_sub         | apparch (area)     |                |
| add_x_17           | DW01_dec         | apparch (area)     |                |
| sub_x_18           | DW01_sub         | pparch (area,speed)                 |
| add_x_19           | DW01_add         | apparch (area)     |                |
| add_x_20           | DW01_add         | apparch (area)     |                |
| eq_x_4             | DW_cmp           | apparch (area)     |                |
| sub_x_5            | DW01_sub         | pparch (speed)     |                |
| eq_x_6             | DW_cmp           | apparch (area)     |                |
| ashr_13            | DW_rightsh       | astr (area)        |                |
| eq_x_17            | DW_cmp           | apparch (area)     |                |
| ash_19             | DW_leftsh        | astr (area)        |                |
| add_x_20           | DW01_add         | apparch (area)     |                |
| eq_x_21            | DW_cmp           | apparch (area)     |                |
| add_x_29           | DW01_inc         | pparch (area,speed)                 |
| eq_x_31            | DW_cmp           | apparch (area)     |                |
| UM1                | DW02_multp       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| ULSD               | DW_lsd           | str                |                |
| eq_x_4             | DW_cmp           | apparch (area)     |                |
| sub_x_5            | DW01_sub         | pparch (speed)     |                |
| eq_x_6             | DW_cmp           | apparch (area)     |                |
| ashr_13            | DW_rightsh       | astr (area)        |                |
| eq_x_17            | DW_cmp           | apparch (area)     |                |
| ash_19             | DW_leftsh        | astr (area)        |                |
| add_x_20           | DW01_add         | apparch (area)     |                |
| eq_x_21            | DW_cmp           | apparch (area)     |                |
| add_x_29           | DW01_inc         | pparch (area,speed)                 |
| eq_x_31            | DW_cmp           | apparch (area)     |                |
| UM1                | DW02_multp       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| ULSD               | DW_lsd           | str                |                |
| DP_OP_216_168_3204 | DP_OP_216_168_3204 | str (area,speed) |                |
| DP_OP_216_169_3236 | DP_OP_216_169_3236 | str (area,speed) |                |
| DP_OP_44J1_122_8319                   |                    |                |
|                    | DP_OP_44J1_122_8319 | str (area,speed)                 |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: benc_radix4              |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_45J1_123_5453                   |                    |                |
|                    | DP_OP_45J1_123_5453 | str (area)      |                |
| DP_OP_106J1_126_3223                  |                    |                |
|                    | DP_OP_106J1_126_3223 | str (area,speed)                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_107J1_127_9769                  |                    |                |
|                    | DP_OP_107J1_127_9769 | str (area,speed)                |
| DP_OP_207_149_9016 | DP_OP_207_149_9016 | str (area)       |                |
| DP_OP_208_150_5508 | DP_OP_208_150_5508 | str (area,speed) |                |
| DP_OP_209_151_153  | DP_OP_209_151_153 | str (area,speed)  |                |
| DP_OP_210_152_6827 | DP_OP_210_152_6827 | str (area,speed) |                |
| DP_OP_207_163_9016 | DP_OP_207_163_9016 | str (area)       |                |
| DP_OP_208_164_5508 | DP_OP_208_164_5508 | str (area,speed) |                |
| DP_OP_209_165_153  | DP_OP_209_165_153 | str (area,speed)  |                |
| DP_OP_210_166_6827 | DP_OP_210_166_6827 | str (area,speed) |                |
===============================================================================

1
