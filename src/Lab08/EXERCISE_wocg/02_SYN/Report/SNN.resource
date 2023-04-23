 
****************************************
Report : resources
Design : SNN
Version: T-2022.03
Date   : Sun Apr 23 01:30:57 2023
****************************************

Resource Sharing Report for design SNN in file
        /RAID2/COURSE/iclab/iclab105/Lab08/EXERCISE_wocg/01_RTL/SNN_wocg.v

===============================================================================
|          |              |            | Contained     |                      |
| Resource | Module       | Parameters | Resources     | Contained Operations |
===============================================================================
| r597     | DW01_inc     | width=7    |               | add_131 add_132      |
|          |              |            |               | add_133 add_134      |
| r598     | DW_cmp       | width=7    |               | lt_160 lt_165        |
| r601     | DW01_inc     | width=4    |               | add_382 add_384      |
| r602     | DW_cmp       | width=8    |               | gt_497 gt_498        |
| r603     | DW_cmp       | width=8    |               | gt_507 gt_508        |
| r604     | DW_cmp       | width=8    |               | gt_511 gt_512        |
| r605     | DW_cmp       | width=8    |               | gt_522 gt_523        |
| r671     | DW_div_uns   | a_width=20 |               | div_82               |
|          |              | b_width=12 |               |                      |
| r673     | DW_cmp       | width=8    |               | gt_88                |
| r675     | DW01_sub     | width=8    |               | sub_93               |
| r677     | DW_cmp       | width=7    |               | gte_380              |
| r679     | DW_cmp       | width=7    |               | lte_380              |
| r683     | DW01_add     | width=11   |               | add_551              |
| r685     | DW01_add     | width=10   |               | add_551_2            |
| r1412    | DW_mult_uns  | a_width=8  |               | mult_64              |
|          |              | b_width=8  |               |                      |
| r1414    | DW_mult_uns  | a_width=8  |               | mult_64_G2           |
|          |              | b_width=8  |               |                      |
| r1416    | DW01_add     | width=17   |               | add_69               |
| r2203    | DW_mult_uns  | a_width=8  |               | mult_64_G3           |
|          |              | b_width=8  |               |                      |
| r2205    | DW_mult_uns  | a_width=8  |               | mult_64_G4           |
|          |              | b_width=8  |               |                      |
| r2207    | DW_mult_uns  | a_width=8  |               | mult_64_G5           |
|          |              | b_width=8  |               |                      |
| r2209    | DW_mult_uns  | a_width=8  |               | mult_64_G6           |
|          |              | b_width=8  |               |                      |
| r2211    | DW_mult_uns  | a_width=8  |               | mult_64_G7           |
|          |              | b_width=8  |               |                      |
| r2213    | DW_mult_uns  | a_width=8  |               | mult_64_G8           |
|          |              | b_width=8  |               |                      |
| r2215    | DW_mult_uns  | a_width=8  |               | mult_64_G9           |
|          |              | b_width=8  |               |                      |
| r2217    | DW01_add     | width=19   |               | add_3_root_add_0_root_add_75_4 |
| r2219    | DW01_add     | width=18   |               | add_5_root_add_0_root_add_75_4 |
| r2221    | DW01_add     | width=18   |               | add_6_root_add_0_root_add_75_4 |
| r2223    | DW01_add     | width=19   |               | add_2_root_add_0_root_add_75_4 |
| r2225    | DW01_add     | width=20   |               | add_4_root_add_0_root_add_75_4 |
| r2227    | DW01_add     | width=20   |               | add_1_root_add_0_root_add_75_4 |
| r2229    | DW01_add     | width=20   |               | add_0_root_add_0_root_add_75_4 |
| r2949    | DW_mult_uns  | a_width=10 |               | mult_add_537_S2_aco  |
|          |              | b_width=1  |               |                      |
| r2951    | DW01_add     | width=10   |               | add_537_S2_aco       |
===============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| div_82/u_div/u_add_PartRem_6_1        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_5_5        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_5_1        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_4_4        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_4_2        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_4_6        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_0_2        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_0_6        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_6_2        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_5_4        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_5_2        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_5_6        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_3_2        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_3_1        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_3_6        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_3_4        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_3_7        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_3_5        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_3_3        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_B3                 |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_0_1        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_5_3        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_B5                 |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_B6                 |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_1_5        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_1_3        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_5_7        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_2_5        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_2_3        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_2_6        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_2_1        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_1_6        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_1_1        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_1_7        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_2_2        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_1_2        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_2_7        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_4_1        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_0_7        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_0_5        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_0_3        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_0_4        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_2_4        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_4_7        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_4_5        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_4_3        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_PartRem_1_4        |                    |                |
|                    | DW01_add         | pparch (area,speed) | pparch        |
| div_82/u_div/u_add_B7                 |                    |                |
|                    | DW01_sub         | pparch (speed)     | pparch         |
| div_82/u_div/u_add_PartRem_6_3        |                    |                |
|                    | DW01_add         | pparch (speed)     | pparch         |
| add_69             | DW01_add         | rpl                |                |
| mult_64_G2         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_64            | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| add_0_root_add_0_root_add_75_4        |                    |                |
|                    | DW01_add         | rpl                |                |
| add_1_root_add_0_root_add_75_4        |                    |                |
|                    | DW01_add         | rpl                |                |
| add_4_root_add_0_root_add_75_4        |                    |                |
|                    | DW01_add         | rpl                |                |
| add_2_root_add_0_root_add_75_4        |                    |                |
|                    | DW01_add         | rpl                |                |
| add_6_root_add_0_root_add_75_4        |                    |                |
|                    | DW01_add         | rpl                |                |
| add_3_root_add_0_root_add_75_4        |                    |                |
|                    | DW01_add         | rpl                |                |
| add_5_root_add_0_root_add_75_4        |                    |                |
|                    | DW01_add         | rpl                |                |
| mult_64_G9         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_64_G8         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_64_G7         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_64_G6         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_64_G5         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_64_G4         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| mult_64_G3         | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| add_537_S2_aco     | DW01_add         | rpl                |                |
| r597               | DW01_inc         | rpl                |                |
| sub_93             | DW01_sub         | rpl                |                |
| add_551            | DW01_add         | rpl                |                |
| add_551_2          | DW01_add         | rpl                |                |
===============================================================================

1
