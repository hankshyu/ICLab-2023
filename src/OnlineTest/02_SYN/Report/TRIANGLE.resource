 
****************************************
Report : resources
Design : TRIANGLE
Version: T-2022.03
Date   : Tue May  9 01:36:24 2023
****************************************

Resource Sharing Report for design TRIANGLE in file
        /RAID2/COURSE/iclab/iclab105/OT_2023_SPRING/01_RTL/TRIANGLE.v

===============================================================================
|          |              |            | Contained     |                      |
| Resource | Module       | Parameters | Resources     | Contained Operations |
===============================================================================
| r499     | DW_cmp       | width=18   |               | gte_163 gte_166      |
| r501     | DW_cmp       | width=18   |               | gte_164 gte_167      |
| r503     | DW_cmp       | width=18   |               | gte_165 gte_168      |
| r549     | DW01_inc     | width=6    |               | add_118              |
| r557     | DW01_sub     | width=17   |               | sub_163              |
| r559     | DW01_sub     | width=17   |               | sub_164              |
| r561     | DW01_sub     | width=17   |               | sub_165              |
| r569     | DW01_inc     | width=16   |               | add_237_S2           |
| r571     | DW_cmp       | width=8    |               | gt_240               |
| r573     | DW_cmp       | width=8    |               | gt_240_2             |
| r575     | DW_cmp       | width=8    |               | gt_244               |
| r577     | DW01_inc     | width=16   |               | add_255_S2           |
| r579     | DW01_inc     | width=16   |               | add_261_S2           |
| r581     | DW_div_pipe  | a_width=30 |               | U1                   |
|          |              | b_width=17 |               |                      |
|          |              | tc_mode=0  |               |                      |
|          |              | rem_mode=1 |               |                      |
|          |              | num_stages=15 |            |                      |
|          |              | stall_mode=0 |             |                      |
|          |              | rst_mode=1 |               |                      |
|          |              | op_iso_mode=0 |            |                      |
| r1303    | DW01_sub     | width=18   |               | sub_1_root_sub_0_root_sub_29 |
| r1305    | DW01_add     | width=18   |               | add_0_root_sub_0_root_sub_29 |
| r2027    | DW01_sub     | width=18   |               | sub_1_root_sub_0_root_sub_28 |
| r2029    | DW01_add     | width=18   |               | add_0_root_sub_0_root_sub_28 |
| r2751    | DW01_sub     | width=18   |               | sub_1_root_sub_0_root_sub_30 |
| r2753    | DW01_add     | width=18   |               | add_0_root_sub_0_root_sub_30 |
| r3469    | DW_mult_uns  | a_width=8  |               | mult_144             |
|          |              | b_width=8  |               |                      |
| r4205    | DW_mult_uns  | a_width=8  |               | mult_145             |
|          |              | b_width=8  |               |                      |
| r4207    | DW_mult_uns  | a_width=8  |               | mult_146             |
|          |              | b_width=8  |               |                      |
| r4209    | DW_mult_uns  | a_width=9  |               | mult_170_2           |
|          |              | b_width=8  |               |                      |
| r4211    | DW_mult_uns  | a_width=9  |               | mult_171_2           |
|          |              | b_width=8  |               |                      |
| r4213    | DW_mult_uns  | a_width=9  |               | mult_172_2           |
|          |              | b_width=8  |               |                      |
===============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_0_root_sub_0_root_sub_29          |                    |                |
|                    | DW01_add         | rpl                |                |
| sub_1_root_sub_0_root_sub_29          |                    |                |
|                    | DW01_sub         | rpl                |                |
| add_0_root_sub_0_root_sub_28          |                    |                |
|                    | DW01_add         | rpl                |                |
| sub_1_root_sub_0_root_sub_28          |                    |                |
|                    | DW01_sub         | rpl                |                |
| add_0_root_sub_0_root_sub_30          |                    |                |
|                    | DW01_add         | rpl                |                |
| sub_1_root_sub_0_root_sub_30          |                    |                |
|                    | DW01_sub         | rpl                |                |
| mult_144           | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_172_2         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_171_2         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_170_2         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_146           | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_145           | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| add_237_S2         | DW01_inc         | rpl                |                |
| add_255_S2         | DW01_inc         | rpl                |                |
| add_261_S2         | DW01_inc         | rpl                |                |
| U1                 | DW_div_pipe      | str                |                |
===============================================================================

1
