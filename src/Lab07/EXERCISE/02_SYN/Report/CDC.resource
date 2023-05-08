 
****************************************
Report : resources
Design : CDC
Version: T-2022.03
Date   : Tue May  9 02:00:02 2023
****************************************


Resource Report for this hierarchy in file
        /RAID2/COURSE/iclab/iclab105/Lab07/EXERCISE/01_RTL/CDC.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_1        | DW_cmp         | width=13   | gte_67 (CDC.v:67)          |
| gte_x_2        | DW_cmp         | width=13   | gte_70 (CDC.v:70)          |
| sub_x_7        | DW01_sub       | width=4    | sub_172 (CDC.v:172)        |
| sub_x_8        | DW01_dec       | width=4    | sub_175 (CDC.v:175)        |
| add_x_13       | DW01_inc       | width=13   | add_185_S2 (CDC.v:185)     |
| lt_x_16        | DW_cmp         | width=4    | lt_218 (CDC.v:218)         |
| add_x_52       | DW01_add       | width=5    | afifo/rptr_empty_m0/add_33 (rptr_empty.v:33) |
| eq_x_53        | DW_cmp         | width=5    | afifo/rptr_empty_m0/eq_38 (rptr_empty.v:38) |
| add_x_54       | DW01_add       | width=5    | afifo/wptr_full_m0/add_32 (wptr_full.v:32) |
| eq_x_55        | DW_cmp         | width=5    | afifo/wptr_full_m0/eq_37 (wptr_full.v:37) |
| add_x_6        | DW01_inc       | width=4    | add_166 (CDC.v:166)        |
|                |                |            | add_167 (CDC.v:167)        |
| DP_OP_81J1_122_2750             |            |                            |
|                | DP_OP_81J1_122_2750 |       |                            |
=============================================================================

Datapath Report for DP_OP_81J1_122_2750
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_81J1_122_2750  | mult_61 (CDC.v:61) add_270 (CDC.v:270)              |
|                      | add_270_2 (CDC.v:270) mult_62 (CDC.v:62)            |
|                      | mult_63 (CDC.v:63)                                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 3     |                                          |
| I3    | PI   | Unsigned | 8     |                                          |
| I4    | PI   | Unsigned | 3     |                                          |
| I5    | PI   | Unsigned | 8     |                                          |
| I6    | PI   | Unsigned | 3     |                                          |
| T0    | IFO  | Unsigned | 11    | I1 * I2 (CDC.v:61)                       |
| T1    | IFO  | Unsigned | 11    | I3 * I4 (CDC.v:62)                       |
| T2    | IFO  | Unsigned | 11    | I5 * I6 (CDC.v:63)                       |
| O1    | PO   | Unsigned | 13    | T0 + T1 + T2 (CDC.v:270)                 |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| gte_x_1            | DW_cmp           | apparch (area)     |                |
| gte_x_2            | DW_cmp           | apparch (area)     |                |
| sub_x_7            | DW01_sub         | apparch (area)     |                |
| sub_x_8            | DW01_dec         | apparch (area)     |                |
| add_x_13           | DW01_inc         | pparch (area,speed)                 |
| lt_x_16            | DW_cmp           | apparch (area)     |                |
| add_x_52           | DW01_add         | apparch (area)     |                |
| eq_x_53            | DW_cmp           | apparch (area)     |                |
| add_x_54           | DW01_add         | apparch (area)     |                |
| eq_x_55            | DW_cmp           | apparch (area)     |                |
| add_x_6            | DW01_inc         | apparch (area)     |                |
| DP_OP_81J1_122_2750                   |                    |                |
|                    | DP_OP_81J1_122_2750 | str (area,speed)                 |
|                    |                  | mult_arch: and     |                |
===============================================================================

1
