 
****************************************
Report : resources
Design : VIP
Version: R-2020.09
Date   : Wed Mar 15 22:45:25 2023
****************************************


Resource Report for this hierarchy in file
        /RAID2/COURSE/iclab/iclab105/Desktop/Lab04/Practice/01_RTL/VIP.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=3    | add_61 (VIP.v:61)          |
| mult1          | DW_fp_mult     | sig_width=23 | mult1 (VIP.v:50)         |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
| add1           | DW_fp_add      | sig_width=23 | add1 (VIP.v:56)          |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy add1
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=23 | U1                       |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy mult1 in file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=8    | add_333                    |
| lte_x_3        | DW_cmp         | width=10   | lte_344                    |
| gte_x_5        | DW_cmp         | width=9    | gte_354                    |
| gte_x_7        | DW_cmp         | width=9    | gte_356                    |
| add_x_14       | DW01_add       | width=7    | add_445_4                  |
| mult_x_15      | DW_mult_uns    | a_width=24 | mult_452                   |
|                |                | b_width=24 |                            |
| eq_x_16        | DW_cmp         | width=10   | eq_453                     |
| lt_x_19        | DW_cmp         | width=8    | lt_474                     |
| lt_x_21        | DW_cmp         | width=8    | lt_479                     |
| add_x_22       | DW01_add       | width=24   | add_484                    |
| U1             | DW_lzd         | a_width=24 | U1                         |
| U2             | DW_lzd         | a_width=24 | U2                         |
| U3             | DW_lzd         | a_width=24 | U3                         |
| U4             | DW_lzd         | a_width=24 | U4                         |
| sub_x_35       | DW01_sub       | width=9    | add_330_4 sub_330_3        |
| add_x_36       | DW01_add       | width=10   | add_330_4 sub_330_3        |
=============================================================================


Resource Report for Ungrouped Hierarchy *cell*13937/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=27 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy add1/U1 in file
        ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=31   | lt_210                     |
| ashr_5         | DW_rightsh     | A_width=26 | srl_269_lsb_trim           |
|                |                | SH_width=8 |                            |
| ash_6          | DW_leftsh      | A_width=26 | sll_271                    |
|                |                | SH_width=8 |                            |
| ash_8          | DW_leftsh      | A_width=27 | sll_322                    |
|                |                | SH_width=6 |                            |
| add_x_9        | DW01_add       | width=5    | add_324                    |
| add_x_16       | DW01_inc       | width=23   | add_372                    |
| U2             | DW_lzd         | a_width=28 | U2                         |
| U1             | DW_norm        | a_width=27 | U1                         |
|                |                | srch_wind=3 |                           |
|                |                | exp_width=6 |                           |
|                |                | exp_ctr=0  |                            |
| DP_OP_65_133_7885               |            |                            |
|                | DP_OP_65_133_7885 |         |                            |
| DP_OP_66_134_3163               |            |                            |
|                | DP_OP_66_134_3163 |         |                            |
| DP_OP_67_135_9752               |            |                            |
|                | DP_OP_67_135_9752 |         |                            |
=============================================================================

Datapath Report for DP_OP_65_133_7885
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_65_133_7885    | sub_263 sub_add_265 add_265_ni                      |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| T64   | IFO  | Signed   | 8     | O1[7:0]                                  |
| O1    | PO   | Signed   | 9     | I1 - I2                                  |
| O2    | PO   | Signed   | 8     | -T64 + $unsigned(8'b00000000)            |
==============================================================================

Datapath Report for DP_OP_66_134_3163
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66_134_3163    | add_280 add_280_2                                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 27    |                                          |
| I2    | PI   | Unsigned | 28    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Unsigned | 28    | I1 + I2 + I3                             |
==============================================================================

Datapath Report for DP_OP_67_135_9752
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67_135_9752    | add_376 sub_377                                     |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 5     |                                          |
| O1    | PO   | Unsigned | 9     | I1 + $unsigned(1'b1)                     |
| O2    | PO   | Signed   | 10    | O1 - I2                                  |
==============================================================================


Resource Report for Ungrouped Hierarchy mult1/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy add1/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy mult1/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_x_2            | DW01_inc         | apparch (area)     |                |
| mult1              | DW_fp_mult       | rtl                |                |
| add1               | DW_fp_add        | rtl                |                |
| U1                 | DW_fp_addsub     | str                |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_14           | DW01_add         | apparch (area)     |                |
| mult_x_15          | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_16            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| lt_x_21            | DW_cmp           | apparch (area)     |                |
| add_x_22           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | rtl                |                |
| U4                 | DW_lzd           | rtl                |                |
| sub_x_35           | DW01_sub         | apparch (area)     |                |
| add_x_36           | DW01_add         | apparch (area)     |                |
| U2                 | DW01_ash         | astr (area)        |                |
| lt_x_1             | DW_cmp           | pparch (area,speed)                 |
| ashr_5             | DW_rightsh       | astr (area)        |                |
| ash_6              | DW_leftsh        | astr (area)        |                |
| ash_8              | DW_leftsh        | astr (area)        |                |
| add_x_9            | DW01_add         | apparch (area)     |                |
| add_x_16           | DW01_inc         | pparch (area,speed)                 |
| U2                 | DW_lzd           | cla                |                |
| U1                 | DW_norm          | rtl                |                |
| DP_OP_65_133_7885  | DP_OP_65_133_7885 | str (area,speed)  |                |
| DP_OP_66_134_3163  | DP_OP_66_134_3163 | str (area,speed)  |                |
| DP_OP_67_135_9752  | DP_OP_67_135_9752 | str (area,speed)  |                |
===============================================================================

1
