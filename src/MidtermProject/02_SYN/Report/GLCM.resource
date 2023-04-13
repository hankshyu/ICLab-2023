 
****************************************
Report : resources
Design : GLCM
Version: T-2022.03
Date   : Fri Apr 14 00:06:38 2023
****************************************


Resource Report for this hierarchy in file
        /RAID2/COURSE/iclab/iclab105/Midterm_project/01_RTL/GLCM.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_1        | DW01_add       | width=4    | add_176 (GLCM.v:176)       |
| add_x_2        | DW01_add       | width=4    | add_177 (GLCM.v:177)       |
| add_x_3        | DW01_add       | width=12   | add_185 (GLCM.v:185)       |
| add_x_59       | DW01_add       | width=14   | add_444 (GLCM.v:444)       |
| add_x_64       | DW01_inc       | width=8    | add_493 (GLCM.v:493)       |
| eq_x_81        | DW_cmp         | width=4    | eq_524 (GLCM.v:524)        |
| add_x_82       | DW01_inc       | width=4    | add_526 (GLCM.v:526)       |
| add_x_83       | DW01_inc       | width=4    | add_529 (GLCM.v:529)       |
| eq_x_113       | DW_cmp         | width=5    | eq_628 (GLCM.v:628)        |
| eq_x_114       | DW_cmp         | width=5    | eq_628_2 (GLCM.v:628)      |
| add_x_101      | DW01_inc       | width=10   | add_556_S2 (GLCM.v:556)    |
|                |                |            | add_559 (GLCM.v:559)       |
|                |                |            | add_563_S2 (GLCM.v:563)    |
|                |                |            | add_565 (GLCM.v:565)       |
| add_x_9        | DW01_inc       | width=2    | add_280_S2 (GLCM.v:280)    |
|                |                |            | add_283 (GLCM.v:283)       |
|                |                |            | add_285_S2 (GLCM.v:285)    |
|                |                |            | add_286 (GLCM.v:286)       |
| DP_OP_177_125_9713              |            |                            |
|                | DP_OP_177_125_9713 |        |                            |
=============================================================================

Datapath Report for DP_OP_177_125_9713
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_177_125_9713   | add_578 (GLCM.v:578) add_577 (GLCM.v:577)           |
|                      | add_578_2 (GLCM.v:578)                              |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 2     |                                          |
| O1    | PO   | Unsigned | 8     | I1 + I2 ( GLCM.v:577 GLCM.v:578 )        |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_x_1            | DW01_add         | apparch (area)     |                |
| add_x_2            | DW01_add         | apparch (area)     |                |
| add_x_3            | DW01_add         | pparch (area,speed)                 |
| add_x_59           | DW01_add         | apparch (area)     |                |
| add_x_64           | DW01_inc         | apparch (area)     |                |
| eq_x_81            | DW_cmp           | apparch (area)     |                |
| add_x_82           | DW01_inc         | apparch (area)     |                |
| add_x_83           | DW01_inc         | apparch (area)     |                |
| eq_x_113           | DW_cmp           | apparch (area)     |                |
| eq_x_114           | DW_cmp           | apparch (area)     |                |
| add_x_101          | DW01_inc         | apparch (area)     |                |
| add_x_9            | DW01_inc         | apparch (area)     |                |
| DP_OP_177_125_9713 | DP_OP_177_125_9713 | str (area,speed) |                |
===============================================================================

1
