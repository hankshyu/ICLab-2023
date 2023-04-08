 
****************************************
Report : resources
Design : SUBWAY
Version: T-2022.03
Date   : Sun Apr  9 02:23:57 2023
****************************************


Resource Report for this hierarchy in file
        /RAID2/COURSE/iclab/iclab105/oldarchive/Lab03/Exercise/01_RTL/SUBWAY.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| lt_x_2         | DW_cmp         | width=7    | lt_100 (SUBWAY.v:100)      |
| gte_x_3        | DW_cmp         | width=7    | gte_111 (SUBWAY.v:111)     |
| add_x_100      | DW01_inc       | width=6    | add_418 (SUBWAY.v:418)     |
| sub_x_7        | DW01_dec       | width=2    | sub_146 (SUBWAY.v:146)     |
|                |                |            | sub_146_2 (SUBWAY.v:146)   |
|                |                |            | sub_149 (SUBWAY.v:149)     |
|                |                |            | sub_173 (SUBWAY.v:173)     |
|                |                |            | sub_175 (SUBWAY.v:175)     |
|                |                |            | sub_192 (SUBWAY.v:192)     |
|                |                |            | sub_206 (SUBWAY.v:206)     |
|                |                |            | sub_209 (SUBWAY.v:209)     |
|                |                |            | sub_225 (SUBWAY.v:225)     |
|                |                |            | sub_242 (SUBWAY.v:242)     |
|                |                |            | sub_242_2 (SUBWAY.v:242)   |
|                |                |            | sub_242_3 (SUBWAY.v:242)   |
|                |                |            | sub_247 (SUBWAY.v:247)     |
|                |                |            | sub_251 (SUBWAY.v:251)     |
|                |                |            | sub_260 (SUBWAY.v:260)     |
|                |                |            | sub_283 (SUBWAY.v:283)     |
|                |                |            | sub_283_2 (SUBWAY.v:283)   |
|                |                |            | sub_286 (SUBWAY.v:286)     |
|                |                |            | sub_311 (SUBWAY.v:311)     |
|                |                |            | sub_313 (SUBWAY.v:313)     |
|                |                |            | sub_330 (SUBWAY.v:330)     |
|                |                |            | sub_344 (SUBWAY.v:344)     |
|                |                |            | sub_347 (SUBWAY.v:347)     |
|                |                |            | sub_363 (SUBWAY.v:363)     |
|                |                |            | sub_380 (SUBWAY.v:380)     |
|                |                |            | sub_380_2 (SUBWAY.v:380)   |
|                |                |            | sub_380_3 (SUBWAY.v:380)   |
|                |                |            | sub_385 (SUBWAY.v:385)     |
|                |                |            | sub_389 (SUBWAY.v:389)     |
|                |                |            | sub_398 (SUBWAY.v:398)     |
| add_x_6        | DW01_inc       | width=2    | add_142 (SUBWAY.v:142)     |
|                |                |            | add_142_2 (SUBWAY.v:142)   |
|                |                |            | add_145 (SUBWAY.v:145)     |
|                |                |            | add_169 (SUBWAY.v:169)     |
|                |                |            | add_172 (SUBWAY.v:172)     |
|                |                |            | add_188 (SUBWAY.v:188)     |
|                |                |            | add_202 (SUBWAY.v:202)     |
|                |                |            | add_205 (SUBWAY.v:205)     |
|                |                |            | add_221 (SUBWAY.v:221)     |
|                |                |            | add_236 (SUBWAY.v:236)     |
|                |                |            | add_242 (SUBWAY.v:242)     |
|                |                |            | add_242_2 (SUBWAY.v:242)   |
|                |                |            | add_246 (SUBWAY.v:246)     |
|                |                |            | add_247 (SUBWAY.v:247)     |
|                |                |            | add_279 (SUBWAY.v:279)     |
|                |                |            | add_279_2 (SUBWAY.v:279)   |
|                |                |            | add_282 (SUBWAY.v:282)     |
|                |                |            | add_307 (SUBWAY.v:307)     |
|                |                |            | add_310 (SUBWAY.v:310)     |
|                |                |            | add_326 (SUBWAY.v:326)     |
|                |                |            | add_340 (SUBWAY.v:340)     |
|                |                |            | add_343 (SUBWAY.v:343)     |
|                |                |            | add_359 (SUBWAY.v:359)     |
|                |                |            | add_374 (SUBWAY.v:374)     |
|                |                |            | add_380 (SUBWAY.v:380)     |
|                |                |            | add_380_2 (SUBWAY.v:380)   |
|                |                |            | add_384 (SUBWAY.v:384)     |
|                |                |            | add_385 (SUBWAY.v:385)     |
| eq_x_103       | DW_cmp         | width=4    | eq_184 (SUBWAY.v:184)      |
|                |                |            | eq_322 (SUBWAY.v:322)      |
| DP_OP_304J1_122_9552            |            |                            |
|                | DP_OP_304J1_122_9552 |      |                            |
| DP_OP_305J1_123_2228            |            |                            |
|                | DP_OP_305J1_123_2228 |      |                            |
=============================================================================

Datapath Report for DP_OP_304J1_122_9552
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_304J1_122_9552 | mult_add_87_aco (SUBWAY.v:87)                       |
|                      | add_87_aco (SUBWAY.v:87)                            |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 7     |                                          |
| I2    | PI   | Unsigned | 1     |                                          |
| T163  | IFO  | Unsigned | 7     | I1 * I2 (SUBWAY.v:87)                    |
| O1    | PO   | Unsigned | 7     | T163 + $unsigned(1'b1) (SUBWAY.v:87)     |
==============================================================================

Datapath Report for DP_OP_305J1_123_2228
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_305J1_123_2228 | add_184 (SUBWAY.v:184) add_184_2 (SUBWAY.v:184)     |
|                      | add_184_3 (SUBWAY.v:184) add_322 (SUBWAY.v:322)     |
|                      | add_322_2 (SUBWAY.v:322) add_322_3 (SUBWAY.v:322)   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 1     |                                          |
| I2    | PI   | Unsigned | 1     |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| I4    | PI   | Unsigned | 1     |                                          |
| O1    | PO   | Unsigned | 4     | I1 + I2 + I3 + I4 ( SUBWAY.v:184 SUBWAY.v:322 ) |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| lt_x_2             | DW_cmp           | apparch (area)     |                |
| gte_x_3            | DW_cmp           | apparch (area)     |                |
| add_x_100          | DW01_inc         | apparch (area)     |                |
| sub_x_7            | DW01_dec         | apparch (area)     |                |
| add_x_6            | DW01_inc         | apparch (area)     |                |
| eq_x_103           | DW_cmp           | apparch (area)     |                |
| DP_OP_304J1_122_9552                  |                    |                |
|                    | DP_OP_304J1_122_9552 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_305J1_123_2228                  |                    |                |
|                    | DP_OP_305J1_123_2228 | str (area)     |                |
===============================================================================

1
