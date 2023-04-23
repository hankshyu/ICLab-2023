 
****************************************
Report : resources
Design : IP
Version: T-2022.03
Date   : Fri Apr 21 00:35:42 2023
****************************************

Resource Sharing Report for design IP in file
        /RAID2/COURSE/iclab/iclab105/Lab08/PRACTICE/01_RTL/IP.v

===============================================================================
|          |              |            | Contained     |                      |
| Resource | Module       | Parameters | Resources     | Contained Operations |
===============================================================================
| r1420    | DW_cmp       | width=8    |               | gt_166 gt_171        |
| r1421    | DW_cmp       | width=8    |               | gt_167 gt_172        |
| r1422    | DW_cmp       | width=8    |               | gt_168 gt_173        |
| r1423    | DW_cmp       | width=8    |               | gt_169 gt_174        |
| r1472    | DW01_inc     | width=6    |               | add_161_S2           |
| r1474    | DW_cmp       | width=8    |               | gt_176               |
| r1476    | DW_cmp       | width=8    |               | gt_177               |
| r1478    | DW_cmp       | width=8    |               | gt_179               |
| r1480    | DW_cmp       | width=8    |               | gt_180               |
| r1482    | DW_cmp       | width=8    |               | gt_182               |
| r1484    | DW_cmp       | width=8    |               | gt_184               |
| r1486    | DW_cmp       | width=8    |               | gt_186               |
| r1488    | DW_cmp       | width=8    |               | gt_187               |
| r1516    | DW_div_uns   | a_width=12 |               | div_312_G8_G8        |
|          |              | b_width=4  |               |                      |
| r1518    | DW01_add     | width=9    |               | add_315_G8_G8        |
| r2277    | DW01_add     | width=10   |               | add_7_root_add_0_root_add_312_8_G8_G8 |
| r2279    | DW01_add     | width=12   |               | add_2_root_add_0_root_add_312_8_G8_G8 |
| r2281    | DW01_add     | width=11   |               | add_3_root_add_0_root_add_312_8_G8_G8 |
| r2283    | DW01_add     | width=12   |               | add_5_root_add_0_root_add_312_8_G8_G8 |
| r2285    | DW01_add     | width=12   |               | add_6_root_add_0_root_add_312_8_G8_G8 |
| r2287    | DW01_add     | width=12   |               | add_1_root_add_0_root_add_312_8_G8_G8 |
| r2289    | DW01_add     | width=12   |               | add_4_root_add_0_root_add_312_8_G8_G8 |
| r2291    | DW01_add     | width=12   |               | add_0_root_add_0_root_add_312_8_G8_G8 |
| r3029    | DW_mult_uns  | a_width=3  |               | mult_311_G8_G8       |
|          |              | b_width=12 |               |                      |
| r3031    | DW01_add     | width=12   |               | add_3_root_sub_0_root_sub_311_4_G8_G8 |
| r3033    | DW01_add     | width=12   |               | add_2_root_sub_0_root_sub_311_4_G8_G8 |
| r3035    | DW01_add     | width=12   |               | add_1_root_sub_0_root_sub_311_4_G8_G8 |
| r3037    | DW01_sub     | width=12   |               | sub_0_root_sub_0_root_sub_311_4_G8_G8 |
===============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| div_312_G8_G8      | DW_div_uns       | rpl                |                |
| add_0_root_add_0_root_add_312_8_G8_G8 |                    |                |
|                    | DW01_add         | rpl                |                |
| add_2_root_add_0_root_add_312_8_G8_G8 |                    |                |
|                    | DW01_add         | rpl                |                |
| add_7_root_add_0_root_add_312_8_G8_G8 |                    |                |
|                    | DW01_add         | rpl                |                |
| sub_0_root_sub_0_root_sub_311_4_G8_G8 |                    |                |
|                    | DW01_sub         | rpl                |                |
| add_1_root_sub_0_root_sub_311_4_G8_G8 |                    |                |
|                    | DW01_add         | rpl                |                |
| add_2_root_sub_0_root_sub_311_4_G8_G8 |                    |                |
|                    | DW01_add         | rpl                |                |
| add_3_root_sub_0_root_sub_311_4_G8_G8 |                    |                |
|                    | DW01_add         | rpl                |                |
| mult_311_G8_G8     | DW_mult_uns      | apparch (area)     |                |
| add_315_G8_G8      | DW01_add         | rpl                |                |
===============================================================================

1
