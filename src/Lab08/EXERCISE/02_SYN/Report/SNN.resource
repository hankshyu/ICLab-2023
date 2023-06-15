 
****************************************
Report : resources
Design : SNN
Version: T-2022.03
Date   : Sun Apr 23 20:51:34 2023
****************************************


Resource Report for this hierarchy in file
        /RAID2/COURSE/iclab/iclab105/Lab08/EXERCISE/01_RTL/SNN.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| div_1          | DW_div_uns     | a_width=20 | div_95 (SNN.v:95)          |
|                |                | b_width=12 |                            |
| gt_x_2         | DW_cmp         | width=8    | gt_101 (SNN.v:101)         |
| sub_x_3        | DW01_sub       | width=8    | sub_106 (SNN.v:106)        |
| lte_x_12       | DW_cmp         | width=7    | lte_180 (SNN.v:180)        |
| gte_x_35       | DW_cmp         | width=7    | gte_233 (SNN.v:233)        |
| gte_x_51       | DW_cmp         | width=7    | gte_257 (SNN.v:257)        |
| lte_x_89       | DW_cmp         | width=7    | lte_560 (SNN.v:560)        |
| lt_x_111       | DW_cmp         | width=7    | lt_649 (SNN.v:649)         |
| lt_x_117       | DW_cmp         | width=7    | lt_680 (SNN.v:680)         |
| lte_x_149      | DW_cmp         | width=7    | lte_193 (SNN.v:193)        |
|                |                |            | lte_205 (SNN.v:205)        |
| gte_x_150      | DW_cmp         | width=7    | gte_221 (SNN.v:221)        |
|                |                |            | gte_560 (SNN.v:560)        |
| lt_x_151       | DW_cmp         | width=7    | lt_320 (SNN.v:320)         |
|                |                |            | lt_331 (SNN.v:331)         |
| gt_x_152       | DW_cmp         | width=8    | gt_712 (SNN.v:712)         |
|                |                |            | gt_713 (SNN.v:713)         |
| gt_x_153       | DW_cmp         | width=8    | gt_722 (SNN.v:722)         |
|                |                |            | gt_723 (SNN.v:723)         |
| gt_x_154       | DW_cmp         | width=8    | gt_726 (SNN.v:726)         |
|                |                |            | gt_727 (SNN.v:727)         |
| gt_x_155       | DW_cmp         | width=8    | gt_737 (SNN.v:737)         |
|                |                |            | gt_738 (SNN.v:738)         |
| add_x_6        | DW01_inc       | width=7    | add_152 (SNN.v:152)        |
|                |                |            | add_153 (SNN.v:153)        |
|                |                |            | add_154 (SNN.v:154)        |
|                |                |            | add_155 (SNN.v:155)        |
| add_x_145      | DW01_add       | width=11   | add_753_S2 (SNN.v:753)     |
|                |                |            | add_801 (SNN.v:801)        |
|                |                |            | add_801_2 (SNN.v:801)      |
| add_x_90       | DW01_inc       | width=4    | add_562 (SNN.v:562)        |
|                |                |            | add_564 (SNN.v:564)        |
| DP_OP_254J1_122_9307            |            |                            |
|                | DP_OP_254J1_122_9307 |      |                            |
=============================================================================

Datapath Report for DP_OP_254J1_122_9307
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_254J1_122_9307 | mult_77 (SNN.v:77) add_82 (SNN.v:82)                |
|                      | mult_77_G2 (SNN.v:77) add_83 (SNN.v:83)             |
|                      | add_88 (SNN.v:88) add_84 (SNN.v:84)                 |
|                      | add_88_2 (SNN.v:88) add_85 (SNN.v:85)               |
|                      | add_88_3 (SNN.v:88) add_88_4 (SNN.v:88)             |
|                      | mult_77_G3 (SNN.v:77) mult_77_G4 (SNN.v:77)         |
|                      | mult_77_G5 (SNN.v:77) mult_77_G6 (SNN.v:77)         |
|                      | mult_77_G7 (SNN.v:77) mult_77_G8 (SNN.v:77)         |
|                      | mult_77_G9 (SNN.v:77)                               |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| I3    | PI   | Unsigned | 8     |                                          |
| I4    | PI   | Unsigned | 8     |                                          |
| I5    | PI   | Unsigned | 8     |                                          |
| I6    | PI   | Unsigned | 8     |                                          |
| I7    | PI   | Unsigned | 8     |                                          |
| I8    | PI   | Unsigned | 8     |                                          |
| I9    | PI   | Unsigned | 8     |                                          |
| I10   | PI   | Unsigned | 8     |                                          |
| I11   | PI   | Unsigned | 8     |                                          |
| I12   | PI   | Unsigned | 8     |                                          |
| I13   | PI   | Unsigned | 8     |                                          |
| I14   | PI   | Unsigned | 8     |                                          |
| I15   | PI   | Unsigned | 8     |                                          |
| I16   | PI   | Unsigned | 8     |                                          |
| I17   | PI   | Unsigned | 8     |                                          |
| I18   | PI   | Unsigned | 8     |                                          |
| T2    | IFO  | Unsigned | 16    | I5 * I6 (SNN.v:77)                       |
| T3    | IFO  | Unsigned | 16    | I7 * I8 (SNN.v:77)                       |
| T0    | IFO  | Unsigned | 16    | I1 * I2 (SNN.v:77)                       |
| T1    | IFO  | Unsigned | 16    | I3 * I4 (SNN.v:77)                       |
| T4    | IFO  | Unsigned | 16    | I9 * I10 (SNN.v:77)                      |
| T5    | IFO  | Unsigned | 16    | I11 * I12 (SNN.v:77)                     |
| T6    | IFO  | Unsigned | 16    | I13 * I14 (SNN.v:77)                     |
| T7    | IFO  | Unsigned | 16    | I15 * I16 (SNN.v:77)                     |
| T8    | IFO  | Unsigned | 16    | I17 * I18 (SNN.v:77)                     |
| O1    | PO   | Unsigned | 17    | T0 + T1 (SNN.v:82)                       |
| O2    | PO   | Unsigned | 20    | T2 + T3 + O1 + T4 + T5 + T6 + T7 + T8 ( SNN.v:83 SNN.v:84 SNN.v:85 SNN.v:88 ) |
==============================================================================


Resource Report for Ungrouped Hierarchy div_1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'sub_106 (SNN.v:106)' in design 'SNN' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'C5471 (SNN.v:750)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| div_1              | DW_div_uns       | cla2               |                |
| gt_x_2             | DW_cmp           | apparch (area)     |                |
| sub_x_3            | DW01_sub         | apparch (area)     |                |
| lte_x_12           | DW_cmp           | apparch (area)     |                |
| gte_x_35           | DW_cmp           | apparch (area)     |                |
| gte_x_51           | DW_cmp           | apparch (area)     |                |
| lte_x_89           | DW_cmp           | apparch (area)     |                |
| lt_x_111           | DW_cmp           | apparch (area)     |                |
| lt_x_117           | DW_cmp           | apparch (area)     |                |
| lte_x_149          | DW_cmp           | apparch (area)     |                |
| gte_x_150          | DW_cmp           | apparch (area)     |                |
| lt_x_151           | DW_cmp           | apparch (area)     |                |
| gt_x_152           | DW_cmp           | apparch (area)     |                |
| gt_x_153           | DW_cmp           | apparch (area)     |                |
| gt_x_154           | DW_cmp           | apparch (area)     |                |
| gt_x_155           | DW_cmp           | apparch (area)     |                |
| add_x_6            | DW01_inc         | apparch (area)     |                |
| add_x_145          | DW01_add         | apparch (area)     |                |
| add_x_90           | DW01_inc         | apparch (area)     |                |
| DP_OP_254J1_122_9307                  |                    |                |
|                    | DP_OP_254J1_122_9307 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
===============================================================================

1
