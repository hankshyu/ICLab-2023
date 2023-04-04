 
****************************************
Report : resources
Design : INV_IP_demo
Version: R-2020.09
Date   : Mon Apr  3 02:47:09 2023
****************************************


Resource Report for this hierarchy in file ./../01_RTL/INV_IP.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gt_x_1         | DW_cmp         | width=7    | I_INV_IP/gt_70 (INV_IP.v:70) |
| div_4          | DW_div_uns     | a_width=7  | I_INV_IP/div_225 (INV_IP.v:225) |
            |                | b_width=7  |                            |
| div_5          | DW_div_uns     | a_width=7  | I_INV_IP/div_241_G2 (INV_IP.v:241) |
         |                | b_width=6  |                            |
| div_8          | DW_div_uns     | a_width=7  | I_INV_IP/div_241_G3 (INV_IP.v:241) |
         |                | b_width=6  |                            |
| div_11         | DW_div_uns     | a_width=7  | I_INV_IP/div_241_G4 (INV_IP.v:241) |
         |                | b_width=6  |                            |
| div_14         | DW_div_uns     | a_width=7  | I_INV_IP/div_241_G5 (INV_IP.v:241) |
         |                | b_width=6  |                            |
| div_17         | DW_div_uns     | a_width=7  | I_INV_IP/div_241_G6 (INV_IP.v:241) |
         |                | b_width=6  |                            |
| div_20         | DW_div_uns     | a_width=7  | I_INV_IP/div_241_G7 (INV_IP.v:241) |
         |                | b_width=6  |                            |
| div_23         | DW_div_uns     | a_width=7  | I_INV_IP/div_241_G8 (INV_IP.v:241) |
         |                | b_width=6  |                            |
| add_x_28       | DW01_add       | width=7    | I_INV_IP/add_260 (INV_IP.v:260) |
| eq_x_30        | DW_cmp         | width=6    | I_INV_IP/eq_244_G2 (INV_IP.v:244) |
          |                |            | I_INV_IP/eq_246_G2 (INV_IP.v:246) |
| DP_OP_75J1_122_7912             |            |                            |
|                | DP_OP_75J1_122_7912 |       |                            |
| DP_OP_76J1_123_2538             |            |                            |
|                | DP_OP_76J1_123_2538 |       |                            |
| DP_OP_77J1_124_2538             |            |                            |
|                | DP_OP_77J1_124_2538 |       |                            |
| DP_OP_78J1_125_2538             |            |                            |
|                | DP_OP_78J1_125_2538 |       |                            |
| DP_OP_79J1_126_2538             |            |                            |
|                | DP_OP_79J1_126_2538 |       |                            |
| DP_OP_80J1_127_2538             |            |                            |
|                | DP_OP_80J1_127_2538 |       |                            |
| DP_OP_81J1_128_744              |            |                            |
|                | DP_OP_81J1_128_744 |        |                            |
=============================================================================

Datapath Report for DP_OP_75J1_122_7912
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_75J1_122_7912  | I_INV_IP/mult_230 (INV_IP.v:230)                    |
|                      | I_INV_IP/sub_230 (INV_IP.v:230)                     |
|                      | I_INV_IP/mult_246_G2 (INV_IP.v:246)                 |
|                      | I_INV_IP/sub_246_G2 (INV_IP.v:246)                  |
|                      | I_INV_IP/sub_246_G3 (INV_IP.v:246)                  |
|                      | I_INV_IP/mult_246_G3 (INV_IP.v:246)                 |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Signed   | 6     |                                          |
| I2    | PI   | Signed   | 6     |                                          |
| I3    | PI   | Signed   | 6     |                                          |
| I4    | PI   | Unsigned | 6     |                                          |
| I5    | PI   | Unsigned | 6     |                                          |
| I6    | PI   | Unsigned | 6     |                                          |
| T5    | IFO  | Unsigned | 6     | I1 * I2 (INV_IP.v:230)                   |
| T13   | IFO  | Unsigned | 6     | I4 * O1 (INV_IP.v:246)                   |
| T20   | IFO  | Unsigned | 6     | I5 * I6 (INV_IP.v:246)                   |
| O1    | PO   | Signed   | 6     | I3 - T5 (INV_IP.v:230)                   |
| O2    | PO   | Signed   | 6     | I2 - T13 (INV_IP.v:246)                  |
| O3    | PO   | Signed   | 6     | O1 - T20 (INV_IP.v:246)                  |
==============================================================================

Datapath Report for DP_OP_76J1_123_2538
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_76J1_123_2538  | I_INV_IP/mult_246_G4 (INV_IP.v:246)                 |
|                      | I_INV_IP/sub_246_G4 (INV_IP.v:246)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 6     |                                          |
| I2    | PI   | Unsigned | 6     |                                          |
| I3    | PI   | Unsigned | 6     |                                          |
| T27   | IFO  | Unsigned | 6     | I1 * I2 (INV_IP.v:246)                   |
| O1    | PO   | Signed   | 6     | I3 - T27 (INV_IP.v:246)                  |
==============================================================================

Datapath Report for DP_OP_77J1_124_2538
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_77J1_124_2538  | I_INV_IP/mult_246_G5 (INV_IP.v:246)                 |
|                      | I_INV_IP/sub_246_G5 (INV_IP.v:246)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 6     |                                          |
| I2    | PI   | Unsigned | 6     |                                          |
| I3    | PI   | Unsigned | 6     |                                          |
| T34   | IFO  | Unsigned | 6     | I1 * I2 (INV_IP.v:246)                   |
| O1    | PO   | Signed   | 6     | I3 - T34 (INV_IP.v:246)                  |
==============================================================================

Datapath Report for DP_OP_78J1_125_2538
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_78J1_125_2538  | I_INV_IP/mult_246_G6 (INV_IP.v:246)                 |
|                      | I_INV_IP/sub_246_G6 (INV_IP.v:246)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 6     |                                          |
| I2    | PI   | Unsigned | 6     |                                          |
| I3    | PI   | Unsigned | 6     |                                          |
| T41   | IFO  | Unsigned | 6     | I1 * I2 (INV_IP.v:246)                   |
| O1    | PO   | Signed   | 6     | I3 - T41 (INV_IP.v:246)                  |
==============================================================================

Datapath Report for DP_OP_79J1_126_2538
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_79J1_126_2538  | I_INV_IP/mult_246_G7 (INV_IP.v:246)                 |
|                      | I_INV_IP/sub_246_G7 (INV_IP.v:246)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 6     |                                          |
| I2    | PI   | Unsigned | 6     |                                          |
| I3    | PI   | Unsigned | 6     |                                          |
| T48   | IFO  | Unsigned | 6     | I1 * I2 (INV_IP.v:246)                   |
| O1    | PO   | Signed   | 6     | I3 - T48 (INV_IP.v:246)                  |
==============================================================================

Datapath Report for DP_OP_80J1_127_2538
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_80J1_127_2538  | I_INV_IP/mult_246_G8 (INV_IP.v:246)                 |
|                      | I_INV_IP/sub_246_G8 (INV_IP.v:246)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 6     |                                          |
| I2    | PI   | Unsigned | 6     |                                          |
| I3    | PI   | Unsigned | 6     |                                          |
| T55   | IFO  | Unsigned | 6     | I1 * I2 (INV_IP.v:246)                   |
| O1    | PO   | Signed   | 6     | I3 - T55 (INV_IP.v:246)                  |
==============================================================================

Datapath Report for DP_OP_81J1_128_744
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_81J1_128_744   | I_INV_IP/sub_mult_227 (INV_IP.v:227)                |
|                      | I_INV_IP/mult_243_G2 (INV_IP.v:243)                 |
|                      | I_INV_IP/sub_243_G2 (INV_IP.v:243)                  |
|                      | I_INV_IP/mult_243_G3 (INV_IP.v:243)                 |
|                      | I_INV_IP/sub_243_G3 (INV_IP.v:243)                  |
|                      | I_INV_IP/mult_243_G4 (INV_IP.v:243)                 |
|                      | I_INV_IP/sub_243_G4 (INV_IP.v:243)                  |
|                      | I_INV_IP/mult_243_G5 (INV_IP.v:243)                 |
|                      | I_INV_IP/sub_243_G5 (INV_IP.v:243)                  |
|                      | I_INV_IP/mult_243_G6 (INV_IP.v:243)                 |
|                      | I_INV_IP/sub_243_G6 (INV_IP.v:243)                  |
|                      | I_INV_IP/mult_243_G7 (INV_IP.v:243)                 |
|                      | I_INV_IP/sub_243_G7 (INV_IP.v:243)                  |
|                      | I_INV_IP/mult_243_G8 (INV_IP.v:243)                 |
|                      | I_INV_IP/sub_243_G8 (INV_IP.v:243)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 6     |                                          |
| I2    | PI   | Unsigned | 6     |                                          |
| I3    | PI   | Unsigned | 6     |                                          |
| I4    | PI   | Signed   | 7     |                                          |
| I5    | PI   | Unsigned | 6     |                                          |
| I6    | PI   | Signed   | 7     |                                          |
| I7    | PI   | Unsigned | 6     |                                          |
| I8    | PI   | Signed   | 7     |                                          |
| I9    | PI   | Unsigned | 6     |                                          |
| I10   | PI   | Signed   | 7     |                                          |
| I11   | PI   | Unsigned | 6     |                                          |
| I12   | PI   | Signed   | 7     |                                          |
| I13   | PI   | Unsigned | 6     |                                          |
| I14   | PI   | Signed   | 7     |                                          |
| T8    | IFO  | Unsigned | 7     | I2 * O1 (INV_IP.v:243)                   |
| T17   | IFO  | Unsigned | 7     | I3 * O2 (INV_IP.v:243)                   |
| T24   | IFO  | Unsigned | 7     | I5 * O3 (INV_IP.v:243)                   |
| T31   | IFO  | Unsigned | 7     | I7 * O4 (INV_IP.v:243)                   |
| T38   | IFO  | Unsigned | 7     | I9 * O5 (INV_IP.v:243)                   |
| T45   | IFO  | Unsigned | 7     | I11 * O6 (INV_IP.v:243)                  |
| T52   | IFO  | Unsigned | 7     | I13 * O7 (INV_IP.v:243)                  |
| O1    | PO   | Signed   | 7     | $signed(1'b0) - I1 (INV_IP.v:227)        |
| O2    | PO   | Signed   | 7     | $unsigned(1'b1) - T8 (INV_IP.v:243)      |
| O3    | PO   | Signed   | 7     | I4 - T17 (INV_IP.v:243)                  |
| O4    | PO   | Signed   | 7     | I6 - T24 (INV_IP.v:243)                  |
| O5    | PO   | Signed   | 7     | I8 - T31 (INV_IP.v:243)                  |
| O6    | PO   | Signed   | 7     | I10 - T38 (INV_IP.v:243)                 |
| O7    | PO   | Signed   | 7     | I12 - T45 (INV_IP.v:243)                 |
| O8    | PO   | Signed   | 7     | I14 - T52 (INV_IP.v:243)                 |
==============================================================================


Resource Report for Ungrouped Hierarchy div_23
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_20
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_17
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_14
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_11
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_8
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_5
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy div_4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'I_INV_IP/sub_246_G2 (INV_IP.v:246)' in design 'INV_IP_demo' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'I_INV_IP/C291 (INV_IP.v:246)'.  (HDL-120)

Information: Operator associated with resources 'I_INV_IP/sub_246_G3 (INV_IP.v:246)' in design 'INV_IP_demo' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'I_INV_IP/C293 (INV_IP.v:246)'.  (HDL-120)

Information: Operator associated with resources 'I_INV_IP/sub_246_G4 (INV_IP.v:246)' in design 'INV_IP_demo' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'I_INV_IP/C295 (INV_IP.v:246)'.  (HDL-120)

Information: Operator associated with resources 'I_INV_IP/sub_246_G5 (INV_IP.v:246)' in design 'INV_IP_demo' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'I_INV_IP/C297 (INV_IP.v:246)'.  (HDL-120)

Information: Operator associated with resources 'I_INV_IP/sub_246_G6 (INV_IP.v:246)' in design 'INV_IP_demo' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'I_INV_IP/C299 (INV_IP.v:246)'.  (HDL-120)

Information: Operator associated with resources 'I_INV_IP/sub_246_G7 (INV_IP.v:246)' in design 'INV_IP_demo' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'I_INV_IP/C301 (INV_IP.v:246)'.  (HDL-120)

Information: Operator associated with resources 'I_INV_IP/sub_mult_227 (INV_IP.v:227)' in design 'INV_IP_demo' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'I_INV_IP/div_225 (INV_IP.v:225)'.  (HDL-120)

Information: Operator associated with resources 'I_INV_IP/mult_243_G2 (INV_IP.v:243)' in design 'INV_IP_demo' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'I_INV_IP/div_241_G2 (INV_IP.v:241)'.  (HDL-120)

Information: Operator associated with resources 'I_INV_IP/mult_243_G3 (INV_IP.v:243)' in design 'INV_IP_demo' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'I_INV_IP/div_241_G3 (INV_IP.v:241)'.  (HDL-120)

Information: Operator associated with resources 'I_INV_IP/mult_243_G4 (INV_IP.v:243)' in design 'INV_IP_demo' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'I_INV_IP/div_241_G4 (INV_IP.v:241)'.  (HDL-120)

Information: Operator associated with resources 'I_INV_IP/mult_243_G5 (INV_IP.v:243)' in design 'INV_IP_demo' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'I_INV_IP/div_241_G5 (INV_IP.v:241)'.  (HDL-120)

Information: Operator associated with resources 'I_INV_IP/mult_243_G6 (INV_IP.v:243)' in design 'INV_IP_demo' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'I_INV_IP/div_241_G6 (INV_IP.v:241)'.  (HDL-120)

Information: Operator associated with resources 'I_INV_IP/mult_243_G7 (INV_IP.v:243)' in design 'INV_IP_demo' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'I_INV_IP/div_241_G7 (INV_IP.v:241)'.  (HDL-120)

Information: Operator associated with resources 'I_INV_IP/mult_243_G8 (INV_IP.v:243)' in design 'INV_IP_demo' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'I_INV_IP/div_241_G8 (INV_IP.v:241)'.  (HDL-120)

Information: Operator associated with resources 'I_INV_IP/sub_243_G8 (INV_IP.v:243)' in design 'INV_IP_demo' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'I_INV_IP/C304 (INV_IP.v:254)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| gt_x_1             | DW_cmp           | apparch (area)     |                |
| div_4              | DW_div_uns       | cla                |                |
| div_5              | DW_div_uns       | cla                |                |
| div_8              | DW_div_uns       | cla                |                |
| div_11             | DW_div_uns       | cla                |                |
| div_14             | DW_div_uns       | cla                |                |
| div_17             | DW_div_uns       | cla                |                |
| div_20             | DW_div_uns       | cla                |                |
| div_23             | DW_div_uns       | cla                |                |
| add_x_28           | DW01_add         | apparch (area)     |                |
| eq_x_30            | DW_cmp           | apparch (area)     |                |
| DP_OP_75J1_122_7912                   |                    |                |
|                    | DP_OP_75J1_122_7912 | str (area)      |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_76J1_123_2538                   |                    |                |
|                    | DP_OP_76J1_123_2538 | str (area)      |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_77J1_124_2538                   |                    |                |
|                    | DP_OP_77J1_124_2538 | str (area)      |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_78J1_125_2538                   |                    |                |
|                    | DP_OP_78J1_125_2538 | str (area)      |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_79J1_126_2538                   |                    |                |
|                    | DP_OP_79J1_126_2538 | str (area)      |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_80J1_127_2538                   |                    |                |
|                    | DP_OP_80J1_127_2538 | str (area)      |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_81J1_128_744 | DP_OP_81J1_128_744 | str (area)       |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
===============================================================================

1
