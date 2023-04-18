Warning: Design 'MMT' has '3' unresolved references. For more detailed information, use the "link" command. (UID-341)
 
****************************************
Report : resources
Design : MMT
Version: T-2022.03
Date   : Wed Apr 19 02:01:24 2023
****************************************

Resource Sharing Report for design MMT in file
        /RAID2/COURSE/iclab/iclab105/oldarchive/Lab05/Exercise/01_RTL/MMT.v

===============================================================================
|          |              |            | Contained     |                      |
| Resource | Module       | Parameters | Resources     | Contained Operations |
===============================================================================
| r935     | DW_cmp       | width=12   |               | eq_131 eq_302 eq_424 |
| r936     | DW_cmp       | width=12   |               | eq_132 eq_425        |
| r937     | DW_cmp       | width=4    |               | eq_141_3 eq_143_3    |
|          |              |            |               | eq_149 eq_161 eq_168 |
|          |              |            |               | eq_318 eq_321 eq_335 |
|          |              |            |               | eq_340 eq_342_2      |
|          |              |            |               | eq_343 eq_349 eq_357 |
|          |              |            |               | eq_376 eq_385 eq_396 |
|          |              |            |               | eq_397 eq_463_3      |
|          |              |            |               | eq_464_2 eq_469_3    |
|          |              |            |               | eq_470_2             |
| r938     | DW_cmp       | width=4    |               | eq_141 eq_147_2      |
|          |              |            |               | eq_149_2 eq_351_2    |
|          |              |            |               | eq_352 eq_357_2      |
|          |              |            |               | eq_358 eq_444        |
|          |              |            |               | eq_446_2 eq_447      |
|          |              |            |               | eq_449_2 eq_463      |
|          |              |            |               | eq_467 eq_476        |
|          |              |            |               | eq_478_2 eq_479      |
|          |              |            |               | eq_485 eq_506 eq_511 |
|          |              |            |               | eq_521 eq_522        |
| r939     | DW_cmp       | width=4    |               | eq_143 eq_147_3      |
|          |              |            |               | eq_149_3 eq_351_3    |
|          |              |            |               | eq_352_2 eq_357_3    |
|          |              |            |               | eq_358_2 eq_446      |
|          |              |            |               | eq_449 eq_461 eq_469 |
|          |              |            |               | eq_478 eq_483        |
|          |              |            |               | eq_485_2 eq_486      |
|          |              |            |               | eq_504 eq_513 eq_524 |
|          |              |            |               | eq_525               |
| r940     | DW_cmp       | width=4    |               | eq_141_2 eq_143_2    |
|          |              |            |               | eq_147 eq_159        |
|          |              |            |               | eq_168_2 eq_316      |
|          |              |            |               | eq_318_2 eq_319      |
|          |              |            |               | eq_321_2 eq_333      |
|          |              |            |               | eq_335_2 eq_336      |
|          |              |            |               | eq_342 eq_351 eq_355 |
|          |              |            |               | eq_378 eq_383 eq_393 |
|          |              |            |               | eq_394 eq_463_2      |
|          |              |            |               | eq_464 eq_469_2      |
|          |              |            |               | eq_470               |
| r941     | DW_cmp       | width=4    |               | eq_159_2 eq_161_2    |
|          |              |            |               | eq_279 eq_284        |
|          |              |            |               | eq_286_2 eq_287      |
|          |              |            |               | eq_378_3 eq_379_2    |
|          |              |            |               | eq_385_3 eq_386_2    |
|          |              |            |               | eq_506_3 eq_507_2    |
|          |              |            |               | eq_513_3 eq_514_2    |
| r942     | DW_cmp       | width=4    |               | eq_159_3 eq_161_3    |
|          |              |            |               | eq_277 eq_279_2      |
|          |              |            |               | eq_280 eq_286        |
|          |              |            |               | eq_378_2 eq_379      |
|          |              |            |               | eq_385_2 eq_386      |
|          |              |            |               | eq_506_2 eq_507      |
|          |              |            |               | eq_513_2 eq_514      |
| r944     | DW_cmp       | width=6    |               | eq_182 eq_577_2      |
|          |              |            |               | eq_578 eq_580_3      |
|          |              |            |               | eq_581_2             |
| r945     | DW01_inc     | width=6    |               | add_182 add_183      |
|          |              |            |               | add_187              |
| r946     | DW_cmp       | width=4    |               | eq_183 eq_638_2      |
| r949     | DW01_inc     | width=4    |               | add_277 add_287_S2   |
| r950     | DW01_inc     | width=4    |               | add_280_S2 add_284   |
| r951     | DW01_inc     | width=4    |               | add_316 add_333      |
|          |              |            |               | add_343_S2           |
|          |              |            |               | add_352_S2 add_355   |
|          |              |            |               | add_379_S2 add_383   |
|          |              |            |               | add_393 add_397      |
| r952     | DW01_inc     | width=4    |               | add_319_S2           |
|          |              |            |               | add_336_S2 add_340   |
|          |              |            |               | add_349 add_358_S2   |
|          |              |            |               | add_376 add_386_S2   |
|          |              |            |               | add_394 add_396      |
| r954     | DW01_inc     | width=4    |               | add_444 add_464_S2   |
|          |              |            |               | add_467 add_476      |
|          |              |            |               | add_486_S2           |
|          |              |            |               | add_507_S2 add_511   |
|          |              |            |               | add_521 add_525      |
| r955     | DW01_inc     | width=4    |               | add_447_S2 add_461   |
|          |              |            |               | add_470_S2           |
|          |              |            |               | add_479_S2 add_483   |
|          |              |            |               | add_504 add_514_S2   |
|          |              |            |               | add_522 add_524      |
| r957     | DW_cmp       | width=4    |               | eq_577 eq_580_2      |
|          |              |            |               | eq_581 eq_588        |
|          |              |            |               | eq_591_2 eq_592      |
|          |              |            |               | eq_596 eq_598        |
| r958     | DW01_inc     | width=4    |               | add_578_S2           |
|          |              |            |               | add_589_S2 add_596   |
| r959     | DW_cmp       | width=4    |               | eq_580 eq_591        |
| r960     | DW01_inc     | width=4    |               | add_581_S2           |
|          |              |            |               | add_592_S2 add_598   |
| r961     | DW_cmp       | width=5    |               | eq_588_2 eq_589      |
|          |              |            |               | eq_591_3 eq_592_2    |
| r980     | DW01_inc     | width=4    |               | add_197              |
| r982     | DW01_inc     | width=4    |               | add_321_S2           |
| r984     | DW01_inc     | width=4    |               | add_449_S2           |
| r986     | DW01_dec     | width=5    |               | sub_635              |
| r988     | DW_cmp       | width=32   |               | eq_635_2             |
| r1712    | DW_mult_uns  | a_width=6  |               | mult_add_180_aco     |
|          |              | b_width=1  |               |                      |
| r1714    | DW01_inc     | width=6    |               | add_180_aco          |
| r2434    | DW_mult_uns  | a_width=6  |               | mult_add_185_aco     |
|          |              | b_width=1  |               |                      |
| r2436    | DW01_inc     | width=6    |               | add_185_aco          |
===============================================================================


No implementations to report
1
