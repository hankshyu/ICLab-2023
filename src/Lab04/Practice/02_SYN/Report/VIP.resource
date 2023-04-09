 
****************************************
Report : resources
Design : VIP
Version: T-2022.03
Date   : Mon Apr 10 01:14:14 2023
****************************************


Resource Report for this hierarchy in file
        /RAID2/COURSE/iclab/iclab105/oldarchive/Lab04/Practice/01_RTL/VIP.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_5        | DW01_inc       | width=10   | add_149 (VIP.v:149)        |
| M0             | DW_fp_mult     | sig_width=23 | M0 (VIP.v:57)            |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
| A0             | DW_fp_add      | sig_width=23 | A0 (VIP.v:58)            |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
| gt_x_10        | DW_cmp         | width=10   | gt_117 (VIP.v:117)         |
|                |                |            | gt_130 (VIP.v:130)         |
=============================================================================


Resource Report for Ungrouped Hierarchy A0
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U1             | DW_fp_addsub   | sig_width=23 | U1                       |
|                |                | exp_width=8 |                           |
|                |                | ieee_compliance=0 |                     |
=============================================================================


Resource Report for Ungrouped Hierarchy M0 in file ./DW_fp_mult__rtl.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_2        | DW01_inc       | width=8    | add_366                    |
| lte_x_3        | DW_cmp         | width=10   | lte_374                    |
| gte_x_5        | DW_cmp         | width=9    | gte_384                    |
| gte_x_7        | DW_cmp         | width=9    | gte_386                    |
| add_x_12       | DW01_add       | width=7    | add_471_4                  |
| mult_x_13      | DW_mult_uns    | a_width=24 | mult_477                   |
|                |                | b_width=24 |                            |
| eq_x_14        | DW_cmp         | width=10   | eq_478                     |
| lt_x_17        | DW_cmp         | width=8    | lt_492                     |
| lt_x_19        | DW_cmp         | width=8    | lt_497                     |
| add_x_20       | DW01_add       | width=24   | add_501                    |
| U1             | DW_lzd         | a_width=24 | U1                         |
| U2             | DW_lzd         | a_width=24 | U2                         |
| U3             | DW_lzd         | a_width=24 | U3                         |
| U4             | DW_lzd         | a_width=24 | U4                         |
| sub_x_33       | DW01_sub       | width=9    | add_363 sub_363            |
| add_x_34       | DW01_add       | width=10   | add_363 sub_363            |
=============================================================================


Resource Report for Ungrouped Hierarchy *cell*14892/U1 in file
        ./DW_norm_rtl.vhd.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| U2             | DW01_ash       | A_width=27 | U2                         |
|                |                | SH_width=3 |                            |
=============================================================================


Resource Report for Ungrouped Hierarchy A0/U1 in file ./DW_fp_addsub__str.v.e
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_1         | DW_cmp         | width=31   | lt_223                     |
| ashr_5         | DW_rightsh     | A_width=26 | srl_283_lsb_trim           |
|                |                | SH_width=8 |                            |
| ash_6          | DW_leftsh      | A_width=26 | sll_285                    |
|                |                | SH_width=8 |                            |
| ash_8          | DW_leftsh      | A_width=27 | sll_337                    |
|                |                | SH_width=6 |                            |
| add_x_9        | DW01_add       | width=5    | add_339                    |
| add_x_16       | DW01_inc       | width=23   | add_398                    |
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
| DP_OP_65_133_7885    | sub_277 sub_add_279 add_279_ni                      |
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
| DP_OP_66_134_3163    | add_294 add_294_2                                   |
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
| DP_OP_67_135_9752    | add_402 sub_403                                     |
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


Resource Report for Ungrouped Hierarchy M0/U3
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy A0/U1/U2
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Resource Report for Ungrouped Hierarchy M0/U4
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
=============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_x_5            | DW01_inc         | apparch (area)     |                |
| M0                 | DW_fp_mult       | rtl                |                |
| A0                 | DW_fp_add        | rtl                |                |
| gt_x_10            | DW_cmp           | apparch (area)     |                |
| U1                 | DW_fp_addsub     | str                |                |
| add_x_2            | DW01_inc         | apparch (area)     |                |
| lte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| add_x_12           | DW01_add         | apparch (area)     |                |
| mult_x_13          | DW_mult_uns      | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| add_x_20           | DW01_add         | pparch (area,speed)                 |
| U3                 | DW_lzd           | rtl                |                |
| U4                 | DW_lzd           | rtl                |                |
| sub_x_33           | DW01_sub         | apparch (area)     |                |
| add_x_34           | DW01_add         | apparch (area)     |                |
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
