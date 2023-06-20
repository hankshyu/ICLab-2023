/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03
// Date      : Wed Jun  7 01:35:09 2023
/////////////////////////////////////////////////////////////


module CPU ( clk, rst_n, IO_stall, awid_m_inf, awaddr_m_inf, awsize_m_inf, 
        awburst_m_inf, awlen_m_inf, awvalid_m_inf, awready_m_inf, wdata_m_inf, 
        wlast_m_inf, wvalid_m_inf, wready_m_inf, bid_m_inf, bresp_m_inf, 
        bvalid_m_inf, bready_m_inf, arid_m_inf, araddr_m_inf, arlen_m_inf, 
        arsize_m_inf, arburst_m_inf, arvalid_m_inf, arready_m_inf, rid_m_inf, 
        rdata_m_inf, rresp_m_inf, rlast_m_inf, rvalid_m_inf, rready_m_inf );
  output [3:0] awid_m_inf;
  output [31:0] awaddr_m_inf;
  output [2:0] awsize_m_inf;
  output [1:0] awburst_m_inf;
  output [6:0] awlen_m_inf;
  output [0:0] awvalid_m_inf;
  input [0:0] awready_m_inf;
  output [15:0] wdata_m_inf;
  output [0:0] wlast_m_inf;
  output [0:0] wvalid_m_inf;
  input [0:0] wready_m_inf;
  input [3:0] bid_m_inf;
  input [1:0] bresp_m_inf;
  input [0:0] bvalid_m_inf;
  output [0:0] bready_m_inf;
  output [7:0] arid_m_inf;
  output [63:0] araddr_m_inf;
  output [13:0] arlen_m_inf;
  output [5:0] arsize_m_inf;
  output [3:0] arburst_m_inf;
  output [1:0] arvalid_m_inf;
  input [1:0] arready_m_inf;
  input [7:0] rid_m_inf;
  input [31:0] rdata_m_inf;
  input [3:0] rresp_m_inf;
  input [1:0] rlast_m_inf;
  input [1:0] rvalid_m_inf;
  output [1:0] rready_m_inf;
  input clk, rst_n;
  output IO_stall;
  wire   awready_m_inf_0_, wlast_m_inf_0_, wvalid_m_inf_0_, wready_m_inf_0_,
         bvalid_m_inf_0_, bready_m_inf_0_, IM_invalid, DM_invalid, DM_flush,
         DM_wen, EXE_MEM_instcode_7, EXE_MEM_instcode_6, N579, N1088,
         instruction_memory_N222, instruction_memory_N211, data_memory_N927,
         data_memory_N922, data_memory_N921, data_memory_N920,
         data_memory_N919, data_memory_N918, data_memory_N917,
         data_memory_N916, data_memory_N915, data_memory_N914,
         data_memory_N913, data_memory_N912, data_memory_N911,
         data_memory_N894, data_memory_N848, data_memory_N847,
         data_memory_N846, data_memory_N845, data_memory_N844,
         data_memory_N843, data_memory_N842, data_memory_N841,
         data_memory_N840, data_memory_N839, data_memory_N838,
         data_memory_N837, data_memory_N836, data_memory_N529,
         data_memory_dmem_write_ok, data_memory_lookup_wen,
         data_memory_dcache_wen, C303_DATA2_0, C303_DATA2_1, C303_DATA2_2,
         C303_DATA2_3, C303_DATA2_4, n1247, n1248, n1249, n1250, n1251, n1252,
         n1253, n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262,
         n1263, n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272,
         n1273, n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282,
         n1283, n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292,
         n1293, n1294, n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302,
         n1303, n1304, n1305, n1306, n1307, n1308, n1310, n1311, n1312, n1313,
         n1314, n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323,
         n1324, n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333,
         n1334, n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343,
         n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351, n1353, n1354,
         n1355, n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363, n1364,
         n1365, n1366, n1367, n1368, n1369, n1370, n1371, n1372, n1373, n1374,
         n1375, n1376, n1377, n1378, n1379, n1380, n1381, n1382, n1383, n1384,
         n1385, n1386, n1387, n1388, n1389, n1390, n1391, n1392, n1393, n1394,
         n1395, n1396, n1397, n1398, n1399, n1400, n1401, n1402, n1403, n1404,
         n1405, n1406, n1407, n1408, n1409, n1410, n1411, n1412, n1413, n1414,
         n1415, n1416, n1417, n1418, n1419, n1420, n1421, n1422, n1423, n1424,
         n1425, n1426, n1427, n1428, n1429, n1430, n1431, n1432, n1433, n1434,
         n1435, n1436, n1437, n1438, n1439, n1440, n1441, n1442, n1443, n1444,
         n1445, n1446, n1447, n1448, n1449, n1450, n1451, n1452, n1453, n1454,
         n1455, n1456, n1457, n1458, n1459, n1460, n1461, n1462, n1463, n1464,
         n1465, n1466, n1467, n1468, n1469, n1470, n1471, n1472, n1473, n1474,
         n1475, n1476, n1477, n1478, n1479, n1480, n1481, n1482, n1483, n1484,
         n1485, n1486, n1487, n1488, n1489, n1490, n1491, n1492, n1493, n1494,
         n1495, n1496, n1497, n1498, n1499, n1500, n1501, n1502, n1503, n1504,
         n1505, n1506, n1507, n1508, n1509, n1510, n1511, n1512, n1513, n1514,
         n1515, n1516, n1517, n1518, n1519, n1520, n1521, n1522, n1523, n1524,
         n1525, n1526, n1527, n1528, n1529, n1530, n1531, n1532, n1533, n1534,
         n1535, n1536, n1537, n1538, n1539, n1540, n1541, n1542, n1543, n1544,
         n1545, n1546, n1547, n1548, n1549, n1550, n1551, n1552, n1553, n1554,
         n1555, n1556, n1557, n1558, n1559, n1560, n1561, n1562, n1563, n1564,
         n1565, n1566, n1567, n1568, n1569, n1570, n1571, n1572, n1573, n1574,
         n1575, n1576, n1577, n1578, n1579, n1580, n1581, n1582, n1583, n1584,
         n1585, n1586, n1587, n1588, n1589, n1590, n1591, n1592, n1593, n1594,
         n1595, n1596, n1597, n1598, n1599, n1600, n1601, n1602, n1603, n1604,
         n1605, n1606, n1607, n1608, n1609, n1610, n1611, n1612, n1613, n1614,
         n1615, n1616, n1617, n1618, n1619, n1620, n1621, n1622, n1623, n1624,
         n1625, n1626, n1627, n1628, n1629, n1630, n1631, n1632, n1633, n1634,
         n1635, n1636, n1637, n1638, n1639, n1640, n1641, n1642, n1643, n1644,
         n1645, n1646, n1647, n1648, n1649, n1650, n1651, n1652, n1653, n1654,
         n1655, n1656, n1657, n1658, n1659, n1660, n1661, n1662, n1663, n1664,
         n1665, n1666, n1667, n1668, n1669, n1670, n1671, n1672, n1673, n1674,
         n1675, n1676, n1677, n1678, n1679, n1680, n1681, n1682, n1683, n1684,
         n1685, n1686, n1687, n1688, n1689, n1690, n1691, n1692, n1693, n1694,
         n1695, n1696, n1697, n1698, n1699, n1700, n1701, n1702, n1703, n1704,
         n1705, n1706, n1707, n1708, n1709, n1710, n1711, n1712, n1713, n1714,
         n1715, n1716, n1717, n1718, n1719, n1720, n1721, n1722, n1723, n1724,
         n1725, n1726, n1727, n1728, n1729, n1730, n1731, n1732, n1733, n1734,
         n1735, n1736, n1737, n1738, n1739, n1740, n1741, n1742, n1743, n1744,
         n1745, n1746, n1747, n1748, n1749, n1750, n1751, n1752, n1753, n1754,
         n1755, n1756, n1757, n1758, n1759, n1760, n1761, n1762, n1763, n1764,
         n1765, n1766, n1767, n1768, n1769, n1770, n1771, n1772, n1773, n1774,
         n1775, n1776, n1777, n1778, n1779, n1780, n1781, n1782, n1783, n1784,
         n1785, n1786, n1787, n1788, n1789, n1790, n1791, n1792, n1793, n1794,
         n1800, n1801, n1802, n1803, n2016, n2017, n2018, n2019, n2020, n2021,
         n2022, n2023, n2024, n2025, n2026, n2027, n2028, n2029, n2030, n2031,
         n2032, n2033, n2034, n2035, n2036, n2037, n2038, n2039, n2040, n2041,
         n2042, n2043, n2044, n2045, n2046, n2047, n2048, n2049, n2050, n2051,
         n2052, n2053, n2054, n2055, n2056, n2057, n2058, n2059, n2060, n2061,
         n2062, n2063, n2064, n2065, n2066, n2067, n2068, n2069, n2070, n2071,
         n2072, n2073, n2074, n2075, n2076, n2077, n2078, n2079, n2080, n2081,
         n2082, n2083, n2084, n2085, n2086, n2087, n2088, n2089, n2090, n2091,
         n2092, n2093, n2094, n2095, n2096, n2097, n2098, n2099, n2100, n2101,
         n2102, n2103, n2104, n2105, n2106, n2107, n2108, n2109, n2110, n2111,
         n2112, n2113, n2114, n2115, n2116, n2117, n2118, n2119, n2120, n2121,
         n2122, n2123, n2124, n2125, n2126, n2127, n2128, n2129, n2130, n2131,
         n2132, n2133, n2134, n2135, n2136, n2137, n2138, n2139, n2140, n2141,
         n2142, n2143, n2144, n2145, n2146, n2147, n2148, n2149, n2150, n2151,
         n2152, n2153, n2154, n2155, n2156, n2157, n2158, n2159, n2160, n2161,
         n2162, n2163, n2164, n2165, n2166, n2167, n2168, n2169, n2170, n2171,
         n2172, n2173, n2174, n2175, n2176, n2177, n2178, n2179, n2180, n2181,
         n2182, n2183, n2184, n2185, n2186, n2187, n2188, n2189, n2190, n2191,
         n2192, n2193, n2194, n2195, n2196, n2197, n2198, n2199, n2200, n2201,
         n2202, n2203, n2204, n2205, n2206, n2207, n2208, n2209, n2210, n2211,
         n2212, n2213, n2214, n2215, n2216, n2217, n2218, n2219, n2220, n2221,
         n2222, n2223, n2224, n2225, n2226, n2227, n2228, n2229, n2230, n2231,
         n2232, n2233, n2234, n2235, n2236, n2237, n2238, n2239, n2240, n2241,
         n2242, n2243, n2244, n2245, n2246, n2247, n2248, n2249, n2250, n2251,
         n2252, n2253, n2254, n2255, n2256, n2257, n2258, n2259, n2260, n2261,
         n2262, n2263, n2264, n2265, n2266, n2267, n2268, n2269, n2270, n2271,
         n2272, n2273, n2274, n2275, n2276, n2277, n2278, n2279, n2280, n2281,
         n2282, n2283, n2284, n2285, n2286, n2287, n2288, n2289, n2290, n2291,
         n2292, n2293, n2294, n2295, n2296, n2297, n2298, n2299, n2300, n2301,
         n2302, n2303, n2304, n2305, n2306, n2307, n2308, n2309, n2310, n2311,
         n2312, n2313, n2314, n2315, n2316, n2317, n2318, n2319, n2320, n2321,
         n2322, n2323, n2324, n2325, n2326, n2327, n2328, n2329, n2330, n2331,
         n2332, n2333, n2334, n2335, n2336, n2337, n2338, n2339, n2340, n2341,
         n2342, n2343, n2344, n2345, n2346, n2347, n2348, n2349, n2350, n2351,
         n2352, n2353, n2354, n2355, n2356, n2357, n2358, n2359, n2360, n2361,
         n2362, n2363, n2364, n2365, n2366, n2367, n2368, n2369, n2370, n2371,
         n2372, n2373, n2374, n2375, n2376, n2377, n2378, n2379, n2380, n2381,
         n2382, n2383, n2384, n2385, n2386, n2387, n2388, n2389, n2390, n2391,
         n2392, n2393, n2394, n2395, n2396, n2397, n2398, n2399, n2400, n2401,
         n2402, n2403, n2404, n2405, n2406, n2407, n2408, n2409, n2410, n2411,
         n2412, n2413, n2414, n2415, n2416, n2417, n2418, n2419, n2420, n2421,
         n2422, n2423, n2424, n2425, n2426, n2427, n2428, n2429, n2430, n2431,
         n2432, n2433, n2434, n2435, n2436, n2437, n2438, n2439, n2440, n2441,
         n2442, n2443, n2444, n2445, n2446, n2447, n2448, n2449, n2450, n2451,
         n2452, n2453, n2454, n2455, n2456, n2457, n2458, n2459, n2460, n2461,
         n2462, n2463, n2464, n2465, n2466, n2467, n2468, n2469, n2470, n2471,
         n2472, n2473, n2474, n2475, n2476, n2477, n2478, n2479, n2480, n2481,
         n2482, n2483, n2484, n2485, n2486, n2487, n2488, n2489, n2490, n2491,
         n2492, n2493, n2494, n2495, n2496, n2497, n2498, n2499, n2500, n2501,
         n2502, n2503, n2504, n2505, n2506, n2507, n2508, n2509, n2510, n2511,
         n2512, n2513, n2514, n2515, n2516, n2517, n2518, n2519, n2520, n2521,
         n2522, n2523, n2524, n2525, n2526, n2527, n2528, n2529, n2530, n2531,
         n2532, n2533, n2534, n2535, n2536, n2537, n2538, n2539, n2540, n2541,
         n2542, n2543, n2544, n2545, n2546, n2547, n2548, n2549, n2550, n2551,
         n2552, n2553, n2554, n2555, n2556, n2557, n2558, n2559, n2560, n2561,
         n2562, n2563, n2564, n2565, n2566, n2567, n2568, n2569, n2570, n2571,
         n2572, n2573, n2574, n2575, n2576, n2577, n2578, n2579, n2580, n2581,
         n2582, n2583, n2584, n2585, n2586, n2587, n2588, n2589, n2590, n2591,
         n2592, n2593, n2594, n2595, n2596, n2597, n2598, n2599, n2600, n2601,
         n2602, n2603, n2604, n2605, n2606, n2607, n2608, n2609, n2610, n2611,
         n2612, n2613, n2614, n2615, n2616, n2617, n2618, n2619, n2620, n2621,
         n2622, n2623, n2624, n2625, n2626, n2627, n2628, n2629, n2630, n2631,
         n2632, n2633, n2634, n2635, n2636, n2637, n2638, n2639, n2640, n2641,
         n2642, n2643, n2644, n2645, n2646, n2647, n2648, n2649, n2650, n2651,
         n2652, n2653, n2654, n2655, n2656, n2657, n2658, n2659, n2660, n2661,
         n2662, n2663, n2664, n2665, n2666, n2667, n2668, n2669, n2670, n2671,
         n2672, n2673, n2674, n2675, n2676, n2677, n2678, n2679, n2680, n2681,
         n2682, n2683, n2684, n2685, n2686, n2687, n2688, n2689, n2690, n2691,
         n2692, n2693, n2694, n2695, n2696, n2697, n2698, n2699, n2700, n2701,
         n2702, n2703, n2704, n2705, n2706, n2707, n2708, n2709, n2710, n2711,
         n2712, n2713, n2714, n2715, n2716, n2717, n2718, n2719, n2720, n2721,
         n2722, n2723, n2724, n2725, n2726, n2727, n2728, n2729, n2730, n2731,
         n2732, n2733, n2734, n2735, n2736, n2737, n2738, n2739, n2740, n2741,
         n2742, n2743, n2744, n2745, n2746, n2747, n2748, n2749, n2750, n2751,
         n2752, n2753, n2754, n2755, n2756, n2757, n2758, n2759, n2760, n2761,
         n2762, n2763, n2764, n2765, n2766, n2767, n2768, n2769, n2770, n2771,
         n2772, n2773, n2774, n2775, n2776, n2777, n2778, n2779, n2780, n2781,
         n2782, n2783, n2784, n2785, n2786, n2787, n2788, n2789, n2790, n2791,
         n2792, n2793, n2794, n2795, n2796, n2797, n2798, n2799, n2800, n2801,
         n2802, n2803, n2804, n2805, n2806, n2807, n2808, n2809, n2810, n2811,
         n2812, n2813, n2814, n2815, n2816, n2817, n2818, n2820, n2821, n2822,
         n2823, n2824, n2826, n2827, n2828, n2829, n2830, n2831, n2832, n2833,
         n2834, n2835, n2837, n2838, n2839, n2840, n2841, n2842, n2843, n2844,
         n2845, n2846, n2847, n2848, n2849, n2850, n2851, n2852, n2853, n2854,
         n2855, n2856, n2857, n2858, n2859, n2860, n2861, n2862, n2863, n2864,
         n2865, n2866, n2867, n2868, n2869, n2870, n2871, n2872, n2873, n2874,
         n2875, n2876, n2877, n2878, n2879, n2880, n2881, n2882, n2883, n2884,
         n2885, n2886, n2887, n2888, n2889, n2890, n2891, n2892, n2893, n2894,
         n2895, n2896, n2897, n2898, n2899, n2900, n2901, n2902, n2903, n2904,
         n2905, n2906, n2907, n2908, n2909, n2910, n2911, n2912, n2913, n2914,
         n2915, n2916, n2917, n2918, n2919, n2920, n2921, n2922, n2923, n2924,
         n2925, n2926, n2927, n2928, n2929, n2930, n2931, n2932, n2933, n2934,
         n2935, n2936, n2937, n2938, n2939, n2940, n2941, n2942, n2943, n2944,
         n2945, n2946, n2947, n2948, n2949, n2950, n2951, n2952, n2953, n2954,
         n2955, n2956, n2957, n2958, n2959, n2960, n2961, n2962, n2963, n2964,
         n2965, n2966, n2967, n2968, n2969, n2970, n2971, n2972, n2973, n2974,
         n2975, n2976, n2977, n2978, n2979, n2980, n2981, n2982, n2983, n2984,
         n2985, n2986, n2987, n2988, n2989, n2990, n2991, n2992, n2993, n2994,
         n2995, n2996, n2997, n2998, n2999, n3000, n3001, n3002, n3003, n3004,
         n3005, n3006, n3007, n3008, n3009, n3010, n3011, n3012, n3013, n3014,
         n3015, n3016, n3017, n3018, n3019, n3020, n3021, n3022, n3023, n3024,
         n3025, n3026, n3027, n3028, n3029, n3030, n3031, n3032, n3033, n3034,
         n3035, n3036, n3037, n3038, n3039, n3040, n3041, n3042, n3043, n3044,
         n3045, n3046, n3047, n3048, n3049, n3050, n3051, n3052, n3053, n3054,
         n3055, n3056, n3057, n3058, n3059, n3060, n3061, n3062, n3063, n3064,
         n3065, n3066, n3067, n3068, n3069, n3070, n3071, n3072, n3073, n3074,
         n3075, n3076, n3077, n3078, n3079, n3080, n3081, n3082, n3083, n3084,
         n3085, n3086, n3087, n3088, n3089, n3090, n3091, n3092, n3093, n3094,
         n3095, n3096, n3097, n3098, n3099, n3100, n3101, n3102, n3103, n3104,
         n3105, n3106, n3107, n3108, n3109, n3110, n3111, n3112, n3113, n3114,
         n3115, n3116, n3117, n3118, n3119, n3120, n3121, n3122, n3123, n3124,
         n3125, n3126, n3127, n3128, n3129, n3130, n3131, n3132, n3133, n3134,
         n3135, n3136, n3137, n3138, n3139, n3140, n3141, n3142, n3143, n3144,
         n3145, n3146, n3147, n3148, n3149, n3150, n3151, n3152, n3153, n3154,
         n3155, n3156, n3157, n3158, n3159, n3160, n3161, n3162, n3163, n3164,
         n3165, n3166, n3167, n3168, n3169, n3170, n3171, n3172, n3173, n3174,
         n3175, n3176, n3177, n3178, n3179, n3180, n3181, n3182, n3183, n3184,
         n3185, n3186, n3187, n3188, n3189, n3190, n3191, n3192, n3193, n3194,
         n3195, n3196, n3197, n3198, n3199, n3200, n3201, n3202, n3203, n3204,
         n3205, n3206, n3207, n3208, n3209, n3210, n3211, n3212, n3213, n3214,
         n3215, n3216, n3217, n3218, n3219, n3220, n3221, n3222, n3223, n3224,
         n3225, n3226, n3227, n3228, n3229, n3230, n3231, n3232, n3233, n3234,
         n3235, n3236, n3237, n3238, n3239, n3240, n3241, n3242, n3243, n3244,
         n3245, n3246, n3247, n3248, n3249, n3250, n3251, n3252, n3253, n3254,
         n3255, n3256, n3257, n3258, n3259, n3260, n3261, n3262, n3263, n3264,
         n3265, n3266, n3267, n3268, n3269, n3270, n3271, n3272, n3273, n3274,
         n3275, n3276, n3277, n3278, n3279, n3280, n3281, n3282, n3283, n3284,
         n3285, n3286, n3287, n3288, n3289, n3290, n3291, n3292, n3293, n3294,
         n3295, n3296, n3297, n3298, n3299, n3300, n3301, n3302, n3303, n3304,
         n3305, n3306, n3307, n3308, n3309, n3310, n3311, n3312, n3313, n3314,
         n3315, n3316, n3317, n3318, n3319, n3320, n3321, n3322, n3323, n3324,
         n3325, n3326, n3327, n3328, n3329, n3330, n3331, n3332, n3333, n3334,
         n3335, n3336, n3337, n3338, n3339, n3340, n3341, n3342, n3343, n3344,
         n3345, n3346, n3347, n3348, n3349, n3350, n3351, n3352, n3353, n3354,
         n3355, n3356, n3357, n3358, n3359, n3360, n3361, n3362, n3363, n3364,
         n3365, n3366, n3367, n3368, n3369, n3370, n3371, n3372, n3373, n3374,
         n3375, n3376, n3377, n3378, n3379, n3380, n3381, n3382, n3383, n3384,
         n3385, n3386, n3387, n3388, n3389, n3390, n3391, n3392, n3393, n3394,
         n3395, n3396, n3397, n3398, n3399, n3400, n3401, n3402, n3403, n3404,
         n3405, n3406, n3407, n3408, n3409, n3410, n3411, n3412, n3413, n3414,
         n3415, n3416, n3417, n3418, n3419, n3420, n3421, n3422, n3423, n3424,
         n3425, n3426, n3427, n3428, n3429, n3430, n3431, n3432, n3433, n3434,
         n3435, n3436, n3437, n3438, n3439, n3440, n3441, n3442, n3443, n3444,
         n3445, n3446, n3447, n3448, n3449, n3450, n3451, n3452, n3453, n3454,
         n3455, n3456, n3457, n3458, n3459, n3460, n3461, n3462, n3463, n3464,
         n3465, n3466, n3467, n3468, n3469, n3470, n3471, n3472, n3473, n3474,
         n3475, n3476, n3477, n3478, n3479, n3480, n3481, n3482, n3483, n3484,
         n3485, n3486, n3487, n3488, n3489, n3490, n3491, n3492, n3493, n3494,
         n3495, n3496, n3497, n3498, n3499, n3500, n3501, n3502, n3503, n3504,
         n3505, n3506, n3507, n3508, n3509, n3510, n3511, n3512, n3513, n3514,
         n3515, n3516, n3517, n3518, n3519, n3520, n3521, n3522, n3523, n3524,
         n3525, n3526, n3527, n3528, n3529, n3530, n3531, n3532, n3533, n3534,
         n3535, n3536, n3537, n3538, n3539, n3540, n3541, n3542, n3543, n3544,
         n3545, n3546, n3547, n3548, n3549, n3550, n3551, n3552, n3553, n3554,
         n3555, n3556, n3557, n3558, n3559, n3560, n3561, n3562, n3563, n3564,
         n3565, n3566, n3567, n3568, n3569, n3570, n3571, n3572, n3573, n3574,
         n3575, n3576, n3577, n3578, n3579, n3580, n3581, n3582, n3583, n3584,
         n3585, n3586, n3587, n3588, n3589, n3590, n3591, n3592, n3593, n3594,
         n3595, n3596, n3597, n3598, n3599, n3600, n3601, n3602, n3603, n3604,
         n3605, n3606, n3607, n3608, n3609, n3610, n3611, n3612, n3613, n3614,
         n3615, n3616, n3617, n3618, n3619, n3620, n3621, n3622, n3623, n3624,
         n3625, n3626, n3627, n3628, n3629, n3630, n3631, n3632, n3633, n3634,
         n3635, n3636, n3637, n3638, n3639, n3640, n3641, n3642, n3643, n3644,
         n3645, n3646, n3647, n3648, n3649, n3650, n3651, n3652, n3653, n3654,
         n3655, n3656, n3657, n3658, n3659, n3660, n3661, n3662, n3663, n3664,
         n3665, n3666, n3667, n3668, n3669, n3670, n3671, n3672, n3673, n3674,
         n3675, n3676, n3677, n3678, n3679, n3680, n3681, n3682, n3683, n3684,
         n3685, n3686, n3687, n3688, n3689, n3690, n3691, n3692, n3693, n3694,
         n3695, n3696, n3697, n3698, n3699, n3700, n3701, n3702, n3703, n3704,
         n3705, n3706, n3707, n3708, n3709, n3710, n3711, n3712, n3713, n3714,
         n3715, n3716, n3717, n3718, n3719, n3720, n3721, n3722, n3723, n3724,
         n3725, n3726, n3727, n3728, n3729, n3730, n3731, n3732, n3733, n3734,
         n3735, n3736, n3737, n3738, n3739, n3740, n3741, n3742, n3743, n3744,
         n3745, n3746, n3747, n3748, n3749, n3750, n3751, n3752, n3753, n3754,
         n3755, n3756, n3757, n3758, n3759, n3760, n3761, n3762, n3763, n3764,
         n3765, n3766, n3767, n3768, n3769, n3770, n3771, n3772, n3773, n3774,
         n3775, n3776, n3777, n3778, n3779, n3780, n3781, n3782, n3783, n3784,
         n3785, n3786, n3787, n3788, n3789, n3790, n3791, n3792, n3793, n3794,
         n3795, n3796, n3797, n3798, n3799, n3800, n3801, n3802, n3803, n3804,
         n3805, n3806, n3807, n3808, n3809, n3810, n3811, n3812, n3813, n3814,
         n3815, n3816, n3817, n3818, n3819, n3820, n3821, n3822, n3823, n3824,
         n3825, n3826, n3827, n3828, n3829, n3830, n3831, n3832, n3833, n3834,
         n3835, n3836, n3837, n3838, n3839, n3840, n3841, n3842, n3843, n3844,
         n3845, n3846, n3847, n3848, n3849, n3850, n3851, n3852, n3853, n3854,
         n3855, n3856, n3857, n3858, n3859, n3860, n3861, n3862, n3863, n3864,
         n3865, n3866, n3867, n3868, n3869, n3870, n3871, n3872, n3873, n3874,
         n3875, n3876, n3877, n3878, n3879, n3880, n3881, n3882, n3883, n3884,
         n3885, n3886, n3887, n3888, n3889, n3890, n3891, n3892, n3893, n3894,
         n3895, n3896, n3897, n3898, n3899, n3900, n3901, n3902, n3903, n3904,
         n3905, n3906, n3907, n3908, n3909, n3910, n3911, n3912, n3913, n3914,
         n3915, n3916, n3917, n3918, n3919, n3920, n3921, n3922, n3923, n3924,
         n3925, n3926, n3927, n3928, n3929, n3930, n3931, n3932, n3933, n3934,
         n3935, n3936, n3937, n3938, n3939, n3940, n3941, n3942, n3943, n3944,
         n3945, n3946, n3947, n3948, n3949, n3950, n3951, n3952, n3953, n3954,
         n3955, n3956, n3957, n3958, n3959, n3960, n3961, n3962, n3963, n3964,
         n3965, n3966, n3967, n3968, n3969, n3970, n3971, n3972, n3973, n3974,
         n3975, n3976, n3977, n3978, n3979, n3980, n3981, n3982, n3983, n3984,
         n3985, n3986, n3987, n3988, n3989, n3990, n3991, n3992, n3993, n3994,
         n3995, n3996, n3997, n3998, n3999, n4000, n4001, n4002, n4003, n4004,
         n4005, n4006, n4007, n4008, n4009, n4010, n4011, n4012, n4013, n4014,
         n4015, n4016, n4017, n4018, n4019, n4020, n4021, n4022, n4023, n4024,
         n4025, n4026, n4027, n4028, n4029, n4030, n4031, n4032, n4033, n4034,
         n4035, n4036, n4037, n4038, n4039, n4040, n4041, n4042, n4043, n4044,
         n4045, n4046, n4047, n4048, n4049, n4050, n4051, n4052, n4053, n4054,
         n4055, n4056, n4057, n4058, n4059, n4060, n4061, n4062, n4063, n4064,
         n4065, n4066, n4067, n4068, n4069, n4070, n4071, n4072, n4073, n4074,
         n4075, n4076, n4077, n4078, n4079, n4080, n4081, n4082, n4083, n4084,
         n4085, n4086, n4087, n4088, n4089, n4090, n4091, n4092, n4093, n4094,
         n4095, n4096, n4097, n4098, n4099, n4100, n4101, n4102, n4103, n4104,
         n4105, n4106, n4107, n4108, n4109, n4110, n4111, n4112, n4113, n4114,
         n4115, n4116, n4117, n4118, n4119, n4120, n4121, n4122, n4123, n4124,
         n4125, n4126, n4127, n4128, n4129, n4130, n4131, n4132, n4133, n4134,
         n4135, n4136, n4137, n4138, n4139, n4140, n4141, n4142, n4143, n4144,
         n4145, n4146, n4147, n4148, n4149, n4150, n4151, n4152, n4153, n4154,
         n4155, n4156, n4157, n4158, n4159, n4160, n4161, n4162, n4163, n4164,
         n4165, n4166, n4167, n4168, n4169, n4170, n4171, n4172, n4173, n4174,
         n4175, n4176, n4177, n4178, n4179, n4180, n4181, n4182, n4183, n4184,
         n4185, n4186, n4187, n4188, n4189, n4190, n4191, n4192, n4193, n4194,
         n4195, n4196, n4197, n4198, n4199, n4200, n4201, n4202, n4203, n4204,
         n4205, n4206, n4207, n4208, n4209, n4210, n4211, n4212, n4213, n4214,
         n4215, n4216, n4217, n4218, n4219, n4220, n4221, n4222, n4223, n4224,
         n4225, n4226, n4227, n4228, n4229, n4230, n4231, n4232, n4233, n4234,
         n4235, n4236, n4237, n4238, n4239, n4240, n4241, n4242, n4243, n4244,
         n4245, n4246, n4247, n4248, n4249, n4250, n4251, n4252, n4253, n4254,
         n4255, n4256, n4257, n4258, n4259, n4260, n4261, n4262, n4263, n4264,
         n4265, n4266, n4267, n4268, n4269, n4270, n4271, n4272, n4273, n4274,
         n4275, n4276, n4277, n4278, n4279, n4280, n4281, n4282, n4283, n4284,
         n4285, n4286, n4287, n4288, n4289, n4290, n4291, n4292, n4293, n4294,
         n4295, n4296, n4297, n4298, n4299, n4300, n4301, n4302, n4303, n4304,
         n4305, n4306, n4307, n4308, n4309, n4310, n4311, n4312, n4313, n4314,
         n4315, n4316, n4317, n4318, n4319, n4320, n4321, n4322, n4323, n4324,
         n4325, n4326, n4327, n4328, n4329, n4330, n4331, n4332, n4333, n4334,
         n4335, n4336, n4337, n4338, n4339, n4340, n4341, n4342, n4343, n4344,
         n4345, n4346, n4347, n4348, n4349, n4350, n4351, n4352, n4353, n4354,
         n4355, n4356, n4357, n4358, n4359, n4360, n4361, n4362, n4363, n4364,
         n4365, n4366, n4367, n4368, n4369, n4370, n4371, n4372, n4373, n4374,
         n4375, n4376, n4377, n4378, n4379, n4380, n4381, n4382, n4383, n4384,
         n4385, n4386, n4387, n4388, n4389, n4390, n4391, n4392, n4393, n4394,
         n4395, n4396, n4397, n4398, n4399, n4400, n4401, n4402, n4403, n4404,
         n4405, n4406, n4407, n4408, n4409, n4410, n4411, n4412, n4413, n4414,
         n4415, n4416, n4417, n4418, n4419, n4420, n4421, n4422, n4423, n4424,
         n4425, n4426, n4427, n4428, n4429, n4430, n4431, n4432, n4433, n4434,
         n4435, n4436, n4437, n4438, n4439, n4440, n4441, n4442, n4443, n4444,
         n4445, n4446, n4447, n4448, n4449, n4450, n4451, n4452, n4453, n4454,
         n4455, n4456, n4457, n4458, n4459, n4460, n4461, n4462, n4463, n4464,
         n4465, n4466, n4467, n4468, n4469, n4470, n4471, n4472, n4473, n4474,
         n4475, n4476, n4477, n4478, n4479, n4480, n4481, n4482, n4483, n4484,
         n4485, n4486, n4487, n4488, n4489, n4490, n4491, n4492, n4493, n4494,
         n4495, n4496, n4497, n4498, n4499, n4500, n4501, n4502, n4503, n4504,
         n4505, n4506, n4507, n4508, n4509, n4510, n4511, n4512, n4513, n4514,
         n4515, n4516, n4517, n4518, n4519, n4520, n4521, n4522, n4523, n4524,
         n4525, n4526, n4527, n4528, n4529, n4530, n4531, n4532, n4533, n4534,
         n4535, n4536, n4537, n4538, n4539, n4540, n4541, n4542, n4543, n4544,
         n4545, n4546, n4547, n4548, n4549, n4550, n4551, n4552, n4553, n4554,
         n4555, n4556, n4557, n4558, n4559, n4560, n4561, n4562, n4563, n4564,
         n4565, n4566, n4567, n4568, n4569, n4570, n4571, n4572, n4573, n4574,
         n4575, n4576, n4577, n4578, n4579, n4580, n4581, n4582, n4583, n4584,
         n4585, n4586, n4587, n4588, n4589, n4590, n4591, n4592, n4593, n4594,
         n4595, n4596, n4597, n4598, n4599, n4600, n4601, n4602, n4603, n4604,
         n4605, n4606, n4607, n4608, n4609, n4610, n4611, n4612, n4613, n4614,
         n4615, n4616, n4617, n4618, n4619, n4620, n4621, n4622, n4623, n4624,
         n4625, n4626, n4627, n4628, n4629, n4630, n4631, n4632, n4633, n4634,
         n4635, n4636, n4637, n4638, n4639, n4640, n4641, n4642, n4643, n4644,
         n4645, n4646, n4647, n4648, n4649, n4650, n4651, n4652, n4653, n4654,
         n4655, n4656, n4657, n4658, n4659, n4660, n4661, n4662, n4663, n4664,
         n4665, n4666, n4667, n4668, n4669, n4670, n4671, n4672, n4673, n4674,
         n4675, n4676, n4677, n4678, n4679, n4680, n4681, n4682, n4683, n4684,
         n4685, n4686, n4687, n4688, n4689, n4690, n4691, n4692, n4693, n4694,
         n4695, n4696, n4697, n4698, n4699, n4700, n4701, n4702, n4703, n4704,
         n4705, n4706, n4707, n4708, n4709, n4710, n4711, n4712, n4713, n4714,
         n4715, n4716, n4717, n4718, n4719, n4720, n4721, n4722, n4723, n4724,
         n4725, n4726, n4727, n4728, n4729, n4730, n4731, n4732, n4733, n4734,
         n4735, n4736, n4737, n4738, n4739, n4740, n4741, n4742, n4743, n4744,
         n4745, n4746, n4747, n4748, n4749, n4750, n4751, n4752, n4753, n4754,
         n4755, n4756, n4757, n4758, n4759, n4760, n4761, n4762, n4763, n4764,
         n4765, n4766, n4767, n4768, n4769, n4770, n4771, n4772, n4773, n4774,
         n4775, n4776, n4777, n4778, n4779, n4780, n4781, n4782, n4783, n4784,
         n4785, n4786, n4787, n4788, n4789, n4790, n4791, n4792, n4793, n4794,
         n4795, n4796, n4797, n4798, n4799, n4800, n4801, n4802, n4803, n4804,
         n4805, n4806, n4807, n4808, n4809, n4810, n4811, n4812, n4813, n4814,
         n4815, n4816, n4817, n4818, n4819, n4820, n4821, n4822, n4823, n4824,
         n4825, n4826, n4827, n4828, n4829, n4830, n4831, n4832, n4833, n4834,
         n4835, n4836, n4837, n4838, n4839, n4840, n4841, n4842, n4843, n4844,
         n4845, n4846, n4847, n4848, n4849, n4850, n4851, n4852, n4853, n4854,
         n4855, n4856, n4857, n4858, n4859, n4860, n4861, n4862, n4863, n4864,
         n4865, n4866, n4867, n4868, n4869, n4870, n4871, n4872, n4873, n4874,
         n4875, n4876, n4877, n4878, n4879, n4880, n4881, n4882, n4883, n4884,
         n4885, n4886, n4887, n4888, n4889, n4890, n4891, n4892, n4893, n4894,
         n4895, n4896, n4897, n4898, n4899, n4900, n4901, n4902, n4903, n4904,
         n4905, n4906, n4907, n4908, n4909, n4910, n4911, n4912, n4913, n4914,
         n4915, n4916, n4917, n4918, n4919, n4920, n4921, n4922, n4923, n4924,
         n4925, n4926, n4927, n4928, n4929, n4930, n4931, n4932, n4933, n4934,
         n4935, n4936, n4937, n4938, awvalid_m_inf_0_, n4942, n4943, n4944,
         n4945, n4946, n4947, n4948, n4949;
  wire   [15:0] core_r0;
  wire   [15:0] core_r1;
  wire   [15:0] core_r2;
  wire   [15:0] core_r3;
  wire   [15:0] core_r4;
  wire   [15:0] core_r5;
  wire   [15:0] core_r6;
  wire   [15:0] core_r7;
  wire   [15:0] core_r8;
  wire   [15:0] core_r9;
  wire   [15:0] core_r10;
  wire   [15:0] core_r11;
  wire   [15:0] core_r12;
  wire   [15:0] core_r13;
  wire   [15:0] core_r14;
  wire   [15:0] core_r15;
  wire   [10:0] IF_PC;
  wire   [10:0] DM_idx;
  wire   [15:0] DM_data;
  wire   [1:0] cpufe_cs;
  wire   [2:0] cpube_cs;
  wire   [2:0] cpube_ls;
  wire   [10:0] EXE_MEM_PCnxt;
  wire   [2:0] cpube_ns;
  wire   [10:0] IF_DEC_PC;
  wire   [15:0] IF_DEC_instr;
  wire   [3:0] patcal;
  wire   [4:0] EXE_MEM_instcode;
  wire   [15:0] EXE_MEM_result;
  wire   [15:0] EXE_MEM_storedata;
  wire   [3:0] EXE_MEM_target;
  wire   [15:0] MEM_WB_memout;
  wire   [6:0] instruction_memory_icache_ready_idx;
  wire   [10:0] instruction_memory_icache_headpc;
  wire   [1:0] instruction_memory_icache_ns;
  wire   [1:0] instruction_memory_icache_cs;
  wire   [2:0] instruction_memory_instmem_ns;
  wire   [2:0] instruction_memory_instmem_cs;
  wire   [15:0] instruction_memory_icache_d;
  wire   [6:0] instruction_memory_icache_a;
  wire   [10:0] instruction_memory_lookup_pc;
  wire   [15:0] data_memory_writeback_storeq2;
  wire   [15:0] data_memory_writeback_storeq;
  wire   [15:0] data_memory_lookup_data;
  wire   [10:0] data_memory_writeback_headpc;
  wire   [2:0] data_memory_writeback_type;
  wire   [6:0] data_memory_writeback_count;
  wire   [3:0] data_memory_dcache_dirty;
  wire   [6:0] data_memory_dcache_ready_idx;
  wire   [10:5] data_memory_dcache_headpc;
  wire   [2:1] data_memory_datamem_js;
  wire   [4:0] data_memory_datamem_ns;
  wire   [3:0] data_memory_datamem_cs;
  wire   [15:0] data_memory_dcache_d;
  wire   [6:0] data_memory_dcache_a;
  wire   [10:0] data_memory_lookup_pc;
  tri   [15:0] instruction_memory_icache_q;
  tri   [15:0] data_memory_dcache_q;
  assign awready_m_inf_0_ = awready_m_inf[0];
  assign wlast_m_inf[0] = wlast_m_inf_0_;
  assign wvalid_m_inf[0] = wvalid_m_inf_0_;
  assign wready_m_inf_0_ = wready_m_inf[0];
  assign bvalid_m_inf_0_ = bvalid_m_inf[0];
  assign bready_m_inf[0] = bready_m_inf_0_;
  assign awvalid_m_inf[0] = awvalid_m_inf_0_;

  RA1SH1 instruction_memory_Icache ( .Q(instruction_memory_icache_q), .A(
        instruction_memory_icache_a), .D(instruction_memory_icache_d), .CLK(
        clk), .CEN(1'b0), .OEN(1'b0), .WEN(instruction_memory_N222) );
  RA1SH1 data_memory_Dcache ( .Q(data_memory_dcache_q), .A(
        data_memory_dcache_a), .D(data_memory_dcache_d), .CLK(clk), .CEN(1'b0), 
        .OEN(1'b0), .WEN(data_memory_dcache_wen) );
  DFFRHQXL data_memory_dcache_ready_idx_reg_6_ ( .D(n1779), .CK(clk), .RN(
        rst_n), .Q(data_memory_dcache_ready_idx[6]) );
  DFFRHQXL data_memory_dcache_ready_idx_reg_5_ ( .D(n1780), .CK(clk), .RN(
        rst_n), .Q(data_memory_dcache_ready_idx[5]) );
  DFFRHQXL data_memory_dcache_dirty_reg_3_ ( .D(n1789), .CK(clk), .RN(rst_n), 
        .Q(data_memory_dcache_dirty[3]) );
  DFFRHQXL data_memory_dcache_dirty_reg_2_ ( .D(n1790), .CK(clk), .RN(rst_n), 
        .Q(data_memory_dcache_dirty[2]) );
  DFFRHQXL cpube_cs_reg_1_ ( .D(cpube_ns[1]), .CK(clk), .RN(rst_n), .Q(
        cpube_cs[1]) );
  DFFRHQXL cpube_ls_reg_1_ ( .D(cpube_cs[1]), .CK(clk), .RN(rst_n), .Q(
        cpube_ls[1]) );
  DFFRHQXL data_memory_dmem_write_ok_reg ( .D(data_memory_N529), .CK(clk), 
        .RN(rst_n), .Q(data_memory_dmem_write_ok) );
  DFFRHQXL IM_invalid_reg ( .D(n1764), .CK(clk), .RN(rst_n), .Q(IM_invalid) );
  DFFRHQXL instruction_memory_icache_cs_reg_0_ ( .D(
        instruction_memory_icache_ns[0]), .CK(clk), .RN(rst_n), .Q(
        instruction_memory_icache_cs[0]) );
  DFFRHQXL instruction_memory_icache_cs_reg_1_ ( .D(
        instruction_memory_icache_ns[1]), .CK(clk), .RN(rst_n), .Q(
        instruction_memory_icache_cs[1]) );
  DFFRHQXL instruction_memory_icache_headpc_reg_10_ ( .D(n1753), .CK(clk), 
        .RN(rst_n), .Q(instruction_memory_icache_headpc[10]) );
  DFFRHQXL instruction_memory_icache_headpc_reg_9_ ( .D(n1754), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_icache_headpc[9]) );
  DFFRHQXL instruction_memory_icache_headpc_reg_8_ ( .D(n1755), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_icache_headpc[8]) );
  DFFRHQXL instruction_memory_icache_headpc_reg_7_ ( .D(n1756), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_icache_headpc[7]) );
  DFFRHQXL instruction_memory_icache_headpc_reg_6_ ( .D(n1757), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_icache_headpc[6]) );
  DFFRHQXL instruction_memory_icache_headpc_reg_5_ ( .D(n1758), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_icache_headpc[5]) );
  DFFRHQXL instruction_memory_icache_headpc_reg_4_ ( .D(n1759), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_icache_headpc[4]) );
  DFFRHQXL instruction_memory_icache_headpc_reg_3_ ( .D(n1760), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_icache_headpc[3]) );
  DFFRHQXL instruction_memory_icache_headpc_reg_2_ ( .D(n1761), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_icache_headpc[2]) );
  DFFRHQXL instruction_memory_icache_headpc_reg_1_ ( .D(n1762), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_icache_headpc[1]) );
  DFFRHQXL instruction_memory_icache_headpc_reg_0_ ( .D(n1763), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_icache_headpc[0]) );
  DFFRHQXL instruction_memory_icache_ready_idx_reg_5_ ( .D(n1734), .CK(clk), 
        .RN(rst_n), .Q(instruction_memory_icache_ready_idx[5]) );
  DFFRHQXL instruction_memory_icache_ready_idx_reg_6_ ( .D(n1740), .CK(clk), 
        .RN(rst_n), .Q(instruction_memory_icache_ready_idx[6]) );
  DFFRHQXL instruction_memory_icache_ready_idx_reg_0_ ( .D(n1739), .CK(clk), 
        .RN(rst_n), .Q(instruction_memory_icache_ready_idx[0]) );
  DFFRHQXL instruction_memory_icache_ready_idx_reg_1_ ( .D(n1738), .CK(clk), 
        .RN(rst_n), .Q(instruction_memory_icache_ready_idx[1]) );
  DFFRHQXL instruction_memory_icache_ready_idx_reg_2_ ( .D(n1737), .CK(clk), 
        .RN(rst_n), .Q(instruction_memory_icache_ready_idx[2]) );
  DFFRHQXL instruction_memory_icache_ready_idx_reg_3_ ( .D(n1736), .CK(clk), 
        .RN(rst_n), .Q(instruction_memory_icache_ready_idx[3]) );
  DFFRHQXL instruction_memory_icache_ready_idx_reg_4_ ( .D(n1735), .CK(clk), 
        .RN(rst_n), .Q(instruction_memory_icache_ready_idx[4]) );
  DFFRHQXL instruction_memory_instmem_cs_reg_0_ ( .D(
        instruction_memory_instmem_ns[0]), .CK(clk), .RN(rst_n), .Q(
        instruction_memory_instmem_cs[0]) );
  DFFRHQXL instruction_memory_instmem_cs_reg_1_ ( .D(
        instruction_memory_instmem_ns[1]), .CK(clk), .RN(rst_n), .Q(
        instruction_memory_instmem_cs[1]) );
  DFFRHQXL instruction_memory_instmem_cs_reg_2_ ( .D(
        instruction_memory_instmem_ns[2]), .CK(clk), .RN(rst_n), .Q(
        instruction_memory_instmem_cs[2]) );
  DFFRHQXL IF_DEC_instr_reg_1_ ( .D(n1732), .CK(clk), .RN(rst_n), .Q(
        IF_DEC_instr[1]) );
  DFFRHQXL IF_DEC_instr_reg_2_ ( .D(n1731), .CK(clk), .RN(rst_n), .Q(
        IF_DEC_instr[2]) );
  DFFRHQXL IF_DEC_instr_reg_3_ ( .D(n1730), .CK(clk), .RN(rst_n), .Q(
        IF_DEC_instr[3]) );
  DFFRHQXL IF_DEC_instr_reg_4_ ( .D(n1729), .CK(clk), .RN(rst_n), .Q(
        IF_DEC_instr[4]) );
  DFFRHQX4 IF_DEC_instr_reg_5_ ( .D(n1728), .CK(clk), .RN(rst_n), .Q(
        IF_DEC_instr[5]) );
  DFFRHQX4 IF_DEC_instr_reg_6_ ( .D(n1727), .CK(clk), .RN(rst_n), .Q(
        IF_DEC_instr[6]) );
  DFFRHQX4 IF_DEC_instr_reg_7_ ( .D(n1726), .CK(clk), .RN(rst_n), .Q(
        IF_DEC_instr[7]) );
  DFFRHQX4 IF_DEC_instr_reg_8_ ( .D(n1725), .CK(clk), .RN(rst_n), .Q(
        IF_DEC_instr[8]) );
  DFFRHQX4 IF_DEC_instr_reg_9_ ( .D(n1724), .CK(clk), .RN(rst_n), .Q(
        IF_DEC_instr[9]) );
  DFFRHQX4 IF_DEC_instr_reg_10_ ( .D(n1723), .CK(clk), .RN(rst_n), .Q(
        IF_DEC_instr[10]) );
  DFFRHQX4 IF_DEC_instr_reg_11_ ( .D(n1722), .CK(clk), .RN(rst_n), .Q(
        IF_DEC_instr[11]) );
  DFFRHQX4 IF_DEC_instr_reg_12_ ( .D(n1721), .CK(clk), .RN(rst_n), .Q(
        IF_DEC_instr[12]) );
  DFFRHQX1 IF_DEC_instr_reg_15_ ( .D(n1718), .CK(clk), .RN(rst_n), .Q(
        IF_DEC_instr[15]) );
  DFFRHQXL cpube_cs_reg_0_ ( .D(cpube_ns[0]), .CK(clk), .RN(rst_n), .Q(
        cpube_cs[0]) );
  DFFRHQXL cpube_ls_reg_0_ ( .D(cpube_cs[0]), .CK(clk), .RN(rst_n), .Q(
        cpube_ls[0]) );
  DFFRHQXL cpufe_cs_reg_0_ ( .D(n1793), .CK(clk), .RN(rst_n), .Q(cpufe_cs[0])
         );
  DFFRHQXL cpufe_cs_reg_1_ ( .D(n1794), .CK(clk), .RN(rst_n), .Q(cpufe_cs[1])
         );
  DFFRHQXL IF_PC_reg_8_ ( .D(n1765), .CK(clk), .RN(rst_n), .Q(IF_PC[8]) );
  DFFRHQXL IF_PC_reg_10_ ( .D(n1775), .CK(clk), .RN(rst_n), .Q(IF_PC[10]) );
  DFFRHQXL IF_PC_reg_9_ ( .D(n1774), .CK(clk), .RN(rst_n), .Q(IF_PC[9]) );
  DFFRHQXL IF_PC_reg_0_ ( .D(n1773), .CK(clk), .RN(rst_n), .Q(IF_PC[0]) );
  DFFRHQXL IF_PC_reg_2_ ( .D(n1771), .CK(clk), .RN(rst_n), .Q(IF_PC[2]) );
  DFFRHQXL IF_PC_reg_3_ ( .D(n1770), .CK(clk), .RN(rst_n), .Q(IF_PC[3]) );
  DFFRHQXL IF_PC_reg_4_ ( .D(n1769), .CK(clk), .RN(rst_n), .Q(IF_PC[4]) );
  DFFRHQXL IF_PC_reg_5_ ( .D(n1768), .CK(clk), .RN(rst_n), .Q(IF_PC[5]) );
  DFFRHQXL IF_PC_reg_6_ ( .D(n1767), .CK(clk), .RN(rst_n), .Q(IF_PC[6]) );
  DFFRHQXL IF_PC_reg_7_ ( .D(n1766), .CK(clk), .RN(rst_n), .Q(IF_PC[7]) );
  DFFRHQXL DM_invalid_reg ( .D(N579), .CK(clk), .RN(rst_n), .Q(DM_invalid) );
  DFFRHQXL data_memory_dcache_dirty_reg_1_ ( .D(n1791), .CK(clk), .RN(rst_n), 
        .Q(data_memory_dcache_dirty[1]) );
  DFFRHQXL DM_flush_reg ( .D(n4949), .CK(clk), .RN(rst_n), .Q(DM_flush) );
  DFFRHQXL DM_idx_reg_3_ ( .D(n1411), .CK(clk), .RN(rst_n), .Q(DM_idx[3]) );
  DFFRHQXL DM_idx_reg_5_ ( .D(n1409), .CK(clk), .RN(rst_n), .Q(DM_idx[5]) );
  DFFRHQXL DM_idx_reg_7_ ( .D(n1407), .CK(clk), .RN(rst_n), .Q(DM_idx[7]) );
  DFFRHQXL DM_idx_reg_8_ ( .D(n1406), .CK(clk), .RN(rst_n), .Q(DM_idx[8]) );
  DFFRHQXL DM_idx_reg_9_ ( .D(n1405), .CK(clk), .RN(rst_n), .Q(DM_idx[9]) );
  DFFRHQXL DM_idx_reg_10_ ( .D(n1404), .CK(clk), .RN(rst_n), .Q(DM_idx[10]) );
  DFFRHQXL data_memory_dcache_dirty_reg_0_ ( .D(n1792), .CK(clk), .RN(rst_n), 
        .Q(data_memory_dcache_dirty[0]) );
  DFFRHQXL data_memory_datamem_js_reg_1_ ( .D(n1776), .CK(clk), .RN(rst_n), 
        .Q(data_memory_datamem_js[1]) );
  DFFRHQXL data_memory_writeback_type_reg_2_ ( .D(n1786), .CK(clk), .RN(rst_n), 
        .Q(data_memory_writeback_type[2]) );
  DFFRHQXL data_memory_writeback_type_reg_0_ ( .D(n1788), .CK(clk), .RN(rst_n), 
        .Q(data_memory_writeback_type[0]) );
  DFFRHQXL data_memory_writeback_type_reg_1_ ( .D(n1787), .CK(clk), .RN(rst_n), 
        .Q(data_memory_writeback_type[1]) );
  DFFRHQXL data_memory_writeback_headpc_reg_0_ ( .D(n1403), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_headpc[0]) );
  DFFRHQXL data_memory_writeback_headpc_reg_1_ ( .D(n1402), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_headpc[1]) );
  DFFRHQXL data_memory_writeback_headpc_reg_2_ ( .D(n1401), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_headpc[2]) );
  DFFRHQXL data_memory_writeback_headpc_reg_3_ ( .D(n1400), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_headpc[3]) );
  DFFRHQXL data_memory_writeback_headpc_reg_4_ ( .D(n1399), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_headpc[4]) );
  DFFRHQXL data_memory_writeback_headpc_reg_5_ ( .D(n1398), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_headpc[5]) );
  DFFRHQXL data_memory_writeback_headpc_reg_6_ ( .D(n1397), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_headpc[6]) );
  DFFRHQXL data_memory_writeback_headpc_reg_7_ ( .D(n1396), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_headpc[7]) );
  DFFRHQXL data_memory_writeback_headpc_reg_8_ ( .D(n1395), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_headpc[8]) );
  DFFRHQXL data_memory_writeback_headpc_reg_9_ ( .D(n1394), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_headpc[9]) );
  DFFRHQXL data_memory_writeback_headpc_reg_10_ ( .D(n1393), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_headpc[10]) );
  DFFRHQXL data_memory_writeback_count_reg_0_ ( .D(n1392), .CK(clk), .RN(rst_n), .Q(data_memory_writeback_count[0]) );
  DFFRHQXL data_memory_writeback_count_reg_1_ ( .D(n1391), .CK(clk), .RN(rst_n), .Q(data_memory_writeback_count[1]) );
  DFFRHQXL data_memory_writeback_count_reg_2_ ( .D(n1390), .CK(clk), .RN(rst_n), .Q(data_memory_writeback_count[2]) );
  DFFRHQXL data_memory_writeback_count_reg_3_ ( .D(n1389), .CK(clk), .RN(rst_n), .Q(data_memory_writeback_count[3]) );
  DFFRHQXL data_memory_writeback_count_reg_4_ ( .D(n1388), .CK(clk), .RN(rst_n), .Q(data_memory_writeback_count[4]) );
  DFFRHQXL data_memory_writeback_count_reg_5_ ( .D(n1387), .CK(clk), .RN(rst_n), .Q(data_memory_writeback_count[5]) );
  DFFRHQXL data_memory_writeback_count_reg_6_ ( .D(n1386), .CK(clk), .RN(rst_n), .Q(data_memory_writeback_count[6]) );
  DFFRHQXL data_memory_dcache_ready_idx_reg_0_ ( .D(n1785), .CK(clk), .RN(
        rst_n), .Q(data_memory_dcache_ready_idx[0]) );
  DFFRHQXL data_memory_dcache_ready_idx_reg_1_ ( .D(n1784), .CK(clk), .RN(
        rst_n), .Q(data_memory_dcache_ready_idx[1]) );
  DFFRHQXL data_memory_dcache_ready_idx_reg_2_ ( .D(n1783), .CK(clk), .RN(
        rst_n), .Q(data_memory_dcache_ready_idx[2]) );
  DFFRHQXL data_memory_dcache_ready_idx_reg_3_ ( .D(n1782), .CK(clk), .RN(
        rst_n), .Q(data_memory_dcache_ready_idx[3]) );
  DFFRHQXL data_memory_dcache_ready_idx_reg_4_ ( .D(n1781), .CK(clk), .RN(
        rst_n), .Q(data_memory_dcache_ready_idx[4]) );
  DFFRHQXL MEM_WB_memout_reg_9_ ( .D(n1423), .CK(clk), .RN(rst_n), .Q(
        MEM_WB_memout[9]) );
  DFFRHQXL core_r13_reg_9_ ( .D(n1710), .CK(clk), .RN(rst_n), .Q(core_r13[9])
         );
  DFFRHQXL core_r12_reg_9_ ( .D(n1694), .CK(clk), .RN(rst_n), .Q(core_r12[9])
         );
  DFFRHQXL core_r11_reg_9_ ( .D(n1678), .CK(clk), .RN(rst_n), .Q(core_r11[9])
         );
  DFFRHQXL core_r10_reg_9_ ( .D(n1662), .CK(clk), .RN(rst_n), .Q(core_r10[9])
         );
  DFFRHQXL core_r9_reg_9_ ( .D(n1646), .CK(clk), .RN(rst_n), .Q(core_r9[9]) );
  DFFRHQXL core_r8_reg_9_ ( .D(n1630), .CK(clk), .RN(rst_n), .Q(core_r8[9]) );
  DFFRHQXL core_r7_reg_9_ ( .D(n1614), .CK(clk), .RN(rst_n), .Q(core_r7[9]) );
  DFFRHQXL core_r6_reg_9_ ( .D(n1598), .CK(clk), .RN(rst_n), .Q(core_r6[9]) );
  DFFRHQXL core_r5_reg_9_ ( .D(n1582), .CK(clk), .RN(rst_n), .Q(core_r5[9]) );
  DFFRHQXL core_r4_reg_9_ ( .D(n1566), .CK(clk), .RN(rst_n), .Q(core_r4[9]) );
  DFFRHQXL core_r3_reg_9_ ( .D(n1550), .CK(clk), .RN(rst_n), .Q(core_r3[9]) );
  DFFRHQXL core_r2_reg_9_ ( .D(n1534), .CK(clk), .RN(rst_n), .Q(core_r2[9]) );
  DFFRHQXL core_r1_reg_9_ ( .D(n1518), .CK(clk), .RN(rst_n), .Q(core_r1[9]) );
  DFFRHQXL core_r0_reg_9_ ( .D(n1502), .CK(clk), .RN(rst_n), .Q(core_r0[9]) );
  DFFRHQXL core_r15_reg_9_ ( .D(n1487), .CK(clk), .RN(rst_n), .Q(core_r15[9])
         );
  DFFRHQXL core_r14_reg_9_ ( .D(n1471), .CK(clk), .RN(rst_n), .Q(core_r14[9])
         );
  DFFRHQXL DM_data_reg_9_ ( .D(n1453), .CK(clk), .RN(rst_n), .Q(DM_data[9]) );
  DFFRHQXL data_memory_lookup_data_reg_9_ ( .D(n1435), .CK(clk), .RN(rst_n), 
        .Q(data_memory_lookup_data[9]) );
  DFFRHQXL MEM_WB_memout_reg_8_ ( .D(n1422), .CK(clk), .RN(rst_n), .Q(
        MEM_WB_memout[8]) );
  DFFRHQXL core_r13_reg_8_ ( .D(n1709), .CK(clk), .RN(rst_n), .Q(core_r13[8])
         );
  DFFRHQXL core_r12_reg_8_ ( .D(n1693), .CK(clk), .RN(rst_n), .Q(core_r12[8])
         );
  DFFRHQXL core_r11_reg_8_ ( .D(n1677), .CK(clk), .RN(rst_n), .Q(core_r11[8])
         );
  DFFRHQXL core_r10_reg_8_ ( .D(n1661), .CK(clk), .RN(rst_n), .Q(core_r10[8])
         );
  DFFRHQXL core_r9_reg_8_ ( .D(n1645), .CK(clk), .RN(rst_n), .Q(core_r9[8]) );
  DFFRHQXL core_r8_reg_8_ ( .D(n1629), .CK(clk), .RN(rst_n), .Q(core_r8[8]) );
  DFFRHQXL core_r7_reg_8_ ( .D(n1613), .CK(clk), .RN(rst_n), .Q(core_r7[8]) );
  DFFRHQXL core_r6_reg_8_ ( .D(n1597), .CK(clk), .RN(rst_n), .Q(core_r6[8]) );
  DFFRHQXL core_r5_reg_8_ ( .D(n1581), .CK(clk), .RN(rst_n), .Q(core_r5[8]) );
  DFFRHQXL core_r4_reg_8_ ( .D(n1565), .CK(clk), .RN(rst_n), .Q(core_r4[8]) );
  DFFRHQXL core_r3_reg_8_ ( .D(n1549), .CK(clk), .RN(rst_n), .Q(core_r3[8]) );
  DFFRHQXL core_r2_reg_8_ ( .D(n1533), .CK(clk), .RN(rst_n), .Q(core_r2[8]) );
  DFFRHQXL core_r1_reg_8_ ( .D(n1517), .CK(clk), .RN(rst_n), .Q(core_r1[8]) );
  DFFRHQXL core_r0_reg_8_ ( .D(n1501), .CK(clk), .RN(rst_n), .Q(core_r0[8]) );
  DFFRHQXL core_r15_reg_8_ ( .D(n1486), .CK(clk), .RN(rst_n), .Q(core_r15[8])
         );
  DFFRHQXL core_r14_reg_8_ ( .D(n1470), .CK(clk), .RN(rst_n), .Q(core_r14[8])
         );
  DFFRHQXL DM_data_reg_8_ ( .D(n1454), .CK(clk), .RN(rst_n), .Q(DM_data[8]) );
  DFFRHQXL data_memory_lookup_data_reg_8_ ( .D(n1436), .CK(clk), .RN(rst_n), 
        .Q(data_memory_lookup_data[8]) );
  DFFRHQXL MEM_WB_memout_reg_7_ ( .D(n1421), .CK(clk), .RN(rst_n), .Q(
        MEM_WB_memout[7]) );
  DFFRHQXL core_r13_reg_7_ ( .D(n1708), .CK(clk), .RN(rst_n), .Q(core_r13[7])
         );
  DFFRHQXL core_r12_reg_7_ ( .D(n1692), .CK(clk), .RN(rst_n), .Q(core_r12[7])
         );
  DFFRHQXL core_r11_reg_7_ ( .D(n1676), .CK(clk), .RN(rst_n), .Q(core_r11[7])
         );
  DFFRHQXL core_r10_reg_7_ ( .D(n1660), .CK(clk), .RN(rst_n), .Q(core_r10[7])
         );
  DFFRHQXL core_r9_reg_7_ ( .D(n1644), .CK(clk), .RN(rst_n), .Q(core_r9[7]) );
  DFFRHQXL core_r8_reg_7_ ( .D(n1628), .CK(clk), .RN(rst_n), .Q(core_r8[7]) );
  DFFRHQXL core_r7_reg_7_ ( .D(n1612), .CK(clk), .RN(rst_n), .Q(core_r7[7]) );
  DFFRHQXL core_r6_reg_7_ ( .D(n1596), .CK(clk), .RN(rst_n), .Q(core_r6[7]) );
  DFFRHQXL core_r5_reg_7_ ( .D(n1580), .CK(clk), .RN(rst_n), .Q(core_r5[7]) );
  DFFRHQXL core_r4_reg_7_ ( .D(n1564), .CK(clk), .RN(rst_n), .Q(core_r4[7]) );
  DFFRHQXL core_r3_reg_7_ ( .D(n1548), .CK(clk), .RN(rst_n), .Q(core_r3[7]) );
  DFFRHQXL core_r2_reg_7_ ( .D(n1532), .CK(clk), .RN(rst_n), .Q(core_r2[7]) );
  DFFRHQXL core_r1_reg_7_ ( .D(n1516), .CK(clk), .RN(rst_n), .Q(core_r1[7]) );
  DFFRHQXL core_r0_reg_7_ ( .D(n1500), .CK(clk), .RN(rst_n), .Q(core_r0[7]) );
  DFFRHQXL core_r15_reg_7_ ( .D(n1485), .CK(clk), .RN(rst_n), .Q(core_r15[7])
         );
  DFFRHQXL core_r14_reg_7_ ( .D(n1469), .CK(clk), .RN(rst_n), .Q(core_r14[7])
         );
  DFFRHQXL DM_data_reg_7_ ( .D(n1455), .CK(clk), .RN(rst_n), .Q(DM_data[7]) );
  DFFRHQXL data_memory_lookup_data_reg_7_ ( .D(n1437), .CK(clk), .RN(rst_n), 
        .Q(data_memory_lookup_data[7]) );
  DFFRHQXL MEM_WB_memout_reg_6_ ( .D(n1420), .CK(clk), .RN(rst_n), .Q(
        MEM_WB_memout[6]) );
  DFFRHQXL core_r13_reg_6_ ( .D(n1707), .CK(clk), .RN(rst_n), .Q(core_r13[6])
         );
  DFFRHQXL core_r12_reg_6_ ( .D(n1691), .CK(clk), .RN(rst_n), .Q(core_r12[6])
         );
  DFFRHQXL core_r11_reg_6_ ( .D(n1675), .CK(clk), .RN(rst_n), .Q(core_r11[6])
         );
  DFFRHQXL core_r10_reg_6_ ( .D(n1659), .CK(clk), .RN(rst_n), .Q(core_r10[6])
         );
  DFFRHQXL core_r9_reg_6_ ( .D(n1643), .CK(clk), .RN(rst_n), .Q(core_r9[6]) );
  DFFRHQXL core_r8_reg_6_ ( .D(n1627), .CK(clk), .RN(rst_n), .Q(core_r8[6]) );
  DFFRHQXL core_r7_reg_6_ ( .D(n1611), .CK(clk), .RN(rst_n), .Q(core_r7[6]) );
  DFFRHQXL core_r6_reg_6_ ( .D(n1595), .CK(clk), .RN(rst_n), .Q(core_r6[6]) );
  DFFRHQXL core_r5_reg_6_ ( .D(n1579), .CK(clk), .RN(rst_n), .Q(core_r5[6]) );
  DFFRHQXL core_r4_reg_6_ ( .D(n1563), .CK(clk), .RN(rst_n), .Q(core_r4[6]) );
  DFFRHQXL core_r3_reg_6_ ( .D(n1547), .CK(clk), .RN(rst_n), .Q(core_r3[6]) );
  DFFRHQXL core_r2_reg_6_ ( .D(n1531), .CK(clk), .RN(rst_n), .Q(core_r2[6]) );
  DFFRHQXL core_r1_reg_6_ ( .D(n1515), .CK(clk), .RN(rst_n), .Q(core_r1[6]) );
  DFFRHQXL core_r0_reg_6_ ( .D(n1499), .CK(clk), .RN(rst_n), .Q(core_r0[6]) );
  DFFRHQXL core_r15_reg_6_ ( .D(n1484), .CK(clk), .RN(rst_n), .Q(core_r15[6])
         );
  DFFRHQXL core_r14_reg_6_ ( .D(n1468), .CK(clk), .RN(rst_n), .Q(core_r14[6])
         );
  DFFRHQXL DM_data_reg_6_ ( .D(n1456), .CK(clk), .RN(rst_n), .Q(DM_data[6]) );
  DFFRHQXL data_memory_lookup_data_reg_6_ ( .D(n1438), .CK(clk), .RN(rst_n), 
        .Q(data_memory_lookup_data[6]) );
  DFFRHQXL MEM_WB_memout_reg_5_ ( .D(n1419), .CK(clk), .RN(rst_n), .Q(
        MEM_WB_memout[5]) );
  DFFRHQXL core_r13_reg_5_ ( .D(n1706), .CK(clk), .RN(rst_n), .Q(core_r13[5])
         );
  DFFRHQXL core_r12_reg_5_ ( .D(n1690), .CK(clk), .RN(rst_n), .Q(core_r12[5])
         );
  DFFRHQXL core_r11_reg_5_ ( .D(n1674), .CK(clk), .RN(rst_n), .Q(core_r11[5])
         );
  DFFRHQXL core_r10_reg_5_ ( .D(n1658), .CK(clk), .RN(rst_n), .Q(core_r10[5])
         );
  DFFRHQXL core_r9_reg_5_ ( .D(n1642), .CK(clk), .RN(rst_n), .Q(core_r9[5]) );
  DFFRHQXL core_r8_reg_5_ ( .D(n1626), .CK(clk), .RN(rst_n), .Q(core_r8[5]) );
  DFFRHQXL core_r7_reg_5_ ( .D(n1610), .CK(clk), .RN(rst_n), .Q(core_r7[5]) );
  DFFRHQXL core_r6_reg_5_ ( .D(n1594), .CK(clk), .RN(rst_n), .Q(core_r6[5]) );
  DFFRHQXL core_r5_reg_5_ ( .D(n1578), .CK(clk), .RN(rst_n), .Q(core_r5[5]) );
  DFFRHQXL core_r4_reg_5_ ( .D(n1562), .CK(clk), .RN(rst_n), .Q(core_r4[5]) );
  DFFRHQXL core_r3_reg_5_ ( .D(n1546), .CK(clk), .RN(rst_n), .Q(core_r3[5]) );
  DFFRHQXL core_r2_reg_5_ ( .D(n1530), .CK(clk), .RN(rst_n), .Q(core_r2[5]) );
  DFFRHQXL core_r1_reg_5_ ( .D(n1514), .CK(clk), .RN(rst_n), .Q(core_r1[5]) );
  DFFRHQXL core_r0_reg_5_ ( .D(n1498), .CK(clk), .RN(rst_n), .Q(core_r0[5]) );
  DFFRHQXL core_r15_reg_5_ ( .D(n1483), .CK(clk), .RN(rst_n), .Q(core_r15[5])
         );
  DFFRHQXL core_r14_reg_5_ ( .D(n1467), .CK(clk), .RN(rst_n), .Q(core_r14[5])
         );
  DFFRHQXL DM_data_reg_5_ ( .D(n1457), .CK(clk), .RN(rst_n), .Q(DM_data[5]) );
  DFFRHQXL data_memory_lookup_data_reg_5_ ( .D(n1439), .CK(clk), .RN(rst_n), 
        .Q(data_memory_lookup_data[5]) );
  DFFRHQXL MEM_WB_memout_reg_4_ ( .D(n1418), .CK(clk), .RN(rst_n), .Q(
        MEM_WB_memout[4]) );
  DFFRHQXL core_r13_reg_4_ ( .D(n1705), .CK(clk), .RN(rst_n), .Q(core_r13[4])
         );
  DFFRHQXL core_r12_reg_4_ ( .D(n1689), .CK(clk), .RN(rst_n), .Q(core_r12[4])
         );
  DFFRHQXL core_r11_reg_4_ ( .D(n1673), .CK(clk), .RN(rst_n), .Q(core_r11[4])
         );
  DFFRHQXL core_r10_reg_4_ ( .D(n1657), .CK(clk), .RN(rst_n), .Q(core_r10[4])
         );
  DFFRHQXL core_r9_reg_4_ ( .D(n1641), .CK(clk), .RN(rst_n), .Q(core_r9[4]) );
  DFFRHQXL core_r8_reg_4_ ( .D(n1625), .CK(clk), .RN(rst_n), .Q(core_r8[4]) );
  DFFRHQXL core_r7_reg_4_ ( .D(n1609), .CK(clk), .RN(rst_n), .Q(core_r7[4]) );
  DFFRHQXL core_r6_reg_4_ ( .D(n1593), .CK(clk), .RN(rst_n), .Q(core_r6[4]) );
  DFFRHQXL core_r5_reg_4_ ( .D(n1577), .CK(clk), .RN(rst_n), .Q(core_r5[4]) );
  DFFRHQXL core_r4_reg_4_ ( .D(n1561), .CK(clk), .RN(rst_n), .Q(core_r4[4]) );
  DFFRHQXL core_r3_reg_4_ ( .D(n1545), .CK(clk), .RN(rst_n), .Q(core_r3[4]) );
  DFFRHQXL core_r2_reg_4_ ( .D(n1529), .CK(clk), .RN(rst_n), .Q(core_r2[4]) );
  DFFRHQXL core_r1_reg_4_ ( .D(n1513), .CK(clk), .RN(rst_n), .Q(core_r1[4]) );
  DFFRHQXL core_r0_reg_4_ ( .D(n1497), .CK(clk), .RN(rst_n), .Q(core_r0[4]) );
  DFFRHQXL core_r15_reg_4_ ( .D(n1482), .CK(clk), .RN(rst_n), .Q(core_r15[4])
         );
  DFFRHQXL core_r14_reg_4_ ( .D(n1466), .CK(clk), .RN(rst_n), .Q(core_r14[4])
         );
  DFFRHQXL DM_data_reg_4_ ( .D(n1458), .CK(clk), .RN(rst_n), .Q(DM_data[4]) );
  DFFRHQXL data_memory_lookup_data_reg_4_ ( .D(n1440), .CK(clk), .RN(rst_n), 
        .Q(data_memory_lookup_data[4]) );
  DFFRHQXL MEM_WB_memout_reg_3_ ( .D(n1417), .CK(clk), .RN(rst_n), .Q(
        MEM_WB_memout[3]) );
  DFFRHQXL core_r13_reg_3_ ( .D(n1704), .CK(clk), .RN(rst_n), .Q(core_r13[3])
         );
  DFFRHQXL core_r12_reg_3_ ( .D(n1688), .CK(clk), .RN(rst_n), .Q(core_r12[3])
         );
  DFFRHQXL core_r11_reg_3_ ( .D(n1672), .CK(clk), .RN(rst_n), .Q(core_r11[3])
         );
  DFFRHQXL core_r10_reg_3_ ( .D(n1656), .CK(clk), .RN(rst_n), .Q(core_r10[3])
         );
  DFFRHQXL core_r9_reg_3_ ( .D(n1640), .CK(clk), .RN(rst_n), .Q(core_r9[3]) );
  DFFRHQXL core_r8_reg_3_ ( .D(n1624), .CK(clk), .RN(rst_n), .Q(core_r8[3]) );
  DFFRHQXL core_r7_reg_3_ ( .D(n1608), .CK(clk), .RN(rst_n), .Q(core_r7[3]) );
  DFFRHQXL core_r6_reg_3_ ( .D(n1592), .CK(clk), .RN(rst_n), .Q(core_r6[3]) );
  DFFRHQXL core_r5_reg_3_ ( .D(n1576), .CK(clk), .RN(rst_n), .Q(core_r5[3]) );
  DFFRHQXL core_r4_reg_3_ ( .D(n1560), .CK(clk), .RN(rst_n), .Q(core_r4[3]) );
  DFFRHQXL core_r3_reg_3_ ( .D(n1544), .CK(clk), .RN(rst_n), .Q(core_r3[3]) );
  DFFRHQXL core_r2_reg_3_ ( .D(n1528), .CK(clk), .RN(rst_n), .Q(core_r2[3]) );
  DFFRHQXL core_r1_reg_3_ ( .D(n1512), .CK(clk), .RN(rst_n), .Q(core_r1[3]) );
  DFFRHQXL core_r0_reg_3_ ( .D(n1496), .CK(clk), .RN(rst_n), .Q(core_r0[3]) );
  DFFRHQXL core_r15_reg_3_ ( .D(n1481), .CK(clk), .RN(rst_n), .Q(core_r15[3])
         );
  DFFRHQXL core_r14_reg_3_ ( .D(n1465), .CK(clk), .RN(rst_n), .Q(core_r14[3])
         );
  DFFRHQXL DM_data_reg_3_ ( .D(n1459), .CK(clk), .RN(rst_n), .Q(DM_data[3]) );
  DFFRHQXL data_memory_lookup_data_reg_3_ ( .D(n1441), .CK(clk), .RN(rst_n), 
        .Q(data_memory_lookup_data[3]) );
  DFFRHQXL MEM_WB_memout_reg_2_ ( .D(n1416), .CK(clk), .RN(rst_n), .Q(
        MEM_WB_memout[2]) );
  DFFRHQXL core_r13_reg_2_ ( .D(n1703), .CK(clk), .RN(rst_n), .Q(core_r13[2])
         );
  DFFRHQXL core_r12_reg_2_ ( .D(n1687), .CK(clk), .RN(rst_n), .Q(core_r12[2])
         );
  DFFRHQXL core_r11_reg_2_ ( .D(n1671), .CK(clk), .RN(rst_n), .Q(core_r11[2])
         );
  DFFRHQXL core_r10_reg_2_ ( .D(n1655), .CK(clk), .RN(rst_n), .Q(core_r10[2])
         );
  DFFRHQXL core_r9_reg_2_ ( .D(n1639), .CK(clk), .RN(rst_n), .Q(core_r9[2]) );
  DFFRHQXL core_r8_reg_2_ ( .D(n1623), .CK(clk), .RN(rst_n), .Q(core_r8[2]) );
  DFFRHQXL core_r7_reg_2_ ( .D(n1607), .CK(clk), .RN(rst_n), .Q(core_r7[2]) );
  DFFRHQXL core_r6_reg_2_ ( .D(n1591), .CK(clk), .RN(rst_n), .Q(core_r6[2]) );
  DFFRHQXL core_r5_reg_2_ ( .D(n1575), .CK(clk), .RN(rst_n), .Q(core_r5[2]) );
  DFFRHQXL core_r4_reg_2_ ( .D(n1559), .CK(clk), .RN(rst_n), .Q(core_r4[2]) );
  DFFRHQXL core_r3_reg_2_ ( .D(n1543), .CK(clk), .RN(rst_n), .Q(core_r3[2]) );
  DFFRHQXL core_r2_reg_2_ ( .D(n1527), .CK(clk), .RN(rst_n), .Q(core_r2[2]) );
  DFFRHQXL core_r1_reg_2_ ( .D(n1511), .CK(clk), .RN(rst_n), .Q(core_r1[2]) );
  DFFRHQXL core_r0_reg_2_ ( .D(n1495), .CK(clk), .RN(rst_n), .Q(core_r0[2]) );
  DFFRHQXL core_r15_reg_2_ ( .D(n1480), .CK(clk), .RN(rst_n), .Q(core_r15[2])
         );
  DFFRHQXL core_r14_reg_2_ ( .D(n1464), .CK(clk), .RN(rst_n), .Q(core_r14[2])
         );
  DFFRHQXL DM_data_reg_2_ ( .D(n1460), .CK(clk), .RN(rst_n), .Q(DM_data[2]) );
  DFFRHQXL data_memory_lookup_data_reg_2_ ( .D(n1442), .CK(clk), .RN(rst_n), 
        .Q(data_memory_lookup_data[2]) );
  DFFRHQXL MEM_WB_memout_reg_1_ ( .D(n1415), .CK(clk), .RN(rst_n), .Q(
        MEM_WB_memout[1]) );
  DFFRHQXL core_r13_reg_1_ ( .D(n1702), .CK(clk), .RN(rst_n), .Q(core_r13[1])
         );
  DFFRHQXL core_r12_reg_1_ ( .D(n1686), .CK(clk), .RN(rst_n), .Q(core_r12[1])
         );
  DFFRHQXL core_r11_reg_1_ ( .D(n1670), .CK(clk), .RN(rst_n), .Q(core_r11[1])
         );
  DFFRHQXL core_r10_reg_1_ ( .D(n1654), .CK(clk), .RN(rst_n), .Q(core_r10[1])
         );
  DFFRHQXL core_r9_reg_1_ ( .D(n1638), .CK(clk), .RN(rst_n), .Q(core_r9[1]) );
  DFFRHQXL core_r8_reg_1_ ( .D(n1622), .CK(clk), .RN(rst_n), .Q(core_r8[1]) );
  DFFRHQXL core_r7_reg_1_ ( .D(n1606), .CK(clk), .RN(rst_n), .Q(core_r7[1]) );
  DFFRHQXL core_r6_reg_1_ ( .D(n1590), .CK(clk), .RN(rst_n), .Q(core_r6[1]) );
  DFFRHQXL core_r5_reg_1_ ( .D(n1574), .CK(clk), .RN(rst_n), .Q(core_r5[1]) );
  DFFRHQXL core_r4_reg_1_ ( .D(n1558), .CK(clk), .RN(rst_n), .Q(core_r4[1]) );
  DFFRHQXL core_r3_reg_1_ ( .D(n1542), .CK(clk), .RN(rst_n), .Q(core_r3[1]) );
  DFFRHQXL core_r2_reg_1_ ( .D(n1526), .CK(clk), .RN(rst_n), .Q(core_r2[1]) );
  DFFRHQXL core_r1_reg_1_ ( .D(n1510), .CK(clk), .RN(rst_n), .Q(core_r1[1]) );
  DFFRHQXL core_r0_reg_1_ ( .D(n1494), .CK(clk), .RN(rst_n), .Q(core_r0[1]) );
  DFFRHQXL core_r15_reg_1_ ( .D(n1479), .CK(clk), .RN(rst_n), .Q(core_r15[1])
         );
  DFFRHQXL core_r14_reg_1_ ( .D(n1463), .CK(clk), .RN(rst_n), .Q(core_r14[1])
         );
  DFFRHQXL DM_data_reg_1_ ( .D(n1461), .CK(clk), .RN(rst_n), .Q(DM_data[1]) );
  DFFRHQXL data_memory_lookup_data_reg_1_ ( .D(n1443), .CK(clk), .RN(rst_n), 
        .Q(data_memory_lookup_data[1]) );
  DFFRHQXL MEM_WB_memout_reg_15_ ( .D(n1778), .CK(clk), .RN(rst_n), .Q(
        MEM_WB_memout[15]) );
  DFFRHQXL core_r15_reg_15_ ( .D(n1777), .CK(clk), .RN(rst_n), .Q(core_r15[15]) );
  DFFRHQXL core_r13_reg_15_ ( .D(n1716), .CK(clk), .RN(rst_n), .Q(core_r13[15]) );
  DFFRHQXL core_r12_reg_15_ ( .D(n1700), .CK(clk), .RN(rst_n), .Q(core_r12[15]) );
  DFFRHQXL core_r11_reg_15_ ( .D(n1684), .CK(clk), .RN(rst_n), .Q(core_r11[15]) );
  DFFRHQXL core_r10_reg_15_ ( .D(n1668), .CK(clk), .RN(rst_n), .Q(core_r10[15]) );
  DFFRHQXL core_r9_reg_15_ ( .D(n1652), .CK(clk), .RN(rst_n), .Q(core_r9[15])
         );
  DFFRHQXL core_r8_reg_15_ ( .D(n1636), .CK(clk), .RN(rst_n), .Q(core_r8[15])
         );
  DFFRHQXL core_r7_reg_15_ ( .D(n1620), .CK(clk), .RN(rst_n), .Q(core_r7[15])
         );
  DFFRHQXL core_r6_reg_15_ ( .D(n1604), .CK(clk), .RN(rst_n), .Q(core_r6[15])
         );
  DFFRHQXL core_r5_reg_15_ ( .D(n1588), .CK(clk), .RN(rst_n), .Q(core_r5[15])
         );
  DFFRHQXL core_r4_reg_15_ ( .D(n1572), .CK(clk), .RN(rst_n), .Q(core_r4[15])
         );
  DFFRHQXL core_r3_reg_15_ ( .D(n1556), .CK(clk), .RN(rst_n), .Q(core_r3[15])
         );
  DFFRHQXL core_r2_reg_15_ ( .D(n1540), .CK(clk), .RN(rst_n), .Q(core_r2[15])
         );
  DFFRHQXL core_r1_reg_15_ ( .D(n1524), .CK(clk), .RN(rst_n), .Q(core_r1[15])
         );
  DFFRHQXL core_r0_reg_15_ ( .D(n1508), .CK(clk), .RN(rst_n), .Q(core_r0[15])
         );
  DFFRHQXL core_r14_reg_15_ ( .D(n1477), .CK(clk), .RN(rst_n), .Q(core_r14[15]) );
  DFFRHQXL DM_data_reg_15_ ( .D(n1447), .CK(clk), .RN(rst_n), .Q(DM_data[15])
         );
  DFFRHQXL data_memory_lookup_data_reg_15_ ( .D(n1445), .CK(clk), .RN(rst_n), 
        .Q(data_memory_lookup_data[15]) );
  DFFRHQXL MEM_WB_memout_reg_14_ ( .D(n1428), .CK(clk), .RN(rst_n), .Q(
        MEM_WB_memout[14]) );
  DFFRHQXL core_r13_reg_14_ ( .D(n1715), .CK(clk), .RN(rst_n), .Q(core_r13[14]) );
  DFFRHQXL core_r12_reg_14_ ( .D(n1699), .CK(clk), .RN(rst_n), .Q(core_r12[14]) );
  DFFRHQXL core_r11_reg_14_ ( .D(n1683), .CK(clk), .RN(rst_n), .Q(core_r11[14]) );
  DFFRHQXL core_r10_reg_14_ ( .D(n1667), .CK(clk), .RN(rst_n), .Q(core_r10[14]) );
  DFFRHQXL core_r9_reg_14_ ( .D(n1651), .CK(clk), .RN(rst_n), .Q(core_r9[14])
         );
  DFFRHQXL core_r8_reg_14_ ( .D(n1635), .CK(clk), .RN(rst_n), .Q(core_r8[14])
         );
  DFFRHQXL core_r7_reg_14_ ( .D(n1619), .CK(clk), .RN(rst_n), .Q(core_r7[14])
         );
  DFFRHQXL core_r6_reg_14_ ( .D(n1603), .CK(clk), .RN(rst_n), .Q(core_r6[14])
         );
  DFFRHQXL core_r5_reg_14_ ( .D(n1587), .CK(clk), .RN(rst_n), .Q(core_r5[14])
         );
  DFFRHQXL core_r4_reg_14_ ( .D(n1571), .CK(clk), .RN(rst_n), .Q(core_r4[14])
         );
  DFFRHQXL core_r3_reg_14_ ( .D(n1555), .CK(clk), .RN(rst_n), .Q(core_r3[14])
         );
  DFFRHQXL core_r2_reg_14_ ( .D(n1539), .CK(clk), .RN(rst_n), .Q(core_r2[14])
         );
  DFFRHQXL core_r1_reg_14_ ( .D(n1523), .CK(clk), .RN(rst_n), .Q(core_r1[14])
         );
  DFFRHQXL core_r0_reg_14_ ( .D(n1507), .CK(clk), .RN(rst_n), .Q(core_r0[14])
         );
  DFFRHQXL core_r15_reg_14_ ( .D(n1492), .CK(clk), .RN(rst_n), .Q(core_r15[14]) );
  DFFRHQXL core_r14_reg_14_ ( .D(n1476), .CK(clk), .RN(rst_n), .Q(core_r14[14]) );
  DFFRHQXL DM_data_reg_14_ ( .D(n1448), .CK(clk), .RN(rst_n), .Q(DM_data[14])
         );
  DFFRHQXL data_memory_lookup_data_reg_14_ ( .D(n1430), .CK(clk), .RN(rst_n), 
        .Q(data_memory_lookup_data[14]) );
  DFFRHQXL MEM_WB_memout_reg_13_ ( .D(n1427), .CK(clk), .RN(rst_n), .Q(
        MEM_WB_memout[13]) );
  DFFRHQXL core_r13_reg_13_ ( .D(n1714), .CK(clk), .RN(rst_n), .Q(core_r13[13]) );
  DFFRHQXL core_r12_reg_13_ ( .D(n1698), .CK(clk), .RN(rst_n), .Q(core_r12[13]) );
  DFFRHQXL core_r11_reg_13_ ( .D(n1682), .CK(clk), .RN(rst_n), .Q(core_r11[13]) );
  DFFRHQXL core_r10_reg_13_ ( .D(n1666), .CK(clk), .RN(rst_n), .Q(core_r10[13]) );
  DFFRHQXL core_r9_reg_13_ ( .D(n1650), .CK(clk), .RN(rst_n), .Q(core_r9[13])
         );
  DFFRHQXL core_r8_reg_13_ ( .D(n1634), .CK(clk), .RN(rst_n), .Q(core_r8[13])
         );
  DFFRHQXL core_r7_reg_13_ ( .D(n1618), .CK(clk), .RN(rst_n), .Q(core_r7[13])
         );
  DFFRHQXL core_r6_reg_13_ ( .D(n1602), .CK(clk), .RN(rst_n), .Q(core_r6[13])
         );
  DFFRHQXL core_r5_reg_13_ ( .D(n1586), .CK(clk), .RN(rst_n), .Q(core_r5[13])
         );
  DFFRHQXL core_r4_reg_13_ ( .D(n1570), .CK(clk), .RN(rst_n), .Q(core_r4[13])
         );
  DFFRHQXL core_r3_reg_13_ ( .D(n1554), .CK(clk), .RN(rst_n), .Q(core_r3[13])
         );
  DFFRHQXL core_r2_reg_13_ ( .D(n1538), .CK(clk), .RN(rst_n), .Q(core_r2[13])
         );
  DFFRHQXL core_r1_reg_13_ ( .D(n1522), .CK(clk), .RN(rst_n), .Q(core_r1[13])
         );
  DFFRHQXL core_r0_reg_13_ ( .D(n1506), .CK(clk), .RN(rst_n), .Q(core_r0[13])
         );
  DFFRHQXL core_r15_reg_13_ ( .D(n1491), .CK(clk), .RN(rst_n), .Q(core_r15[13]) );
  DFFRHQXL core_r14_reg_13_ ( .D(n1475), .CK(clk), .RN(rst_n), .Q(core_r14[13]) );
  DFFRHQXL DM_data_reg_13_ ( .D(n1449), .CK(clk), .RN(rst_n), .Q(DM_data[13])
         );
  DFFRHQXL data_memory_lookup_data_reg_13_ ( .D(n1431), .CK(clk), .RN(rst_n), 
        .Q(data_memory_lookup_data[13]) );
  DFFRHQXL MEM_WB_memout_reg_12_ ( .D(n1426), .CK(clk), .RN(rst_n), .Q(
        MEM_WB_memout[12]) );
  DFFRHQXL core_r13_reg_12_ ( .D(n1713), .CK(clk), .RN(rst_n), .Q(core_r13[12]) );
  DFFRHQXL core_r12_reg_12_ ( .D(n1697), .CK(clk), .RN(rst_n), .Q(core_r12[12]) );
  DFFRHQXL core_r11_reg_12_ ( .D(n1681), .CK(clk), .RN(rst_n), .Q(core_r11[12]) );
  DFFRHQXL core_r10_reg_12_ ( .D(n1665), .CK(clk), .RN(rst_n), .Q(core_r10[12]) );
  DFFRHQXL core_r9_reg_12_ ( .D(n1649), .CK(clk), .RN(rst_n), .Q(core_r9[12])
         );
  DFFRHQXL core_r8_reg_12_ ( .D(n1633), .CK(clk), .RN(rst_n), .Q(core_r8[12])
         );
  DFFRHQXL core_r7_reg_12_ ( .D(n1617), .CK(clk), .RN(rst_n), .Q(core_r7[12])
         );
  DFFRHQXL core_r6_reg_12_ ( .D(n1601), .CK(clk), .RN(rst_n), .Q(core_r6[12])
         );
  DFFRHQXL core_r5_reg_12_ ( .D(n1585), .CK(clk), .RN(rst_n), .Q(core_r5[12])
         );
  DFFRHQXL core_r4_reg_12_ ( .D(n1569), .CK(clk), .RN(rst_n), .Q(core_r4[12])
         );
  DFFRHQXL core_r3_reg_12_ ( .D(n1553), .CK(clk), .RN(rst_n), .Q(core_r3[12])
         );
  DFFRHQXL core_r2_reg_12_ ( .D(n1537), .CK(clk), .RN(rst_n), .Q(core_r2[12])
         );
  DFFRHQXL core_r1_reg_12_ ( .D(n1521), .CK(clk), .RN(rst_n), .Q(core_r1[12])
         );
  DFFRHQXL core_r0_reg_12_ ( .D(n1505), .CK(clk), .RN(rst_n), .Q(core_r0[12])
         );
  DFFRHQXL core_r15_reg_12_ ( .D(n1490), .CK(clk), .RN(rst_n), .Q(core_r15[12]) );
  DFFRHQXL core_r14_reg_12_ ( .D(n1474), .CK(clk), .RN(rst_n), .Q(core_r14[12]) );
  DFFRHQXL DM_data_reg_12_ ( .D(n1450), .CK(clk), .RN(rst_n), .Q(DM_data[12])
         );
  DFFRHQXL data_memory_lookup_data_reg_12_ ( .D(n1432), .CK(clk), .RN(rst_n), 
        .Q(data_memory_lookup_data[12]) );
  DFFRHQXL MEM_WB_memout_reg_11_ ( .D(n1425), .CK(clk), .RN(rst_n), .Q(
        MEM_WB_memout[11]) );
  DFFRHQXL core_r13_reg_11_ ( .D(n1712), .CK(clk), .RN(rst_n), .Q(core_r13[11]) );
  DFFRHQXL core_r12_reg_11_ ( .D(n1696), .CK(clk), .RN(rst_n), .Q(core_r12[11]) );
  DFFRHQXL core_r11_reg_11_ ( .D(n1680), .CK(clk), .RN(rst_n), .Q(core_r11[11]) );
  DFFRHQXL core_r10_reg_11_ ( .D(n1664), .CK(clk), .RN(rst_n), .Q(core_r10[11]) );
  DFFRHQXL core_r9_reg_11_ ( .D(n1648), .CK(clk), .RN(rst_n), .Q(core_r9[11])
         );
  DFFRHQXL core_r8_reg_11_ ( .D(n1632), .CK(clk), .RN(rst_n), .Q(core_r8[11])
         );
  DFFRHQXL core_r7_reg_11_ ( .D(n1616), .CK(clk), .RN(rst_n), .Q(core_r7[11])
         );
  DFFRHQXL core_r6_reg_11_ ( .D(n1600), .CK(clk), .RN(rst_n), .Q(core_r6[11])
         );
  DFFRHQXL core_r5_reg_11_ ( .D(n1584), .CK(clk), .RN(rst_n), .Q(core_r5[11])
         );
  DFFRHQXL core_r4_reg_11_ ( .D(n1568), .CK(clk), .RN(rst_n), .Q(core_r4[11])
         );
  DFFRHQXL core_r3_reg_11_ ( .D(n1552), .CK(clk), .RN(rst_n), .Q(core_r3[11])
         );
  DFFRHQXL core_r2_reg_11_ ( .D(n1536), .CK(clk), .RN(rst_n), .Q(core_r2[11])
         );
  DFFRHQXL core_r1_reg_11_ ( .D(n1520), .CK(clk), .RN(rst_n), .Q(core_r1[11])
         );
  DFFRHQXL core_r0_reg_11_ ( .D(n1504), .CK(clk), .RN(rst_n), .Q(core_r0[11])
         );
  DFFRHQXL core_r15_reg_11_ ( .D(n1489), .CK(clk), .RN(rst_n), .Q(core_r15[11]) );
  DFFRHQXL core_r14_reg_11_ ( .D(n1473), .CK(clk), .RN(rst_n), .Q(core_r14[11]) );
  DFFRHQXL DM_data_reg_11_ ( .D(n1451), .CK(clk), .RN(rst_n), .Q(DM_data[11])
         );
  DFFRHQXL data_memory_lookup_data_reg_11_ ( .D(n1433), .CK(clk), .RN(rst_n), 
        .Q(data_memory_lookup_data[11]) );
  DFFRHQXL MEM_WB_memout_reg_10_ ( .D(n1424), .CK(clk), .RN(rst_n), .Q(
        MEM_WB_memout[10]) );
  DFFRHQXL core_r13_reg_10_ ( .D(n1711), .CK(clk), .RN(rst_n), .Q(core_r13[10]) );
  DFFRHQXL core_r12_reg_10_ ( .D(n1695), .CK(clk), .RN(rst_n), .Q(core_r12[10]) );
  DFFRHQXL core_r11_reg_10_ ( .D(n1679), .CK(clk), .RN(rst_n), .Q(core_r11[10]) );
  DFFRHQXL core_r10_reg_10_ ( .D(n1663), .CK(clk), .RN(rst_n), .Q(core_r10[10]) );
  DFFRHQXL core_r9_reg_10_ ( .D(n1647), .CK(clk), .RN(rst_n), .Q(core_r9[10])
         );
  DFFRHQXL core_r8_reg_10_ ( .D(n1631), .CK(clk), .RN(rst_n), .Q(core_r8[10])
         );
  DFFRHQXL core_r7_reg_10_ ( .D(n1615), .CK(clk), .RN(rst_n), .Q(core_r7[10])
         );
  DFFRHQXL core_r6_reg_10_ ( .D(n1599), .CK(clk), .RN(rst_n), .Q(core_r6[10])
         );
  DFFRHQXL core_r5_reg_10_ ( .D(n1583), .CK(clk), .RN(rst_n), .Q(core_r5[10])
         );
  DFFRHQXL core_r4_reg_10_ ( .D(n1567), .CK(clk), .RN(rst_n), .Q(core_r4[10])
         );
  DFFRHQXL core_r3_reg_10_ ( .D(n1551), .CK(clk), .RN(rst_n), .Q(core_r3[10])
         );
  DFFRHQXL core_r2_reg_10_ ( .D(n1535), .CK(clk), .RN(rst_n), .Q(core_r2[10])
         );
  DFFRHQXL core_r1_reg_10_ ( .D(n1519), .CK(clk), .RN(rst_n), .Q(core_r1[10])
         );
  DFFRHQXL core_r0_reg_10_ ( .D(n1503), .CK(clk), .RN(rst_n), .Q(core_r0[10])
         );
  DFFRHQXL core_r15_reg_10_ ( .D(n1488), .CK(clk), .RN(rst_n), .Q(core_r15[10]) );
  DFFRHQXL core_r14_reg_10_ ( .D(n1472), .CK(clk), .RN(rst_n), .Q(core_r14[10]) );
  DFFRHQXL DM_data_reg_10_ ( .D(n1452), .CK(clk), .RN(rst_n), .Q(DM_data[10])
         );
  DFFRHQXL data_memory_lookup_data_reg_10_ ( .D(n1434), .CK(clk), .RN(rst_n), 
        .Q(data_memory_lookup_data[10]) );
  DFFRHQXL MEM_WB_memout_reg_0_ ( .D(n1429), .CK(clk), .RN(rst_n), .Q(
        MEM_WB_memout[0]) );
  DFFRHQXL core_r13_reg_0_ ( .D(n1717), .CK(clk), .RN(rst_n), .Q(core_r13[0])
         );
  DFFRHQXL core_r12_reg_0_ ( .D(n1701), .CK(clk), .RN(rst_n), .Q(core_r12[0])
         );
  DFFRHQXL core_r11_reg_0_ ( .D(n1685), .CK(clk), .RN(rst_n), .Q(core_r11[0])
         );
  DFFRHQXL core_r10_reg_0_ ( .D(n1669), .CK(clk), .RN(rst_n), .Q(core_r10[0])
         );
  DFFRHQXL core_r9_reg_0_ ( .D(n1653), .CK(clk), .RN(rst_n), .Q(core_r9[0]) );
  DFFRHQXL core_r8_reg_0_ ( .D(n1637), .CK(clk), .RN(rst_n), .Q(core_r8[0]) );
  DFFRHQXL core_r7_reg_0_ ( .D(n1621), .CK(clk), .RN(rst_n), .Q(core_r7[0]) );
  DFFRHQXL core_r6_reg_0_ ( .D(n1605), .CK(clk), .RN(rst_n), .Q(core_r6[0]) );
  DFFRHQXL core_r5_reg_0_ ( .D(n1589), .CK(clk), .RN(rst_n), .Q(core_r5[0]) );
  DFFRHQXL core_r4_reg_0_ ( .D(n1573), .CK(clk), .RN(rst_n), .Q(core_r4[0]) );
  DFFRHQXL core_r3_reg_0_ ( .D(n1557), .CK(clk), .RN(rst_n), .Q(core_r3[0]) );
  DFFRHQXL core_r2_reg_0_ ( .D(n1541), .CK(clk), .RN(rst_n), .Q(core_r2[0]) );
  DFFRHQXL core_r1_reg_0_ ( .D(n1525), .CK(clk), .RN(rst_n), .Q(core_r1[0]) );
  DFFRHQXL core_r0_reg_0_ ( .D(n1509), .CK(clk), .RN(rst_n), .Q(core_r0[0]) );
  DFFRHQXL core_r15_reg_0_ ( .D(n1493), .CK(clk), .RN(rst_n), .Q(core_r15[0])
         );
  DFFRHQXL core_r14_reg_0_ ( .D(n1478), .CK(clk), .RN(rst_n), .Q(core_r14[0])
         );
  DFFRHQXL DM_data_reg_0_ ( .D(n1462), .CK(clk), .RN(rst_n), .Q(DM_data[0]) );
  DFFRHQXL data_memory_lookup_data_reg_0_ ( .D(n1444), .CK(clk), .RN(rst_n), 
        .Q(data_memory_lookup_data[0]) );
  DFFRHQXL data_memory_writeback_storeq_reg_0_ ( .D(n1383), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq[0]) );
  DFFRHQXL data_memory_writeback_storeq2_reg_0_ ( .D(n1382), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq2[0]) );
  DFFRHQXL data_memory_writeback_storeq_reg_15_ ( .D(n1381), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq[15]) );
  DFFRHQXL data_memory_writeback_storeq2_reg_15_ ( .D(n1380), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq2[15]) );
  DFFRHQXL data_memory_writeback_storeq_reg_14_ ( .D(n1379), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq[14]) );
  DFFRHQXL data_memory_writeback_storeq2_reg_14_ ( .D(n1378), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq2[14]) );
  DFFRHQXL data_memory_writeback_storeq_reg_13_ ( .D(n1377), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq[13]) );
  DFFRHQXL data_memory_writeback_storeq2_reg_13_ ( .D(n1376), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq2[13]) );
  DFFRHQXL data_memory_writeback_storeq_reg_12_ ( .D(n1375), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq[12]) );
  DFFRHQXL data_memory_writeback_storeq2_reg_12_ ( .D(n1374), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq2[12]) );
  DFFRHQXL data_memory_writeback_storeq_reg_11_ ( .D(n1373), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq[11]) );
  DFFRHQXL data_memory_writeback_storeq2_reg_11_ ( .D(n1372), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq2[11]) );
  DFFRHQXL data_memory_writeback_storeq_reg_10_ ( .D(n1371), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq[10]) );
  DFFRHQXL data_memory_writeback_storeq2_reg_10_ ( .D(n1370), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq2[10]) );
  DFFRHQXL data_memory_writeback_storeq_reg_9_ ( .D(n1369), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq[9]) );
  DFFRHQXL data_memory_writeback_storeq2_reg_9_ ( .D(n1368), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq2[9]) );
  DFFRHQXL data_memory_writeback_storeq_reg_8_ ( .D(n1367), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq[8]) );
  DFFRHQXL data_memory_writeback_storeq2_reg_8_ ( .D(n1366), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq2[8]) );
  DFFRHQXL data_memory_writeback_storeq_reg_7_ ( .D(n1365), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq[7]) );
  DFFRHQXL data_memory_writeback_storeq2_reg_7_ ( .D(n1364), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq2[7]) );
  DFFRHQXL data_memory_writeback_storeq_reg_6_ ( .D(n1363), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq[6]) );
  DFFRHQXL data_memory_writeback_storeq2_reg_6_ ( .D(n1362), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq2[6]) );
  DFFRHQXL data_memory_writeback_storeq_reg_5_ ( .D(n1361), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq[5]) );
  DFFRHQXL data_memory_writeback_storeq2_reg_5_ ( .D(n1360), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq2[5]) );
  DFFRHQXL data_memory_writeback_storeq_reg_4_ ( .D(n1359), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq[4]) );
  DFFRHQXL data_memory_writeback_storeq2_reg_4_ ( .D(n1358), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq2[4]) );
  DFFRHQXL data_memory_writeback_storeq_reg_3_ ( .D(n1357), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq[3]) );
  DFFRHQXL data_memory_writeback_storeq2_reg_3_ ( .D(n1356), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq2[3]) );
  DFFRHQXL data_memory_writeback_storeq_reg_2_ ( .D(n1355), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq[2]) );
  DFFRHQXL data_memory_writeback_storeq2_reg_2_ ( .D(n1354), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq2[2]) );
  DFFRHQXL data_memory_writeback_storeq_reg_1_ ( .D(n1353), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq[1]) );
  DFFRHQXL data_memory_writeback_storeq2_reg_1_ ( .D(n1351), .CK(clk), .RN(
        rst_n), .Q(data_memory_writeback_storeq2[1]) );
  DFFRHQX4 data_memory_dcache_headpc_reg_0_ ( .D(n1350), .CK(clk), .RN(rst_n), 
        .Q(C303_DATA2_0) );
  DFFRHQXL data_memory_dcache_headpc_reg_10_ ( .D(n1349), .CK(clk), .RN(rst_n), 
        .Q(data_memory_dcache_headpc[10]) );
  DFFRHQXL data_memory_dcache_headpc_reg_8_ ( .D(n1347), .CK(clk), .RN(rst_n), 
        .Q(data_memory_dcache_headpc[8]) );
  DFFRHQX4 data_memory_dcache_headpc_reg_1_ ( .D(n1340), .CK(clk), .RN(rst_n), 
        .Q(C303_DATA2_1) );
  DFFRHQXL EXE_MEM_PCnxt_reg_0_ ( .D(n1339), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_PCnxt[0]) );
  DFFRHQXL EXE_MEM_PCnxt_reg_10_ ( .D(n1338), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_PCnxt[10]) );
  DFFRHQXL EXE_MEM_PCnxt_reg_9_ ( .D(n1337), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_PCnxt[9]) );
  DFFRHQXL EXE_MEM_PCnxt_reg_8_ ( .D(n1336), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_PCnxt[8]) );
  DFFRHQXL EXE_MEM_PCnxt_reg_7_ ( .D(n1335), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_PCnxt[7]) );
  DFFRHQXL EXE_MEM_PCnxt_reg_6_ ( .D(n1334), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_PCnxt[6]) );
  DFFRHQXL EXE_MEM_PCnxt_reg_5_ ( .D(n1333), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_PCnxt[5]) );
  DFFRHQXL EXE_MEM_PCnxt_reg_4_ ( .D(n1332), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_PCnxt[4]) );
  DFFRHQXL EXE_MEM_PCnxt_reg_3_ ( .D(n1331), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_PCnxt[3]) );
  DFFRHQXL EXE_MEM_PCnxt_reg_2_ ( .D(n1330), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_PCnxt[2]) );
  DFFRHQXL EXE_MEM_PCnxt_reg_1_ ( .D(n1329), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_PCnxt[1]) );
  DFFRHQXL EXE_MEM_instcode_reg_1_ ( .D(n1328), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_instcode[1]) );
  DFFRHQXL EXE_MEM_instcode_reg_2_ ( .D(n1327), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_instcode[2]) );
  DFFRHQXL EXE_MEM_instcode_reg_3_ ( .D(n1326), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_instcode[3]) );
  DFFRHQXL EXE_MEM_instcode_reg_4_ ( .D(n1325), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_instcode[4]) );
  DFFRHQXL EXE_MEM_instcode_reg_6_ ( .D(n1324), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_instcode_6) );
  DFFRHQXL EXE_MEM_instcode_reg_7_ ( .D(n1323), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_instcode_7) );
  DFFRHQXL EXE_MEM_instcode_reg_0_ ( .D(n1322), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_instcode[0]) );
  DFFRHQXL EXE_MEM_target_reg_1_ ( .D(n1321), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_target[1]) );
  DFFRHQXL EXE_MEM_target_reg_2_ ( .D(n1320), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_target[2]) );
  DFFRHQXL EXE_MEM_target_reg_3_ ( .D(n1319), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_target[3]) );
  DFFRHQXL EXE_MEM_target_reg_0_ ( .D(n1318), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_target[0]) );
  DFFRHQXL EXE_MEM_result_reg_1_ ( .D(n1317), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_result[1]) );
  DFFRHQXL EXE_MEM_result_reg_2_ ( .D(n1316), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_result[2]) );
  DFFRHQXL EXE_MEM_result_reg_3_ ( .D(n1315), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_result[3]) );
  DFFRHQXL EXE_MEM_result_reg_4_ ( .D(n1314), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_result[4]) );
  DFFRHQXL EXE_MEM_result_reg_5_ ( .D(n1313), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_result[5]) );
  DFFRHQXL EXE_MEM_result_reg_6_ ( .D(n1312), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_result[6]) );
  DFFRHQXL EXE_MEM_result_reg_7_ ( .D(n1311), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_result[7]) );
  DFFRHQXL EXE_MEM_result_reg_8_ ( .D(n1310), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_result[8]) );
  DFFRHQXL EXE_MEM_result_reg_9_ ( .D(n4942), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_result[9]) );
  DFFRHQXL EXE_MEM_result_reg_10_ ( .D(n1308), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_result[10]) );
  DFFRHQXL EXE_MEM_result_reg_11_ ( .D(n1307), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_result[11]) );
  DFFRHQXL EXE_MEM_result_reg_0_ ( .D(n1302), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_result[0]) );
  DFFRHQXL IF_DEC_PC_reg_8_ ( .D(n1301), .CK(clk), .RN(rst_n), .Q(IF_DEC_PC[8]) );
  DFFRHQXL IF_DEC_PC_reg_10_ ( .D(n1300), .CK(clk), .RN(rst_n), .Q(
        IF_DEC_PC[10]) );
  DFFRHQXL instruction_memory_lookup_pc_reg_10_ ( .D(n1299), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_lookup_pc[10]) );
  DFFRHQXL IF_DEC_PC_reg_9_ ( .D(n1298), .CK(clk), .RN(rst_n), .Q(IF_DEC_PC[9]) );
  DFFRHQXL instruction_memory_lookup_pc_reg_9_ ( .D(n1297), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_lookup_pc[9]) );
  DFFRHQXL IF_DEC_PC_reg_0_ ( .D(n1296), .CK(clk), .RN(rst_n), .Q(IF_DEC_PC[0]) );
  DFFRHQXL instruction_memory_lookup_pc_reg_0_ ( .D(n1295), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_lookup_pc[0]) );
  DFFRHQXL IF_DEC_PC_reg_1_ ( .D(n1294), .CK(clk), .RN(rst_n), .Q(IF_DEC_PC[1]) );
  DFFRHQXL instruction_memory_lookup_pc_reg_1_ ( .D(n1293), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_lookup_pc[1]) );
  DFFRHQXL IF_DEC_PC_reg_2_ ( .D(n1292), .CK(clk), .RN(rst_n), .Q(IF_DEC_PC[2]) );
  DFFRHQXL instruction_memory_lookup_pc_reg_2_ ( .D(n1291), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_lookup_pc[2]) );
  DFFRHQXL IF_DEC_PC_reg_3_ ( .D(n1290), .CK(clk), .RN(rst_n), .Q(IF_DEC_PC[3]) );
  DFFRHQXL instruction_memory_lookup_pc_reg_3_ ( .D(n1289), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_lookup_pc[3]) );
  DFFRHQXL IF_DEC_PC_reg_4_ ( .D(n1288), .CK(clk), .RN(rst_n), .Q(IF_DEC_PC[4]) );
  DFFRHQXL instruction_memory_lookup_pc_reg_4_ ( .D(n1287), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_lookup_pc[4]) );
  DFFRHQXL IF_DEC_PC_reg_5_ ( .D(n1286), .CK(clk), .RN(rst_n), .Q(IF_DEC_PC[5]) );
  DFFRHQXL instruction_memory_lookup_pc_reg_5_ ( .D(n1285), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_lookup_pc[5]) );
  DFFRHQXL IF_DEC_PC_reg_6_ ( .D(n1284), .CK(clk), .RN(rst_n), .Q(IF_DEC_PC[6]) );
  DFFRHQXL instruction_memory_lookup_pc_reg_6_ ( .D(n1283), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_lookup_pc[6]) );
  DFFRHQXL IF_DEC_PC_reg_7_ ( .D(n1282), .CK(clk), .RN(rst_n), .Q(IF_DEC_PC[7]) );
  DFFRHQXL instruction_memory_lookup_pc_reg_7_ ( .D(n1281), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_lookup_pc[7]) );
  DFFRHQXL instruction_memory_lookup_pc_reg_8_ ( .D(n1280), .CK(clk), .RN(
        rst_n), .Q(instruction_memory_lookup_pc[8]) );
  DFFRHQXL patcal_reg_1_ ( .D(n1279), .CK(clk), .RN(rst_n), .Q(patcal[1]) );
  DFFRHQXL patcal_reg_2_ ( .D(n1278), .CK(clk), .RN(rst_n), .Q(patcal[2]) );
  DFFRHQXL data_memory_lookup_pc_reg_8_ ( .D(n1269), .CK(clk), .RN(rst_n), .Q(
        data_memory_lookup_pc[8]) );
  DFFRHQXL data_memory_lookup_pc_reg_9_ ( .D(n1268), .CK(clk), .RN(rst_n), .Q(
        data_memory_lookup_pc[9]) );
  DFFRHQXL data_memory_lookup_pc_reg_10_ ( .D(n1267), .CK(clk), .RN(rst_n), 
        .Q(data_memory_lookup_pc[10]) );
  DFFRHQXL data_memory_datamem_js_reg_2_ ( .D(n1266), .CK(clk), .RN(rst_n), 
        .Q(data_memory_datamem_js[2]) );
  DFFRHQXL EXE_MEM_storedata_reg_9_ ( .D(n1265), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_storedata[9]) );
  DFFRHQXL EXE_MEM_storedata_reg_7_ ( .D(n1263), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_storedata[7]) );
  DFFRHQXL EXE_MEM_storedata_reg_6_ ( .D(n1262), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_storedata[6]) );
  DFFRHQXL EXE_MEM_storedata_reg_5_ ( .D(n1261), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_storedata[5]) );
  DFFRHQXL EXE_MEM_storedata_reg_4_ ( .D(n1260), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_storedata[4]) );
  DFFRHQXL EXE_MEM_storedata_reg_3_ ( .D(n1259), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_storedata[3]) );
  DFFRHQXL EXE_MEM_storedata_reg_2_ ( .D(n1258), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_storedata[2]) );
  DFFRHQXL EXE_MEM_storedata_reg_1_ ( .D(n1257), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_storedata[1]) );
  DFFRHQXL EXE_MEM_storedata_reg_15_ ( .D(n1256), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_storedata[15]) );
  DFFRHQXL EXE_MEM_storedata_reg_14_ ( .D(n1255), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_storedata[14]) );
  DFFRHQXL EXE_MEM_storedata_reg_13_ ( .D(n1254), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_storedata[13]) );
  DFFRHQXL EXE_MEM_storedata_reg_12_ ( .D(n1253), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_storedata[12]) );
  DFFRHQXL EXE_MEM_storedata_reg_11_ ( .D(n1252), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_storedata[11]) );
  DFFRHQXL EXE_MEM_storedata_reg_10_ ( .D(n1251), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_storedata[10]) );
  DFFRHQXL EXE_MEM_storedata_reg_0_ ( .D(n1250), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_storedata[0]) );
  DFFRHQXL EXE_MEM_result_reg_14_ ( .D(n1304), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_result[14]) );
  DFFRHQXL EXE_MEM_result_reg_15_ ( .D(n1303), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_result[15]) );
  DFFRHQXL EXE_MEM_result_reg_13_ ( .D(n1305), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_result[13]) );
  DFFRHQXL EXE_MEM_result_reg_12_ ( .D(n1306), .CK(clk), .RN(rst_n), .Q(
        EXE_MEM_result[12]) );
  DFFRHQX1 data_memory_dcache_headpc_reg_9_ ( .D(n1348), .CK(clk), .RN(rst_n), 
        .Q(data_memory_dcache_headpc[9]) );
  DFFRHQX1 data_memory_datamem_cs_reg_0_ ( .D(data_memory_datamem_ns[0]), .CK(
        clk), .RN(rst_n), .Q(data_memory_datamem_cs[0]) );
  DFFRHQX2 data_memory_dcache_headpc_reg_5_ ( .D(n1344), .CK(clk), .RN(rst_n), 
        .Q(data_memory_dcache_headpc[5]) );
  DFFRHQX1 DM_idx_reg_0_ ( .D(n1414), .CK(clk), .RN(rst_n), .Q(DM_idx[0]) );
  DFFRHQX1 data_memory_dcache_headpc_reg_6_ ( .D(n1345), .CK(clk), .RN(rst_n), 
        .Q(data_memory_dcache_headpc[6]) );
  DFFSX1 patcal_reg_0_ ( .D(n1248), .CK(clk), .SN(rst_n), .Q(patcal[0]), .QN(
        n4945) );
  DFFSX1 data_memory_lookup_wen_reg ( .D(n1249), .CK(clk), .SN(rst_n), .Q(
        data_memory_lookup_wen), .QN(n4946) );
  DFFSX1 patcal_reg_3_ ( .D(n1247), .CK(clk), .SN(rst_n), .Q(patcal[3]) );
  DFFSX1 DM_wen_reg ( .D(n1446), .CK(clk), .SN(rst_n), .Q(DM_wen) );
  DFFSX1 data_memory_d_awlen_m_inf_reg_6_ ( .D(data_memory_N848), .CK(clk), 
        .SN(rst_n), .Q(awlen_m_inf[6]) );
  DFFSX1 data_memory_d_awlen_m_inf_reg_5_ ( .D(data_memory_N847), .CK(clk), 
        .SN(rst_n), .Q(awlen_m_inf[5]) );
  DFFSX1 IO_stall_reg ( .D(N1088), .CK(clk), .SN(rst_n), .Q(IO_stall) );
  DFFSX1 cpube_ls_reg_2_ ( .D(n4944), .CK(clk), .SN(rst_n), .Q(n4943), .QN(
        cpube_ls[2]) );
  DFFRX1 EXE_MEM_storedata_reg_8_ ( .D(n1264), .CK(clk), .RN(rst_n), .QN(n4947) );
  DFFRHQXL IF_PC_reg_1_ ( .D(n1772), .CK(clk), .RN(rst_n), .Q(IF_PC[1]) );
  DFFRHQXL data_memory_lookup_pc_reg_7_ ( .D(n1270), .CK(clk), .RN(rst_n), .Q(
        data_memory_lookup_pc[7]) );
  DFFRHQXL data_memory_d_araddr_m_inf_reg_4_ ( .D(data_memory_N915), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[4]) );
  DFFRHQXL data_memory_d_awaddr_m_inf_reg_7_ ( .D(data_memory_N842), .CK(clk), 
        .RN(rst_n), .Q(awaddr_m_inf[7]) );
  DFFRHQXL instruction_memory_i_araddr_m_inf_reg_11_ ( .D(n1751), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[43]) );
  DFFRHQX1 data_memory_dcache_headpc_reg_3_ ( .D(n1342), .CK(clk), .RN(rst_n), 
        .Q(C303_DATA2_3) );
  DFFRHQXL IF_DEC_instr_reg_0_ ( .D(n1733), .CK(clk), .RN(rst_n), .Q(
        IF_DEC_instr[0]) );
  DFFRHQXL IF_DEC_instr_reg_13_ ( .D(n1720), .CK(clk), .RN(rst_n), .Q(
        IF_DEC_instr[13]) );
  DFFRHQXL IF_DEC_instr_reg_14_ ( .D(n1719), .CK(clk), .RN(rst_n), .Q(
        IF_DEC_instr[14]) );
  DFFRHQXL DM_idx_reg_4_ ( .D(n1410), .CK(clk), .RN(rst_n), .Q(DM_idx[4]) );
  DFFRHQXL DM_idx_reg_6_ ( .D(n1408), .CK(clk), .RN(rst_n), .Q(DM_idx[6]) );
  DFFRHQXL data_memory_lookup_pc_reg_1_ ( .D(n1276), .CK(clk), .RN(rst_n), .Q(
        data_memory_lookup_pc[1]) );
  DFFRHQXL data_memory_lookup_pc_reg_2_ ( .D(n1275), .CK(clk), .RN(rst_n), .Q(
        data_memory_lookup_pc[2]) );
  DFFRHQXL data_memory_lookup_pc_reg_3_ ( .D(n1274), .CK(clk), .RN(rst_n), .Q(
        data_memory_lookup_pc[3]) );
  DFFRHQXL data_memory_lookup_pc_reg_4_ ( .D(n1273), .CK(clk), .RN(rst_n), .Q(
        data_memory_lookup_pc[4]) );
  DFFRHQXL data_memory_lookup_pc_reg_5_ ( .D(n1272), .CK(clk), .RN(rst_n), .Q(
        data_memory_lookup_pc[5]) );
  DFFRHQXL data_memory_lookup_pc_reg_6_ ( .D(n1271), .CK(clk), .RN(rst_n), .Q(
        data_memory_lookup_pc[6]) );
  DFFRHQXL cpube_cs_reg_2_ ( .D(cpube_ns[2]), .CK(clk), .RN(rst_n), .Q(
        cpube_cs[2]) );
  DFFRHQXL data_memory_d_rready_m_inf_reg ( .D(data_memory_N927), .CK(clk), 
        .RN(rst_n), .Q(rready_m_inf[0]) );
  DFFRHQXL data_memory_d_araddr_m_inf_reg_1_ ( .D(data_memory_N912), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[1]) );
  DFFRHQXL data_memory_d_araddr_m_inf_reg_2_ ( .D(data_memory_N913), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[2]) );
  DFFRHQXL data_memory_d_araddr_m_inf_reg_3_ ( .D(data_memory_N914), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[3]) );
  DFFRHQXL data_memory_d_araddr_m_inf_reg_5_ ( .D(data_memory_N916), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[5]) );
  DFFRHQXL data_memory_d_araddr_m_inf_reg_6_ ( .D(data_memory_N917), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[6]) );
  DFFRHQXL data_memory_d_araddr_m_inf_reg_7_ ( .D(data_memory_N918), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[7]) );
  DFFRHQXL data_memory_d_araddr_m_inf_reg_8_ ( .D(data_memory_N919), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[8]) );
  DFFRHQXL data_memory_d_araddr_m_inf_reg_9_ ( .D(data_memory_N920), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[9]) );
  DFFRHQXL data_memory_d_araddr_m_inf_reg_10_ ( .D(data_memory_N921), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[10]) );
  DFFRHQXL data_memory_d_araddr_m_inf_reg_11_ ( .D(data_memory_N922), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[11]) );
  DFFRHQXL instruction_memory_i_rready_m_inf_reg ( .D(instruction_memory_N211), 
        .CK(clk), .RN(rst_n), .Q(rready_m_inf[1]) );
  DFFRHQXL data_memory_d_awaddr_m_inf_reg_1_ ( .D(data_memory_N836), .CK(clk), 
        .RN(rst_n), .Q(awaddr_m_inf[1]) );
  DFFRHQXL data_memory_d_awaddr_m_inf_reg_2_ ( .D(data_memory_N837), .CK(clk), 
        .RN(rst_n), .Q(awaddr_m_inf[2]) );
  DFFRHQXL data_memory_d_awaddr_m_inf_reg_3_ ( .D(data_memory_N838), .CK(clk), 
        .RN(rst_n), .Q(awaddr_m_inf[3]) );
  DFFRHQXL data_memory_d_awaddr_m_inf_reg_4_ ( .D(data_memory_N839), .CK(clk), 
        .RN(rst_n), .Q(awaddr_m_inf[4]) );
  DFFRHQXL data_memory_d_awaddr_m_inf_reg_5_ ( .D(data_memory_N840), .CK(clk), 
        .RN(rst_n), .Q(awaddr_m_inf[5]) );
  DFFRHQXL data_memory_d_awaddr_m_inf_reg_6_ ( .D(data_memory_N841), .CK(clk), 
        .RN(rst_n), .Q(awaddr_m_inf[6]) );
  DFFRHQXL data_memory_d_awaddr_m_inf_reg_8_ ( .D(data_memory_N843), .CK(clk), 
        .RN(rst_n), .Q(awaddr_m_inf[8]) );
  DFFRHQXL data_memory_d_awaddr_m_inf_reg_9_ ( .D(data_memory_N844), .CK(clk), 
        .RN(rst_n), .Q(awaddr_m_inf[9]) );
  DFFRHQXL data_memory_d_awaddr_m_inf_reg_10_ ( .D(data_memory_N845), .CK(clk), 
        .RN(rst_n), .Q(awaddr_m_inf[10]) );
  DFFRHQXL data_memory_d_awaddr_m_inf_reg_11_ ( .D(data_memory_N846), .CK(clk), 
        .RN(rst_n), .Q(awaddr_m_inf[11]) );
  DFFRHQXL data_memory_d_wlast_m_inf_reg ( .D(n1385), .CK(clk), .RN(rst_n), 
        .Q(wlast_m_inf_0_) );
  DFFRHQXL data_memory_d_wvalid_m_inf_reg ( .D(n1384), .CK(clk), .RN(rst_n), 
        .Q(wvalid_m_inf_0_) );
  DFFRHQXL data_memory_d_araddr_m_inf_reg_12_ ( .D(data_memory_N911), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[12]) );
  DFFRHQXL data_memory_d_awvalid_m_inf_reg ( .D(n4948), .CK(clk), .RN(rst_n), 
        .Q(awaddr_m_inf[12]) );
  DFFRHQXL instruction_memory_i_araddr_m_inf_reg_10_ ( .D(n1750), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[42]) );
  DFFRHQXL instruction_memory_i_araddr_m_inf_reg_8_ ( .D(n1748), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[40]) );
  DFFRHQXL instruction_memory_i_araddr_m_inf_reg_1_ ( .D(n1741), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[33]) );
  DFFRHQXL instruction_memory_i_araddr_m_inf_reg_6_ ( .D(n1746), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[38]) );
  DFFRHQXL instruction_memory_i_araddr_m_inf_reg_3_ ( .D(n1743), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[35]) );
  DFFRHQXL instruction_memory_i_araddr_m_inf_reg_7_ ( .D(n1747), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[39]) );
  DFFRHQXL instruction_memory_i_araddr_m_inf_reg_9_ ( .D(n1749), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[41]) );
  DFFRHQXL instruction_memory_i_araddr_m_inf_reg_5_ ( .D(n1745), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[37]) );
  DFFRHQXL instruction_memory_i_araddr_m_inf_reg_4_ ( .D(n1744), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[36]) );
  DFFRHQXL instruction_memory_i_araddr_m_inf_reg_2_ ( .D(n1742), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[34]) );
  DFFRHQXL instruction_memory_i_araddr_m_inf_reg_12_ ( .D(n1752), .CK(clk), 
        .RN(rst_n), .Q(araddr_m_inf[44]) );
  DFFRHQXL data_memory_d_bready_m_inf_reg ( .D(data_memory_N894), .CK(clk), 
        .RN(rst_n), .Q(bready_m_inf_0_) );
  DFFRHQXL data_memory_datamem_cs_reg_3_ ( .D(data_memory_datamem_ns[3]), .CK(
        clk), .RN(rst_n), .Q(data_memory_datamem_cs[3]) );
  DFFRHQXL data_memory_datamem_cs_reg_2_ ( .D(data_memory_datamem_ns[2]), .CK(
        clk), .RN(rst_n), .Q(data_memory_datamem_cs[2]) );
  DFFRHQXL data_memory_datamem_cs_reg_1_ ( .D(data_memory_datamem_ns[1]), .CK(
        clk), .RN(rst_n), .Q(data_memory_datamem_cs[1]) );
  DFFRHQX1 DM_idx_reg_1_ ( .D(n1413), .CK(clk), .RN(rst_n), .Q(DM_idx[1]) );
  DFFRHQX1 data_memory_lookup_pc_reg_0_ ( .D(n1277), .CK(clk), .RN(rst_n), .Q(
        data_memory_lookup_pc[0]) );
  DFFRHQXL DM_idx_reg_2_ ( .D(n1412), .CK(clk), .RN(rst_n), .Q(DM_idx[2]) );
  DFFRHQX1 data_memory_dcache_headpc_reg_4_ ( .D(n1343), .CK(clk), .RN(rst_n), 
        .Q(C303_DATA2_4) );
  DFFRHQX2 data_memory_dcache_headpc_reg_2_ ( .D(n1341), .CK(clk), .RN(rst_n), 
        .Q(C303_DATA2_2) );
  DFFRHQX1 data_memory_dcache_headpc_reg_7_ ( .D(n1346), .CK(clk), .RN(rst_n), 
        .Q(data_memory_dcache_headpc[7]) );
  NOR2X1 U1959 ( .A(n3195), .B(n3624), .Y(data_memory_N529) );
  NOR2X1 U1960 ( .A(n3661), .B(n3744), .Y(data_memory_N842) );
  NOR2X1 U1961 ( .A(n4800), .B(n4799), .Y(n4812) );
  NOR2X1 U1962 ( .A(n3723), .B(n3722), .Y(n3728) );
  NOR2X1 U1963 ( .A(n4583), .B(n4582), .Y(n4584) );
  NOR2X1 U1964 ( .A(n3137), .B(n3136), .Y(n3636) );
  AOI222XL U1965 ( .A0(n4865), .A1(EXE_MEM_target[1]), .B0(IF_DEC_instr[6]), 
        .B1(n3234), .C0(n3134), .C1(IF_DEC_instr[2]), .Y(n3135) );
  NOR2X1 U1966 ( .A(n4420), .B(n4865), .Y(n4786) );
  NOR2X1 U1967 ( .A(data_memory_writeback_type[2]), .B(
        data_memory_writeback_type[0]), .Y(n4814) );
  NOR2X1 U1968 ( .A(n3796), .B(data_memory_dcache_ready_idx[0]), .Y(n3723) );
  NOR2X1 U1969 ( .A(n4542), .B(n4536), .Y(n4539) );
  NOR2X1 U1970 ( .A(n4278), .B(n4266), .Y(n4268) );
  NOR2X1 U1971 ( .A(n3745), .B(data_memory_writeback_count[0]), .Y(n4606) );
  NOR2X1 U1972 ( .A(n4317), .B(IF_PC[4]), .Y(n4309) );
  NOR2X1 U1973 ( .A(instruction_memory_N222), .B(
        instruction_memory_icache_ready_idx[0]), .Y(n4266) );
  NOR2X1 U1974 ( .A(n2922), .B(n3008), .Y(n2925) );
  NOR2X1 U1975 ( .A(n3610), .B(n3609), .Y(n3622) );
  NOR2X1 U1976 ( .A(n4945), .B(IO_stall), .Y(n4935) );
  NOR2X1 U1977 ( .A(n3615), .B(n3614), .Y(n3620) );
  NOR2X1 U1978 ( .A(n4120), .B(n4119), .Y(n4121) );
  NOR2X1 U1979 ( .A(n3108), .B(n3107), .Y(n4948) );
  NOR2X1 U1980 ( .A(instruction_memory_N222), .B(n3639), .Y(n3688) );
  OAI21X1 U1981 ( .A0(n4659), .A1(n4658), .B0(n4657), .Y(n4773) );
  NAND2X1 U1982 ( .A(n4236), .B(n4235), .Y(n4675) );
  NOR2X1 U1983 ( .A(n3615), .B(n3613), .Y(n3608) );
  NOR2X1 U1984 ( .A(n4670), .B(DM_wen), .Y(n4871) );
  NAND2X1 U1985 ( .A(n4442), .B(n4441), .Y(n4426) );
  NOR2X1 U1986 ( .A(n2909), .B(n2908), .Y(n2935) );
  NOR2X1 U1987 ( .A(n2894), .B(n2893), .Y(n4282) );
  NOR2X1 U1988 ( .A(n4223), .B(n4781), .Y(n4252) );
  NOR2X1 U1989 ( .A(n4415), .B(n4414), .Y(n4420) );
  NOR2X1 U1990 ( .A(n3975), .B(n3972), .Y(n3978) );
  NOR2X1 U1991 ( .A(n3193), .B(n3131), .Y(instruction_memory_N211) );
  NOR2X1 U1992 ( .A(n3904), .B(n3903), .Y(n3972) );
  NOR2X1 U1993 ( .A(n4017), .B(n4016), .Y(n4015) );
  ADDHXL U1994 ( .A(n2902), .B(n2901), .CO(n2909), .S(n2897) );
  NOR2X1 U1995 ( .A(n3946), .B(n3945), .Y(n3975) );
  NOR2X2 U1996 ( .A(n4177), .B(n4200), .Y(n4178) );
  NOR2X1 U1997 ( .A(n3568), .B(n3567), .Y(n3579) );
  ADDFHX1 U1998 ( .A(n4755), .B(n4754), .CI(n4753), .CO(n4756), .S(n4764) );
  NOR4X1 U1999 ( .A(EXE_MEM_instcode[2]), .B(EXE_MEM_instcode[0]), .C(
        EXE_MEM_instcode[1]), .D(EXE_MEM_instcode[3]), .Y(n3238) );
  ADDFX1 U2000 ( .A(n4633), .B(n4632), .CI(n4631), .CO(n4683), .S(n4630) );
  ADDFX1 U2001 ( .A(n3944), .B(n3943), .CI(n3942), .CO(n3945), .S(n3904) );
  NOR2X1 U2002 ( .A(n4247), .B(n4781), .Y(n4248) );
  NOR2X1 U2003 ( .A(n2092), .B(n2105), .Y(n2093) );
  ADDFX1 U2004 ( .A(n4004), .B(n4003), .CI(n4002), .CO(n4037), .S(n4009) );
  AND2X2 U2005 ( .A(n2882), .B(n4781), .Y(n3038) );
  NOR2X1 U2006 ( .A(n3627), .B(n2960), .Y(n3220) );
  NOR2X1 U2007 ( .A(n3560), .B(n3559), .Y(n3564) );
  NOR2X1 U2008 ( .A(n4865), .B(n2959), .Y(n3134) );
  NOR2X1 U2009 ( .A(instruction_memory_icache_ready_idx[1]), .B(
        instruction_memory_icache_ready_idx[4]), .Y(n3170) );
  NOR2X1 U2010 ( .A(EXE_MEM_instcode_6), .B(EXE_MEM_instcode_7), .Y(n3082) );
  NOR2X1 U2011 ( .A(n3126), .B(n3573), .Y(n3127) );
  NOR2X1 U2012 ( .A(n2101), .B(n2100), .Y(n2102) );
  NOR2X1 U2013 ( .A(n4344), .B(n3729), .Y(n3884) );
  NOR2X1 U2014 ( .A(cpube_cs[1]), .B(cpube_cs[0]), .Y(n3239) );
  NOR2X1 U2015 ( .A(n3551), .B(n3550), .Y(n3555) );
  NOR2X1 U2016 ( .A(n2075), .B(data_memory_datamem_cs[0]), .Y(n2100) );
  NOR2X1 U2017 ( .A(data_memory_writeback_count[5]), .B(
        data_memory_writeback_count[6]), .Y(n3202) );
  NOR2X1 U2018 ( .A(n4581), .B(n3206), .Y(n2101) );
  NOR2X1 U2019 ( .A(n4899), .B(n4897), .Y(n3648) );
  NOR2X1 U2020 ( .A(n3755), .B(n3758), .Y(n3914) );
  NOR2X1 U2021 ( .A(data_memory_dcache_ready_idx[1]), .B(
        data_memory_dcache_ready_idx[4]), .Y(n2061) );
  NOR2X1 U2022 ( .A(n3056), .B(n3055), .Y(n3665) );
  NOR2X1 U2023 ( .A(n3054), .B(n3053), .Y(n3662) );
  NOR2X1 U2024 ( .A(n2075), .B(n3814), .Y(n4899) );
  NOR3X2 U2025 ( .A(n2644), .B(n4464), .C(n2643), .Y(n2645) );
  NAND2X2 U2026 ( .A(n4182), .B(n4707), .Y(n4620) );
  OR2X2 U2027 ( .A(n4467), .B(n4468), .Y(n2643) );
  NOR2X1 U2028 ( .A(n3037), .B(n4634), .Y(n4488) );
  NOR2X1 U2029 ( .A(n4841), .B(n4780), .Y(n4498) );
  NOR2X1 U2030 ( .A(n2040), .B(DM_idx[8]), .Y(n2041) );
  NOR2X1 U2031 ( .A(n3760), .B(n4169), .Y(n4470) );
  BUFX4 U2032 ( .A(n3982), .Y(n4743) );
  NOR2X1 U2033 ( .A(n2605), .B(n2604), .Y(n2613) );
  NOR2X1 U2034 ( .A(n2408), .B(n2407), .Y(n2411) );
  NOR2X1 U2035 ( .A(n2444), .B(n2443), .Y(n2447) );
  NOR2X1 U2036 ( .A(n2660), .B(n2659), .Y(n2663) );
  NOR2X1 U2037 ( .A(n2299), .B(n2298), .Y(n2302) );
  NOR2X1 U2038 ( .A(n2335), .B(n2334), .Y(n2338) );
  NOR2X1 U2039 ( .A(n4852), .B(n3765), .Y(n4468) );
  NOR2X1 U2040 ( .A(n3675), .B(n4698), .Y(n4464) );
  NOR2X1 U2041 ( .A(n2190), .B(n2189), .Y(n2194) );
  NOR2X1 U2042 ( .A(n2518), .B(n2517), .Y(n2521) );
  NOR2X1 U2043 ( .A(n4382), .B(instruction_memory_icache_headpc[3]), .Y(n3142)
         );
  NOR2X1 U2044 ( .A(n2148), .B(n2147), .Y(n2156) );
  NOR2X1 U2045 ( .A(n4513), .B(C303_DATA2_1), .Y(n2027) );
  NOR2X1 U2046 ( .A(n2736), .B(n2735), .Y(n2739) );
  NOR2X4 U2047 ( .A(n2280), .B(n2275), .Y(n2614) );
  NOR2X2 U2048 ( .A(n2247), .B(n2246), .Y(n2248) );
  NOR2X1 U2049 ( .A(n2239), .B(n2244), .Y(n2827) );
  NOR2X1 U2050 ( .A(n2245), .B(n2247), .Y(n2817) );
  NOR2X1 U2051 ( .A(n4549), .B(data_memory_lookup_pc[1]), .Y(n2140) );
  NOR2X2 U2052 ( .A(n2247), .B(n2240), .Y(n2237) );
  NAND2X2 U2053 ( .A(n2221), .B(n2220), .Y(n2245) );
  XNOR2XL U2054 ( .A(n4737), .B(n4637), .Y(n4228) );
  XOR2XL U2055 ( .A(n2017), .B(n4154), .Y(n4155) );
  AOI221XL U2056 ( .A0(n2038), .A1(n2037), .B0(n2036), .B1(n2037), .C0(n2035), 
        .Y(n2039) );
  XNOR2XL U2057 ( .A(n2020), .B(n2017), .Y(n4226) );
  XNOR2XL U2058 ( .A(n4689), .B(n4730), .Y(n3986) );
  XNOR2XL U2059 ( .A(n4706), .B(n4621), .Y(n3770) );
  XOR2XL U2060 ( .A(n4463), .B(n2020), .Y(n2873) );
  NOR2XL U2061 ( .A(n2994), .B(data_memory_datamem_cs[2]), .Y(n2948) );
  AOI222XL U2062 ( .A0(n4865), .A1(EXE_MEM_target[2]), .B0(IF_DEC_instr[7]), 
        .B1(n3234), .C0(n3134), .C1(IF_DEC_instr[3]), .Y(n3133) );
  XOR2XL U2063 ( .A(n3025), .B(n2022), .Y(n3027) );
  INVXL U2064 ( .A(n2075), .Y(n4932) );
  INVXL U2065 ( .A(n4608), .Y(n3802) );
  NOR2X1 U2066 ( .A(n4369), .B(n4363), .Y(n4800) );
  INVXL U2067 ( .A(n4522), .Y(n4949) );
  XNOR2XL U2068 ( .A(n4141), .B(n4140), .Y(n1800) );
  AND4X2 U2069 ( .A(n2722), .B(n2721), .C(n2720), .D(n2719), .Y(n1801) );
  XNOR2XL U2070 ( .A(n2181), .B(n2180), .Y(n1802) );
  OAI21XL U2071 ( .A0(instruction_memory_lookup_pc[10]), .A1(n4358), .B0(n4800), .Y(n4357) );
  BUFX2 U2072 ( .A(n3842), .Y(n2016) );
  OAI2BB1XL U2073 ( .A0N(n4590), .A1N(n4589), .B0(n3802), .Y(n3752) );
  INVX2 U2074 ( .A(n4873), .Y(n4587) );
  AND3XL U2075 ( .A(n3636), .B(n4588), .C(bvalid_m_inf_0_), .Y(
        data_memory_N894) );
  MX2X2 U2076 ( .A(n3697), .B(IF_DEC_PC[4]), .S0(n3036), .Y(n2905) );
  NAND2XL U2077 ( .A(n2945), .B(n4872), .Y(n2946) );
  NAND2XL U2078 ( .A(n3817), .B(data_memory_datamem_cs[2]), .Y(n2945) );
  AOI21X1 U2079 ( .A0(n2944), .A1(n4946), .B0(n3816), .Y(n2216) );
  NOR2X1 U2080 ( .A(n3051), .B(n4777), .Y(n4454) );
  NOR2X1 U2081 ( .A(n4662), .B(n4660), .Y(n4500) );
  INVX1 U2082 ( .A(data_memory_datamem_ns[3]), .Y(n3645) );
  NOR2X1 U2083 ( .A(n2555), .B(n2554), .Y(n2558) );
  OR2XL U2084 ( .A(n2188), .B(n2187), .Y(n2189) );
  OR2XL U2085 ( .A(n3613), .B(n3612), .Y(n3614) );
  INVX1 U2086 ( .A(n3624), .Y(n2998) );
  INVX2 U2087 ( .A(instruction_memory_N222), .Y(n2023) );
  INVX2 U2088 ( .A(DM_invalid), .Y(n4670) );
  NOR2X1 U2089 ( .A(data_memory_datamem_cs[0]), .B(data_memory_datamem_cs[2]), 
        .Y(n2068) );
  INVX1 U2090 ( .A(cpube_cs[0]), .Y(n2960) );
  NOR2X1 U2091 ( .A(n4792), .B(n4791), .Y(n4794) );
  NOR2X1 U2092 ( .A(n4792), .B(n4317), .Y(n4301) );
  OAI2BB1XL U2093 ( .A0N(n4791), .A1N(n4399), .B0(n4373), .Y(n4793) );
  OAI2BB1XL U2094 ( .A0N(n4396), .A1N(n4399), .B0(n4373), .Y(n4401) );
  INVX3 U2095 ( .A(n4399), .Y(n4792) );
  OAI2BB1XL U2096 ( .A0N(n4317), .A1N(n4399), .B0(n4373), .Y(n4312) );
  OAI211XL U2097 ( .A0(cpube_cs[1]), .A1(n3199), .B0(n3105), .C0(n3104), .Y(
        N1088) );
  XNOR2X1 U2098 ( .A(n4656), .B(n4655), .Y(n4668) );
  NOR2X1 U2099 ( .A(n4357), .B(n3812), .Y(n4349) );
  NOR2X1 U2100 ( .A(n4800), .B(n2023), .Y(n4278) );
  AND2XL U2101 ( .A(n4330), .B(n3028), .Y(n3034) );
  INVXL U2102 ( .A(n4673), .Y(n4679) );
  INVX1 U2103 ( .A(n3752), .Y(n4127) );
  NOR2X1 U2104 ( .A(n3954), .B(n4293), .Y(n2900) );
  NOR2X1 U2105 ( .A(n3746), .B(data_memory_writeback_count[0]), .Y(n3852) );
  OAI21XL U2106 ( .A0(n3746), .A1(n3791), .B0(n3855), .Y(n3805) );
  NOR2X1 U2107 ( .A(n3746), .B(n3740), .Y(n4610) );
  NOR2X1 U2108 ( .A(n3745), .B(n3740), .Y(n3789) );
  OAI31XL U2109 ( .A0(instruction_memory_icache_cs[1]), .A1(arready_m_inf[1]), 
        .A2(n3192), .B0(n4369), .Y(instruction_memory_icache_ns[0]) );
  NOR4XL U2110 ( .A(n3844), .B(data_memory_datamem_cs[2]), .C(n3815), .D(n3814), .Y(n3842) );
  NOR2X1 U2111 ( .A(n2929), .B(n2928), .Y(n3012) );
  NOR2X1 U2112 ( .A(n4586), .B(n4873), .Y(n4585) );
  NOR2X1 U2113 ( .A(n3024), .B(n3023), .Y(n3031) );
  NOR2X1 U2114 ( .A(n3020), .B(n3019), .Y(n3007) );
  NOR2X1 U2115 ( .A(n3636), .B(n3635), .Y(n1384) );
  NOR2X1 U2116 ( .A(n3631), .B(n3086), .Y(n3087) );
  NOR2X1 U2117 ( .A(n3661), .B(n3753), .Y(data_memory_N846) );
  OAI2BB1XL U2118 ( .A0N(n3179), .A1N(n3178), .B0(n3177), .Y(n3182) );
  AOI2BB1XL U2119 ( .A0N(n3631), .A1N(n3627), .B0(n3234), .Y(n3633) );
  ADDFHX2 U2120 ( .A(n4764), .B(n4763), .CI(n4762), .CO(n4766), .S(n4653) );
  INVXL U2121 ( .A(n4138), .Y(n4020) );
  INVX1 U2122 ( .A(n4015), .Y(n4136) );
  NAND2X2 U2123 ( .A(n2950), .B(n2949), .Y(n2952) );
  AND2XL U2124 ( .A(n3038), .B(n3696), .Y(n2906) );
  OAI211XL U2125 ( .A0(n4480), .A1(n2467), .B0(n4479), .C0(n4478), .Y(n4481)
         );
  AND2XL U2126 ( .A(n3038), .B(n3889), .Y(n2927) );
  NOR2X1 U2127 ( .A(data_memory_datamem_ns[1]), .B(n3645), .Y(n3649) );
  OAI2BB1XL U2128 ( .A0N(n4006), .A1N(n4009), .B0(n4005), .Y(n4018) );
  ADDFHX2 U2129 ( .A(n4199), .B(n4198), .CI(n4197), .CO(n4205), .S(n4177) );
  ADDFHX2 U2130 ( .A(n4234), .B(n4233), .CI(n4232), .CO(n4235), .S(n4204) );
  ADDFHX2 U2131 ( .A(n4651), .B(n4650), .CI(n4649), .CO(n4652), .S(n4236) );
  ADDFHX2 U2132 ( .A(n4176), .B(n4175), .CI(n4174), .CO(n4200), .S(n4041) );
  NAND2X1 U2133 ( .A(data_memory_datamem_ns[2]), .B(n3645), .Y(n3108) );
  NOR2X1 U2134 ( .A(n3678), .B(n3677), .Y(n3709) );
  OR2XL U2135 ( .A(n3706), .B(n3705), .Y(n3779) );
  ADDFHX2 U2136 ( .A(n4187), .B(n4186), .CI(n4185), .CO(n4233), .S(n4197) );
  NOR2X1 U2137 ( .A(n3775), .B(n3774), .Y(n3907) );
  AOI211XL U2138 ( .A0(n4473), .A1(n4472), .B0(n4471), .C0(n4470), .Y(n4475)
         );
  ADDFX1 U2139 ( .A(n3773), .B(n3772), .CI(n3771), .CO(n3774), .S(n3706) );
  NAND4BXL U2140 ( .AN(n4500), .B(n2685), .C(n2684), .D(n4491), .Y(n2875) );
  OR2XL U2141 ( .A(n2067), .B(n2066), .Y(n2098) );
  NOR2X1 U2142 ( .A(n4875), .B(n4881), .Y(data_memory_N915) );
  NOR2X1 U2143 ( .A(n4540), .B(n4881), .Y(data_memory_N916) );
  NOR2X1 U2144 ( .A(n4547), .B(n4881), .Y(data_memory_N914) );
  NOR2X1 U2145 ( .A(n4535), .B(n4881), .Y(data_memory_N918) );
  NOR2X1 U2146 ( .A(n4245), .B(n4244), .Y(n4446) );
  NOR2X1 U2147 ( .A(n4047), .B(n4049), .Y(n3964) );
  NOR2X1 U2148 ( .A(n4876), .B(n4881), .Y(data_memory_N917) );
  NOR2X1 U2149 ( .A(n4550), .B(n4881), .Y(data_memory_N913) );
  NOR2X1 U2150 ( .A(n4881), .B(n4877), .Y(data_memory_N919) );
  NOR2X1 U2151 ( .A(n3188), .B(data_memory_dcache_headpc[8]), .Y(n3190) );
  NOR2X1 U2152 ( .A(n3968), .B(n3967), .Y(n4131) );
  NOR2X1 U2153 ( .A(n3697), .B(n3696), .Y(n3758) );
  NOR2X1 U2154 ( .A(n4881), .B(n4878), .Y(data_memory_N920) );
  NOR2X1 U2155 ( .A(n4172), .B(n4781), .Y(n4244) );
  NOR2X1 U2156 ( .A(n3670), .B(n3669), .Y(n3755) );
  NAND2XL U2157 ( .A(n4566), .B(n4565), .Y(n4567) );
  NOR2X1 U2158 ( .A(n3820), .B(n4528), .Y(n3847) );
  NOR2X1 U2159 ( .A(n3927), .B(n3926), .Y(n4047) );
  NOR2X1 U2160 ( .A(n3962), .B(n3961), .Y(n4049) );
  NOR2X1 U2161 ( .A(n3762), .B(n3761), .Y(n3913) );
  NOR2X1 U2162 ( .A(n4881), .B(n4879), .Y(data_memory_N921) );
  NOR2X1 U2163 ( .A(n4821), .B(n3060), .Y(n4460) );
  NOR2X1 U2164 ( .A(n4746), .B(n4781), .Y(n4782) );
  NOR2X1 U2165 ( .A(n2184), .B(n2183), .Y(n2196) );
  NOR2X1 U2166 ( .A(n4662), .B(n4781), .Y(n4663) );
  NAND2BXL U2167 ( .AN(n4563), .B(n4562), .Y(n4566) );
  NOR2X1 U2168 ( .A(data_memory_lookup_pc[10]), .B(n4260), .Y(n4531) );
  NOR2X1 U2169 ( .A(n2126), .B(n2125), .Y(n2160) );
  NOR2X1 U2170 ( .A(n2158), .B(n2157), .Y(n2159) );
  NAND2XL U2171 ( .A(n2182), .B(n1802), .Y(n2183) );
  NOR2X1 U2172 ( .A(n3625), .B(n3624), .Y(n3629) );
  XNOR2X1 U2173 ( .A(n4693), .B(n4634), .Y(n4209) );
  NAND2X1 U2174 ( .A(n3356), .B(n3456), .Y(n3340) );
  NOR2X1 U2175 ( .A(n3098), .B(n3630), .Y(n3625) );
  NAND2X1 U2176 ( .A(n3497), .B(n3472), .Y(n3491) );
  NAND2X1 U2177 ( .A(n3361), .B(n3456), .Y(n3338) );
  NAND2X1 U2178 ( .A(n3497), .B(n3456), .Y(n3489) );
  NOR2X1 U2179 ( .A(n4526), .B(n4524), .Y(n4523) );
  INVX2 U2180 ( .A(n3765), .Y(n1803) );
  NAND2X1 U2181 ( .A(n3354), .B(n3456), .Y(n3342) );
  NAND2X1 U2182 ( .A(n3356), .B(n3472), .Y(n3348) );
  NAND4X1 U2183 ( .A(n2303), .B(n2302), .C(n2301), .D(n2300), .Y(n4634) );
  NAND2X1 U2184 ( .A(n3361), .B(n3472), .Y(n3346) );
  NAND4X2 U2185 ( .A(n2559), .B(n2558), .C(n2557), .D(n2556), .Y(n3897) );
  NAND2X1 U2186 ( .A(n3354), .B(n3472), .Y(n3344) );
  NAND2X1 U2187 ( .A(n3361), .B(n3492), .Y(n3455) );
  NOR2X1 U2188 ( .A(n2634), .B(n2633), .Y(n2642) );
  NOR2X1 U2189 ( .A(n4529), .B(data_memory_lookup_pc[8]), .Y(n4526) );
  NOR2X1 U2190 ( .A(n4355), .B(instruction_memory_lookup_pc[8]), .Y(n4354) );
  NAND2X1 U2191 ( .A(n3354), .B(n3496), .Y(n3445) );
  NAND2X1 U2192 ( .A(n3356), .B(n3492), .Y(n3453) );
  NOR2X1 U2193 ( .A(EXE_MEM_target[0]), .B(n3242), .Y(n3456) );
  NOR2X1 U2194 ( .A(n2040), .B(n2039), .Y(n2046) );
  NOR2X1 U2195 ( .A(n2072), .B(n2091), .Y(n2073) );
  NOR2X1 U2196 ( .A(n2988), .B(n2987), .Y(n4796) );
  NAND2X1 U2197 ( .A(n3497), .B(n3496), .Y(n3541) );
  NAND2X1 U2198 ( .A(n3361), .B(n3496), .Y(n3447) );
  NOR2X1 U2199 ( .A(n3089), .B(n3134), .Y(n2961) );
  AND2XL U2200 ( .A(n4086), .B(n4518), .Y(n4083) );
  NOR2X1 U2201 ( .A(EXE_MEM_target[0]), .B(n3291), .Y(n3472) );
  NAND2X1 U2202 ( .A(n3356), .B(n3496), .Y(n3451) );
  NAND2X1 U2203 ( .A(n3354), .B(n3492), .Y(n3449) );
  OAI2BB1XL U2204 ( .A0N(IF_DEC_instr[7]), .A1N(n4407), .B0(n4152), .Y(n1726)
         );
  NAND2X1 U2205 ( .A(n3497), .B(n3492), .Y(n3543) );
  AND2X1 U2206 ( .A(EXE_MEM_target[0]), .B(n3351), .Y(n3496) );
  NOR2X1 U2207 ( .A(n4262), .B(n3207), .Y(n3089) );
  NOR2X1 U2208 ( .A(n4600), .B(n4603), .Y(n3742) );
  OAI2BB1XL U2209 ( .A0N(core_r12[1]), .A1N(n2826), .B0(n2733), .Y(n2736) );
  NAND2XL U2210 ( .A(n3209), .B(cpufe_cs[0]), .Y(n2985) );
  INVXL U2211 ( .A(n4106), .Y(n4110) );
  NOR2X1 U2212 ( .A(n4396), .B(IF_PC[9]), .Y(n4374) );
  NOR2X1 U2213 ( .A(n2551), .B(n2550), .Y(n2559) );
  AND2X1 U2214 ( .A(EXE_MEM_target[0]), .B(n3349), .Y(n3492) );
  NOR2X1 U2215 ( .A(n3209), .B(n3208), .Y(n4263) );
  NOR2X1 U2216 ( .A(n3861), .B(n3860), .Y(n4820) );
  NOR2X1 U2217 ( .A(n4274), .B(n4266), .Y(n4267) );
  NAND2X1 U2218 ( .A(n2087), .B(n3814), .Y(n4548) );
  INVX1 U2219 ( .A(n4407), .Y(n4405) );
  NOR2X1 U2220 ( .A(n3199), .B(n4944), .Y(n3095) );
  NOR2X1 U2221 ( .A(n4346), .B(instruction_memory_lookup_pc[6]), .Y(n4350) );
  NOR3X1 U2222 ( .A(n4865), .B(n3067), .C(IF_DEC_instr[0]), .Y(n4790) );
  NOR2X1 U2223 ( .A(n3816), .B(data_memory_lookup_wen), .Y(n2199) );
  AOI222XL U2224 ( .A0(n4865), .A1(EXE_MEM_target[0]), .B0(IF_DEC_instr[5]), 
        .B1(n3234), .C0(n3134), .C1(IF_DEC_instr[1]), .Y(n3132) );
  NAND2X1 U2225 ( .A(n4823), .B(n4822), .Y(n4868) );
  NOR2X1 U2226 ( .A(n4592), .B(data_memory_dcache_dirty[2]), .Y(n4600) );
  INVX1 U2227 ( .A(data_memory_N911), .Y(n4881) );
  NOR2X1 U2228 ( .A(EXE_MEM_target[3]), .B(n3290), .Y(n3349) );
  NOR2X1 U2229 ( .A(n3648), .B(n3204), .Y(n1385) );
  NOR2X1 U2230 ( .A(n3241), .B(n3290), .Y(n3351) );
  NOR2X1 U2231 ( .A(n4537), .B(data_memory_lookup_pc[6]), .Y(n3230) );
  XOR2XL U2232 ( .A(data_memory_dcache_headpc[6]), .B(n4561), .Y(n4564) );
  NOR2X1 U2233 ( .A(n2218), .B(n4865), .Y(n4335) );
  NOR2X1 U2234 ( .A(n4791), .B(IF_PC[6]), .Y(n4319) );
  BUFX4 U2235 ( .A(n2222), .Y(n2800) );
  NOR2X1 U2236 ( .A(n4542), .B(n3227), .Y(n4537) );
  NOR2X1 U2237 ( .A(n3129), .B(n3814), .Y(n4060) );
  INVX1 U2238 ( .A(n4509), .Y(n4823) );
  NOR2X1 U2239 ( .A(arready_m_inf[0]), .B(n3129), .Y(data_memory_N911) );
  NOR2X1 U2240 ( .A(n2044), .B(n2043), .Y(n2040) );
  NOR2X1 U2241 ( .A(n2919), .B(n4865), .Y(n4612) );
  NAND2X1 U2242 ( .A(n4144), .B(cpufe_cs[0]), .Y(n4407) );
  NOR2X1 U2243 ( .A(n4865), .B(n3081), .Y(n3234) );
  NAND2X1 U2244 ( .A(n3110), .B(n3109), .Y(n4522) );
  MXI2XL U2245 ( .A(n4380), .B(n2962), .S0(IF_PC[1]), .Y(n2991) );
  NOR2X1 U2246 ( .A(n3210), .B(n2956), .Y(n4144) );
  NOR2X1 U2247 ( .A(n3624), .B(n4670), .Y(n4611) );
  NOR2X1 U2248 ( .A(n2117), .B(n2119), .Y(n2164) );
  NOR2X1 U2249 ( .A(n3740), .B(n2083), .Y(n3791) );
  NOR2X1 U2250 ( .A(n3185), .B(n4598), .Y(n2097) );
  NOR2X1 U2251 ( .A(n3815), .B(n2997), .Y(n2095) );
  AND2X1 U2252 ( .A(n2948), .B(n2996), .Y(n4897) );
  NOR2X1 U2253 ( .A(n4363), .B(n3180), .Y(n3181) );
  NOR2X1 U2254 ( .A(C303_DATA2_4), .B(n4098), .Y(n4107) );
  INVX1 U2255 ( .A(n4871), .Y(n4869) );
  NOR2X1 U2256 ( .A(n3185), .B(n3184), .Y(n4603) );
  NOR2X1 U2257 ( .A(n3887), .B(instruction_memory_lookup_pc[3]), .Y(n3117) );
  NOR2X1 U2258 ( .A(n2033), .B(data_memory_lookup_pc[4]), .Y(n2117) );
  NOR2X1 U2259 ( .A(n4376), .B(EXE_MEM_PCnxt[9]), .Y(n2967) );
  NOR2X1 U2260 ( .A(n3813), .B(instruction_memory_lookup_pc[0]), .Y(n3545) );
  NOR2X1 U2261 ( .A(n4874), .B(data_memory_datamem_cs[3]), .Y(n3860) );
  NOR2X1 U2262 ( .A(n3246), .B(EXE_MEM_target[2]), .Y(n3361) );
  NOR2X1 U2263 ( .A(n3213), .B(instruction_memory_lookup_pc[1]), .Y(n3115) );
  NOR2X1 U2264 ( .A(n4344), .B(n4342), .Y(n3886) );
  NOR2X1 U2265 ( .A(n3851), .B(instruction_memory_lookup_pc[6]), .Y(n3581) );
  NOR2X1 U2266 ( .A(n2947), .B(data_memory_datamem_cs[0]), .Y(n2996) );
  NOR2X1 U2267 ( .A(n4546), .B(data_memory_lookup_pc[2]), .Y(n2149) );
  OR2XL U2268 ( .A(n3587), .B(instruction_memory_lookup_pc[7]), .Y(n3586) );
  NAND2BXL U2269 ( .AN(C303_DATA2_3), .B(n4069), .Y(n4098) );
  NOR2X1 U2270 ( .A(n4816), .B(data_memory_lookup_pc[0]), .Y(n2143) );
  NOR2X1 U2271 ( .A(n3883), .B(instruction_memory_lookup_pc[4]), .Y(n3569) );
  OR2XL U2272 ( .A(n4534), .B(data_memory_lookup_pc[7]), .Y(n2178) );
  NOR2X1 U2273 ( .A(n4545), .B(data_memory_lookup_pc[3]), .Y(n2132) );
  NOR2X1 U2274 ( .A(n3570), .B(instruction_memory_lookup_pc[5]), .Y(n3573) );
  NOR2X1 U2275 ( .A(n2032), .B(data_memory_lookup_pc[5]), .Y(n2119) );
  NOR2X1 U2276 ( .A(n4798), .B(instruction_memory_icache_headpc[5]), .Y(n3126)
         );
  NOR2X1 U2277 ( .A(n2120), .B(data_memory_lookup_pc[6]), .Y(n2173) );
  NOR2X1 U2278 ( .A(n3244), .B(EXE_MEM_target[1]), .Y(n3354) );
  NAND2X1 U2279 ( .A(n4872), .B(n2068), .Y(n3624) );
  NAND2BX1 U2280 ( .AN(instruction_memory_icache_cs[0]), .B(n3111), .Y(n4363)
         );
  NOR2X1 U2281 ( .A(n2978), .B(IF_DEC_PC[9]), .Y(n3092) );
  NOR2X1 U2282 ( .A(n2957), .B(cpube_cs[0]), .Y(n3110) );
  NOR2X1 U2283 ( .A(n2960), .B(cpube_cs[1]), .Y(n3102) );
  NOR2X1 U2284 ( .A(n2033), .B(DM_idx[4]), .Y(n2053) );
  NOR2X1 U2285 ( .A(n4559), .B(data_memory_dcache_headpc[5]), .Y(n2054) );
  INVX1 U2286 ( .A(data_memory_datamem_cs[2]), .Y(n2997) );
  INVX1 U2287 ( .A(data_memory_datamem_cs[0]), .Y(n3814) );
  NOR2X1 U2288 ( .A(data_memory_dcache_ready_idx[0]), .B(
        data_memory_dcache_ready_idx[2]), .Y(n2062) );
  NOR2X1 U2289 ( .A(data_memory_dcache_ready_idx[6]), .B(
        data_memory_dcache_ready_idx[5]), .Y(n2063) );
  NOR2X1 U2290 ( .A(instruction_memory_icache_ready_idx[5]), .B(
        instruction_memory_icache_ready_idx[6]), .Y(n3172) );
  NOR2X1 U2291 ( .A(instruction_memory_icache_ready_idx[0]), .B(
        instruction_memory_icache_ready_idx[2]), .Y(n3171) );
  NOR2X1 U2292 ( .A(instruction_memory_icache_cs[0]), .B(rvalid_m_inf[1]), .Y(
        n3131) );
  INVX1 U2293 ( .A(cpube_cs[2]), .Y(n4944) );
  NAND2X1 U2294 ( .A(instruction_memory_icache_cs[0]), .B(
        instruction_memory_icache_cs[1]), .Y(instruction_memory_N222) );
  NOR2X1 U2295 ( .A(data_memory_datamem_cs[3]), .B(data_memory_datamem_cs[1]), 
        .Y(n4872) );
  NOR2X1 U2296 ( .A(instruction_memory_lookup_pc[6]), .B(
        instruction_memory_lookup_pc[5]), .Y(n3811) );
  INVX3 U2297 ( .A(IF_DEC_instr[8]), .Y(n2220) );
  AND2X1 U2298 ( .A(EXE_MEM_target[2]), .B(EXE_MEM_target[1]), .Y(n3497) );
  NOR2X1 U2299 ( .A(EXE_MEM_target[2]), .B(EXE_MEM_target[1]), .Y(n3356) );
  INVXL U2300 ( .A(1'b0), .Y(arburst_m_inf[0]) );
  INVXL U2302 ( .A(1'b1), .Y(arburst_m_inf[1]) );
  INVXL U2304 ( .A(1'b0), .Y(arburst_m_inf[2]) );
  INVXL U2306 ( .A(1'b1), .Y(arburst_m_inf[3]) );
  INVXL U2308 ( .A(1'b0), .Y(arsize_m_inf[0]) );
  INVXL U2310 ( .A(1'b1), .Y(arsize_m_inf[1]) );
  INVXL U2312 ( .A(1'b1), .Y(arsize_m_inf[2]) );
  INVXL U2314 ( .A(1'b0), .Y(arsize_m_inf[3]) );
  INVXL U2316 ( .A(1'b1), .Y(arsize_m_inf[4]) );
  INVXL U2318 ( .A(1'b1), .Y(arsize_m_inf[5]) );
  INVXL U2320 ( .A(1'b0), .Y(arlen_m_inf[0]) );
  INVXL U2322 ( .A(1'b0), .Y(arlen_m_inf[1]) );
  INVXL U2324 ( .A(1'b0), .Y(arlen_m_inf[2]) );
  INVXL U2326 ( .A(1'b0), .Y(arlen_m_inf[3]) );
  INVXL U2328 ( .A(1'b0), .Y(arlen_m_inf[4]) );
  INVXL U2330 ( .A(1'b0), .Y(arlen_m_inf[5]) );
  INVXL U2332 ( .A(1'b0), .Y(arlen_m_inf[6]) );
  INVXL U2334 ( .A(1'b0), .Y(arlen_m_inf[7]) );
  INVXL U2336 ( .A(1'b0), .Y(arlen_m_inf[8]) );
  INVXL U2338 ( .A(1'b0), .Y(arlen_m_inf[9]) );
  INVXL U2340 ( .A(1'b0), .Y(arlen_m_inf[10]) );
  INVXL U2342 ( .A(1'b0), .Y(arlen_m_inf[11]) );
  INVXL U2344 ( .A(1'b0), .Y(arlen_m_inf[12]) );
  INVXL U2346 ( .A(1'b0), .Y(arlen_m_inf[13]) );
  INVXL U2348 ( .A(1'b1), .Y(araddr_m_inf[0]) );
  INVXL U2350 ( .A(1'b1), .Y(araddr_m_inf[13]) );
  INVXL U2352 ( .A(1'b1), .Y(araddr_m_inf[14]) );
  INVXL U2354 ( .A(1'b1), .Y(araddr_m_inf[15]) );
  INVXL U2356 ( .A(1'b1), .Y(araddr_m_inf[16]) );
  INVXL U2358 ( .A(1'b1), .Y(araddr_m_inf[17]) );
  INVXL U2360 ( .A(1'b1), .Y(araddr_m_inf[18]) );
  INVXL U2362 ( .A(1'b1), .Y(araddr_m_inf[19]) );
  INVXL U2364 ( .A(1'b1), .Y(araddr_m_inf[20]) );
  INVXL U2366 ( .A(1'b1), .Y(araddr_m_inf[21]) );
  INVXL U2368 ( .A(1'b1), .Y(araddr_m_inf[22]) );
  INVXL U2370 ( .A(1'b1), .Y(araddr_m_inf[23]) );
  INVXL U2372 ( .A(1'b1), .Y(araddr_m_inf[24]) );
  INVXL U2374 ( .A(1'b1), .Y(araddr_m_inf[25]) );
  INVXL U2376 ( .A(1'b1), .Y(araddr_m_inf[26]) );
  INVXL U2378 ( .A(1'b1), .Y(araddr_m_inf[27]) );
  INVXL U2380 ( .A(1'b1), .Y(araddr_m_inf[28]) );
  INVXL U2382 ( .A(1'b1), .Y(araddr_m_inf[29]) );
  INVXL U2384 ( .A(1'b1), .Y(araddr_m_inf[30]) );
  INVXL U2386 ( .A(1'b1), .Y(araddr_m_inf[31]) );
  INVXL U2388 ( .A(1'b1), .Y(araddr_m_inf[32]) );
  INVXL U2390 ( .A(1'b1), .Y(araddr_m_inf[45]) );
  INVXL U2392 ( .A(1'b1), .Y(araddr_m_inf[46]) );
  INVXL U2394 ( .A(1'b1), .Y(araddr_m_inf[47]) );
  INVXL U2396 ( .A(1'b1), .Y(araddr_m_inf[48]) );
  INVXL U2398 ( .A(1'b1), .Y(araddr_m_inf[49]) );
  INVXL U2400 ( .A(1'b1), .Y(araddr_m_inf[50]) );
  INVXL U2402 ( .A(1'b1), .Y(araddr_m_inf[51]) );
  INVXL U2404 ( .A(1'b1), .Y(araddr_m_inf[52]) );
  INVXL U2406 ( .A(1'b1), .Y(araddr_m_inf[53]) );
  INVXL U2408 ( .A(1'b1), .Y(araddr_m_inf[54]) );
  INVXL U2410 ( .A(1'b1), .Y(araddr_m_inf[55]) );
  INVXL U2412 ( .A(1'b1), .Y(araddr_m_inf[56]) );
  INVXL U2414 ( .A(1'b1), .Y(araddr_m_inf[57]) );
  INVXL U2416 ( .A(1'b1), .Y(araddr_m_inf[58]) );
  INVXL U2418 ( .A(1'b1), .Y(araddr_m_inf[59]) );
  INVXL U2420 ( .A(1'b1), .Y(araddr_m_inf[60]) );
  INVXL U2422 ( .A(1'b1), .Y(araddr_m_inf[61]) );
  INVXL U2424 ( .A(1'b1), .Y(araddr_m_inf[62]) );
  INVXL U2426 ( .A(1'b1), .Y(araddr_m_inf[63]) );
  INVXL U2428 ( .A(1'b1), .Y(arid_m_inf[0]) );
  INVXL U2430 ( .A(1'b1), .Y(arid_m_inf[1]) );
  INVXL U2432 ( .A(1'b1), .Y(arid_m_inf[2]) );
  INVXL U2434 ( .A(1'b1), .Y(arid_m_inf[3]) );
  INVXL U2436 ( .A(1'b1), .Y(arid_m_inf[4]) );
  INVXL U2438 ( .A(1'b1), .Y(arid_m_inf[5]) );
  INVXL U2440 ( .A(1'b1), .Y(arid_m_inf[6]) );
  INVXL U2442 ( .A(1'b1), .Y(arid_m_inf[7]) );
  INVXL U2444 ( .A(1'b0), .Y(awlen_m_inf[0]) );
  INVXL U2446 ( .A(1'b0), .Y(awlen_m_inf[1]) );
  INVXL U2448 ( .A(1'b0), .Y(awlen_m_inf[2]) );
  INVXL U2450 ( .A(1'b0), .Y(awlen_m_inf[3]) );
  INVXL U2452 ( .A(1'b0), .Y(awlen_m_inf[4]) );
  INVXL U2454 ( .A(1'b0), .Y(awburst_m_inf[0]) );
  INVXL U2456 ( .A(1'b1), .Y(awburst_m_inf[1]) );
  INVXL U2458 ( .A(1'b0), .Y(awsize_m_inf[0]) );
  INVXL U2460 ( .A(1'b1), .Y(awsize_m_inf[1]) );
  INVXL U2462 ( .A(1'b1), .Y(awsize_m_inf[2]) );
  INVXL U2464 ( .A(1'b1), .Y(awaddr_m_inf[0]) );
  INVXL U2466 ( .A(1'b1), .Y(awaddr_m_inf[13]) );
  INVXL U2468 ( .A(1'b1), .Y(awaddr_m_inf[14]) );
  INVXL U2470 ( .A(1'b1), .Y(awaddr_m_inf[15]) );
  INVXL U2472 ( .A(1'b1), .Y(awaddr_m_inf[16]) );
  INVXL U2474 ( .A(1'b1), .Y(awaddr_m_inf[17]) );
  INVXL U2476 ( .A(1'b1), .Y(awaddr_m_inf[18]) );
  INVXL U2478 ( .A(1'b1), .Y(awaddr_m_inf[19]) );
  INVXL U2480 ( .A(1'b1), .Y(awaddr_m_inf[20]) );
  INVXL U2482 ( .A(1'b1), .Y(awaddr_m_inf[21]) );
  INVXL U2484 ( .A(1'b1), .Y(awaddr_m_inf[22]) );
  INVXL U2486 ( .A(1'b1), .Y(awaddr_m_inf[23]) );
  INVXL U2488 ( .A(1'b1), .Y(awaddr_m_inf[24]) );
  INVXL U2490 ( .A(1'b1), .Y(awaddr_m_inf[25]) );
  INVXL U2492 ( .A(1'b1), .Y(awaddr_m_inf[26]) );
  INVXL U2494 ( .A(1'b1), .Y(awaddr_m_inf[27]) );
  INVXL U2496 ( .A(1'b1), .Y(awaddr_m_inf[28]) );
  INVXL U2498 ( .A(1'b1), .Y(awaddr_m_inf[29]) );
  INVXL U2500 ( .A(1'b1), .Y(awaddr_m_inf[30]) );
  INVXL U2502 ( .A(1'b1), .Y(awaddr_m_inf[31]) );
  INVXL U2504 ( .A(1'b1), .Y(awid_m_inf[0]) );
  INVXL U2506 ( .A(1'b1), .Y(awid_m_inf[1]) );
  INVXL U2508 ( .A(1'b1), .Y(awid_m_inf[2]) );
  INVXL U2510 ( .A(1'b1), .Y(awid_m_inf[3]) );
  INVX2 U2512 ( .A(n4817), .Y(n3882) );
  OAI2BB1XL U2513 ( .A0N(core_r7[1]), .A1N(n2847), .B0(n2754), .Y(n2755) );
  NOR2X2 U2514 ( .A(n2270), .B(n2276), .Y(n2847) );
  MX2X2 U2515 ( .A(n3670), .B(IF_DEC_PC[3]), .S0(n3036), .Y(n2901) );
  XNOR2X1 U2516 ( .A(n4730), .B(n4698), .Y(n4032) );
  BUFX4 U2517 ( .A(n4715), .Y(n2017) );
  NAND4X1 U2518 ( .A(n2797), .B(n2796), .C(n2795), .D(n2794), .Y(n4715) );
  XNOR2X1 U2519 ( .A(n4706), .B(n4738), .Y(n4183) );
  OAI22X1 U2520 ( .A0(n4210), .A1(n3995), .B0(n4695), .B1(n3994), .Y(n3996) );
  INVX2 U2521 ( .A(n4558), .Y(n2018) );
  INVX4 U2522 ( .A(n2018), .Y(n2019) );
  AOI222X1 U2523 ( .A0(DM_idx[4]), .A1(n4079), .B0(DM_idx[4]), .B1(n4078), 
        .C0(n4079), .C1(n4078), .Y(n4558) );
  ADDHX1 U2524 ( .A(n4641), .B(n4640), .CO(n4726), .S(n4646) );
  INVX4 U2525 ( .A(n1801), .Y(n2020) );
  NAND2X1 U2526 ( .A(n4139), .B(n4136), .Y(n4022) );
  AOI21X1 U2527 ( .A0(n4139), .A1(n4135), .B0(n4020), .Y(n4021) );
  OAI22X1 U2528 ( .A0(n4620), .A1(n4183), .B0(n4208), .B1(n4707), .Y(n4212) );
  OAI22X1 U2529 ( .A0(n4620), .A1(n4031), .B0(n4157), .B1(n4707), .Y(n4165) );
  XNOR2X1 U2530 ( .A(n4706), .B(n4634), .Y(n4157) );
  OAI22X1 U2531 ( .A0(n4639), .A1(n4224), .B0(n4638), .B1(n4732), .Y(n4632) );
  NAND2BX4 U2532 ( .AN(IF_DEC_instr[5]), .B(IF_DEC_instr[6]), .Y(n2244) );
  NAND4X2 U2533 ( .A(n2613), .B(n2612), .C(n2611), .D(n2610), .Y(n3936) );
  NOR2X1 U2534 ( .A(n2609), .B(n2608), .Y(n2612) );
  AOI222X2 U2535 ( .A0(n4865), .A1(EXE_MEM_result[10]), .B0(n4786), .B1(n4044), 
        .C0(n4043), .C1(n4790), .Y(n4045) );
  ADDHX1 U2536 ( .A(n4181), .B(n4180), .CO(n4230), .S(n4191) );
  OAI22X1 U2537 ( .A0(n4620), .A1(n4157), .B0(n4183), .B1(n4707), .Y(n4181) );
  OAI22X1 U2538 ( .A0(n4714), .A1(n4153), .B0(n4712), .B1(n4194), .Y(n4193) );
  NAND2X4 U2539 ( .A(n4712), .B(n3981), .Y(n4714) );
  NOR3XL U2540 ( .A(n4469), .B(n4468), .C(n4467), .Y(n4471) );
  AOI211XL U2541 ( .A0(n4846), .A1(n4466), .B0(n4465), .C0(n4464), .Y(n4469)
         );
  AOI222XL U2542 ( .A0(n2020), .A1(n4463), .B0(n4689), .B1(n4462), .C0(n4461), 
        .C1(n4460), .Y(n4465) );
  NAND2X1 U2543 ( .A(n4700), .B(n4221), .Y(n4702) );
  AOI22X1 U2544 ( .A0(n2614), .A1(core_r1[5]), .B0(n2839), .B1(core_r3[5]), 
        .Y(n2557) );
  XNOR2X2 U2545 ( .A(n4474), .B(n3897), .Y(n4732) );
  NOR2X2 U2546 ( .A(n2239), .B(n2229), .Y(n2809) );
  NOR2X2 U2547 ( .A(n2246), .B(n2229), .Y(n2801) );
  AOI2BB1XL U2548 ( .A0N(n4475), .A1N(n4623), .B0(n4474), .Y(n4476) );
  NOR2BXL U2549 ( .AN(n4743), .B(n4712), .Y(n3998) );
  OAI22X1 U2550 ( .A0(n4620), .A1(n3993), .B0(n3992), .B1(n4707), .Y(n3997) );
  XNOR2XL U2551 ( .A(n4693), .B(n4689), .Y(n3702) );
  NAND2X2 U2552 ( .A(n2220), .B(IF_DEC_instr[7]), .Y(n2246) );
  NOR2X1 U2553 ( .A(n2868), .B(n2867), .Y(n2869) );
  NAND4XL U2554 ( .A(n2860), .B(n2859), .C(n2858), .D(n2857), .Y(n2868) );
  NAND2XL U2555 ( .A(n3035), .B(n4778), .Y(n3970) );
  MXI2XL U2556 ( .A(n4777), .B(n4776), .S0(n4634), .Y(n3035) );
  AOI21XL U2557 ( .A0(n3920), .A1(n3919), .B0(n3918), .Y(n3921) );
  NAND2XL U2558 ( .A(n3920), .B(n3914), .Y(n3922) );
  NOR2BX1 U2559 ( .AN(IF_DEC_instr[15]), .B(IF_DEC_instr[14]), .Y(n2954) );
  NAND3XL U2560 ( .A(n4318), .B(IF_PC[4]), .C(IF_PC[3]), .Y(n4791) );
  NAND3XL U2561 ( .A(n4372), .B(IF_PC[7]), .C(IF_PC[8]), .Y(n4396) );
  XNOR2XL U2562 ( .A(n2020), .B(n4737), .Y(n3941) );
  OAI22XL U2563 ( .A0(n4702), .A1(n4223), .B0(n4700), .B1(n4222), .Y(n4633) );
  INVXL U2564 ( .A(n4220), .Y(n4247) );
  NOR2X1 U2565 ( .A(n2389), .B(n2388), .Y(n2392) );
  OAI22XL U2566 ( .A0(n4210), .A1(n3932), .B0(n4695), .B1(n3995), .Y(n3989) );
  OAI22XL U2567 ( .A0(n4620), .A1(n3931), .B0(n3993), .B1(n4707), .Y(n3990) );
  BUFX1 U2568 ( .A(n4636), .Y(n4742) );
  NAND4XL U2569 ( .A(n2622), .B(n2621), .C(n2620), .D(n2619), .Y(n2623) );
  NOR2X1 U2570 ( .A(n2247), .B(n2239), .Y(n2826) );
  NOR2X1 U2571 ( .A(n2440), .B(n2439), .Y(n2448) );
  NAND4XL U2572 ( .A(n2434), .B(n2433), .C(n2432), .D(n2431), .Y(n2440) );
  NAND4XL U2573 ( .A(n2438), .B(n2437), .C(n2436), .D(n2435), .Y(n2439) );
  NAND2XL U2574 ( .A(n3006), .B(n4778), .Y(n3962) );
  MXI2XL U2575 ( .A(n4777), .B(n4776), .S0(n4637), .Y(n3006) );
  NOR3X2 U2576 ( .A(n2876), .B(n2875), .C(n2874), .Y(n2882) );
  OAI21XL U2577 ( .A0(n3599), .A1(n3598), .B0(n3597), .Y(n3615) );
  INVXL U2578 ( .A(instruction_memory_icache_headpc[1]), .Y(n3213) );
  NAND2XL U2579 ( .A(n4249), .B(n4248), .Y(n4432) );
  OR2XL U2580 ( .A(n4249), .B(n4248), .Y(n4433) );
  NOR2X2 U2581 ( .A(n2245), .B(n2244), .Y(n2818) );
  NOR2X2 U2582 ( .A(n2246), .B(n2244), .Y(n2816) );
  NAND2XL U2583 ( .A(n4245), .B(n4244), .Y(n4447) );
  NAND2XL U2584 ( .A(n3927), .B(n3926), .Y(n4046) );
  OAI21XL U2585 ( .A0(n3908), .A1(n3907), .B0(n3906), .Y(n3977) );
  NOR2X1 U2586 ( .A(n3662), .B(n3665), .Y(n3668) );
  OR2XL U2587 ( .A(n3063), .B(n3062), .Y(n3683) );
  INVXL U2588 ( .A(n2959), .Y(n3081) );
  NOR2X1 U2589 ( .A(n2911), .B(n2910), .Y(n2937) );
  AOI21X1 U2590 ( .A0(n2900), .A1(n3953), .B0(n2899), .Y(n3018) );
  OAI21XL U2591 ( .A0(n3954), .A1(n4294), .B0(n3955), .Y(n2899) );
  AOI31XL U2592 ( .A0(n3228), .A1(data_memory_lookup_pc[7]), .A2(
        data_memory_lookup_pc[6]), .B0(n4531), .Y(n4543) );
  AND3XL U2593 ( .A(data_memory_lookup_pc[8]), .B(data_memory_lookup_pc[10]), 
        .C(data_memory_lookup_pc[9]), .Y(n3228) );
  INVXL U2594 ( .A(n3734), .Y(n3722) );
  NAND2X1 U2595 ( .A(n3855), .B(n3002), .Y(n3746) );
  INVXL U2596 ( .A(n3001), .Y(n3002) );
  NAND2XL U2597 ( .A(n4594), .B(n4590), .Y(n3185) );
  AOI2BB1X2 U2598 ( .A0N(n3641), .A1N(n2990), .B0(n2989), .Y(n4373) );
  AOI21XL U2599 ( .A0(n2984), .A1(n4144), .B0(n3640), .Y(n2989) );
  NAND2XL U2600 ( .A(n2988), .B(n2983), .Y(n2984) );
  INVXL U2601 ( .A(n2982), .Y(n2988) );
  MXI2XL U2602 ( .A(n4144), .B(cpufe_cs[1]), .S0(n3640), .Y(n2987) );
  INVXL U2603 ( .A(n2983), .Y(n3209) );
  NAND2XL U2604 ( .A(n2958), .B(cpube_cs[0]), .Y(n3207) );
  NAND2XL U2605 ( .A(n4416), .B(n2954), .Y(n3090) );
  XNOR2XL U2606 ( .A(n2194), .B(n2193), .Y(n2195) );
  OAI22XL U2607 ( .A0(DM_idx[2]), .A1(n2028), .B0(n4545), .B1(DM_idx[3]), .Y(
        n2029) );
  NAND2XL U2608 ( .A(n3091), .B(patcal[0]), .Y(n3199) );
  OAI21XL U2609 ( .A0(awready_m_inf_0_), .A1(n3107), .B0(n3205), .Y(n2091) );
  INVXL U2610 ( .A(n3635), .Y(n3861) );
  NAND2XL U2611 ( .A(n3860), .B(data_memory_datamem_cs[1]), .Y(n3107) );
  NAND2XL U2612 ( .A(n2095), .B(data_memory_datamem_cs[0]), .Y(n3816) );
  NAND2XL U2613 ( .A(n4611), .B(DM_flush), .Y(n3205) );
  INVXL U2614 ( .A(n4239), .Y(n4240) );
  INVXL U2615 ( .A(n3018), .Y(n4306) );
  NAND2XL U2616 ( .A(n3020), .B(n3019), .Y(n4329) );
  INVXL U2617 ( .A(n3007), .Y(n4330) );
  AOI21XL U2618 ( .A0(n3736), .A1(n3654), .B0(n3722), .Y(n3660) );
  NAND2BXL U2619 ( .AN(data_memory_dcache_dirty[3]), .B(n3184), .Y(n4598) );
  INVXL U2620 ( .A(n4373), .Y(n4324) );
  NOR2X1 U2621 ( .A(n4791), .B(n4323), .Y(n4372) );
  AOI2BB1XL U2622 ( .A0N(n4792), .A1N(n4372), .B0(n4324), .Y(n4339) );
  NAND2XL U2623 ( .A(n2955), .B(n3090), .Y(n3098) );
  NAND2XL U2624 ( .A(n3095), .B(n3239), .Y(n2955) );
  INVXL U2625 ( .A(n4274), .Y(n3720) );
  AOI21X1 U2626 ( .A0(n3182), .A1(n3181), .B0(instruction_memory_N211), .Y(
        n4369) );
  AOI2BB1XL U2627 ( .A0N(n3091), .A1N(n3090), .B0(n3089), .Y(n3626) );
  NAND2BXL U2628 ( .AN(cpube_cs[2]), .B(cpube_cs[1]), .Y(n3627) );
  NAND2XL U2629 ( .A(n2948), .B(n2995), .Y(n4581) );
  INVXL U2630 ( .A(n4581), .Y(n4588) );
  INVXL U2631 ( .A(n3736), .Y(n3796) );
  XNOR2XL U2632 ( .A(n4623), .B(n4730), .Y(n4224) );
  XNOR2XL U2633 ( .A(n4693), .B(n4729), .Y(n4195) );
  XNOR2XL U2634 ( .A(n2020), .B(n4730), .Y(n3985) );
  NAND4X1 U2635 ( .A(n2430), .B(n2429), .C(n2428), .D(n2427), .Y(n3980) );
  NOR2X1 U2636 ( .A(n2422), .B(n2421), .Y(n2430) );
  NOR2X1 U2637 ( .A(n2426), .B(n2425), .Y(n2429) );
  NAND4X1 U2638 ( .A(n2321), .B(n2320), .C(n2319), .D(n2318), .Y(n4154) );
  NOR2X1 U2639 ( .A(n2313), .B(n2312), .Y(n2321) );
  NOR2X1 U2640 ( .A(n2317), .B(n2316), .Y(n2320) );
  OAI21XL U2641 ( .A0(IF_PC[6]), .A1(n3851), .B0(n3149), .Y(n3150) );
  NAND2XL U2642 ( .A(n3148), .B(n3147), .Y(n3149) );
  AOI2BB2XL U2643 ( .B0(n3570), .B1(IF_PC[5]), .A0N(
        instruction_memory_icache_headpc[6]), .A1N(n4387), .Y(n3147) );
  NAND2XL U2644 ( .A(n3146), .B(n3145), .Y(n3148) );
  NAND2XL U2645 ( .A(n2120), .B(data_memory_lookup_pc[6]), .Y(n2172) );
  NAND2XL U2646 ( .A(n4549), .B(data_memory_lookup_pc[1]), .Y(n2141) );
  INVXL U2647 ( .A(n2170), .Y(n2176) );
  NAND2XL U2648 ( .A(n4534), .B(data_memory_lookup_pc[7]), .Y(n2179) );
  NAND2XL U2649 ( .A(n4525), .B(data_memory_lookup_pc[9]), .Y(n2186) );
  AOI22XL U2650 ( .A0(data_memory_dcache_headpc[7]), .A1(DM_idx[7]), .B0(
        DM_idx[6]), .B1(n2120), .Y(n2037) );
  XNOR2XL U2651 ( .A(n4623), .B(n4710), .Y(n4713) );
  NAND2BXL U2652 ( .AN(n4646), .B(n4642), .Y(n4644) );
  INVXL U2653 ( .A(n4645), .Y(n4642) );
  NOR2X1 U2654 ( .A(n2353), .B(n2352), .Y(n2356) );
  NAND4X1 U2655 ( .A(n2664), .B(n2663), .C(n2662), .D(n2661), .Y(n4220) );
  NOR2X1 U2656 ( .A(n2656), .B(n2655), .Y(n2664) );
  NAND2XL U2657 ( .A(n3005), .B(n4637), .Y(n4482) );
  XNOR2X2 U2658 ( .A(n4154), .B(n4710), .Y(n4716) );
  XNOR2X2 U2659 ( .A(n3980), .B(n4730), .Y(n4712) );
  XOR2X1 U2660 ( .A(n3980), .B(n4710), .Y(n3981) );
  XNOR2XL U2661 ( .A(n2020), .B(n4710), .Y(n4153) );
  OAI22XL U2662 ( .A0(n4639), .A1(n3940), .B0(n3986), .B1(n4732), .Y(n4000) );
  NOR2BXL U2663 ( .AN(n4743), .B(n4732), .Y(n3935) );
  XNOR2XL U2664 ( .A(n4693), .B(n4698), .Y(n3894) );
  ADDHXL U2665 ( .A(n3896), .B(n3895), .CO(n3943), .S(n3900) );
  OAI22XL U2666 ( .A0(n4620), .A1(n3770), .B0(n3898), .B1(n4707), .Y(n3895) );
  INVXL U2667 ( .A(n3897), .Y(n3760) );
  XNOR2XL U2668 ( .A(n2020), .B(n4693), .Y(n3768) );
  XOR2X2 U2669 ( .A(n4706), .B(n4466), .Y(n3061) );
  NOR2X1 U2670 ( .A(n2458), .B(n2457), .Y(n2466) );
  INVXL U2671 ( .A(n4154), .Y(n3037) );
  OAI211XL U2672 ( .A0(EXE_MEM_instcode[4]), .A1(n3240), .B0(n3239), .C0(
        cpube_cs[2]), .Y(n3290) );
  INVXL U2673 ( .A(n3238), .Y(n3240) );
  NAND2XL U2674 ( .A(n3152), .B(n3166), .Y(n3156) );
  NAND2XL U2675 ( .A(n3165), .B(instruction_memory_icache_headpc[7]), .Y(n3152) );
  NAND2XL U2676 ( .A(n3155), .B(instruction_memory_icache_headpc[9]), .Y(n3161) );
  NAND2XL U2677 ( .A(n4528), .B(data_memory_lookup_pc[8]), .Y(n2185) );
  INVXL U2678 ( .A(n2186), .Y(n2187) );
  OAI21XL U2679 ( .A0(n2170), .A1(n2167), .B0(n2166), .Y(n2190) );
  AOI21XL U2680 ( .A0(n2121), .A1(n2171), .B0(n2165), .Y(n2166) );
  NAND2XL U2681 ( .A(n2179), .B(n2172), .Y(n2165) );
  NAND2XL U2682 ( .A(n2121), .B(n2172), .Y(n2122) );
  NAND2XL U2683 ( .A(n2112), .B(n2118), .Y(n2113) );
  INVXL U2684 ( .A(data_memory_dcache_ready_idx[5]), .Y(n2115) );
  NOR2X1 U2685 ( .A(n2404), .B(n2403), .Y(n2412) );
  XOR2XL U2686 ( .A(n4749), .B(n4748), .Y(n4750) );
  MXI2XL U2687 ( .A(n4777), .B(n4776), .S0(n4660), .Y(n4661) );
  OAI2BB1XL U2688 ( .A0N(core_r12[0]), .A1N(n2826), .B0(n2479), .Y(n2482) );
  OAI2BB1XL U2689 ( .A0N(core_r14[0]), .A1N(n2827), .B0(n2480), .Y(n2481) );
  NOR2X1 U2690 ( .A(n2478), .B(n2477), .Y(n2486) );
  NOR2X1 U2691 ( .A(n2331), .B(n2330), .Y(n2339) );
  OAI2BB1XL U2692 ( .A0N(core_r12[2]), .A1N(n2826), .B0(n2715), .Y(n2718) );
  OAI2BB1XL U2693 ( .A0N(core_r14[2]), .A1N(n2827), .B0(n2716), .Y(n2717) );
  NOR2X1 U2694 ( .A(n2587), .B(n2586), .Y(n2595) );
  NAND4XL U2695 ( .A(n2581), .B(n2580), .C(n2579), .D(n2578), .Y(n2587) );
  NAND4XL U2696 ( .A(n2585), .B(n2584), .C(n2583), .D(n2582), .Y(n2586) );
  NAND2XL U2697 ( .A(n4832), .B(n4220), .Y(n4491) );
  NOR2X1 U2698 ( .A(n2789), .B(n2788), .Y(n2797) );
  AOI22XL U2699 ( .A0(n2614), .A1(core_r1[11]), .B0(n2839), .B1(core_r3[11]), 
        .Y(n2795) );
  NAND2XL U2700 ( .A(n3966), .B(n4778), .Y(n3967) );
  MXI2XL U2701 ( .A(n4777), .B(n4776), .S0(n4729), .Y(n3966) );
  MXI2XL U2702 ( .A(n4777), .B(n4776), .S0(n2020), .Y(n2881) );
  MXI2XL U2703 ( .A(n4463), .B(n4379), .S0(n4781), .Y(n3055) );
  MXI2XL U2704 ( .A(n4777), .B(n4776), .S0(n4623), .Y(n2913) );
  MXI2XL U2705 ( .A(n3037), .B(n4392), .S0(n2884), .Y(n3969) );
  INVXL U2706 ( .A(n4068), .Y(n4082) );
  OAI22XL U2707 ( .A0(n3160), .A1(n3159), .B0(n3158), .B1(n4395), .Y(n3163) );
  INVXL U2708 ( .A(n3157), .Y(n3158) );
  AOI21XL U2709 ( .A0(n3156), .A1(IF_PC[8]), .B0(n3153), .Y(n3160) );
  OAI22XL U2710 ( .A0(n3156), .A1(IF_PC[8]), .B0(IF_PC[9]), .B1(n3157), .Y(
        n3159) );
  INVXL U2711 ( .A(n3161), .Y(n3164) );
  XOR2XL U2712 ( .A(C303_DATA2_4), .B(n4098), .Y(n4079) );
  INVXL U2713 ( .A(DM_idx[3]), .Y(n4076) );
  NAND2XL U2714 ( .A(n4564), .B(DM_idx[6]), .Y(n4562) );
  OR2XL U2715 ( .A(data_memory_dcache_headpc[6]), .B(n4561), .Y(n4556) );
  AND2XL U2716 ( .A(bready_m_inf_0_), .B(bvalid_m_inf_0_), .Y(n2076) );
  AOI211XL U2717 ( .A0(n2051), .A1(n2050), .B0(n2049), .C0(n2048), .Y(n2067)
         );
  AOI2BB1XL U2718 ( .A0N(n2050), .A1N(n2051), .B0(n2047), .Y(n2048) );
  NAND2XL U2719 ( .A(n4541), .B(n3226), .Y(n4542) );
  AND2XL U2720 ( .A(data_memory_lookup_pc[3]), .B(data_memory_lookup_pc[2]), 
        .Y(n3226) );
  INVXL U2721 ( .A(n3233), .Y(n4541) );
  NAND2XL U2722 ( .A(n4253), .B(n4252), .Y(n4657) );
  OR2XL U2723 ( .A(n4664), .B(n4663), .Y(n4774) );
  NAND2XL U2724 ( .A(n4664), .B(n4663), .Y(n4772) );
  AOI22XL U2725 ( .A0(n2816), .A1(core_r6[10]), .B0(n2818), .B1(core_r2[10]), 
        .Y(n2301) );
  AOI22XL U2726 ( .A0(n2816), .A1(core_r6[11]), .B0(n2818), .B1(core_r2[11]), 
        .Y(n2777) );
  NAND4XL U2727 ( .A(n2682), .B(n2681), .C(n2680), .D(n2679), .Y(n4626) );
  NOR2X1 U2728 ( .A(n2678), .B(n2677), .Y(n2681) );
  NAND2XL U2729 ( .A(n2835), .B(n2834), .Y(n4692) );
  NOR2X1 U2730 ( .A(n2815), .B(n2814), .Y(n2835) );
  NOR2X1 U2731 ( .A(n2833), .B(n2832), .Y(n2834) );
  AOI22XL U2732 ( .A0(n2816), .A1(core_r6[1]), .B0(n2818), .B1(core_r2[1]), 
        .Y(n2738) );
  XOR3X2 U2733 ( .A(n4199), .B(n4198), .C(n4197), .Y(n4201) );
  OR2XL U2734 ( .A(n3970), .B(n3969), .Y(n4241) );
  NAND2XL U2735 ( .A(n3968), .B(n3967), .Y(n4132) );
  NAND2XL U2736 ( .A(n3775), .B(n3774), .Y(n3906) );
  OAI21XL U2737 ( .A0(n4285), .A1(n4282), .B0(n4283), .Y(n3953) );
  AND2XL U2738 ( .A(n3038), .B(n3961), .Y(n3022) );
  MX2XL U2739 ( .A(n3962), .B(IF_DEC_PC[8]), .S0(n3036), .Y(n3021) );
  OAI2BB1XL U2740 ( .A0N(n4781), .A1N(IF_DEC_PC[0]), .B0(n2890), .Y(n3051) );
  NAND2XL U2741 ( .A(data_memory_lookup_pc[1]), .B(data_memory_lookup_pc[0]), 
        .Y(n3233) );
  NAND2XL U2742 ( .A(n3230), .B(n4519), .Y(n4529) );
  NAND2XL U2743 ( .A(n4526), .B(n4524), .Y(n4260) );
  INVXL U2744 ( .A(n4872), .Y(n3815) );
  MXI2XL U2745 ( .A(n2996), .B(n2995), .S0(n2994), .Y(n3001) );
  NOR3XL U2746 ( .A(data_memory_dcache_dirty[3]), .B(n4594), .C(
        data_memory_dcache_dirty[0]), .Y(n4597) );
  AOI2BB1XL U2747 ( .A0N(n3093), .A1N(n3092), .B0(n3207), .Y(n2982) );
  NAND2XL U2748 ( .A(instruction_memory_lookup_pc[1]), .B(
        instruction_memory_lookup_pc[0]), .Y(n4344) );
  NAND2XL U2749 ( .A(instruction_memory_lookup_pc[2]), .B(
        instruction_memory_lookup_pc[3]), .Y(n3729) );
  NAND2XL U2750 ( .A(n3884), .B(instruction_memory_lookup_pc[4]), .Y(n4345) );
  NAND2XL U2751 ( .A(n4345), .B(n4798), .Y(n4346) );
  NOR3XL U2752 ( .A(n3811), .B(n3810), .C(n3809), .Y(n3812) );
  NAND2XL U2753 ( .A(n4350), .B(n4327), .Y(n4355) );
  NAND2XL U2754 ( .A(n4354), .B(n4341), .Y(n4358) );
  NOR2X1 U2755 ( .A(n3197), .B(patcal[1]), .Y(n3091) );
  AND2XL U2756 ( .A(data_memory_datamem_cs[3]), .B(data_memory_datamem_cs[0]), 
        .Y(n2995) );
  INVXL U2757 ( .A(data_memory_datamem_ns[2]), .Y(n2108) );
  AOI21XL U2758 ( .A0(n3120), .A1(n3119), .B0(n3118), .Y(n3599) );
  NOR2X1 U2759 ( .A(n3117), .B(n3113), .Y(n3120) );
  NAND3BXL U2760 ( .AN(cpube_ls[1]), .B(n4943), .C(cpube_ls[0]), .Y(n3103) );
  NAND2XL U2761 ( .A(n2101), .B(n2076), .Y(n2070) );
  NAND2XL U2762 ( .A(n4060), .B(arready_m_inf[0]), .Y(n2071) );
  NAND2X1 U2763 ( .A(n2098), .B(n4611), .Y(n2094) );
  OR2XL U2764 ( .A(n2091), .B(n2090), .Y(n2105) );
  NAND3XL U2765 ( .A(n2089), .B(n2088), .C(n4548), .Y(n2090) );
  NAND2XL U2766 ( .A(n4060), .B(n2086), .Y(n2089) );
  NAND2XL U2767 ( .A(n2948), .B(n2947), .Y(n3129) );
  INVXL U2768 ( .A(n4432), .Y(n4250) );
  INVXL U2769 ( .A(n4672), .Y(n4237) );
  XOR2XL U2770 ( .A(n4783), .B(n4782), .Y(n4784) );
  MXI2XL U2771 ( .A(n4777), .B(n4776), .S0(n4775), .Y(n4779) );
  NOR2X1 U2772 ( .A(n4676), .B(n4672), .Y(n4673) );
  NAND2XL U2773 ( .A(n4769), .B(n4768), .Y(n4770) );
  INVXL U2774 ( .A(n4765), .Y(n4769) );
  NOR2X1 U2775 ( .A(n4767), .B(n4766), .Y(n4765) );
  AOI22XL U2776 ( .A0(n2816), .A1(core_r6[5]), .B0(n2818), .B1(core_r2[5]), 
        .Y(n2575) );
  AOI22XL U2777 ( .A0(n2775), .A1(core_r0[5]), .B0(n2248), .B1(core_r4[5]), 
        .Y(n2574) );
  NOR2X1 U2778 ( .A(n2573), .B(n2572), .Y(n2576) );
  AOI211XL U2779 ( .A0(n4500), .A1(n4499), .B0(n4498), .C0(n4497), .Y(n4501)
         );
  NAND2X1 U2780 ( .A(n4496), .B(n4495), .Y(n4502) );
  NOR2BXL U2781 ( .AN(n4743), .B(n4707), .Y(n4506) );
  MXI2XL U2782 ( .A(n4777), .B(n4776), .S0(n4743), .Y(n2888) );
  NAND2XL U2783 ( .A(n4443), .B(n4442), .Y(n4444) );
  OAI21XL U2784 ( .A0(n4049), .A1(n4046), .B0(n4050), .Y(n3963) );
  NAND2XL U2785 ( .A(n4139), .B(n4138), .Y(n4140) );
  INVXL U2786 ( .A(n4054), .Y(n4137) );
  OAI21XL U2787 ( .A0(n4048), .A1(n4047), .B0(n4046), .Y(n4053) );
  OAI21XL U2788 ( .A0(n3930), .A1(n3972), .B0(n3974), .Y(n3949) );
  NAND2XL U2789 ( .A(n3947), .B(n3973), .Y(n3948) );
  INVXL U2790 ( .A(n3975), .Y(n3947) );
  INVXL U2791 ( .A(n3965), .Y(n4048) );
  INVXL U2792 ( .A(n3977), .Y(n3930) );
  NAND2XL U2793 ( .A(n3905), .B(n3974), .Y(n3909) );
  INVXL U2794 ( .A(n3972), .Y(n3905) );
  OAI21XL U2795 ( .A0(n3888), .A1(n3913), .B0(n3916), .Y(n3893) );
  INVXL U2796 ( .A(n3777), .Y(n3778) );
  NAND2XL U2797 ( .A(n3776), .B(n3906), .Y(n3781) );
  INVXL U2798 ( .A(n3907), .Y(n3776) );
  AOI21XL U2799 ( .A0(n3759), .A1(n3914), .B0(n3919), .Y(n3888) );
  NAND2XL U2800 ( .A(n3779), .B(n3777), .Y(n3710) );
  AOI21XL U2801 ( .A0(n3759), .A1(n3695), .B0(n3694), .Y(n3700) );
  AOI21XL U2802 ( .A0(n3683), .A1(n3682), .B0(n3681), .Y(n3708) );
  OAI21XL U2803 ( .A0(n3072), .A1(n3662), .B0(n3664), .Y(n3059) );
  NAND2XL U2804 ( .A(n3075), .B(n3074), .Y(n3076) );
  INVXL U2805 ( .A(n4420), .Y(n3067) );
  INVXL U2806 ( .A(n4865), .Y(n4416) );
  INVXL U2807 ( .A(n4282), .Y(n4284) );
  NAND2XL U2808 ( .A(n3748), .B(n2891), .Y(n4285) );
  INVXL U2809 ( .A(n3749), .Y(n2891) );
  INVXL U2810 ( .A(n4293), .Y(n4295) );
  INVXL U2811 ( .A(n3953), .Y(n4297) );
  INVXL U2812 ( .A(n3009), .Y(n2922) );
  INVXL U2813 ( .A(n3031), .Y(n3028) );
  NAND2XL U2814 ( .A(n3024), .B(n3023), .Y(n3029) );
  MXI2XL U2815 ( .A(EXE_MEM_result[0]), .B(MEM_WB_memout[0]), .S0(n3238), .Y(
        n3539) );
  MXI2XL U2816 ( .A(EXE_MEM_result[10]), .B(MEM_WB_memout[10]), .S0(n3238), 
        .Y(n3526) );
  MXI2XL U2817 ( .A(EXE_MEM_result[11]), .B(MEM_WB_memout[11]), .S0(n3238), 
        .Y(n3505) );
  MXI2XL U2818 ( .A(EXE_MEM_result[12]), .B(MEM_WB_memout[12]), .S0(n3238), 
        .Y(n3515) );
  MXI2XL U2819 ( .A(EXE_MEM_result[13]), .B(MEM_WB_memout[13]), .S0(n3238), 
        .Y(n3523) );
  MXI2XL U2820 ( .A(EXE_MEM_result[14]), .B(MEM_WB_memout[14]), .S0(n3238), 
        .Y(n3544) );
  MXI2XL U2821 ( .A(EXE_MEM_result[15]), .B(MEM_WB_memout[15]), .S0(n3238), 
        .Y(n3521) );
  MXI2XL U2822 ( .A(EXE_MEM_result[1]), .B(MEM_WB_memout[1]), .S0(n3238), .Y(
        n3528) );
  MXI2XL U2823 ( .A(EXE_MEM_result[2]), .B(MEM_WB_memout[2]), .S0(n3238), .Y(
        n3533) );
  MXI2XL U2824 ( .A(EXE_MEM_result[3]), .B(MEM_WB_memout[3]), .S0(n3238), .Y(
        n3536) );
  MXI2XL U2825 ( .A(EXE_MEM_result[4]), .B(MEM_WB_memout[4]), .S0(n3238), .Y(
        n3530) );
  MXI2XL U2826 ( .A(EXE_MEM_result[5]), .B(MEM_WB_memout[5]), .S0(n3238), .Y(
        n3511) );
  MXI2XL U2827 ( .A(EXE_MEM_result[6]), .B(MEM_WB_memout[6]), .S0(n3238), .Y(
        n3517) );
  MXI2XL U2828 ( .A(EXE_MEM_result[7]), .B(MEM_WB_memout[7]), .S0(n3238), .Y(
        n3508) );
  MXI2XL U2829 ( .A(EXE_MEM_result[8]), .B(MEM_WB_memout[8]), .S0(n3238), .Y(
        n3519) );
  MXI2XL U2830 ( .A(EXE_MEM_result[9]), .B(MEM_WB_memout[9]), .S0(n3238), .Y(
        n3500) );
  NAND3XL U2831 ( .A(data_memory_dcache_ready_idx[0]), .B(
        data_memory_dcache_ready_idx[2]), .C(data_memory_dcache_ready_idx[1]), 
        .Y(n3654) );
  AOI2BB1XL U2832 ( .A0N(n3649), .A1N(n3648), .B0(n3647), .Y(n3734) );
  NOR4XL U2833 ( .A(n3646), .B(n4897), .C(n3860), .D(n4932), .Y(n3647) );
  INVXL U2834 ( .A(n3746), .Y(n3792) );
  NAND2XL U2835 ( .A(n3792), .B(n3791), .Y(n3808) );
  NAND2XL U2836 ( .A(n3847), .B(data_memory_dcache_headpc[9]), .Y(n3846) );
  OAI21X1 U2837 ( .A0(n4597), .A1(n3186), .B0(n3802), .Y(n3819) );
  INVXL U2838 ( .A(n3742), .Y(n3186) );
  INVXL U2839 ( .A(n3819), .Y(n4129) );
  NAND2XL U2840 ( .A(data_memory_dcache_dirty[3]), .B(
        data_memory_dcache_dirty[1]), .Y(n4589) );
  NAND2XL U2841 ( .A(n3183), .B(data_memory_dcache_dirty[3]), .Y(n4592) );
  OAI2BB1XL U2842 ( .A0N(n4097), .A1N(n4096), .B0(n4095), .Y(n4586) );
  AOI22XL U2843 ( .A0(DM_idx[10]), .A1(n4091), .B0(DM_idx[9]), .B1(n4063), .Y(
        n4097) );
  NOR2X1 U2844 ( .A(n4094), .B(n4093), .Y(n4095) );
  NAND2XL U2845 ( .A(n3220), .B(n3219), .Y(n4509) );
  NAND3XL U2846 ( .A(n4943), .B(cpube_ls[0]), .C(cpube_ls[1]), .Y(n3219) );
  NAND3XL U2847 ( .A(IF_PC[0]), .B(IF_PC[1]), .C(IF_PC[2]), .Y(n4317) );
  NAND2XL U2848 ( .A(n4365), .B(n4360), .Y(n3210) );
  BUFX4 U2849 ( .A(IF_DEC_instr[10]), .Y(n4149) );
  AND2XL U2850 ( .A(n3622), .B(n3621), .Y(n4366) );
  NAND3XL U2851 ( .A(instruction_memory_icache_ready_idx[0]), .B(
        instruction_memory_icache_ready_idx[1]), .C(
        instruction_memory_icache_ready_idx[2]), .Y(n3714) );
  INVXL U2852 ( .A(n3714), .Y(n3690) );
  AOI2BB1XL U2853 ( .A0N(n3690), .A1N(instruction_memory_N222), .B0(n4278), 
        .Y(n3718) );
  NOR2X1 U2854 ( .A(n3689), .B(n4275), .Y(n4274) );
  NAND2XL U2855 ( .A(n3690), .B(n3637), .Y(n4275) );
  AND2XL U2856 ( .A(instruction_memory_icache_ready_idx[4]), .B(
        instruction_memory_icache_ready_idx[3]), .Y(n3637) );
  AND2XL U2857 ( .A(n2023), .B(instruction_memory_icache_ready_idx[5]), .Y(
        n4276) );
  NOR3XL U2858 ( .A(n3192), .B(instruction_memory_icache_cs[1]), .C(n3191), 
        .Y(n4799) );
  NAND2XL U2859 ( .A(n3130), .B(instruction_memory_icache_cs[1]), .Y(n3193) );
  NAND2XL U2860 ( .A(instruction_memory_icache_cs[0]), .B(rlast_m_inf[1]), .Y(
        n3130) );
  NAND2XL U2861 ( .A(n2990), .B(instruction_memory_instmem_cs[2]), .Y(n2956)
         );
  AND2XL U2862 ( .A(n3102), .B(cpube_cs[2]), .Y(n3630) );
  NAND2XL U2863 ( .A(n2953), .B(n3110), .Y(n3632) );
  OAI2BB1X1 U2864 ( .A0N(n4123), .A1N(n4122), .B0(n4121), .Y(n4583) );
  AOI22XL U2865 ( .A0(DM_idx[10]), .A1(n4117), .B0(DM_idx[9]), .B1(n4101), .Y(
        n4123) );
  OAI2BB1XL U2866 ( .A0N(n4579), .A1N(n4578), .B0(n4577), .Y(n4582) );
  NOR2X1 U2867 ( .A(n4576), .B(n4575), .Y(n4577) );
  NAND2X1 U2868 ( .A(n3650), .B(n3816), .Y(n3736) );
  AOI2BB1XL U2869 ( .A0N(n3816), .A1N(n3652), .B0(n4588), .Y(n3794) );
  AOI2BB2X1 U2870 ( .B0(data_memory_dcache_headpc[5]), .B1(n4559), .A0N(n3872), 
        .A1N(n2054), .Y(n3859) );
  NAND2XL U2871 ( .A(n4516), .B(data_memory_dcache_headpc[6]), .Y(n3857) );
  NAND2XL U2872 ( .A(n2120), .B(DM_idx[6]), .Y(n3856) );
  OAI22X1 U2873 ( .A0(n3865), .A1(n2053), .B0(C303_DATA2_4), .B1(n4408), .Y(
        n3872) );
  INVXL U2874 ( .A(n2052), .Y(n3865) );
  INVXL U2875 ( .A(n4820), .Y(n3880) );
  INVXL U2876 ( .A(C303_DATA2_0), .Y(n4816) );
  AND2XL U2877 ( .A(n2023), .B(instruction_memory_icache_ready_idx[0]), .Y(
        n4270) );
  INVXL U2878 ( .A(n4363), .Y(n4368) );
  MXI2XL U2879 ( .A(n4876), .B(n2032), .S0(n4548), .Y(n1344) );
  NAND2XL U2880 ( .A(n2094), .B(n2093), .Y(data_memory_datamem_ns[1]) );
  OAI2BB1XL U2881 ( .A0N(n4588), .A1N(data_memory_datamem_js[1]), .B0(n2085), 
        .Y(n2092) );
  OAI2BB1XL U2882 ( .A0N(wready_m_inf_0_), .A1N(n2993), .B0(n2084), .Y(n2085)
         );
  NAND2XL U2883 ( .A(n2078), .B(awready_m_inf_0_), .Y(n2079) );
  NAND2XL U2884 ( .A(n2074), .B(n2097), .Y(n2081) );
  NAND4X1 U2885 ( .A(n3632), .B(n3625), .C(n2961), .D(n3844), .Y(cpube_ns[2])
         );
  OAI2BB1XL U2886 ( .A0N(n4335), .A1N(n4308), .B0(n4307), .Y(n1332) );
  AOI22XL U2887 ( .A0(n4612), .A1(IF_DEC_instr[5]), .B0(EXE_MEM_PCnxt[4]), 
        .B1(n4865), .Y(n4307) );
  XNOR2XL U2888 ( .A(n4306), .B(n4305), .Y(n4308) );
  NAND2XL U2889 ( .A(n4304), .B(n4303), .Y(n4305) );
  AOI22XL U2890 ( .A0(n4612), .A1(IF_DEC_instr[7]), .B0(EXE_MEM_PCnxt[6]), 
        .B1(n4865), .Y(n2920) );
  NAND2XL U2891 ( .A(n2916), .B(n3011), .Y(n2917) );
  OAI2BB1XL U2892 ( .A0N(n4335), .A1N(n4334), .B0(n4333), .Y(n1336) );
  AOI22XL U2893 ( .A0(n4612), .A1(n4332), .B0(EXE_MEM_PCnxt[8]), .B1(n4865), 
        .Y(n4333) );
  NAND2XL U2894 ( .A(n4330), .B(n4329), .Y(n4331) );
  AOI22XL U2895 ( .A0(n4612), .A1(n3048), .B0(EXE_MEM_PCnxt[10]), .B1(n4865), 
        .Y(n3049) );
  NAND2XL U2896 ( .A(n3045), .B(n3044), .Y(n3046) );
  MXI2XL U2897 ( .A(n4550), .B(n4549), .S0(n4548), .Y(n1340) );
  MXI2XL U2898 ( .A(n4880), .B(n4261), .S0(n4548), .Y(n1349) );
  OAI31XL U2899 ( .A0(n3237), .A1(data_memory_lookup_pc[0]), .A2(n4548), .B0(
        n3236), .Y(n1350) );
  OAI2BB1XL U2900 ( .A0N(DM_data[6]), .A1N(n4871), .B0(n4859), .Y(n1438) );
  OAI2BB1XL U2901 ( .A0N(DM_data[8]), .A1N(n4871), .B0(n4864), .Y(n1436) );
  OAI211XL U2902 ( .A0(n3660), .A1(n3659), .B0(n3794), .C0(n3658), .Y(n1782)
         );
  NAND3XL U2903 ( .A(n3736), .B(n3657), .C(n3659), .Y(n3658) );
  OAI211XL U2904 ( .A0(n3728), .A1(n3725), .B0(n3794), .C0(n3724), .Y(n1784)
         );
  NAND3XL U2905 ( .A(n3736), .B(data_memory_dcache_ready_idx[0]), .C(n3725), 
        .Y(n3724) );
  NAND3XL U2906 ( .A(n4399), .B(n4372), .C(n4389), .Y(n4326) );
  OAI2BB1XL U2907 ( .A0N(IF_PC[9]), .A1N(n4401), .B0(n4375), .Y(n1774) );
  OAI211XL U2908 ( .A0(n3633), .A1(n3624), .B0(n3100), .C0(n3099), .Y(
        cpube_ns[0]) );
  AOI211XL U2909 ( .A0(n3624), .A1(n3098), .B0(n3097), .C0(n3096), .Y(n3099)
         );
  MXI2XL U2910 ( .A(n3088), .B(n3087), .S0(cpube_cs[0]), .Y(n3100) );
  OAI211XL U2911 ( .A0(n4595), .A1(data_memory_N847), .B0(n3800), .C0(n3799), 
        .Y(n1780) );
  NAND2XL U2912 ( .A(n3798), .B(data_memory_dcache_ready_idx[5]), .Y(n3799) );
  AOI31XL U2913 ( .A0(n4948), .A1(data_memory_writeback_type[1]), .A2(n4814), 
        .B0(n3797), .Y(n3800) );
  OAI31XL U2914 ( .A0(n3796), .A1(data_memory_dcache_ready_idx[5]), .A2(n3795), 
        .B0(n3794), .Y(n3797) );
  OAI2BB1XL U2915 ( .A0N(IF_PC[1]), .A1N(n3213), .B0(n3139), .Y(n3140) );
  NAND4XL U2916 ( .A(n2549), .B(n2548), .C(n2547), .D(n2546), .Y(n2550) );
  NAND4XL U2917 ( .A(n2545), .B(n2544), .C(n2543), .D(n2542), .Y(n2551) );
  OAI2BB1X1 U2918 ( .A0N(core_r7[5]), .A1N(n2847), .B0(n2553), .Y(n2554) );
  OAI2BB1XL U2919 ( .A0N(core_r6[5]), .A1N(n2845), .B0(n2552), .Y(n2555) );
  OAI21XL U2920 ( .A0(instruction_memory_icache_headpc[4]), .A1(n4384), .B0(
        n3144), .Y(n3146) );
  OAI22XL U2921 ( .A0(n3143), .A1(n3142), .B0(IF_PC[3]), .B1(n3887), .Y(n3144)
         );
  AOI2BB2XL U2922 ( .B0(n3141), .B1(instruction_memory_icache_headpc[2]), 
        .A0N(IF_PC[2]), .A1N(n3140), .Y(n3143) );
  AOI2BB2XL U2923 ( .B0(n4797), .B1(instruction_memory_icache_headpc[5]), 
        .A0N(n3883), .A1N(IF_PC[4]), .Y(n3145) );
  OAI21X1 U2924 ( .A0(n2140), .A1(n2143), .B0(n2141), .Y(n2131) );
  XNOR2XL U2925 ( .A(n4737), .B(n4158), .Y(n4184) );
  XNOR2XL U2926 ( .A(n4730), .B(n4169), .Y(n4196) );
  XNOR2XL U2927 ( .A(n4730), .B(n4621), .Y(n4170) );
  XNOR2XL U2928 ( .A(n4693), .B(n4158), .Y(n4024) );
  XNOR2XL U2929 ( .A(n4693), .B(n4169), .Y(n3995) );
  XNOR2XL U2930 ( .A(n4743), .B(n4730), .Y(n3940) );
  XNOR2XL U2931 ( .A(n4737), .B(n4698), .Y(n3988) );
  AOI22XL U2932 ( .A0(n2837), .A1(core_r0[3]), .B0(n2838), .B1(core_r2[3]), 
        .Y(n2618) );
  AOI22XL U2933 ( .A0(n2861), .A1(core_r13[3]), .B0(n2746), .B1(core_r15[3]), 
        .Y(n2619) );
  OAI2BB1XL U2934 ( .A0N(core_r6[1]), .A1N(n2845), .B0(n2753), .Y(n2756) );
  NAND2XL U2935 ( .A(n2844), .B(core_r5[1]), .Y(n2754) );
  NAND4XL U2936 ( .A(n2745), .B(n2744), .C(n2743), .D(n2742), .Y(n2752) );
  NAND4XL U2937 ( .A(n2750), .B(n2749), .C(n2748), .D(n2747), .Y(n2751) );
  NAND4X1 U2938 ( .A(n2703), .B(n2702), .C(n2701), .D(n2700), .Y(n4466) );
  NOR2X1 U2939 ( .A(n2695), .B(n2694), .Y(n2703) );
  NAND4X1 U2940 ( .A(n2522), .B(n2521), .C(n2520), .D(n2519), .Y(n3765) );
  NOR2X1 U2941 ( .A(n2514), .B(n2513), .Y(n2522) );
  NAND4XL U2942 ( .A(n2456), .B(n2455), .C(n2454), .D(n2453), .Y(n2457) );
  NOR2X1 U2943 ( .A(n1803), .B(n4621), .Y(n4473) );
  NOR2X1 U2944 ( .A(n3569), .B(n3573), .Y(n3580) );
  NAND2XL U2945 ( .A(instruction_memory_icache_headpc[7]), .B(
        instruction_memory_icache_headpc[8]), .Y(n3154) );
  INVXL U2946 ( .A(n3154), .Y(n3155) );
  NOR3XL U2947 ( .A(C303_DATA2_2), .B(C303_DATA2_1), .C(C303_DATA2_0), .Y(
        n4069) );
  OR2XL U2948 ( .A(C303_DATA2_4), .B(n4098), .Y(n4557) );
  NAND2XL U2949 ( .A(n2032), .B(data_memory_lookup_pc[5]), .Y(n2118) );
  NAND2XL U2950 ( .A(n4545), .B(data_memory_lookup_pc[3]), .Y(n2133) );
  INVXL U2951 ( .A(n2131), .Y(n2153) );
  AOI22XL U2952 ( .A0(n2055), .A1(n3856), .B0(data_memory_dcache_headpc[7]), 
        .B1(n4518), .Y(n2058) );
  NAND2XL U2953 ( .A(n3859), .B(n3857), .Y(n2055) );
  OAI22XL U2954 ( .A0(data_memory_dcache_headpc[8]), .A1(n4520), .B0(n4518), 
        .B1(data_memory_dcache_headpc[7]), .Y(n2057) );
  XNOR2XL U2955 ( .A(n4738), .B(n4693), .Y(n4627) );
  XNOR2XL U2956 ( .A(n4737), .B(n4634), .Y(n4741) );
  OAI22XL U2957 ( .A0(n4714), .A1(n4227), .B0(n4712), .B1(n4624), .Y(n4617) );
  ADDFHX1 U2958 ( .A(n4231), .B(n4230), .CI(n4229), .CO(n4628), .S(n4234) );
  INVXL U2959 ( .A(n4475), .Y(n4480) );
  NOR2X1 U2960 ( .A(n3924), .B(n4158), .Y(n4483) );
  OAI2BB1XL U2961 ( .A0N(core_r6[11]), .A1N(n2845), .B0(n2790), .Y(n2793) );
  NAND4XL U2962 ( .A(n2787), .B(n2786), .C(n2785), .D(n2784), .Y(n2788) );
  NAND2XL U2963 ( .A(n2746), .B(core_r15[11]), .Y(n2784) );
  NAND4XL U2964 ( .A(n2783), .B(n2782), .C(n2781), .D(n2780), .Y(n2789) );
  INVXL U2965 ( .A(n2017), .Y(n4172) );
  XNOR2XL U2966 ( .A(n4698), .B(n4710), .Y(n4194) );
  OAI22X1 U2967 ( .A0(n4636), .A1(n4159), .B0(n4740), .B1(n4184), .Y(n4180) );
  OAI22XL U2968 ( .A0(n4639), .A1(n3985), .B0(n4032), .B1(n4732), .Y(n4034) );
  XNOR2XL U2969 ( .A(n4743), .B(n4710), .Y(n3991) );
  INVXL U2970 ( .A(n3936), .Y(n3924) );
  XNOR2XL U2971 ( .A(n4693), .B(n4621), .Y(n3932) );
  INVXL U2972 ( .A(n3980), .Y(n3005) );
  NAND4XL U2973 ( .A(n2494), .B(n2493), .C(n2492), .D(n2491), .Y(n2495) );
  NAND4XL U2974 ( .A(n2490), .B(n2489), .C(n2488), .D(n2487), .Y(n2496) );
  NOR2X1 U2975 ( .A(n2500), .B(n2499), .Y(n2503) );
  OAI2BB1XL U2976 ( .A0N(core_r7[0]), .A1N(n2847), .B0(n2498), .Y(n2499) );
  OAI2BB1XL U2977 ( .A0N(core_r6[0]), .A1N(n2845), .B0(n2497), .Y(n2500) );
  NAND4BXL U2978 ( .AN(n4485), .B(n4503), .C(n4486), .D(n2468), .Y(n2646) );
  XOR2XL U2979 ( .A(n2467), .B(n4474), .Y(n2468) );
  XOR2XL U2980 ( .A(n4829), .B(n2017), .Y(n2872) );
  NOR4BXL U2981 ( .AN(n4493), .B(n4488), .C(n2683), .D(n4483), .Y(n2685) );
  INVXL U2982 ( .A(n4482), .Y(n2683) );
  OAI21XL U2983 ( .A0(instruction_memory_icache_headpc[7]), .A1(
        instruction_memory_icache_headpc[8]), .B0(n3154), .Y(n3153) );
  OAI21XL U2984 ( .A0(n3155), .A1(instruction_memory_icache_headpc[9]), .B0(
        n3161), .Y(n3157) );
  NAND2XL U2985 ( .A(n3150), .B(n4389), .Y(n3165) );
  NAND2XL U2986 ( .A(n3151), .B(IF_PC[7]), .Y(n3166) );
  XNOR2XL U2987 ( .A(n2145), .B(n3725), .Y(n2148) );
  XOR2XL U2988 ( .A(n2144), .B(n2143), .Y(n2145) );
  NAND2XL U2989 ( .A(n2142), .B(n2141), .Y(n2144) );
  XNOR2XL U2990 ( .A(n2146), .B(n4819), .Y(n2147) );
  XOR2XL U2991 ( .A(n2130), .B(n3866), .Y(n2139) );
  XNOR2XL U2992 ( .A(n2177), .B(n2129), .Y(n2130) );
  NAND2XL U2993 ( .A(n2128), .B(n2127), .Y(n2129) );
  XOR2XL U2994 ( .A(n2137), .B(n3659), .Y(n2138) );
  XNOR2XL U2995 ( .A(n2136), .B(n2135), .Y(n2137) );
  NAND2XL U2996 ( .A(n2134), .B(n2133), .Y(n2135) );
  OAI21X1 U2997 ( .A0(n2153), .A1(n2149), .B0(n2150), .Y(n2136) );
  XOR2XL U2998 ( .A(n2154), .B(n3869), .Y(n2155) );
  XOR2XL U2999 ( .A(n2153), .B(n2152), .Y(n2154) );
  NAND2XL U3000 ( .A(n2151), .B(n2150), .Y(n2152) );
  INVXL U3001 ( .A(n2149), .Y(n2151) );
  OR2XL U3002 ( .A(n4528), .B(data_memory_lookup_pc[8]), .Y(n2168) );
  NAND2XL U3003 ( .A(n2178), .B(n2179), .Y(n2180) );
  XOR2XL U3004 ( .A(n2190), .B(n2169), .Y(n2182) );
  NAND2XL U3005 ( .A(n2168), .B(n2185), .Y(n2169) );
  NAND2XL U3006 ( .A(n2161), .B(n2186), .Y(n2162) );
  OR2XL U3007 ( .A(n4525), .B(data_memory_lookup_pc[9]), .Y(n2161) );
  NAND2BXL U3008 ( .AN(n2042), .B(DM_idx[8]), .Y(n2045) );
  OAI211XL U3009 ( .A0(data_memory_dcache_headpc[9]), .A1(n2043), .B0(n2060), 
        .C0(n2059), .Y(n2065) );
  NAND2XL U3010 ( .A(n4261), .B(DM_idx[10]), .Y(n2059) );
  OAI21XL U3011 ( .A0(n2058), .A1(n2057), .B0(n2056), .Y(n2060) );
  AOI2BB2XL U3012 ( .B0(n2043), .B1(data_memory_dcache_headpc[9]), .A0N(n4528), 
        .A1N(DM_idx[8]), .Y(n2056) );
  NAND4XL U3013 ( .A(n2063), .B(n2062), .C(n2061), .D(n3659), .Y(n2064) );
  NAND2XL U3014 ( .A(n4246), .B(n4778), .Y(n4249) );
  MXI2XL U3015 ( .A(n4777), .B(n4776), .S0(n4626), .Y(n4246) );
  ADDFX2 U3016 ( .A(n4736), .B(n4735), .CI(n4734), .CO(n4751), .S(n4754) );
  NOR2BXL U3017 ( .AN(n4743), .B(n4745), .Y(n4736) );
  OAI22XL U3018 ( .A0(n4702), .A1(n4701), .B0(n4700), .B1(n4699), .Y(n4703) );
  OAI22XL U3019 ( .A0(n4210), .A1(n4696), .B0(n4695), .B1(n4694), .Y(n4704) );
  OAI22XL U3020 ( .A0(n4714), .A1(n4713), .B0(n4712), .B1(n4711), .Y(n4721) );
  ADDFHX1 U3021 ( .A(n4630), .B(n4629), .CI(n4628), .CO(n4763), .S(n4649) );
  NAND2XL U3022 ( .A(n4648), .B(n4647), .Y(n4681) );
  NAND2XL U3023 ( .A(n4644), .B(n4643), .Y(n4648) );
  NAND2XL U3024 ( .A(n4251), .B(n4778), .Y(n4253) );
  MXI2XL U3025 ( .A(n4777), .B(n4776), .S0(n4692), .Y(n4251) );
  NOR2X1 U3026 ( .A(n2295), .B(n2294), .Y(n2303) );
  NOR2X1 U3027 ( .A(n2770), .B(n2769), .Y(n2779) );
  NOR2X1 U3028 ( .A(n2674), .B(n2673), .Y(n2682) );
  OAI2BB1XL U3029 ( .A0N(core_r14[1]), .A1N(n2827), .B0(n2734), .Y(n2735) );
  NOR2X1 U3030 ( .A(n2638), .B(n2637), .Y(n2641) );
  NOR2X2 U3031 ( .A(n2240), .B(n2229), .Y(n2807) );
  OAI2BB1XL U3032 ( .A0N(core_r14[7]), .A1N(n2827), .B0(n2589), .Y(n2590) );
  NAND4XL U3033 ( .A(n2357), .B(n2356), .C(n2355), .D(n2354), .Y(n4687) );
  NOR2X1 U3034 ( .A(n2349), .B(n2348), .Y(n2357) );
  AOI22XL U3035 ( .A0(n2614), .A1(core_r1[14]), .B0(n2839), .B1(core_r3[14]), 
        .Y(n2355) );
  NAND4XL U3036 ( .A(n2393), .B(n2392), .C(n2391), .D(n2390), .Y(n4780) );
  NOR2X1 U3037 ( .A(n2385), .B(n2384), .Y(n2393) );
  NAND2XL U3038 ( .A(n4243), .B(n4778), .Y(n4245) );
  MXI2XL U3039 ( .A(n4777), .B(n4776), .S0(n4738), .Y(n4243) );
  ADDFHX1 U3040 ( .A(n4193), .B(n4192), .CI(n4191), .CO(n4218), .S(n4199) );
  OAI22XL U3041 ( .A0(n4719), .A1(n4156), .B0(n4179), .B1(n4716), .Y(n4192) );
  XNOR2XL U3042 ( .A(n2017), .B(n4743), .Y(n4156) );
  MXI2XL U3043 ( .A(n3984), .B(n4376), .S0(n2884), .Y(n3968) );
  OR2XL U3044 ( .A(n4008), .B(n4011), .Y(n4006) );
  INVXL U3045 ( .A(n4008), .Y(n4010) );
  NAND2XL U3046 ( .A(n3925), .B(n4778), .Y(n3926) );
  MXI2XL U3047 ( .A(n4777), .B(n4776), .S0(n4158), .Y(n3925) );
  MXI2XL U3048 ( .A(n3924), .B(n4388), .S0(n2884), .Y(n3927) );
  OAI22XL U3049 ( .A0(n4742), .A1(n3760), .B0(n4740), .B1(n3767), .Y(n3902) );
  MXI2XL U3050 ( .A(n3760), .B(n4385), .S0(n4781), .Y(n3762) );
  NOR2BXL U3051 ( .AN(n4743), .B(n4740), .Y(n3773) );
  OAI22XL U3052 ( .A0(n4620), .A1(n3701), .B0(n3770), .B1(n4707), .Y(n3772) );
  ADDHXL U3053 ( .A(n3704), .B(n3703), .CO(n3705), .S(n3678) );
  OAI22XL U3054 ( .A0(n4620), .A1(n3672), .B0(n3701), .B1(n4707), .Y(n3704) );
  OAI22XL U3055 ( .A0(n4210), .A1(n3676), .B0(n4695), .B1(n3702), .Y(n3677) );
  NOR2BXL U3056 ( .AN(n4743), .B(n4695), .Y(n3062) );
  BUFX8 U3057 ( .A(n4182), .Y(n4706) );
  MXI2XL U3058 ( .A(n4462), .B(n4377), .S0(n4781), .Y(n3054) );
  MXI2XL U3059 ( .A(n3675), .B(n4381), .S0(n4781), .Y(n3669) );
  MXI2XL U3060 ( .A(n4777), .B(n4776), .S0(n4621), .Y(n2904) );
  MXI2XL U3061 ( .A(n1803), .B(n4383), .S0(n4781), .Y(n3696) );
  OAI2BB1XL U3062 ( .A0N(n4781), .A1N(IF_DEC_PC[6]), .B0(n2912), .Y(n3889) );
  MXI2XL U3063 ( .A(n3005), .B(n4390), .S0(n2884), .Y(n3961) );
  NAND4X1 U3064 ( .A(n2504), .B(n2503), .C(n2502), .D(n2501), .Y(n3060) );
  AOI22XL U3065 ( .A0(n2614), .A1(core_r1[0]), .B0(n2839), .B1(core_r3[0]), 
        .Y(n2502) );
  NOR2X1 U3066 ( .A(n2496), .B(n2495), .Y(n2504) );
  AOI22XL U3067 ( .A0(n2837), .A1(core_r0[0]), .B0(n2838), .B1(core_r2[0]), 
        .Y(n2501) );
  XOR2XL U3068 ( .A(IF_DEC_PC[1]), .B(EXE_MEM_PCnxt[1]), .Y(n2969) );
  XOR2XL U3069 ( .A(IF_DEC_PC[2]), .B(EXE_MEM_PCnxt[2]), .Y(n2972) );
  NAND4XL U3070 ( .A(n2966), .B(n2965), .C(n2964), .D(n2963), .Y(n2977) );
  OAI211XL U3071 ( .A0(instruction_memory_icache_headpc[8]), .A1(n4391), .B0(
        n3167), .C0(n3166), .Y(n3169) );
  NAND2XL U3072 ( .A(n3165), .B(n3587), .Y(n3167) );
  NAND2XL U3073 ( .A(n4391), .B(instruction_memory_icache_headpc[8]), .Y(n3168) );
  NAND4XL U3074 ( .A(n3172), .B(n3171), .C(n3170), .D(n3692), .Y(n3173) );
  NAND2XL U3075 ( .A(n2981), .B(n4944), .Y(n2983) );
  NAND2XL U3076 ( .A(n2980), .B(n3094), .Y(n2981) );
  NAND2XL U3077 ( .A(n3103), .B(n3085), .Y(n2980) );
  NAND2XL U3078 ( .A(cpube_cs[1]), .B(cpube_cs[2]), .Y(n2957) );
  XOR2XL U3079 ( .A(data_memory_dcache_headpc[5]), .B(n4107), .Y(n4108) );
  NAND2BXL U3080 ( .AN(data_memory_dcache_headpc[5]), .B(n4107), .Y(n4105) );
  INVXL U3081 ( .A(n2185), .Y(n2188) );
  NAND2XL U3082 ( .A(n2192), .B(n2191), .Y(n2193) );
  NAND2XL U3083 ( .A(n4261), .B(data_memory_lookup_pc[10]), .Y(n2191) );
  OR2XL U3084 ( .A(n4261), .B(data_memory_lookup_pc[10]), .Y(n2192) );
  XNOR2X1 U3085 ( .A(n2124), .B(n3862), .Y(n2125) );
  XNOR2X1 U3086 ( .A(n2116), .B(n2115), .Y(n2126) );
  NAND2XL U3087 ( .A(n2156), .B(n2155), .Y(n2157) );
  NAND2XL U3088 ( .A(n2139), .B(n2138), .Y(n2158) );
  XOR2XL U3089 ( .A(n2163), .B(n2162), .Y(n2184) );
  INVXL U3090 ( .A(n2168), .Y(n2163) );
  OAI2BB1XL U3091 ( .A0N(n4545), .A1N(DM_idx[3]), .B0(C303_DATA2_2), .Y(n2028)
         );
  NOR2X1 U3092 ( .A(n3215), .B(instruction_memory_lookup_pc[2]), .Y(n3113) );
  AOI22XL U3093 ( .A0(n2816), .A1(core_r6[8]), .B0(n2818), .B1(core_r2[8]), 
        .Y(n2410) );
  NOR2X1 U3094 ( .A(n4253), .B(n4252), .Y(n4658) );
  NAND4X1 U3095 ( .A(n2486), .B(n2485), .C(n2484), .D(n2483), .Y(n3982) );
  AOI22XL U3096 ( .A0(n2775), .A1(core_r0[0]), .B0(n2248), .B1(core_r4[0]), 
        .Y(n2483) );
  NOR2X1 U3097 ( .A(n2482), .B(n2481), .Y(n2485) );
  NAND4XL U3098 ( .A(n2339), .B(n2338), .C(n2337), .D(n2336), .Y(n4660) );
  AOI22XL U3099 ( .A0(n2816), .A1(core_r6[14]), .B0(n2818), .B1(core_r2[14]), 
        .Y(n2337) );
  NAND4XL U3100 ( .A(n2375), .B(n2374), .C(n2373), .D(n2372), .Y(n4775) );
  NOR2X1 U3101 ( .A(n2371), .B(n2370), .Y(n2374) );
  NOR2X1 U3102 ( .A(n2718), .B(n2717), .Y(n2721) );
  NAND4X2 U3103 ( .A(n2642), .B(n2641), .C(n2640), .D(n2639), .Y(n4698) );
  AOI22XL U3104 ( .A0(n2816), .A1(core_r6[3]), .B0(n2818), .B1(core_r2[3]), 
        .Y(n2640) );
  AOI22XL U3105 ( .A0(n2775), .A1(core_r0[3]), .B0(n2248), .B1(core_r4[3]), 
        .Y(n2639) );
  NAND4X2 U3106 ( .A(n2541), .B(n2540), .C(n2539), .D(n2538), .Y(n4621) );
  AOI22XL U3107 ( .A0(n2816), .A1(core_r6[4]), .B0(n2818), .B1(core_r2[4]), 
        .Y(n2539) );
  AOI22XL U3108 ( .A0(n2775), .A1(core_r0[4]), .B0(n2248), .B1(core_r4[4]), 
        .Y(n2538) );
  NOR2X1 U3109 ( .A(n2533), .B(n2532), .Y(n2541) );
  AOI22XL U3110 ( .A0(n2775), .A1(core_r0[6]), .B0(n2248), .B1(core_r4[6]), 
        .Y(n2445) );
  NAND4X1 U3111 ( .A(n2252), .B(n2251), .C(n2250), .D(n2249), .Y(n4729) );
  AOI22XL U3112 ( .A0(n2816), .A1(core_r6[9]), .B0(n2818), .B1(core_r2[9]), 
        .Y(n2250) );
  NOR2X1 U3113 ( .A(n2243), .B(n2242), .Y(n2251) );
  AOI2BB1XL U3114 ( .A0N(n4838), .A1N(n4687), .B0(n2394), .Y(n4503) );
  INVXL U3115 ( .A(n4499), .Y(n2394) );
  OAI21X1 U3116 ( .A0(n4697), .A1(n4835), .B0(n4494), .Y(n4496) );
  OAI2BB1XL U3117 ( .A0N(n4829), .A1N(n2017), .B0(n4490), .Y(n4492) );
  NAND2XL U3118 ( .A(n4835), .B(n4697), .Y(n4495) );
  NOR2X1 U3119 ( .A(n2903), .B(n4777), .Y(n4776) );
  NAND2XL U3120 ( .A(n3970), .B(n3969), .Y(n4239) );
  INVXL U3121 ( .A(n4055), .Y(n4135) );
  INVX2 U3122 ( .A(n4007), .Y(n4139) );
  NOR2X1 U3123 ( .A(n4019), .B(n4018), .Y(n4007) );
  NOR2X1 U3124 ( .A(n3890), .B(n3889), .Y(n3917) );
  NOR2BXL U3125 ( .AN(IF_DEC_instr[14]), .B(IF_DEC_instr[15]), .Y(n2959) );
  AND2XL U3126 ( .A(n3038), .B(n3055), .Y(n2887) );
  ADDHXL U3127 ( .A(n3041), .B(IF_DEC_PC[5]), .CO(n2915), .S(n2910) );
  NOR2X1 U3128 ( .A(n2915), .B(n2914), .Y(n3008) );
  XOR2XL U3129 ( .A(n3040), .B(n3039), .Y(n3043) );
  AND2XL U3130 ( .A(n3038), .B(n3969), .Y(n3039) );
  NAND2XL U3131 ( .A(n2954), .B(n4414), .Y(n2919) );
  NAND2X1 U3132 ( .A(n2944), .B(data_memory_lookup_wen), .Y(n3817) );
  NAND3BXL U3133 ( .AN(data_memory_writeback_count[2]), .B(n3854), .C(n4607), 
        .Y(n3740) );
  INVXL U3134 ( .A(n3855), .Y(n3745) );
  OAI21X1 U3135 ( .A0(n4518), .A1(n4086), .B0(n4085), .Y(n4087) );
  OR2X1 U3136 ( .A(n4084), .B(n4083), .Y(n4085) );
  INVXL U3137 ( .A(n4065), .Y(n4088) );
  OAI22XL U3138 ( .A0(DM_idx[9]), .A1(n4092), .B0(n4091), .B1(DM_idx[10]), .Y(
        n4093) );
  OAI2BB1XL U3139 ( .A0N(n4091), .A1N(DM_idx[10]), .B0(n4090), .Y(n4092) );
  INVXL U3140 ( .A(n4061), .Y(n4091) );
  NAND4BXL U3141 ( .AN(n2977), .B(n2976), .C(n2975), .D(n2974), .Y(n3093) );
  NOR2X1 U3142 ( .A(n2973), .B(n2972), .Y(n2974) );
  NOR2X1 U3143 ( .A(n2971), .B(n2970), .Y(n2975) );
  NOR3XL U3144 ( .A(n2969), .B(n2968), .C(n2967), .Y(n2976) );
  NAND2XL U3145 ( .A(n3604), .B(n3603), .Y(n3610) );
  XOR2XL U3146 ( .A(n3615), .B(n3602), .Y(n3603) );
  NOR2X1 U3147 ( .A(n3591), .B(n3590), .Y(n3604) );
  XOR2XL U3148 ( .A(n3608), .B(n3607), .Y(n3609) );
  OAI22XL U3149 ( .A0(n3162), .A1(n4402), .B0(n3164), .B1(
        instruction_memory_icache_headpc[10]), .Y(n3179) );
  AOI2BB2XL U3150 ( .B0(instruction_memory_icache_headpc[10]), .B1(n3164), 
        .A0N(n3163), .A1N(IF_PC[10]), .Y(n3178) );
  AOI21XL U3151 ( .A0(n3176), .A1(n3175), .B0(n3174), .Y(n3177) );
  OAI2BB1XL U3152 ( .A0N(instruction_memory_icache_headpc[10]), .A1N(n4402), 
        .B0(n3173), .Y(n3174) );
  AOI2BB2XL U3153 ( .B0(n3732), .B1(IF_PC[9]), .A0N(
        instruction_memory_icache_headpc[10]), .A1N(n4402), .Y(n3175) );
  OAI211XL U3154 ( .A0(IF_PC[9]), .A1(n3732), .B0(n3169), .C0(n3168), .Y(n3176) );
  OAI21X1 U3155 ( .A0(n2994), .A1(n2947), .B0(n2946), .Y(n2950) );
  OAI22XL U3156 ( .A0(DM_idx[9]), .A1(n4118), .B0(n4117), .B1(DM_idx[10]), .Y(
        n4119) );
  OAI2BB1XL U3157 ( .A0N(n4117), .A1N(DM_idx[10]), .B0(n4116), .Y(n4118) );
  INVXL U3158 ( .A(n4099), .Y(n4117) );
  NAND2BXL U3159 ( .AN(n4564), .B(n4516), .Y(n4565) );
  OAI2BB1XL U3160 ( .A0N(n4573), .A1N(DM_idx[10]), .B0(n4572), .Y(n4574) );
  INVXL U3161 ( .A(n4551), .Y(n4573) );
  OAI211XL U3162 ( .A0(data_memory_lookup_pc[3]), .A1(n4544), .B0(n4543), .C0(
        n4542), .Y(n4875) );
  AND2XL U3163 ( .A(n4541), .B(data_memory_lookup_pc[2]), .Y(n4544) );
  INVXL U3164 ( .A(n4637), .Y(n4863) );
  NAND2XL U3165 ( .A(n4588), .B(n2077), .Y(n2088) );
  INVXL U3166 ( .A(n2076), .Y(n2077) );
  INVXL U3167 ( .A(n3107), .Y(n2078) );
  AOI21XL U3168 ( .A0(n2996), .A1(n2997), .B0(n4932), .Y(n3635) );
  NAND2XL U3169 ( .A(n4543), .B(n3231), .Y(n4535) );
  OAI211XL U3170 ( .A0(data_memory_lookup_pc[5]), .A1(n4539), .B0(n4543), .C0(
        n4538), .Y(n4876) );
  NAND2XL U3171 ( .A(n4543), .B(n3229), .Y(n4540) );
  XOR2XL U3172 ( .A(n4542), .B(n4536), .Y(n3229) );
  NAND2XL U3173 ( .A(n4543), .B(n3232), .Y(n4547) );
  INVXL U3174 ( .A(data_memory_dcache_headpc[9]), .Y(n4525) );
  NAND2XL U3175 ( .A(n4654), .B(n4674), .Y(n4655) );
  INVXL U3176 ( .A(n4676), .Y(n4654) );
  INVXL U3177 ( .A(n3982), .Y(n4821) );
  INVXL U3178 ( .A(n4634), .Y(n4826) );
  INVXL U3179 ( .A(n4738), .Y(n4829) );
  INVXL U3180 ( .A(n4692), .Y(n4835) );
  INVXL U3181 ( .A(n4660), .Y(n4838) );
  INVXL U3182 ( .A(n4775), .Y(n4841) );
  INVXL U3183 ( .A(n4698), .Y(n4849) );
  INVXL U3184 ( .A(n4621), .Y(n4852) );
  INVXL U3185 ( .A(n4729), .Y(n4866) );
  AND2XL U3186 ( .A(patcal[1]), .B(n4935), .Y(n4938) );
  INVXL U3187 ( .A(n3954), .Y(n3956) );
  OAI21X1 U3188 ( .A0(n4297), .A1(n4293), .B0(n4294), .Y(n3958) );
  OR2XL U3189 ( .A(n3043), .B(n3042), .Y(n3045) );
  NAND2XL U3190 ( .A(n3043), .B(n3042), .Y(n3044) );
  AOI2BB1XL U3191 ( .A0N(n3031), .A1N(n4329), .B0(n3030), .Y(n3032) );
  NAND2X2 U3192 ( .A(n3102), .B(n4944), .Y(n4865) );
  OAI211XL U3193 ( .A0(data_memory_lookup_pc[1]), .A1(data_memory_lookup_pc[0]), .B0(n4543), .C0(n3233), .Y(n4550) );
  INVXL U3194 ( .A(data_memory_dcache_headpc[7]), .Y(n4534) );
  INVXL U3195 ( .A(data_memory_dcache_headpc[8]), .Y(n4528) );
  OR2XL U3196 ( .A(n4527), .B(n4531), .Y(n4878) );
  INVXL U3197 ( .A(n3129), .Y(n2087) );
  INVXL U3198 ( .A(n4543), .Y(n3237) );
  NAND3BX1 U3199 ( .AN(data_memory_datamem_cs[1]), .B(n2997), .C(
        data_memory_datamem_cs[3]), .Y(n2075) );
  NOR3X1 U3200 ( .A(n3817), .B(n3816), .C(n3844), .Y(n3843) );
  NAND2XL U3201 ( .A(n3791), .B(n3202), .Y(n2993) );
  OAI2BB1XL U3202 ( .A0N(data_memory_dcache_dirty[0]), .A1N(n4598), .B0(n4589), 
        .Y(n3801) );
  INVXL U3203 ( .A(n3187), .Y(n3821) );
  NAND2XL U3204 ( .A(data_memory_dcache_headpc[7]), .B(n3821), .Y(n3820) );
  OR2XL U3205 ( .A(n4600), .B(n4597), .Y(n3825) );
  NAND2XL U3206 ( .A(n3825), .B(data_memory_dcache_headpc[5]), .Y(n3824) );
  NAND3BXL U3207 ( .AN(cpube_ls[0]), .B(cpube_ls[2]), .C(cpube_ls[1]), .Y(
        n3109) );
  OAI21X1 U3208 ( .A0(n4792), .A1(IF_PC[0]), .B0(n4373), .Y(n4289) );
  INVXL U3209 ( .A(n2987), .Y(n4262) );
  AND2XL U3210 ( .A(n3631), .B(n3083), .Y(n3088) );
  AOI31XL U3211 ( .A0(n3624), .A1(cpube_cs[2]), .A2(n3085), .B0(n3084), .Y(
        n3086) );
  OAI31XL U3212 ( .A0(n3093), .A1(n3092), .A2(n3207), .B0(n3626), .Y(n3097) );
  AND3XL U3213 ( .A(n4363), .B(instruction_memory_instmem_cs[1]), .C(
        instruction_memory_instmem_cs[0]), .Y(n4361) );
  INVXL U3214 ( .A(instruction_memory_icache_headpc[0]), .Y(n3813) );
  NAND2XL U3215 ( .A(n4349), .B(n4315), .Y(n4801) );
  OAI211XL U3216 ( .A0(instruction_memory_lookup_pc[1]), .A1(
        instruction_memory_lookup_pc[0]), .B0(n4349), .C0(n4344), .Y(n4802) );
  NAND2XL U3217 ( .A(n4349), .B(n4343), .Y(n4803) );
  XOR2XL U3218 ( .A(n4342), .B(n4344), .Y(n4343) );
  OAI211XL U3219 ( .A0(instruction_memory_lookup_pc[3]), .A1(n3886), .B0(n4349), .C0(n3885), .Y(n4804) );
  OAI211XL U3220 ( .A0(n3884), .A1(instruction_memory_lookup_pc[4]), .B0(n4349), .C0(n4345), .Y(n4805) );
  NAND2XL U3221 ( .A(n4349), .B(n4348), .Y(n4806) );
  OAI2BB1XL U3222 ( .A0N(instruction_memory_lookup_pc[5]), .A1N(n4347), .B0(
        n4346), .Y(n4348) );
  OAI21XL U3223 ( .A0(n4350), .A1(n3850), .B0(n4349), .Y(n4807) );
  AND2XL U3224 ( .A(n4346), .B(instruction_memory_lookup_pc[6]), .Y(n3850) );
  NAND2XL U3225 ( .A(n4353), .B(n4352), .Y(n4808) );
  OAI2BB1XL U3226 ( .A0N(instruction_memory_lookup_pc[7]), .A1N(n4351), .B0(
        n4355), .Y(n4352) );
  OR2XL U3227 ( .A(n4357), .B(n4356), .Y(n4809) );
  AOI21XL U3228 ( .A0(instruction_memory_lookup_pc[8]), .A1(n4355), .B0(n4354), 
        .Y(n4356) );
  NAND2XL U3229 ( .A(n4353), .B(n3731), .Y(n4810) );
  OAI2BB1XL U3230 ( .A0N(instruction_memory_lookup_pc[9]), .A1N(n3730), .B0(
        n4358), .Y(n3731) );
  NAND3XL U3231 ( .A(n4800), .B(instruction_memory_lookup_pc[10]), .C(n4358), 
        .Y(n4811) );
  NAND3XL U3232 ( .A(n3657), .B(data_memory_dcache_ready_idx[4]), .C(
        data_memory_dcache_ready_idx[3]), .Y(n3795) );
  OAI2BB1XL U3233 ( .A0N(n3795), .A1N(n3736), .B0(n3734), .Y(n3798) );
  OAI2BB1XL U3234 ( .A0N(data_memory_writeback_type[0]), .A1N(n4948), .B0(
        data_memory_N847), .Y(n3733) );
  NAND2XL U3235 ( .A(data_memory_datamem_cs[0]), .B(data_memory_datamem_cs[2]), 
        .Y(n4874) );
  AOI22XL U3236 ( .A0(n3599), .A1(n3572), .B0(
        instruction_memory_icache_headpc[4]), .B1(n4313), .Y(n3128) );
  XOR2XL U3237 ( .A(n3128), .B(n3127), .Y(n3566) );
  INVXL U3238 ( .A(n4276), .Y(n3638) );
  XOR2XL U3239 ( .A(n3599), .B(n3222), .Y(n3561) );
  AOI22XL U3240 ( .A0(n3224), .A1(n3223), .B0(
        instruction_memory_icache_headpc[2]), .B1(n4342), .Y(n3557) );
  XOR2XL U3241 ( .A(n3224), .B(n3216), .Y(n3552) );
  MXI2XL U3242 ( .A(n4875), .B(n4545), .S0(n4548), .Y(n1342) );
  OAI2BB1XL U3243 ( .A0N(araddr_m_inf[43]), .A1N(n4812), .B0(n4811), .Y(n1751)
         );
  MXI2XL U3244 ( .A(n4519), .B(n4518), .S0(DM_invalid), .Y(n1270) );
  OAI2BB1XL U3245 ( .A0N(EXE_MEM_PCnxt[1]), .A1N(n4796), .B0(n4291), .Y(n1772)
         );
  MXI2XL U3246 ( .A(n4290), .B(n4289), .S0(IF_PC[1]), .Y(n4291) );
  AND2XL U3247 ( .A(n4399), .B(IF_PC[0]), .Y(n4290) );
  MXI2XL U3248 ( .A(n4863), .B(n4947), .S0(n4865), .Y(n1264) );
  AOI211XL U3249 ( .A0(n3103), .A1(cpube_cs[0]), .B0(n3102), .C0(n4944), .Y(
        n3104) );
  NAND2XL U3250 ( .A(n3101), .B(cpube_ns[2]), .Y(n3105) );
  NAND2XL U3251 ( .A(n4948), .B(data_memory_writeback_type[2]), .Y(
        data_memory_N847) );
  OAI2BB1XL U3252 ( .A0N(n4814), .A1N(n4813), .B0(n4948), .Y(data_memory_N848)
         );
  MXI2XL U3253 ( .A(n4512), .B(n4511), .S0(DM_invalid), .Y(n1277) );
  MXI2XL U3254 ( .A(n4547), .B(n4546), .S0(n4548), .Y(n1341) );
  MXI2XL U3255 ( .A(n4540), .B(n2033), .S0(n4548), .Y(n1343) );
  MXI2XL U3256 ( .A(n4535), .B(n2120), .S0(n4548), .Y(n1345) );
  NAND3XL U3257 ( .A(n2071), .B(n2070), .C(n2069), .Y(n2072) );
  OAI2BB1XL U3258 ( .A0N(data_memory_datamem_cs[0]), .A1N(rlast_m_inf[0]), 
        .B0(n2095), .Y(n2069) );
  NOR3XL U3259 ( .A(n2105), .B(n2104), .C(data_memory_N927), .Y(n2106) );
  OAI21XL U3260 ( .A0(n3648), .A1(n2103), .B0(n2102), .Y(n2104) );
  OAI21XL U3261 ( .A0(n4799), .A1(n3693), .B0(n4359), .Y(n1752) );
  OAI2BB1XL U3262 ( .A0N(n4812), .A1N(araddr_m_inf[34]), .B0(n4802), .Y(n1742)
         );
  OAI2BB1XL U3263 ( .A0N(n4812), .A1N(araddr_m_inf[36]), .B0(n4804), .Y(n1744)
         );
  OAI2BB1XL U3264 ( .A0N(n4812), .A1N(araddr_m_inf[37]), .B0(n4805), .Y(n1745)
         );
  OAI2BB1XL U3265 ( .A0N(araddr_m_inf[41]), .A1N(n4812), .B0(n4809), .Y(n1749)
         );
  OAI2BB1XL U3266 ( .A0N(n4812), .A1N(araddr_m_inf[39]), .B0(n4807), .Y(n1747)
         );
  OAI2BB1XL U3267 ( .A0N(n4812), .A1N(araddr_m_inf[35]), .B0(n4803), .Y(n1743)
         );
  OAI2BB1XL U3268 ( .A0N(n4812), .A1N(araddr_m_inf[38]), .B0(n4806), .Y(n1746)
         );
  OAI2BB1XL U3269 ( .A0N(n4812), .A1N(araddr_m_inf[33]), .B0(n4801), .Y(n1741)
         );
  OAI2BB1XL U3270 ( .A0N(n4812), .A1N(araddr_m_inf[40]), .B0(n4808), .Y(n1748)
         );
  OAI2BB1XL U3271 ( .A0N(n4812), .A1N(araddr_m_inf[42]), .B0(n4810), .Y(n1750)
         );
  AND2XL U3272 ( .A(n4948), .B(data_memory_writeback_headpc[9]), .Y(
        data_memory_N845) );
  AND2XL U3273 ( .A(n4948), .B(data_memory_writeback_headpc[8]), .Y(
        data_memory_N844) );
  AND2XL U3274 ( .A(n4948), .B(data_memory_writeback_headpc[7]), .Y(
        data_memory_N843) );
  AND2XL U3275 ( .A(n4948), .B(data_memory_writeback_headpc[5]), .Y(
        data_memory_N841) );
  AND2XL U3276 ( .A(n4948), .B(data_memory_writeback_headpc[4]), .Y(
        data_memory_N840) );
  AND2XL U3277 ( .A(n4948), .B(data_memory_writeback_headpc[3]), .Y(
        data_memory_N839) );
  AND2XL U3278 ( .A(n4948), .B(data_memory_writeback_headpc[2]), .Y(
        data_memory_N838) );
  AND2XL U3279 ( .A(n4948), .B(data_memory_writeback_headpc[1]), .Y(
        data_memory_N837) );
  AND2XL U3280 ( .A(n4948), .B(data_memory_writeback_headpc[0]), .Y(
        data_memory_N836) );
  NOR2X1 U3281 ( .A(n4881), .B(n4880), .Y(data_memory_N922) );
  NOR3XL U3282 ( .A(n3237), .B(data_memory_lookup_pc[0]), .C(n4881), .Y(
        data_memory_N912) );
  OAI21XL U3283 ( .A0(n3816), .A1(rlast_m_inf[0]), .B0(n2096), .Y(
        data_memory_N927) );
  NAND3XL U3284 ( .A(n2095), .B(rvalid_m_inf[0]), .C(n3814), .Y(n2096) );
  MXI2XL U3285 ( .A(n4879), .B(n4525), .S0(n4548), .Y(n1348) );
  OAI2BB1XL U3286 ( .A0N(n4790), .A1N(n4438), .B0(n4437), .Y(n1306) );
  XNOR2XL U3287 ( .A(n4435), .B(n4434), .Y(n4436) );
  XOR2XL U3288 ( .A(n4659), .B(n4255), .Y(n4256) );
  XOR2XL U3289 ( .A(n4785), .B(n4784), .Y(n4787) );
  MXI2XL U3290 ( .A(n4821), .B(n4824), .S0(n4865), .Y(n1250) );
  MXI2XL U3291 ( .A(n4826), .B(n4827), .S0(n4865), .Y(n1251) );
  MXI2XL U3292 ( .A(n4829), .B(n4830), .S0(n4865), .Y(n1252) );
  MXI2XL U3293 ( .A(n4832), .B(n4833), .S0(n4865), .Y(n1253) );
  MXI2XL U3294 ( .A(n4835), .B(n4836), .S0(n4865), .Y(n1254) );
  MXI2XL U3295 ( .A(n4838), .B(n4839), .S0(n4865), .Y(n1255) );
  MXI2XL U3296 ( .A(n4841), .B(n4842), .S0(n4865), .Y(n1256) );
  MXI2XL U3297 ( .A(n4459), .B(n4844), .S0(n4865), .Y(n1257) );
  MXI2XL U3298 ( .A(n4846), .B(n4847), .S0(n4865), .Y(n1258) );
  MXI2XL U3299 ( .A(n4849), .B(n4850), .S0(n4865), .Y(n1259) );
  MXI2XL U3300 ( .A(n4852), .B(n4853), .S0(n4865), .Y(n1260) );
  MXI2XL U3301 ( .A(n2467), .B(n4858), .S0(n4865), .Y(n1262) );
  MXI2XL U3302 ( .A(n4860), .B(n4861), .S0(n4865), .Y(n1263) );
  MXI2XL U3303 ( .A(n4866), .B(n4867), .S0(n4865), .Y(n1265) );
  OAI2BB1XL U3304 ( .A0N(DM_idx[10]), .A1N(DM_invalid), .B0(n4671), .Y(n1267)
         );
  MXI2XL U3305 ( .A(n4524), .B(n2043), .S0(DM_invalid), .Y(n1268) );
  OAI2BB1XL U3306 ( .A0N(DM_idx[8]), .A1N(DM_invalid), .B0(n4521), .Y(n1269)
         );
  MXI2XL U3307 ( .A(n4517), .B(n4516), .S0(DM_invalid), .Y(n1271) );
  MXI2XL U3308 ( .A(n4409), .B(n4559), .S0(DM_invalid), .Y(n1272) );
  MXI2XL U3309 ( .A(n4536), .B(n4408), .S0(DM_invalid), .Y(n1273) );
  OAI2BB1XL U3310 ( .A0N(DM_idx[3]), .A1N(DM_invalid), .B0(n4413), .Y(n1274)
         );
  OAI2BB1XL U3311 ( .A0N(DM_idx[2]), .A1N(DM_invalid), .B0(n4411), .Y(n1275)
         );
  OAI2BB1XL U3312 ( .A0N(DM_idx[1]), .A1N(DM_invalid), .B0(n4514), .Y(n1276)
         );
  MXI2XL U3313 ( .A(n4340), .B(n4391), .S0(IM_invalid), .Y(n1280) );
  MXI2XL U3314 ( .A(n4327), .B(n4389), .S0(IM_invalid), .Y(n1281) );
  MXI2XL U3315 ( .A(n4389), .B(n4388), .S0(n4407), .Y(n1282) );
  MXI2XL U3316 ( .A(n4322), .B(n4387), .S0(IM_invalid), .Y(n1283) );
  MXI2XL U3317 ( .A(n4387), .B(n4386), .S0(n4407), .Y(n1284) );
  MXI2XL U3318 ( .A(n4798), .B(n4797), .S0(IM_invalid), .Y(n1285) );
  MXI2XL U3319 ( .A(n4797), .B(n4385), .S0(n4407), .Y(n1286) );
  MXI2XL U3320 ( .A(n4313), .B(n4384), .S0(IM_invalid), .Y(n1287) );
  MXI2XL U3321 ( .A(n4384), .B(n4383), .S0(n4407), .Y(n1288) );
  MXI2XL U3322 ( .A(n4314), .B(n4382), .S0(IM_invalid), .Y(n1289) );
  MXI2XL U3323 ( .A(n4382), .B(n4381), .S0(n4407), .Y(n1290) );
  MXI2XL U3324 ( .A(n4342), .B(n4380), .S0(IM_invalid), .Y(n1291) );
  MXI2XL U3325 ( .A(n4380), .B(n4379), .S0(n4407), .Y(n1292) );
  MXI2XL U3326 ( .A(n4316), .B(n4378), .S0(IM_invalid), .Y(n1293) );
  MXI2XL U3327 ( .A(n4378), .B(n4377), .S0(n4407), .Y(n1294) );
  MXI2XL U3328 ( .A(n4315), .B(n4394), .S0(IM_invalid), .Y(n1295) );
  MXI2XL U3329 ( .A(n4394), .B(n4393), .S0(n4407), .Y(n1296) );
  MXI2XL U3330 ( .A(n4341), .B(n4395), .S0(IM_invalid), .Y(n1297) );
  MXI2XL U3331 ( .A(n4395), .B(n4376), .S0(n4407), .Y(n1298) );
  MXI2XL U3332 ( .A(n4403), .B(n4402), .S0(IM_invalid), .Y(n1299) );
  MXI2XL U3333 ( .A(n4402), .B(n4392), .S0(n4407), .Y(n1300) );
  MXI2XL U3334 ( .A(n4391), .B(n4390), .S0(n4407), .Y(n1301) );
  OAI2BB1XL U3335 ( .A0N(n4786), .A1N(n4508), .B0(n4507), .Y(n1302) );
  AOI21XL U3336 ( .A0(n4790), .A1(n4506), .B0(n4505), .Y(n4507) );
  OAI2BB1XL U3337 ( .A0N(n4790), .A1N(n4453), .B0(n4452), .Y(n1307) );
  AOI22XL U3338 ( .A0(n4451), .A1(n4786), .B0(EXE_MEM_result[11]), .B1(n4865), 
        .Y(n4452) );
  XOR2XL U3339 ( .A(n4450), .B(n4449), .Y(n4451) );
  INVXL U3340 ( .A(n4786), .Y(n4142) );
  XNOR2XL U3341 ( .A(n4053), .B(n4052), .Y(n4058) );
  XOR2XL U3342 ( .A(n4048), .B(n3929), .Y(n3951) );
  XNOR2XL U3343 ( .A(n3949), .B(n3948), .Y(n3950) );
  XNOR2XL U3344 ( .A(n3893), .B(n3892), .Y(n3911) );
  XOR2XL U3345 ( .A(n3909), .B(n3930), .Y(n3910) );
  XOR2XL U3346 ( .A(n3888), .B(n3764), .Y(n3783) );
  XOR2XL U3347 ( .A(n3781), .B(n3908), .Y(n3782) );
  XNOR2XL U3348 ( .A(n3710), .B(n3780), .Y(n3711) );
  XNOR2XL U3349 ( .A(n3759), .B(n3671), .Y(n3686) );
  INVXL U3350 ( .A(n3070), .Y(n1316) );
  XNOR2XL U3351 ( .A(n3059), .B(n3058), .Y(n3069) );
  INVXL U3352 ( .A(n3080), .Y(n1317) );
  XOR2XL U3353 ( .A(n3073), .B(n3072), .Y(n3079) );
  AND2XL U3354 ( .A(n3077), .B(n3076), .Y(n3078) );
  MXI2XL U3355 ( .A(n4418), .B(n4417), .S0(n4416), .Y(n1322) );
  OAI2BB1XL U3356 ( .A0N(EXE_MEM_instcode_7), .A1N(n4865), .B0(n4613), .Y(
        n1323) );
  MXI2XL U3357 ( .A(n4615), .B(n4614), .S0(n4865), .Y(n1324) );
  OAI22XL U3358 ( .A0(n3235), .A1(n4414), .B0(n4416), .B1(n4822), .Y(n1325) );
  OAI2BB1XL U3359 ( .A0N(EXE_MEM_instcode[3]), .A1N(n4865), .B0(n4419), .Y(
        n1326) );
  MXI2XL U3360 ( .A(n4497), .B(n4421), .S0(n4865), .Y(n1327) );
  MXI2XL U3361 ( .A(n4423), .B(n4422), .S0(n4865), .Y(n1328) );
  INVXL U3362 ( .A(n4288), .Y(n1329) );
  AOI222XL U3363 ( .A0(n4865), .A1(EXE_MEM_PCnxt[1]), .B0(n4612), .B1(
        IF_DEC_instr[2]), .C0(n4287), .C1(n4335), .Y(n4288) );
  INVXL U3364 ( .A(n4299), .Y(n1330) );
  AOI222XL U3365 ( .A0(n4865), .A1(EXE_MEM_PCnxt[2]), .B0(n4612), .B1(
        IF_DEC_instr[3]), .C0(n4298), .C1(n4335), .Y(n4299) );
  AOI22XL U3366 ( .A0(n4612), .A1(IF_DEC_instr[6]), .B0(EXE_MEM_PCnxt[5]), 
        .B1(n4865), .Y(n2942) );
  NAND2XL U3367 ( .A(n2939), .B(n2938), .Y(n2940) );
  AOI22XL U3368 ( .A0(n4612), .A1(IF_DEC_instr[8]), .B0(EXE_MEM_PCnxt[7]), 
        .B1(n4865), .Y(n2933) );
  NAND2XL U3369 ( .A(n2930), .B(n3010), .Y(n2931) );
  AND2XL U3370 ( .A(n3028), .B(n3029), .Y(n2022) );
  XNOR2XL U3371 ( .A(n3749), .B(n3748), .Y(n3750) );
  MXI2XL U3372 ( .A(n4877), .B(n4534), .S0(n4548), .Y(n1346) );
  MXI2XL U3373 ( .A(n4878), .B(n4528), .S0(n4548), .Y(n1347) );
  OAI2BB1XL U3374 ( .A0N(DM_data[0]), .A1N(n4871), .B0(n4825), .Y(n1444) );
  OAI21XL U3375 ( .A0(n3539), .A1(n3489), .B0(n3462), .Y(n1478) );
  OAI21XL U3376 ( .A0(n3539), .A1(n3541), .B0(n3537), .Y(n1493) );
  OAI21XL U3377 ( .A0(n3539), .A1(n3348), .B0(n3321), .Y(n1509) );
  OAI21XL U3378 ( .A0(n3539), .A1(n3453), .B0(n3373), .Y(n1525) );
  OAI21XL U3379 ( .A0(n3539), .A1(n3346), .B0(n3317), .Y(n1541) );
  OAI21XL U3380 ( .A0(n3539), .A1(n3455), .B0(n3375), .Y(n1557) );
  OAI21XL U3381 ( .A0(n3539), .A1(n3344), .B0(n3315), .Y(n1573) );
  OAI21XL U3382 ( .A0(n3539), .A1(n3449), .B0(n3377), .Y(n1589) );
  OAI21XL U3383 ( .A0(n3539), .A1(n3491), .B0(n3474), .Y(n1605) );
  OAI21XL U3384 ( .A0(n3539), .A1(n3543), .B0(n3538), .Y(n1621) );
  OAI21XL U3385 ( .A0(n3539), .A1(n3340), .B0(n3253), .Y(n1637) );
  OAI21XL U3386 ( .A0(n3539), .A1(n3451), .B0(n3378), .Y(n1653) );
  OAI21XL U3387 ( .A0(n3539), .A1(n3338), .B0(n3255), .Y(n1669) );
  OAI21XL U3388 ( .A0(n3539), .A1(n3447), .B0(n3380), .Y(n1685) );
  OAI21XL U3389 ( .A0(n3539), .A1(n3342), .B0(n3256), .Y(n1701) );
  OAI21XL U3390 ( .A0(n3539), .A1(n3445), .B0(n3382), .Y(n1717) );
  OAI2BB1XL U3391 ( .A0N(DM_data[10]), .A1N(n4871), .B0(n4828), .Y(n1434) );
  OAI21XL U3392 ( .A0(n3526), .A1(n3489), .B0(n3461), .Y(n1472) );
  OAI21XL U3393 ( .A0(n3526), .A1(n3541), .B0(n3525), .Y(n1488) );
  OAI21XL U3394 ( .A0(n3526), .A1(n3348), .B0(n3305), .Y(n1503) );
  OAI21XL U3395 ( .A0(n3526), .A1(n3453), .B0(n3386), .Y(n1519) );
  OAI21XL U3396 ( .A0(n3526), .A1(n3346), .B0(n3303), .Y(n1535) );
  OAI21XL U3397 ( .A0(n3526), .A1(n3455), .B0(n3388), .Y(n1551) );
  OAI21XL U3398 ( .A0(n3526), .A1(n3344), .B0(n3329), .Y(n1567) );
  OAI21XL U3399 ( .A0(n3526), .A1(n3449), .B0(n3390), .Y(n1583) );
  OAI21XL U3400 ( .A0(n3526), .A1(n3491), .B0(n3473), .Y(n1599) );
  OAI21XL U3401 ( .A0(n3526), .A1(n3543), .B0(n3524), .Y(n1615) );
  OAI21XL U3402 ( .A0(n3526), .A1(n3340), .B0(n3261), .Y(n1631) );
  OAI21XL U3403 ( .A0(n3526), .A1(n3451), .B0(n3392), .Y(n1647) );
  OAI21XL U3404 ( .A0(n3526), .A1(n3338), .B0(n3263), .Y(n1663) );
  OAI21XL U3405 ( .A0(n3526), .A1(n3447), .B0(n3400), .Y(n1679) );
  OAI21XL U3406 ( .A0(n3526), .A1(n3342), .B0(n3268), .Y(n1695) );
  OAI21XL U3407 ( .A0(n3526), .A1(n3445), .B0(n3402), .Y(n1711) );
  OAI2BB1XL U3408 ( .A0N(DM_data[11]), .A1N(n4871), .B0(n4831), .Y(n1433) );
  OAI21XL U3409 ( .A0(n3505), .A1(n3489), .B0(n3464), .Y(n1473) );
  OAI21XL U3410 ( .A0(n3505), .A1(n3541), .B0(n3504), .Y(n1489) );
  OAI21XL U3411 ( .A0(n3505), .A1(n3348), .B0(n3313), .Y(n1504) );
  OAI21XL U3412 ( .A0(n3505), .A1(n3453), .B0(n3406), .Y(n1520) );
  OAI21XL U3413 ( .A0(n3505), .A1(n3346), .B0(n3292), .Y(n1536) );
  OAI21XL U3414 ( .A0(n3505), .A1(n3455), .B0(n3408), .Y(n1552) );
  OAI21XL U3415 ( .A0(n3505), .A1(n3344), .B0(n3332), .Y(n1568) );
  OAI21XL U3416 ( .A0(n3505), .A1(n3449), .B0(n3410), .Y(n1584) );
  OAI21XL U3417 ( .A0(n3505), .A1(n3491), .B0(n3481), .Y(n1600) );
  OAI21XL U3418 ( .A0(n3505), .A1(n3543), .B0(n3501), .Y(n1616) );
  OAI21XL U3419 ( .A0(n3505), .A1(n3340), .B0(n3272), .Y(n1632) );
  OAI21XL U3420 ( .A0(n3505), .A1(n3451), .B0(n3412), .Y(n1648) );
  OAI21XL U3421 ( .A0(n3505), .A1(n3338), .B0(n3274), .Y(n1664) );
  OAI21XL U3422 ( .A0(n3505), .A1(n3447), .B0(n3414), .Y(n1680) );
  OAI21XL U3423 ( .A0(n3505), .A1(n3342), .B0(n3277), .Y(n1696) );
  OAI21XL U3424 ( .A0(n3505), .A1(n3445), .B0(n3416), .Y(n1712) );
  OAI2BB1XL U3425 ( .A0N(DM_data[12]), .A1N(n4871), .B0(n4834), .Y(n1432) );
  OAI21XL U3426 ( .A0(n3515), .A1(n3489), .B0(n3460), .Y(n1474) );
  OAI21XL U3427 ( .A0(n3515), .A1(n3541), .B0(n3514), .Y(n1490) );
  OAI21XL U3428 ( .A0(n3515), .A1(n3348), .B0(n3301), .Y(n1505) );
  OAI21XL U3429 ( .A0(n3515), .A1(n3453), .B0(n3420), .Y(n1521) );
  OAI21XL U3430 ( .A0(n3515), .A1(n3346), .B0(n3296), .Y(n1537) );
  OAI21XL U3431 ( .A0(n3515), .A1(n3455), .B0(n3422), .Y(n1553) );
  OAI21XL U3432 ( .A0(n3515), .A1(n3344), .B0(n3327), .Y(n1569) );
  OAI21XL U3433 ( .A0(n3515), .A1(n3449), .B0(n3426), .Y(n1585) );
  OAI21XL U3434 ( .A0(n3515), .A1(n3491), .B0(n3483), .Y(n1601) );
  OAI21XL U3435 ( .A0(n3515), .A1(n3543), .B0(n3495), .Y(n1617) );
  OAI21XL U3436 ( .A0(n3515), .A1(n3340), .B0(n3283), .Y(n1633) );
  OAI21XL U3437 ( .A0(n3515), .A1(n3451), .B0(n3439), .Y(n1649) );
  OAI21XL U3438 ( .A0(n3515), .A1(n3338), .B0(n3287), .Y(n1665) );
  OAI21XL U3439 ( .A0(n3515), .A1(n3447), .B0(n3443), .Y(n1681) );
  OAI21XL U3440 ( .A0(n3515), .A1(n3342), .B0(n3288), .Y(n1697) );
  OAI21XL U3441 ( .A0(n3515), .A1(n3445), .B0(n3441), .Y(n1713) );
  OAI2BB1XL U3442 ( .A0N(DM_data[13]), .A1N(n4871), .B0(n4837), .Y(n1431) );
  OAI21XL U3443 ( .A0(n3523), .A1(n3489), .B0(n3465), .Y(n1475) );
  OAI21XL U3444 ( .A0(n3523), .A1(n3541), .B0(n3522), .Y(n1491) );
  OAI21XL U3445 ( .A0(n3523), .A1(n3348), .B0(n3328), .Y(n1506) );
  OAI21XL U3446 ( .A0(n3523), .A1(n3453), .B0(n3442), .Y(n1522) );
  OAI21XL U3447 ( .A0(n3523), .A1(n3346), .B0(n3309), .Y(n1538) );
  OAI21XL U3448 ( .A0(n3523), .A1(n3455), .B0(n3440), .Y(n1554) );
  OAI21XL U3449 ( .A0(n3523), .A1(n3344), .B0(n3302), .Y(n1570) );
  OAI21XL U3450 ( .A0(n3523), .A1(n3449), .B0(n3438), .Y(n1586) );
  OAI21XL U3451 ( .A0(n3523), .A1(n3491), .B0(n3475), .Y(n1602) );
  OAI21XL U3452 ( .A0(n3523), .A1(n3543), .B0(n3502), .Y(n1618) );
  OAI21XL U3453 ( .A0(n3523), .A1(n3340), .B0(n3280), .Y(n1634) );
  OAI21XL U3454 ( .A0(n3523), .A1(n3451), .B0(n3436), .Y(n1650) );
  OAI21XL U3455 ( .A0(n3523), .A1(n3338), .B0(n3284), .Y(n1666) );
  OAI21XL U3456 ( .A0(n3523), .A1(n3447), .B0(n3434), .Y(n1682) );
  OAI21XL U3457 ( .A0(n3523), .A1(n3342), .B0(n3281), .Y(n1698) );
  OAI21XL U3458 ( .A0(n3523), .A1(n3445), .B0(n3432), .Y(n1714) );
  OAI2BB1XL U3459 ( .A0N(DM_data[14]), .A1N(n4871), .B0(n4840), .Y(n1430) );
  OAI21XL U3460 ( .A0(n3544), .A1(n3489), .B0(n3488), .Y(n1476) );
  OAI21XL U3461 ( .A0(n3544), .A1(n3541), .B0(n3540), .Y(n1492) );
  OAI21XL U3462 ( .A0(n3544), .A1(n3348), .B0(n3347), .Y(n1507) );
  OAI21XL U3463 ( .A0(n3544), .A1(n3453), .B0(n3452), .Y(n1523) );
  OAI21XL U3464 ( .A0(n3544), .A1(n3346), .B0(n3345), .Y(n1539) );
  OAI21XL U3465 ( .A0(n3544), .A1(n3455), .B0(n3454), .Y(n1555) );
  OAI21XL U3466 ( .A0(n3544), .A1(n3344), .B0(n3343), .Y(n1571) );
  OAI21XL U3467 ( .A0(n3544), .A1(n3449), .B0(n3448), .Y(n1587) );
  OAI21XL U3468 ( .A0(n3544), .A1(n3491), .B0(n3490), .Y(n1603) );
  OAI21XL U3469 ( .A0(n3544), .A1(n3543), .B0(n3542), .Y(n1619) );
  OAI21XL U3470 ( .A0(n3544), .A1(n3340), .B0(n3339), .Y(n1635) );
  OAI21XL U3471 ( .A0(n3544), .A1(n3451), .B0(n3450), .Y(n1651) );
  OAI21XL U3472 ( .A0(n3544), .A1(n3338), .B0(n3337), .Y(n1667) );
  OAI21XL U3473 ( .A0(n3544), .A1(n3447), .B0(n3446), .Y(n1683) );
  OAI21XL U3474 ( .A0(n3544), .A1(n3342), .B0(n3341), .Y(n1699) );
  OAI21XL U3475 ( .A0(n3544), .A1(n3445), .B0(n3444), .Y(n1715) );
  OAI2BB1XL U3476 ( .A0N(DM_data[15]), .A1N(n4871), .B0(n4843), .Y(n1445) );
  OAI21XL U3477 ( .A0(n3521), .A1(n3489), .B0(n3457), .Y(n1477) );
  OAI21XL U3478 ( .A0(n3521), .A1(n3348), .B0(n3325), .Y(n1508) );
  OAI21XL U3479 ( .A0(n3521), .A1(n3453), .B0(n3424), .Y(n1524) );
  OAI21XL U3480 ( .A0(n3521), .A1(n3346), .B0(n3299), .Y(n1540) );
  OAI21XL U3481 ( .A0(n3521), .A1(n3455), .B0(n3418), .Y(n1556) );
  OAI21XL U3482 ( .A0(n3521), .A1(n3344), .B0(n3304), .Y(n1572) );
  OAI21XL U3483 ( .A0(n3521), .A1(n3449), .B0(n3404), .Y(n1588) );
  OAI21XL U3484 ( .A0(n3521), .A1(n3491), .B0(n3480), .Y(n1604) );
  OAI21XL U3485 ( .A0(n3521), .A1(n3543), .B0(n3520), .Y(n1620) );
  OAI21XL U3486 ( .A0(n3521), .A1(n3340), .B0(n3270), .Y(n1636) );
  OAI21XL U3487 ( .A0(n3521), .A1(n3451), .B0(n3398), .Y(n1652) );
  OAI21XL U3488 ( .A0(n3521), .A1(n3338), .B0(n3265), .Y(n1668) );
  OAI21XL U3489 ( .A0(n3521), .A1(n3447), .B0(n3396), .Y(n1684) );
  OAI21XL U3490 ( .A0(n3521), .A1(n3342), .B0(n3264), .Y(n1700) );
  OAI21XL U3491 ( .A0(n3521), .A1(n3445), .B0(n3394), .Y(n1716) );
  OAI21XL U3492 ( .A0(n3521), .A1(n3541), .B0(n3513), .Y(n1777) );
  OAI2BB1XL U3493 ( .A0N(DM_data[1]), .A1N(n4871), .B0(n4845), .Y(n1443) );
  OAI21XL U3494 ( .A0(n3528), .A1(n3489), .B0(n3470), .Y(n1463) );
  OAI21XL U3495 ( .A0(n3528), .A1(n3541), .B0(n3509), .Y(n1479) );
  OAI21XL U3496 ( .A0(n3528), .A1(n3348), .B0(n3306), .Y(n1494) );
  OAI21XL U3497 ( .A0(n3528), .A1(n3453), .B0(n3384), .Y(n1510) );
  OAI21XL U3498 ( .A0(n3528), .A1(n3346), .B0(n3319), .Y(n1526) );
  OAI21XL U3499 ( .A0(n3528), .A1(n3455), .B0(n3389), .Y(n1542) );
  OAI21XL U3500 ( .A0(n3528), .A1(n3344), .B0(n3323), .Y(n1558) );
  OAI21XL U3501 ( .A0(n3528), .A1(n3449), .B0(n3387), .Y(n1574) );
  OAI21XL U3502 ( .A0(n3528), .A1(n3491), .B0(n3485), .Y(n1590) );
  OAI21XL U3503 ( .A0(n3528), .A1(n3543), .B0(n3527), .Y(n1606) );
  OAI21XL U3504 ( .A0(n3528), .A1(n3340), .B0(n3248), .Y(n1622) );
  OAI21XL U3505 ( .A0(n3528), .A1(n3451), .B0(n3367), .Y(n1638) );
  OAI21XL U3506 ( .A0(n3528), .A1(n3338), .B0(n3247), .Y(n1654) );
  OAI21XL U3507 ( .A0(n3528), .A1(n3447), .B0(n3365), .Y(n1670) );
  OAI21XL U3508 ( .A0(n3528), .A1(n3342), .B0(n3262), .Y(n1686) );
  OAI21XL U3509 ( .A0(n3528), .A1(n3445), .B0(n3363), .Y(n1702) );
  OAI2BB1XL U3510 ( .A0N(DM_data[2]), .A1N(n4871), .B0(n4848), .Y(n1442) );
  OAI21XL U3511 ( .A0(n3533), .A1(n3489), .B0(n3466), .Y(n1464) );
  OAI21XL U3512 ( .A0(n3533), .A1(n3541), .B0(n3531), .Y(n1480) );
  OAI21XL U3513 ( .A0(n3533), .A1(n3348), .B0(n3331), .Y(n1495) );
  OAI21XL U3514 ( .A0(n3533), .A1(n3453), .B0(n3369), .Y(n1511) );
  OAI21XL U3515 ( .A0(n3533), .A1(n3346), .B0(n3333), .Y(n1527) );
  OAI21XL U3516 ( .A0(n3533), .A1(n3455), .B0(n3358), .Y(n1543) );
  OAI21XL U3517 ( .A0(n3533), .A1(n3344), .B0(n3330), .Y(n1559) );
  OAI21XL U3518 ( .A0(n3533), .A1(n3449), .B0(n3355), .Y(n1575) );
  OAI21XL U3519 ( .A0(n3533), .A1(n3491), .B0(n3482), .Y(n1591) );
  OAI21XL U3520 ( .A0(n3533), .A1(n3543), .B0(n3532), .Y(n1607) );
  OAI21XL U3521 ( .A0(n3533), .A1(n3340), .B0(n3243), .Y(n1623) );
  OAI21XL U3522 ( .A0(n3533), .A1(n3451), .B0(n3357), .Y(n1639) );
  OAI21XL U3523 ( .A0(n3533), .A1(n3338), .B0(n3254), .Y(n1655) );
  OAI21XL U3524 ( .A0(n3533), .A1(n3447), .B0(n3371), .Y(n1671) );
  OAI21XL U3525 ( .A0(n3533), .A1(n3342), .B0(n3275), .Y(n1687) );
  OAI21XL U3526 ( .A0(n3533), .A1(n3445), .B0(n3352), .Y(n1703) );
  OAI2BB1XL U3527 ( .A0N(DM_data[3]), .A1N(n4871), .B0(n4851), .Y(n1441) );
  OAI21XL U3528 ( .A0(n3536), .A1(n3489), .B0(n3468), .Y(n1465) );
  OAI21XL U3529 ( .A0(n3536), .A1(n3541), .B0(n3534), .Y(n1481) );
  OAI21XL U3530 ( .A0(n3536), .A1(n3348), .B0(n3336), .Y(n1496) );
  OAI21XL U3531 ( .A0(n3536), .A1(n3453), .B0(n3350), .Y(n1512) );
  OAI21XL U3532 ( .A0(n3536), .A1(n3346), .B0(n3335), .Y(n1528) );
  OAI21XL U3533 ( .A0(n3536), .A1(n3455), .B0(n3353), .Y(n1544) );
  OAI21XL U3534 ( .A0(n3536), .A1(n3344), .B0(n3334), .Y(n1560) );
  OAI21XL U3535 ( .A0(n3536), .A1(n3449), .B0(n3360), .Y(n1576) );
  OAI21XL U3536 ( .A0(n3536), .A1(n3491), .B0(n3477), .Y(n1592) );
  OAI21XL U3537 ( .A0(n3536), .A1(n3543), .B0(n3535), .Y(n1608) );
  OAI21XL U3538 ( .A0(n3536), .A1(n3340), .B0(n3249), .Y(n1624) );
  OAI21XL U3539 ( .A0(n3536), .A1(n3451), .B0(n3359), .Y(n1640) );
  OAI21XL U3540 ( .A0(n3536), .A1(n3338), .B0(n3250), .Y(n1656) );
  OAI21XL U3541 ( .A0(n3536), .A1(n3447), .B0(n3362), .Y(n1672) );
  OAI21XL U3542 ( .A0(n3536), .A1(n3342), .B0(n3245), .Y(n1688) );
  OAI21XL U3543 ( .A0(n3536), .A1(n3445), .B0(n3364), .Y(n1704) );
  OAI2BB1XL U3544 ( .A0N(DM_data[4]), .A1N(n4871), .B0(n4854), .Y(n1440) );
  OAI21XL U3545 ( .A0(n3530), .A1(n3489), .B0(n3469), .Y(n1466) );
  OAI21XL U3546 ( .A0(n3530), .A1(n3541), .B0(n3529), .Y(n1482) );
  OAI21XL U3547 ( .A0(n3530), .A1(n3348), .B0(n3326), .Y(n1497) );
  OAI21XL U3548 ( .A0(n3530), .A1(n3453), .B0(n3366), .Y(n1513) );
  OAI21XL U3549 ( .A0(n3530), .A1(n3346), .B0(n3324), .Y(n1529) );
  OAI21XL U3550 ( .A0(n3530), .A1(n3455), .B0(n3368), .Y(n1545) );
  OAI21XL U3551 ( .A0(n3530), .A1(n3344), .B0(n3322), .Y(n1561) );
  OAI21XL U3552 ( .A0(n3530), .A1(n3449), .B0(n3370), .Y(n1577) );
  OAI21XL U3553 ( .A0(n3530), .A1(n3491), .B0(n3479), .Y(n1593) );
  OAI21XL U3554 ( .A0(n3530), .A1(n3543), .B0(n3512), .Y(n1609) );
  OAI21XL U3555 ( .A0(n3530), .A1(n3340), .B0(n3258), .Y(n1625) );
  OAI21XL U3556 ( .A0(n3530), .A1(n3451), .B0(n3372), .Y(n1641) );
  OAI21XL U3557 ( .A0(n3530), .A1(n3338), .B0(n3251), .Y(n1657) );
  OAI21XL U3558 ( .A0(n3530), .A1(n3447), .B0(n3374), .Y(n1673) );
  OAI21XL U3559 ( .A0(n3530), .A1(n3342), .B0(n3252), .Y(n1689) );
  OAI21XL U3560 ( .A0(n3530), .A1(n3445), .B0(n3376), .Y(n1705) );
  OAI2BB1XL U3561 ( .A0N(DM_data[5]), .A1N(n4871), .B0(n4857), .Y(n1439) );
  OAI21XL U3562 ( .A0(n3511), .A1(n3489), .B0(n3459), .Y(n1467) );
  OAI21XL U3563 ( .A0(n3511), .A1(n3541), .B0(n3510), .Y(n1483) );
  OAI21XL U3564 ( .A0(n3511), .A1(n3348), .B0(n3310), .Y(n1498) );
  OAI21XL U3565 ( .A0(n3511), .A1(n3453), .B0(n3379), .Y(n1514) );
  OAI21XL U3566 ( .A0(n3511), .A1(n3346), .B0(n3320), .Y(n1530) );
  OAI21XL U3567 ( .A0(n3511), .A1(n3455), .B0(n3381), .Y(n1546) );
  OAI21XL U3568 ( .A0(n3511), .A1(n3344), .B0(n3307), .Y(n1562) );
  OAI21XL U3569 ( .A0(n3511), .A1(n3449), .B0(n3383), .Y(n1578) );
  OAI21XL U3570 ( .A0(n3511), .A1(n3491), .B0(n3487), .Y(n1594) );
  OAI21XL U3571 ( .A0(n3511), .A1(n3543), .B0(n3493), .Y(n1610) );
  OAI21XL U3572 ( .A0(n3511), .A1(n3340), .B0(n3257), .Y(n1626) );
  OAI21XL U3573 ( .A0(n3511), .A1(n3451), .B0(n3385), .Y(n1642) );
  OAI21XL U3574 ( .A0(n3511), .A1(n3338), .B0(n3259), .Y(n1658) );
  OAI21XL U3575 ( .A0(n3511), .A1(n3447), .B0(n3428), .Y(n1674) );
  OAI21XL U3576 ( .A0(n3511), .A1(n3342), .B0(n3260), .Y(n1690) );
  OAI21XL U3577 ( .A0(n3511), .A1(n3445), .B0(n3430), .Y(n1706) );
  OAI21XL U3578 ( .A0(n3517), .A1(n3489), .B0(n3458), .Y(n1468) );
  OAI21XL U3579 ( .A0(n3517), .A1(n3541), .B0(n3516), .Y(n1484) );
  OAI21XL U3580 ( .A0(n3517), .A1(n3348), .B0(n3298), .Y(n1499) );
  OAI21XL U3581 ( .A0(n3517), .A1(n3453), .B0(n3391), .Y(n1515) );
  OAI21XL U3582 ( .A0(n3517), .A1(n3346), .B0(n3300), .Y(n1531) );
  OAI21XL U3583 ( .A0(n3517), .A1(n3455), .B0(n3393), .Y(n1547) );
  OAI21XL U3584 ( .A0(n3517), .A1(n3344), .B0(n3295), .Y(n1563) );
  OAI21XL U3585 ( .A0(n3517), .A1(n3449), .B0(n3395), .Y(n1579) );
  OAI21XL U3586 ( .A0(n3517), .A1(n3491), .B0(n3484), .Y(n1595) );
  OAI21XL U3587 ( .A0(n3517), .A1(n3543), .B0(n3503), .Y(n1611) );
  OAI21XL U3588 ( .A0(n3517), .A1(n3340), .B0(n3266), .Y(n1627) );
  OAI21XL U3589 ( .A0(n3517), .A1(n3451), .B0(n3397), .Y(n1643) );
  OAI21XL U3590 ( .A0(n3517), .A1(n3338), .B0(n3267), .Y(n1659) );
  OAI21XL U3591 ( .A0(n3517), .A1(n3447), .B0(n3399), .Y(n1675) );
  OAI21XL U3592 ( .A0(n3517), .A1(n3342), .B0(n3269), .Y(n1691) );
  OAI21XL U3593 ( .A0(n3517), .A1(n3445), .B0(n3401), .Y(n1707) );
  OAI2BB1XL U3594 ( .A0N(DM_data[7]), .A1N(n4871), .B0(n4862), .Y(n1437) );
  OAI21XL U3595 ( .A0(n3508), .A1(n3489), .B0(n3467), .Y(n1469) );
  OAI21XL U3596 ( .A0(n3508), .A1(n3541), .B0(n3498), .Y(n1485) );
  OAI21XL U3597 ( .A0(n3508), .A1(n3348), .B0(n3293), .Y(n1500) );
  OAI21XL U3598 ( .A0(n3508), .A1(n3453), .B0(n3403), .Y(n1516) );
  OAI21XL U3599 ( .A0(n3508), .A1(n3346), .B0(n3308), .Y(n1532) );
  OAI21XL U3600 ( .A0(n3508), .A1(n3455), .B0(n3405), .Y(n1548) );
  OAI21XL U3601 ( .A0(n3508), .A1(n3344), .B0(n3294), .Y(n1564) );
  OAI21XL U3602 ( .A0(n3508), .A1(n3449), .B0(n3407), .Y(n1580) );
  OAI21XL U3603 ( .A0(n3508), .A1(n3491), .B0(n3486), .Y(n1596) );
  OAI21XL U3604 ( .A0(n3508), .A1(n3543), .B0(n3507), .Y(n1612) );
  OAI21XL U3605 ( .A0(n3508), .A1(n3340), .B0(n3271), .Y(n1628) );
  OAI21XL U3606 ( .A0(n3508), .A1(n3451), .B0(n3409), .Y(n1644) );
  OAI21XL U3607 ( .A0(n3508), .A1(n3338), .B0(n3273), .Y(n1660) );
  OAI21XL U3608 ( .A0(n3508), .A1(n3447), .B0(n3411), .Y(n1676) );
  OAI21XL U3609 ( .A0(n3508), .A1(n3342), .B0(n3276), .Y(n1692) );
  OAI21XL U3610 ( .A0(n3508), .A1(n3445), .B0(n3413), .Y(n1708) );
  OAI21XL U3611 ( .A0(n3519), .A1(n3489), .B0(n3471), .Y(n1470) );
  OAI21XL U3612 ( .A0(n3519), .A1(n3541), .B0(n3518), .Y(n1486) );
  OAI21XL U3613 ( .A0(n3519), .A1(n3348), .B0(n3297), .Y(n1501) );
  OAI21XL U3614 ( .A0(n3519), .A1(n3453), .B0(n3415), .Y(n1517) );
  OAI21XL U3615 ( .A0(n3519), .A1(n3346), .B0(n3316), .Y(n1533) );
  OAI21XL U3616 ( .A0(n3519), .A1(n3455), .B0(n3417), .Y(n1549) );
  OAI21XL U3617 ( .A0(n3519), .A1(n3344), .B0(n3318), .Y(n1565) );
  OAI21XL U3618 ( .A0(n3519), .A1(n3449), .B0(n3419), .Y(n1581) );
  OAI21XL U3619 ( .A0(n3519), .A1(n3491), .B0(n3478), .Y(n1597) );
  OAI21XL U3620 ( .A0(n3519), .A1(n3543), .B0(n3506), .Y(n1613) );
  OAI21XL U3621 ( .A0(n3519), .A1(n3340), .B0(n3278), .Y(n1629) );
  OAI21XL U3622 ( .A0(n3519), .A1(n3451), .B0(n3421), .Y(n1645) );
  OAI21XL U3623 ( .A0(n3519), .A1(n3338), .B0(n3282), .Y(n1661) );
  OAI21XL U3624 ( .A0(n3519), .A1(n3447), .B0(n3423), .Y(n1677) );
  OAI21XL U3625 ( .A0(n3519), .A1(n3342), .B0(n3279), .Y(n1693) );
  OAI21XL U3626 ( .A0(n3519), .A1(n3445), .B0(n3425), .Y(n1709) );
  OAI2BB1XL U3627 ( .A0N(DM_data[9]), .A1N(n4871), .B0(n4870), .Y(n1435) );
  OAI21XL U3628 ( .A0(n3500), .A1(n3489), .B0(n3463), .Y(n1471) );
  OAI21XL U3629 ( .A0(n3500), .A1(n3541), .B0(n3499), .Y(n1487) );
  OAI21XL U3630 ( .A0(n3500), .A1(n3348), .B0(n3311), .Y(n1502) );
  OAI21XL U3631 ( .A0(n3500), .A1(n3453), .B0(n3427), .Y(n1518) );
  OAI21XL U3632 ( .A0(n3500), .A1(n3346), .B0(n3312), .Y(n1534) );
  OAI21XL U3633 ( .A0(n3500), .A1(n3455), .B0(n3429), .Y(n1550) );
  OAI21XL U3634 ( .A0(n3500), .A1(n3344), .B0(n3314), .Y(n1566) );
  OAI21XL U3635 ( .A0(n3500), .A1(n3449), .B0(n3431), .Y(n1582) );
  OAI21XL U3636 ( .A0(n3500), .A1(n3491), .B0(n3476), .Y(n1598) );
  OAI21XL U3637 ( .A0(n3500), .A1(n3543), .B0(n3494), .Y(n1614) );
  OAI21XL U3638 ( .A0(n3500), .A1(n3340), .B0(n3286), .Y(n1630) );
  OAI21XL U3639 ( .A0(n3500), .A1(n3451), .B0(n3433), .Y(n1646) );
  OAI21XL U3640 ( .A0(n3500), .A1(n3338), .B0(n3285), .Y(n1662) );
  OAI21XL U3641 ( .A0(n3500), .A1(n3447), .B0(n3435), .Y(n1678) );
  OAI21XL U3642 ( .A0(n3500), .A1(n3342), .B0(n3289), .Y(n1694) );
  OAI21XL U3643 ( .A0(n3500), .A1(n3445), .B0(n3437), .Y(n1710) );
  OAI211XL U3644 ( .A0(n3660), .A1(n3866), .B0(n3794), .C0(n3656), .Y(n1781)
         );
  OAI211XL U3645 ( .A0(data_memory_dcache_ready_idx[3]), .A1(
        data_memory_dcache_ready_idx[4]), .B0(n3736), .C0(n3655), .Y(n3656) );
  OAI211XL U3646 ( .A0(n3728), .A1(n3869), .B0(n3794), .C0(n3727), .Y(n1783)
         );
  OAI211XL U3647 ( .A0(data_memory_dcache_ready_idx[1]), .A1(
        data_memory_dcache_ready_idx[2]), .B0(n3736), .C0(n3726), .Y(n3727) );
  OAI211XL U3648 ( .A0(n3734), .A1(n4819), .B0(n3653), .C0(n3794), .Y(n1785)
         );
  OAI211XL U3649 ( .A0(n3808), .A1(data_memory_writeback_count[5]), .B0(n3807), 
        .C0(n3806), .Y(n1387) );
  OAI2BB1XL U3650 ( .A0N(n3804), .A1N(n3803), .B0(n3802), .Y(n3807) );
  NAND2XL U3651 ( .A(n3805), .B(data_memory_writeback_count[5]), .Y(n3806) );
  NAND3XL U3652 ( .A(n3793), .B(n4608), .C(n3808), .Y(n1388) );
  OAI2BB1XL U3653 ( .A0N(n3790), .A1N(n3789), .B0(
        data_memory_writeback_count[4]), .Y(n3793) );
  OAI211XL U3654 ( .A0(n3789), .A1(n3790), .B0(n3741), .C0(n4608), .Y(n1389)
         );
  NAND2XL U3655 ( .A(n4610), .B(n3790), .Y(n3741) );
  NAND3BXL U3656 ( .AN(n4610), .B(n4609), .C(n4608), .Y(n1390) );
  OAI2BB1XL U3657 ( .A0N(n4607), .A1N(n4606), .B0(
        data_memory_writeback_count[2]), .Y(n4609) );
  OAI211XL U3658 ( .A0(n4606), .A1(n4607), .B0(n3747), .C0(n4608), .Y(n1391)
         );
  NAND2XL U3659 ( .A(n3852), .B(n4607), .Y(n3747) );
  OAI211XL U3660 ( .A0(n3855), .A1(n3854), .B0(n3853), .C0(n4608), .Y(n1392)
         );
  OAI222XL U3661 ( .A0(n3754), .A1(n3819), .B0(n3753), .B1(n3802), .C0(n4261), 
        .C1(n3752), .Y(n1393) );
  NAND2XL U3662 ( .A(n3849), .B(n3848), .Y(n1394) );
  AOI22XL U3663 ( .A0(n4127), .A1(data_memory_dcache_headpc[9]), .B0(
        data_memory_writeback_headpc[9]), .B1(n4608), .Y(n3849) );
  OAI211XL U3664 ( .A0(data_memory_dcache_headpc[9]), .A1(n3847), .B0(n4129), 
        .C0(n3846), .Y(n3848) );
  OAI31XL U3665 ( .A0(n3819), .A1(n3847), .A2(n3190), .B0(n3189), .Y(n1395) );
  AOI22XL U3666 ( .A0(n4127), .A1(data_memory_dcache_headpc[8]), .B0(
        data_memory_writeback_headpc[8]), .B1(n4608), .Y(n3189) );
  INVXL U3667 ( .A(n3820), .Y(n3188) );
  NAND2XL U3668 ( .A(n3823), .B(n3822), .Y(n1396) );
  AOI22XL U3669 ( .A0(n4127), .A1(data_memory_dcache_headpc[7]), .B0(
        data_memory_writeback_headpc[7]), .B1(n4608), .Y(n3823) );
  OAI211XL U3670 ( .A0(data_memory_dcache_headpc[7]), .A1(n3821), .B0(n4129), 
        .C0(n3820), .Y(n3822) );
  OAI222XL U3671 ( .A0(n3752), .A1(n2120), .B0(n3744), .B1(n3802), .C0(n3819), 
        .C1(n3743), .Y(n1397) );
  NAND2XL U3672 ( .A(n3827), .B(n3826), .Y(n1398) );
  AOI22XL U3673 ( .A0(n4127), .A1(data_memory_dcache_headpc[5]), .B0(
        data_memory_writeback_headpc[5]), .B1(n4608), .Y(n3827) );
  OAI211XL U3674 ( .A0(data_memory_dcache_headpc[5]), .A1(n3825), .B0(n4129), 
        .C0(n3824), .Y(n3826) );
  OAI21XL U3675 ( .A0(n2033), .A1(n3819), .B0(n3786), .Y(n1399) );
  AOI22XL U3676 ( .A0(n4127), .A1(C303_DATA2_4), .B0(
        data_memory_writeback_headpc[4]), .B1(n4608), .Y(n3786) );
  OAI21XL U3677 ( .A0(n4545), .A1(n3819), .B0(n3787), .Y(n1400) );
  AOI22XL U3678 ( .A0(n4127), .A1(C303_DATA2_3), .B0(
        data_memory_writeback_headpc[3]), .B1(n4608), .Y(n3787) );
  OAI21XL U3679 ( .A0(n4546), .A1(n3819), .B0(n3785), .Y(n1401) );
  AOI22XL U3680 ( .A0(n4127), .A1(C303_DATA2_2), .B0(
        data_memory_writeback_headpc[2]), .B1(n4608), .Y(n3785) );
  OAI21XL U3681 ( .A0(n4549), .A1(n3819), .B0(n3788), .Y(n1402) );
  AOI22XL U3682 ( .A0(n4127), .A1(C303_DATA2_1), .B0(
        data_memory_writeback_headpc[1]), .B1(n4608), .Y(n3788) );
  AOI22XL U3683 ( .A0(n4127), .A1(C303_DATA2_0), .B0(
        data_memory_writeback_headpc[0]), .B1(n4608), .Y(n4128) );
  MXI2XL U3684 ( .A(n4591), .B(n4813), .S0(n4608), .Y(n1787) );
  MXI2XL U3685 ( .A(n4596), .B(n4595), .S0(n4608), .Y(n1788) );
  AOI2BB1XL U3686 ( .A0N(n4598), .A1N(n4594), .B0(n4593), .Y(n4596) );
  MXI2XL U3687 ( .A(n4605), .B(n4604), .S0(n4608), .Y(n1786) );
  OAI2BB2XL U3688 ( .B0(n4588), .B1(n4590), .A0N(n4587), .A1N(n4586), .Y(n1792) );
  OAI2BB1XL U3689 ( .A0N(n4949), .A1N(DM_idx[10]), .B0(n4669), .Y(n1404) );
  MXI2XL U3690 ( .A(n4594), .B(data_memory_datamem_cs[3]), .S0(n4126), .Y(
        n1791) );
  NAND2XL U3691 ( .A(n4585), .B(n4583), .Y(n4124) );
  OAI2BB1XL U3692 ( .A0N(IF_PC[6]), .A1N(n4793), .B0(n4321), .Y(n1767) );
  MXI2XL U3693 ( .A(IF_PC[6]), .B(n4319), .S0(IF_PC[5]), .Y(n4320) );
  OAI2BB1XL U3694 ( .A0N(n4796), .A1N(EXE_MEM_PCnxt[5]), .B0(n4795), .Y(n1768)
         );
  MXI2XL U3695 ( .A(n4794), .B(n4793), .S0(IF_PC[5]), .Y(n4795) );
  OAI2BB1XL U3696 ( .A0N(IF_PC[4]), .A1N(n4312), .B0(n4311), .Y(n1769) );
  MXI2XL U3697 ( .A(IF_PC[4]), .B(n4309), .S0(IF_PC[3]), .Y(n4310) );
  OAI2BB1XL U3698 ( .A0N(n4796), .A1N(EXE_MEM_PCnxt[3]), .B0(n4302), .Y(n1770)
         );
  MXI2XL U3699 ( .A(n4301), .B(n4312), .S0(IF_PC[3]), .Y(n4302) );
  OAI2BB1XL U3700 ( .A0N(n4796), .A1N(EXE_MEM_PCnxt[0]), .B0(n4280), .Y(n1773)
         );
  MXI2XL U3701 ( .A(n4399), .B(n4324), .S0(IF_PC[0]), .Y(n4280) );
  OAI2BB1XL U3702 ( .A0N(IF_PC[10]), .A1N(n4401), .B0(n4400), .Y(n1775) );
  AOI2BB1XL U3703 ( .A0N(IF_PC[9]), .A1N(IF_PC[10]), .B0(n4397), .Y(n4398) );
  AOI2BB1XL U3704 ( .A0N(n4396), .A1N(IF_PC[10]), .B0(n4395), .Y(n4397) );
  OAI211XL U3705 ( .A0(IF_PC[7]), .A1(IF_PC[8]), .B0(n4399), .C0(n4336), .Y(
        n4338) );
  OAI2BB1XL U3706 ( .A0N(IF_DEC_instr[15]), .A1N(n4407), .B0(n4264), .Y(n1718)
         );
  OAI2BB1XL U3707 ( .A0N(IF_DEC_instr[14]), .A1N(n4407), .B0(n4265), .Y(n1719)
         );
  OAI2BB1XL U3708 ( .A0N(IF_DEC_instr[13]), .A1N(n4407), .B0(n4404), .Y(n1720)
         );
  OAI2BB1XL U3709 ( .A0N(n3048), .A1N(n4407), .B0(n4151), .Y(n1722) );
  OAI2BB1XL U3710 ( .A0N(n4149), .A1N(n4407), .B0(n4148), .Y(n1723) );
  OAI2BB1XL U3711 ( .A0N(n4332), .A1N(n4407), .B0(n4259), .Y(n1724) );
  OAI2BB1XL U3712 ( .A0N(IF_DEC_instr[8]), .A1N(n4407), .B0(n4145), .Y(n1725)
         );
  OAI2BB1XL U3713 ( .A0N(IF_DEC_instr[4]), .A1N(n4407), .B0(n4300), .Y(n1729)
         );
  OAI2BB1XL U3714 ( .A0N(IF_DEC_instr[3]), .A1N(n4407), .B0(n4292), .Y(n1730)
         );
  OAI2BB1XL U3715 ( .A0N(IF_DEC_instr[2]), .A1N(n4407), .B0(n4281), .Y(n1731)
         );
  OAI2BB1XL U3716 ( .A0N(IF_DEC_instr[1]), .A1N(n4407), .B0(n4279), .Y(n1732)
         );
  OAI2BB1XL U3717 ( .A0N(IF_DEC_instr[0]), .A1N(n4407), .B0(n4406), .Y(n1733)
         );
  NOR3XL U3718 ( .A(n3623), .B(instruction_memory_instmem_cs[2]), .C(n4361), 
        .Y(instruction_memory_instmem_ns[2]) );
  AOI31XL U3719 ( .A0(n4366), .A1(n2023), .A2(instruction_memory_instmem_cs[1]), .B0(instruction_memory_instmem_cs[0]), .Y(n3623) );
  OR2XL U3720 ( .A(n4371), .B(n4370), .Y(instruction_memory_instmem_ns[1]) );
  AOI31XL U3721 ( .A0(n4366), .A1(n2023), .A2(n4365), .B0(n4364), .Y(n4371) );
  AOI21XL U3722 ( .A0(n4369), .A1(n4368), .B0(n4367), .Y(n4370) );
  OAI2BB2XL U3723 ( .B0(n4800), .B1(n4367), .A0N(n4361), .A1N(n4362), .Y(
        instruction_memory_instmem_ns[0]) );
  OAI211XL U3724 ( .A0(n3718), .A1(n3717), .B0(n3720), .C0(n3716), .Y(n1735)
         );
  OAI21XL U3725 ( .A0(n3718), .A1(n3692), .B0(n3691), .Y(n1736) );
  OAI2BB1XL U3726 ( .A0N(instruction_memory_icache_ready_idx[2]), .A1N(n4272), 
        .B0(n4271), .Y(n1737) );
  AOI31XL U3727 ( .A0(n4270), .A1(instruction_memory_icache_ready_idx[1]), 
        .A2(n4269), .B0(n4274), .Y(n4271) );
  OAI21XL U3728 ( .A0(instruction_memory_icache_ready_idx[1]), .A1(
        instruction_memory_N222), .B0(n4268), .Y(n4272) );
  OAI211XL U3729 ( .A0(n4268), .A1(n3721), .B0(n3720), .C0(n3719), .Y(n1738)
         );
  OAI2BB1XL U3730 ( .A0N(instruction_memory_icache_ready_idx[0]), .A1N(n4278), 
        .B0(n4267), .Y(n1739) );
  OAI22XL U3731 ( .A0(n4800), .A1(n3639), .B0(n3638), .B1(n4275), .Y(n1740) );
  OAI2BB1XL U3732 ( .A0N(instruction_memory_icache_ready_idx[5]), .A1N(n4278), 
        .B0(n4277), .Y(n1734) );
  AOI211XL U3733 ( .A0(n4276), .A1(n4275), .B0(n4274), .C0(n4273), .Y(n4277)
         );
  OAI21XL U3734 ( .A0(n4800), .A1(n3813), .B0(n4801), .Y(n1763) );
  OAI2BB1XL U3735 ( .A0N(instruction_memory_icache_headpc[1]), .A1N(n4359), 
        .B0(n4802), .Y(n1762) );
  OAI2BB1XL U3736 ( .A0N(instruction_memory_icache_headpc[2]), .A1N(n4359), 
        .B0(n4803), .Y(n1761) );
  OAI21XL U3737 ( .A0(n4800), .A1(n3887), .B0(n4804), .Y(n1760) );
  OAI21XL U3738 ( .A0(n4800), .A1(n3883), .B0(n4805), .Y(n1759) );
  OAI2BB1XL U3739 ( .A0N(instruction_memory_icache_headpc[5]), .A1N(n4359), 
        .B0(n4806), .Y(n1758) );
  OAI21XL U3740 ( .A0(n4800), .A1(n3851), .B0(n4807), .Y(n1757) );
  OAI2BB1XL U3741 ( .A0N(instruction_memory_icache_headpc[7]), .A1N(n4359), 
        .B0(n4808), .Y(n1756) );
  OAI2BB1XL U3742 ( .A0N(instruction_memory_icache_headpc[8]), .A1N(n4359), 
        .B0(n4809), .Y(n1755) );
  OAI21XL U3743 ( .A0(n4800), .A1(n3732), .B0(n4810), .Y(n1754) );
  OAI2BB1XL U3744 ( .A0N(instruction_memory_icache_headpc[10]), .A1N(n4359), 
        .B0(n4811), .Y(n1753) );
  OAI211XL U3745 ( .A0(n4263), .A1(n3644), .B0(n3643), .C0(n3642), .Y(n1764)
         );
  OAI21XL U3746 ( .A0(n3641), .A1(n2990), .B0(n3640), .Y(n3643) );
  NAND3XL U3747 ( .A(n3634), .B(n3633), .C(n3632), .Y(cpube_ns[1]) );
  AOI211XL U3748 ( .A0(n3631), .A1(n3630), .B0(n3629), .C0(n3628), .Y(n3634)
         );
  OAI2BB1XL U3749 ( .A0N(data_memory_dcache_dirty[2]), .A1N(n4581), .B0(n4580), 
        .Y(n1790) );
  NAND3BXL U3750 ( .AN(n4583), .B(n4585), .C(n4582), .Y(n4580) );
  OAI2BB2XL U3751 ( .B0(n4588), .B1(n4602), .A0N(n4585), .A1N(n4584), .Y(n1789) );
  NAND4XL U3752 ( .A(n3739), .B(n3738), .C(n3794), .D(n3737), .Y(n1779) );
  OAI211XL U3753 ( .A0(data_memory_dcache_ready_idx[5]), .A1(
        data_memory_dcache_ready_idx[6]), .B0(n3736), .C0(n3735), .Y(n3737) );
  NAND2XL U3754 ( .A(n3733), .B(data_memory_writeback_type[1]), .Y(n3739) );
  NAND2XL U3755 ( .A(n3798), .B(data_memory_dcache_ready_idx[6]), .Y(n3738) );
  OAI2BB1XL U3756 ( .A0N(n4874), .A1N(n4873), .B0(n4872), .Y(
        data_memory_dcache_wen) );
  INVXL U3757 ( .A(n2217), .Y(data_memory_dcache_d[9]) );
  AOI222XL U3758 ( .A0(n4587), .A1(DM_data[9]), .B0(rdata_m_inf[9]), .B1(n2216), .C0(n2215), .C1(data_memory_lookup_data[9]), .Y(n2217) );
  INVXL U3759 ( .A(n2214), .Y(data_memory_dcache_d[8]) );
  INVXL U3760 ( .A(n2213), .Y(data_memory_dcache_d[7]) );
  AOI222XL U3761 ( .A0(n4587), .A1(DM_data[7]), .B0(rdata_m_inf[7]), .B1(n2216), .C0(n2215), .C1(data_memory_lookup_data[7]), .Y(n2213) );
  AOI222XL U3762 ( .A0(n4587), .A1(DM_data[6]), .B0(rdata_m_inf[6]), .B1(n2216), .C0(n2215), .C1(data_memory_lookup_data[6]), .Y(n2212) );
  INVXL U3763 ( .A(n2211), .Y(data_memory_dcache_d[5]) );
  AOI222XL U3764 ( .A0(n4587), .A1(DM_data[5]), .B0(rdata_m_inf[5]), .B1(n2216), .C0(n2215), .C1(data_memory_lookup_data[5]), .Y(n2211) );
  INVXL U3765 ( .A(n2210), .Y(data_memory_dcache_d[4]) );
  AOI222XL U3766 ( .A0(n4587), .A1(DM_data[4]), .B0(rdata_m_inf[4]), .B1(n2216), .C0(n2215), .C1(data_memory_lookup_data[4]), .Y(n2210) );
  INVXL U3767 ( .A(n2209), .Y(data_memory_dcache_d[3]) );
  AOI222XL U3768 ( .A0(n4587), .A1(DM_data[3]), .B0(rdata_m_inf[3]), .B1(n2216), .C0(n2215), .C1(data_memory_lookup_data[3]), .Y(n2209) );
  INVXL U3769 ( .A(n2208), .Y(data_memory_dcache_d[2]) );
  AOI222XL U3770 ( .A0(n4587), .A1(DM_data[2]), .B0(rdata_m_inf[2]), .B1(n2216), .C0(n2215), .C1(data_memory_lookup_data[2]), .Y(n2208) );
  INVXL U3771 ( .A(n2207), .Y(data_memory_dcache_d[1]) );
  AOI222XL U3772 ( .A0(n4587), .A1(DM_data[1]), .B0(rdata_m_inf[1]), .B1(n2216), .C0(n2215), .C1(data_memory_lookup_data[1]), .Y(n2207) );
  INVXL U3773 ( .A(n2206), .Y(data_memory_dcache_d[15]) );
  AOI222XL U3774 ( .A0(n4587), .A1(DM_data[15]), .B0(rdata_m_inf[15]), .B1(
        n2216), .C0(n2215), .C1(data_memory_lookup_data[15]), .Y(n2206) );
  INVXL U3775 ( .A(n2205), .Y(data_memory_dcache_d[14]) );
  AOI222XL U3776 ( .A0(n4587), .A1(DM_data[14]), .B0(rdata_m_inf[14]), .B1(
        n2216), .C0(n2215), .C1(data_memory_lookup_data[14]), .Y(n2205) );
  INVXL U3777 ( .A(n2204), .Y(data_memory_dcache_d[13]) );
  AOI222XL U3778 ( .A0(n4587), .A1(DM_data[13]), .B0(rdata_m_inf[13]), .B1(
        n2216), .C0(n2215), .C1(data_memory_lookup_data[13]), .Y(n2204) );
  INVXL U3779 ( .A(n2203), .Y(data_memory_dcache_d[12]) );
  AOI222XL U3780 ( .A0(n4587), .A1(DM_data[12]), .B0(rdata_m_inf[12]), .B1(
        n2216), .C0(n2215), .C1(data_memory_lookup_data[12]), .Y(n2203) );
  INVXL U3781 ( .A(n2202), .Y(data_memory_dcache_d[11]) );
  AOI222XL U3782 ( .A0(n4587), .A1(DM_data[11]), .B0(rdata_m_inf[11]), .B1(
        n2216), .C0(n2215), .C1(data_memory_lookup_data[11]), .Y(n2202) );
  INVXL U3783 ( .A(n2201), .Y(data_memory_dcache_d[10]) );
  AOI222XL U3784 ( .A0(n4587), .A1(DM_data[10]), .B0(rdata_m_inf[10]), .B1(
        n2216), .C0(n2215), .C1(data_memory_lookup_data[10]), .Y(n2201) );
  INVXL U3785 ( .A(n2200), .Y(data_memory_dcache_d[0]) );
  AOI222XL U3786 ( .A0(n4587), .A1(DM_data[0]), .B0(rdata_m_inf[0]), .B1(n2216), .C0(n2215), .C1(data_memory_lookup_data[0]), .Y(n2200) );
  OAI22XL U3787 ( .A0(n3882), .A1(n3863), .B0(n4820), .B1(n3862), .Y(
        data_memory_dcache_a[6]) );
  OAI2BB2XL U3788 ( .B0(n3882), .B1(n3873), .A0N(
        data_memory_dcache_ready_idx[5]), .A1N(n3880), .Y(
        data_memory_dcache_a[5]) );
  XOR2XL U3789 ( .A(n3872), .B(n3871), .Y(n3873) );
  OAI22XL U3790 ( .A0(n3882), .A1(n3867), .B0(n4820), .B1(n3866), .Y(
        data_memory_dcache_a[4]) );
  XOR2XL U3791 ( .A(n3865), .B(n3864), .Y(n3867) );
  OAI2BB2XL U3792 ( .B0(n3882), .B1(n3878), .A0N(
        data_memory_dcache_ready_idx[3]), .A1N(n3880), .Y(
        data_memory_dcache_a[3]) );
  XOR2XL U3793 ( .A(n3877), .B(n3876), .Y(n3878) );
  XOR2XL U3794 ( .A(n4545), .B(DM_idx[3]), .Y(n3876) );
  OAI22XL U3795 ( .A0(n3882), .A1(n3870), .B0(n4820), .B1(n3869), .Y(
        data_memory_dcache_a[2]) );
  XOR2XL U3796 ( .A(n3874), .B(n3868), .Y(n3870) );
  XOR2XL U3797 ( .A(n4546), .B(DM_idx[2]), .Y(n3868) );
  OAI2BB2XL U3798 ( .B0(n3882), .B1(n3881), .A0N(
        data_memory_dcache_ready_idx[1]), .A1N(n3880), .Y(
        data_memory_dcache_a[1]) );
  OAI2BB2XL U3799 ( .B0(n4820), .B1(n4819), .A0N(n4818), .A1N(n4817), .Y(
        data_memory_dcache_a[0]) );
  AND2XL U3800 ( .A(n2023), .B(rdata_m_inf[25]), .Y(
        instruction_memory_icache_d[9]) );
  AND2XL U3801 ( .A(n2023), .B(rdata_m_inf[24]), .Y(
        instruction_memory_icache_d[8]) );
  AND2XL U3802 ( .A(n2023), .B(rdata_m_inf[23]), .Y(
        instruction_memory_icache_d[7]) );
  AND2XL U3803 ( .A(n2023), .B(rdata_m_inf[22]), .Y(
        instruction_memory_icache_d[6]) );
  AND2XL U3804 ( .A(n2023), .B(rdata_m_inf[21]), .Y(
        instruction_memory_icache_d[5]) );
  AND2XL U3805 ( .A(n2023), .B(rdata_m_inf[20]), .Y(
        instruction_memory_icache_d[4]) );
  AND2XL U3806 ( .A(n2023), .B(rdata_m_inf[19]), .Y(
        instruction_memory_icache_d[3]) );
  AND2XL U3807 ( .A(n2023), .B(rdata_m_inf[18]), .Y(
        instruction_memory_icache_d[2]) );
  AND2XL U3808 ( .A(n2023), .B(rdata_m_inf[17]), .Y(
        instruction_memory_icache_d[1]) );
  AND2XL U3809 ( .A(n2023), .B(rdata_m_inf[31]), .Y(
        instruction_memory_icache_d[15]) );
  AND2XL U3810 ( .A(n2023), .B(rdata_m_inf[30]), .Y(
        instruction_memory_icache_d[14]) );
  AND2XL U3811 ( .A(n2023), .B(rdata_m_inf[29]), .Y(
        instruction_memory_icache_d[13]) );
  AND2XL U3812 ( .A(n2023), .B(rdata_m_inf[28]), .Y(
        instruction_memory_icache_d[12]) );
  AND2XL U3813 ( .A(n2023), .B(rdata_m_inf[27]), .Y(
        instruction_memory_icache_d[11]) );
  AND2XL U3814 ( .A(n2023), .B(rdata_m_inf[26]), .Y(
        instruction_memory_icache_d[10]) );
  AND2XL U3815 ( .A(n2023), .B(rdata_m_inf[16]), .Y(
        instruction_memory_icache_d[0]) );
  OR2XL U3816 ( .A(n3688), .B(n3125), .Y(instruction_memory_icache_a[6]) );
  AOI211XL U3817 ( .A0(n3124), .A1(n3574), .B0(n4363), .C0(n3123), .Y(n3125)
         );
  NOR2X1 U3818 ( .A(n3124), .B(n3574), .Y(n3123) );
  OAI2BB1XL U3819 ( .A0N(n3122), .A1N(n3128), .B0(n3121), .Y(n3124) );
  OAI2BB2XL U3820 ( .B0(n3225), .B1(n4363), .A0N(n2023), .A1N(
        instruction_memory_icache_ready_idx[3]), .Y(
        instruction_memory_icache_a[3]) );
  XOR2XL U3821 ( .A(n3557), .B(n3556), .Y(n3225) );
  OAI2BB2XL U3822 ( .B0(n3552), .B1(n4363), .A0N(n2023), .A1N(
        instruction_memory_icache_ready_idx[2]), .Y(
        instruction_memory_icache_a[2]) );
  OAI2BB2XL U3823 ( .B0(n3218), .B1(n4363), .A0N(n2023), .A1N(
        instruction_memory_icache_ready_idx[1]), .Y(
        instruction_memory_icache_a[1]) );
  XOR2XL U3824 ( .A(n3546), .B(n3217), .Y(n3218) );
  NAND4X2 U3825 ( .A(n2577), .B(n2576), .C(n2575), .D(n2574), .Y(n4169) );
  XNOR2XL U3826 ( .A(n4130), .B(n4134), .Y(n2021) );
  INVXL U3827 ( .A(n3923), .Y(n3759) );
  AOI222XL U3828 ( .A0(n4108), .A1(n4559), .B0(n4108), .B1(n2019), .C0(n4559), 
        .C1(n2019), .Y(n4109) );
  NOR2X1 U3829 ( .A(n2280), .B(n2277), .Y(n2278) );
  XNOR2XL U3830 ( .A(n4743), .B(n4697), .Y(n4225) );
  XNOR2XL U3831 ( .A(n4689), .B(n4697), .Y(n4625) );
  XOR2XL U3832 ( .A(n4835), .B(n4697), .Y(n2871) );
  XNOR2XL U3833 ( .A(n2020), .B(n4697), .Y(n4701) );
  XOR2XL U3834 ( .A(n4220), .B(n4697), .Y(n4221) );
  AND2X2 U3835 ( .A(n3038), .B(n3761), .Y(n3041) );
  INVXL U3836 ( .A(cpufe_cs[1]), .Y(n2990) );
  INVX2 U3837 ( .A(C303_DATA2_3), .Y(n4545) );
  INVXL U3838 ( .A(C303_DATA2_1), .Y(n4549) );
  CLKINVX3 U3839 ( .A(n2268), .Y(n3048) );
  BUFX4 U3840 ( .A(n3897), .Y(n4737) );
  NAND2X2 U3841 ( .A(n3937), .B(n4732), .Y(n4639) );
  NAND4X1 U3842 ( .A(n2285), .B(n2284), .C(n2283), .D(n2282), .Y(n3979) );
  AOI21X1 U3843 ( .A0(n3965), .A1(n3964), .B0(n3963), .Y(n4130) );
  NAND2X2 U3844 ( .A(n2870), .B(n2869), .Y(n4697) );
  INVXL U3845 ( .A(n4697), .Y(n4223) );
  INVXL U3846 ( .A(n4477), .Y(n4478) );
  INVXL U3847 ( .A(n4481), .Y(n4484) );
  XNOR2XL U3848 ( .A(n3557), .B(n3556), .Y(n3558) );
  NAND2XL U3849 ( .A(n2741), .B(core_r11[11]), .Y(n2780) );
  NAND2XL U3850 ( .A(n2746), .B(core_r15[9]), .Y(n2262) );
  NAND2XL U3851 ( .A(n2741), .B(core_r11[6]), .Y(n2449) );
  INVXL U3852 ( .A(n3561), .Y(n3562) );
  XNOR2XL U3853 ( .A(n4693), .B(n4692), .Y(n4694) );
  XNOR2XL U3854 ( .A(n4169), .B(n4710), .Y(n4624) );
  NOR2X1 U3855 ( .A(n2267), .B(n2266), .Y(n2285) );
  INVXL U3856 ( .A(n4710), .Y(n3984) );
  XNOR2XL U3857 ( .A(n4743), .B(n4693), .Y(n3676) );
  INVXL U3858 ( .A(n4706), .Y(n4462) );
  AOI222XL U3859 ( .A0(n2046), .A1(n2045), .B0(n2044), .B1(n2043), .C0(n2042), 
        .C1(n2041), .Y(n2047) );
  ADDFHX1 U3860 ( .A(n4683), .B(n4682), .CI(n4681), .CO(n4761), .S(n4762) );
  NAND2XL U3861 ( .A(n2800), .B(core_r3[2]), .Y(n2706) );
  NAND2XL U3862 ( .A(n2800), .B(core_r3[4]), .Y(n2524) );
  NAND2XL U3863 ( .A(n2808), .B(core_r13[6]), .Y(n2436) );
  OAI21X1 U3864 ( .A0(n3923), .A1(n3922), .B0(n3921), .Y(n3965) );
  INVXL U3865 ( .A(n3665), .Y(n3057) );
  INVXL U3866 ( .A(n3185), .Y(n3183) );
  INVXL U3867 ( .A(n2957), .Y(n2958) );
  INVXL U3868 ( .A(n4103), .Y(n4114) );
  NOR2X1 U3869 ( .A(n2714), .B(n2713), .Y(n2722) );
  NOR2X1 U3870 ( .A(n2569), .B(n2568), .Y(n2577) );
  INVX2 U3871 ( .A(n3060), .Y(n4707) );
  INVXL U3872 ( .A(n3076), .Y(n3682) );
  XNOR2XL U3873 ( .A(n3620), .B(n3619), .Y(n3621) );
  OAI2BB1XL U3874 ( .A0N(DM_idx[2]), .A1N(n4546), .B0(n3874), .Y(n3875) );
  INVXL U3875 ( .A(n4537), .Y(n4538) );
  XOR2XL U3876 ( .A(n3700), .B(n3699), .Y(n3712) );
  XNOR2XL U3877 ( .A(n3958), .B(n3957), .Y(n3959) );
  INVXL U3878 ( .A(n2919), .Y(n2218) );
  XOR2XL U3879 ( .A(n4680), .B(n4238), .Y(n4258) );
  INVXL U3880 ( .A(IF_PC[3]), .Y(n4382) );
  XNOR2XL U3881 ( .A(n4445), .B(n4444), .Y(n4453) );
  INVXL U3882 ( .A(C303_DATA2_2), .Y(n4546) );
  INVXL U3883 ( .A(n4799), .Y(n3194) );
  AOI222XL U3884 ( .A0(n4587), .A1(DM_data[8]), .B0(rdata_m_inf[8]), .B1(n2216), .C0(n2215), .C1(data_memory_lookup_data[8]), .Y(n2214) );
  XOR2XL U3885 ( .A(n3859), .B(n3858), .Y(n3863) );
  INVXL U3886 ( .A(n3135), .Y(n1321) );
  INVXL U3887 ( .A(n2992), .Y(n1771) );
  INVXL U3888 ( .A(n2212), .Y(data_memory_dcache_d[6]) );
  BUFXL U3889 ( .A(araddr_m_inf[12]), .Y(arvalid_m_inf[0]) );
  BUFXL U3890 ( .A(araddr_m_inf[44]), .Y(arvalid_m_inf[1]) );
  INVXL U3891 ( .A(DM_idx[10]), .Y(n2051) );
  ADDHXL U3892 ( .A(data_memory_dcache_headpc[10]), .B(n2024), .CO(n2049), .S(
        n2050) );
  ADDHXL U3893 ( .A(data_memory_dcache_headpc[9]), .B(n2025), .CO(n2024), .S(
        n2044) );
  INVXL U3894 ( .A(DM_idx[9]), .Y(n2043) );
  INVXL U3895 ( .A(data_memory_dcache_headpc[5]), .Y(n2032) );
  OAI2BB1XL U3896 ( .A0N(n2032), .A1N(DM_idx[5]), .B0(C303_DATA2_4), .Y(n2026)
         );
  OAI22XL U3897 ( .A0(DM_idx[4]), .A1(n2026), .B0(n2032), .B1(DM_idx[5]), .Y(
        n2038) );
  INVXL U3898 ( .A(data_memory_dcache_headpc[6]), .Y(n2120) );
  INVXL U3899 ( .A(C303_DATA2_4), .Y(n2033) );
  NAND2XL U3900 ( .A(DM_idx[3]), .B(n4545), .Y(n2031) );
  INVXL U3901 ( .A(DM_idx[0]), .Y(n4511) );
  NAND2XL U3902 ( .A(n4511), .B(C303_DATA2_0), .Y(n4815) );
  INVXL U3903 ( .A(DM_idx[1]), .Y(n4513) );
  OAI22XL U3904 ( .A0(n4815), .A1(n2027), .B0(DM_idx[1]), .B1(n4549), .Y(n3874) );
  NAND2BXL U3905 ( .AN(C303_DATA2_2), .B(DM_idx[2]), .Y(n2030) );
  AOI31X1 U3906 ( .A0(n2031), .A1(n3874), .A2(n2030), .B0(n2029), .Y(n2052) );
  AOI221XL U3907 ( .A0(DM_idx[4]), .A1(n2033), .B0(DM_idx[5]), .B1(n2032), 
        .C0(n2052), .Y(n2036) );
  OAI2BB1XL U3908 ( .A0N(data_memory_dcache_headpc[7]), .A1N(DM_idx[7]), .B0(
        data_memory_dcache_headpc[6]), .Y(n2034) );
  OAI22XL U3909 ( .A0(DM_idx[6]), .A1(n2034), .B0(data_memory_dcache_headpc[7]), .B1(DM_idx[7]), .Y(n2035) );
  ADDHXL U3910 ( .A(data_memory_dcache_headpc[8]), .B(
        data_memory_dcache_headpc[7]), .CO(n2025), .S(n2042) );
  INVXL U3911 ( .A(data_memory_dcache_headpc[10]), .Y(n4261) );
  INVXL U3912 ( .A(DM_idx[4]), .Y(n4408) );
  INVXL U3913 ( .A(DM_idx[6]), .Y(n4516) );
  INVXL U3914 ( .A(DM_idx[7]), .Y(n4518) );
  INVXL U3915 ( .A(DM_idx[8]), .Y(n4520) );
  INVXL U3916 ( .A(data_memory_dcache_ready_idx[3]), .Y(n3659) );
  OAI211XL U3917 ( .A0(DM_idx[10]), .A1(n4261), .B0(n2065), .C0(n2064), .Y(
        n2066) );
  INVXL U3918 ( .A(data_memory_dcache_dirty[1]), .Y(n4594) );
  INVXL U3919 ( .A(data_memory_dcache_dirty[0]), .Y(n4590) );
  INVXL U3920 ( .A(data_memory_dcache_dirty[2]), .Y(n3184) );
  INVXL U3921 ( .A(data_memory_datamem_cs[1]), .Y(n2994) );
  INVXL U3922 ( .A(data_memory_datamem_cs[3]), .Y(n2947) );
  INVXL U3923 ( .A(data_memory_datamem_js[2]), .Y(n3206) );
  OAI21X1 U3924 ( .A0(n2094), .A1(n2097), .B0(n2073), .Y(
        data_memory_datamem_ns[2]) );
  INVXL U3925 ( .A(n3205), .Y(n2074) );
  NOR2X1 U3926 ( .A(n2101), .B(n3861), .Y(n2080) );
  NAND4X1 U3927 ( .A(n2081), .B(n2080), .C(n2088), .D(n2079), .Y(
        data_memory_datamem_ns[3]) );
  INVXL U3928 ( .A(data_memory_writeback_count[0]), .Y(n3854) );
  INVXL U3929 ( .A(data_memory_writeback_count[1]), .Y(n4607) );
  INVXL U3930 ( .A(data_memory_writeback_count[3]), .Y(n3790) );
  INVXL U3931 ( .A(data_memory_writeback_count[4]), .Y(n2082) );
  NAND2XL U3932 ( .A(n3790), .B(n2082), .Y(n2083) );
  INVXL U3933 ( .A(n3648), .Y(n2084) );
  INVXL U3934 ( .A(arready_m_inf[0]), .Y(n2086) );
  NAND2XL U3935 ( .A(n2098), .B(n2097), .Y(n2099) );
  NAND2XL U3936 ( .A(n2099), .B(n4611), .Y(n2107) );
  INVXL U3937 ( .A(wready_m_inf_0_), .Y(n2103) );
  NAND2XL U3938 ( .A(n2107), .B(n2106), .Y(data_memory_datamem_ns[0]) );
  NAND2XL U3939 ( .A(n2108), .B(data_memory_datamem_ns[0]), .Y(n3137) );
  NOR3X1 U3940 ( .A(n3137), .B(data_memory_datamem_ns[3]), .C(
        data_memory_datamem_ns[1]), .Y(n4817) );
  NAND2XL U3941 ( .A(n4817), .B(n4871), .Y(n4873) );
  NOR2X1 U3942 ( .A(n2149), .B(n2132), .Y(n2110) );
  NAND2XL U3943 ( .A(n4546), .B(data_memory_lookup_pc[2]), .Y(n2150) );
  OAI21XL U3944 ( .A0(n2132), .A1(n2150), .B0(n2133), .Y(n2109) );
  AOI21X1 U3945 ( .A0(n2110), .A1(n2131), .B0(n2109), .Y(n2167) );
  INVX2 U3946 ( .A(n2167), .Y(n2177) );
  INVXL U3947 ( .A(n2117), .Y(n2128) );
  NAND2XL U3948 ( .A(n2033), .B(data_memory_lookup_pc[4]), .Y(n2127) );
  INVXL U3949 ( .A(n2127), .Y(n2111) );
  AOI21XL U3950 ( .A0(n2177), .A1(n2128), .B0(n2111), .Y(n2114) );
  INVXL U3951 ( .A(n2119), .Y(n2112) );
  XOR2X1 U3952 ( .A(n2114), .B(n2113), .Y(n2116) );
  OAI21XL U3953 ( .A0(n2119), .A1(n2127), .B0(n2118), .Y(n2171) );
  AOI21X1 U3954 ( .A0(n2164), .A1(n2177), .B0(n2171), .Y(n2123) );
  INVXL U3955 ( .A(n2173), .Y(n2121) );
  XOR2X1 U3956 ( .A(n2123), .B(n2122), .Y(n2124) );
  INVXL U3957 ( .A(data_memory_dcache_ready_idx[6]), .Y(n3862) );
  INVXL U3958 ( .A(data_memory_dcache_ready_idx[4]), .Y(n3866) );
  INVXL U3959 ( .A(n2132), .Y(n2134) );
  INVXL U3960 ( .A(n2140), .Y(n2142) );
  INVXL U3961 ( .A(data_memory_dcache_ready_idx[1]), .Y(n3725) );
  XNOR2XL U3962 ( .A(n4816), .B(data_memory_lookup_pc[0]), .Y(n2146) );
  INVXL U3963 ( .A(data_memory_dcache_ready_idx[0]), .Y(n4819) );
  INVXL U3964 ( .A(data_memory_dcache_ready_idx[2]), .Y(n3869) );
  NAND2X1 U3965 ( .A(n2160), .B(n2159), .Y(n2198) );
  NAND2XL U3966 ( .A(n2164), .B(n2121), .Y(n2170) );
  INVXL U3967 ( .A(n2171), .Y(n2174) );
  OAI21XL U3968 ( .A0(n2174), .A1(n2173), .B0(n2172), .Y(n2175) );
  AOI21XL U3969 ( .A0(n2177), .A1(n2176), .B0(n2175), .Y(n2181) );
  NAND2XL U3970 ( .A(n2196), .B(n2195), .Y(n2197) );
  NOR2X2 U3971 ( .A(n2198), .B(n2197), .Y(n2944) );
  AND2X1 U3972 ( .A(n2944), .B(n2199), .Y(n2215) );
  INVXL U3973 ( .A(IF_DEC_instr[13]), .Y(n4414) );
  NAND2BX2 U3974 ( .AN(IF_DEC_instr[6]), .B(IF_DEC_instr[5]), .Y(n2227) );
  NOR2X1 U3975 ( .A(n2246), .B(n2227), .Y(n2219) );
  BUFX4 U3976 ( .A(n2219), .Y(n2798) );
  NAND2XL U3977 ( .A(n2798), .B(core_r5[9]), .Y(n2226) );
  INVX2 U3978 ( .A(IF_DEC_instr[7]), .Y(n2221) );
  NOR2X1 U3979 ( .A(n2245), .B(n2227), .Y(n2704) );
  BUFX4 U3980 ( .A(n2704), .Y(n2799) );
  NAND2XL U3981 ( .A(n2799), .B(core_r1[9]), .Y(n2225) );
  NAND2X2 U3982 ( .A(IF_DEC_instr[6]), .B(IF_DEC_instr[5]), .Y(n2229) );
  NOR2X1 U3983 ( .A(n2245), .B(n2229), .Y(n2222) );
  NAND2XL U3984 ( .A(n2800), .B(core_r3[9]), .Y(n2224) );
  NAND2XL U3985 ( .A(n2801), .B(core_r7[9]), .Y(n2223) );
  NAND4XL U3986 ( .A(n2226), .B(n2225), .C(n2224), .D(n2223), .Y(n2235) );
  NAND2BX4 U3987 ( .AN(IF_DEC_instr[7]), .B(IF_DEC_instr[8]), .Y(n2240) );
  NOR2X1 U3988 ( .A(n2240), .B(n2227), .Y(n2527) );
  BUFX4 U3989 ( .A(n2527), .Y(n2806) );
  NAND2XL U3990 ( .A(n2806), .B(core_r9[9]), .Y(n2233) );
  NAND2XL U3991 ( .A(n2807), .B(core_r11[9]), .Y(n2232) );
  NAND2X2 U3992 ( .A(IF_DEC_instr[7]), .B(IF_DEC_instr[8]), .Y(n2239) );
  NOR2X1 U3993 ( .A(n2227), .B(n2239), .Y(n2228) );
  BUFX4 U3994 ( .A(n2228), .Y(n2808) );
  NAND2XL U3995 ( .A(n2808), .B(core_r13[9]), .Y(n2231) );
  NAND2XL U3996 ( .A(n2809), .B(core_r15[9]), .Y(n2230) );
  NAND4XL U3997 ( .A(n2233), .B(n2232), .C(n2231), .D(n2230), .Y(n2234) );
  NOR2X1 U3998 ( .A(n2235), .B(n2234), .Y(n2252) );
  INVX2 U3999 ( .A(IF_DEC_instr[5]), .Y(n2236) );
  NAND2BX2 U4000 ( .AN(IF_DEC_instr[6]), .B(n2236), .Y(n2247) );
  NAND2XL U4001 ( .A(n2237), .B(core_r8[9]), .Y(n2238) );
  OAI2BB1XL U4002 ( .A0N(core_r12[9]), .A1N(n2826), .B0(n2238), .Y(n2243) );
  NOR2X2 U4003 ( .A(n2240), .B(n2244), .Y(n2824) );
  NAND2XL U4004 ( .A(n2824), .B(core_r10[9]), .Y(n2241) );
  OAI2BB1XL U4005 ( .A0N(core_r14[9]), .A1N(n2827), .B0(n2241), .Y(n2242) );
  BUFX3 U4006 ( .A(n2817), .Y(n2775) );
  AOI22XL U4007 ( .A0(n2775), .A1(core_r0[9]), .B0(n2248), .B1(core_r4[9]), 
        .Y(n2249) );
  BUFX4 U4008 ( .A(IF_DEC_instr[9]), .Y(n4332) );
  NAND2BX4 U4009 ( .AN(IF_DEC_instr[10]), .B(n4332), .Y(n2275) );
  INVX3 U4010 ( .A(IF_DEC_instr[11]), .Y(n2268) );
  NAND2X4 U4011 ( .A(n2268), .B(IF_DEC_instr[12]), .Y(n2254) );
  NOR2X4 U4012 ( .A(n2275), .B(n2254), .Y(n2854) );
  NAND2XL U4013 ( .A(n2854), .B(core_r9[9]), .Y(n2258) );
  NAND2BX4 U4014 ( .AN(IF_DEC_instr[9]), .B(n4149), .Y(n2279) );
  NOR2X4 U4015 ( .A(n2279), .B(n2254), .Y(n2855) );
  NAND2XL U4016 ( .A(n2855), .B(core_r10[9]), .Y(n2257) );
  INVX2 U4017 ( .A(IF_DEC_instr[9]), .Y(n2253) );
  NAND2BX4 U4018 ( .AN(IF_DEC_instr[10]), .B(n2253), .Y(n2277) );
  NOR2X4 U4019 ( .A(n2277), .B(n2254), .Y(n2856) );
  NAND2XL U4020 ( .A(n2856), .B(core_r8[9]), .Y(n2256) );
  NAND2X2 U4021 ( .A(IF_DEC_instr[9]), .B(IF_DEC_instr[10]), .Y(n2276) );
  NOR2X4 U4022 ( .A(n2254), .B(n2276), .Y(n2741) );
  NAND2XL U4023 ( .A(n2741), .B(core_r11[9]), .Y(n2255) );
  NAND4XL U4024 ( .A(n2258), .B(n2257), .C(n2256), .D(n2255), .Y(n2267) );
  BUFX2 U4025 ( .A(IF_DEC_instr[11]), .Y(n2259) );
  NAND2X4 U4026 ( .A(IF_DEC_instr[12]), .B(n2259), .Y(n2261) );
  NOR2X4 U4027 ( .A(n2275), .B(n2261), .Y(n2861) );
  NAND2XL U4028 ( .A(n2861), .B(core_r13[9]), .Y(n2265) );
  NOR2X4 U4029 ( .A(n2277), .B(n2261), .Y(n2862) );
  NAND2XL U4030 ( .A(n2862), .B(core_r12[9]), .Y(n2264) );
  NOR2X4 U4031 ( .A(n2261), .B(n2279), .Y(n2260) );
  NAND2XL U4032 ( .A(n2260), .B(core_r14[9]), .Y(n2263) );
  NOR2X4 U4033 ( .A(n2276), .B(n2261), .Y(n2746) );
  NAND4XL U4034 ( .A(n2265), .B(n2264), .C(n2263), .D(n2262), .Y(n2266) );
  NAND2X4 U4035 ( .A(n2274), .B(n3048), .Y(n2270) );
  NOR2X2 U4036 ( .A(n2279), .B(n2270), .Y(n2845) );
  NOR2X4 U4037 ( .A(n2270), .B(n2277), .Y(n2846) );
  NAND2XL U4038 ( .A(n2846), .B(core_r4[9]), .Y(n2269) );
  OAI2BB1XL U4039 ( .A0N(core_r6[9]), .A1N(n2845), .B0(n2269), .Y(n2273) );
  NOR2X4 U4040 ( .A(n2275), .B(n2270), .Y(n2844) );
  NAND2XL U4041 ( .A(n2844), .B(core_r5[9]), .Y(n2271) );
  OAI2BB1XL U4042 ( .A0N(core_r7[9]), .A1N(n2847), .B0(n2271), .Y(n2272) );
  NOR2X1 U4043 ( .A(n2273), .B(n2272), .Y(n2284) );
  INVX4 U4044 ( .A(IF_DEC_instr[12]), .Y(n2274) );
  NAND2X4 U4045 ( .A(n2268), .B(n2274), .Y(n2280) );
  NOR2X4 U4046 ( .A(n2280), .B(n2276), .Y(n2839) );
  AOI22XL U4047 ( .A0(n2614), .A1(core_r1[9]), .B0(n2839), .B1(core_r3[9]), 
        .Y(n2283) );
  BUFX8 U4048 ( .A(n2278), .Y(n2837) );
  NOR2X2 U4049 ( .A(n2280), .B(n2279), .Y(n2281) );
  BUFX8 U4050 ( .A(n2281), .Y(n2838) );
  AOI22XL U4051 ( .A0(n2837), .A1(core_r0[9]), .B0(n2838), .B1(core_r2[9]), 
        .Y(n2282) );
  NAND2XL U4052 ( .A(n2798), .B(core_r5[10]), .Y(n2289) );
  NAND2XL U4053 ( .A(n2799), .B(core_r1[10]), .Y(n2288) );
  NAND2XL U4054 ( .A(n2800), .B(core_r3[10]), .Y(n2287) );
  NAND2XL U4055 ( .A(n2801), .B(core_r7[10]), .Y(n2286) );
  NAND4XL U4056 ( .A(n2289), .B(n2288), .C(n2287), .D(n2286), .Y(n2295) );
  NAND2XL U4057 ( .A(n2806), .B(core_r9[10]), .Y(n2293) );
  NAND2XL U4058 ( .A(n2807), .B(core_r11[10]), .Y(n2292) );
  NAND2XL U4059 ( .A(n2808), .B(core_r13[10]), .Y(n2291) );
  NAND2XL U4060 ( .A(n2809), .B(core_r15[10]), .Y(n2290) );
  NAND4XL U4061 ( .A(n2293), .B(n2292), .C(n2291), .D(n2290), .Y(n2294) );
  NAND2XL U4062 ( .A(n2237), .B(core_r8[10]), .Y(n2296) );
  OAI2BB1XL U4063 ( .A0N(core_r12[10]), .A1N(n2826), .B0(n2296), .Y(n2299) );
  NAND2XL U4064 ( .A(n2824), .B(core_r10[10]), .Y(n2297) );
  OAI2BB1XL U4065 ( .A0N(core_r14[10]), .A1N(n2827), .B0(n2297), .Y(n2298) );
  AOI22XL U4066 ( .A0(n2775), .A1(core_r0[10]), .B0(n2248), .B1(core_r4[10]), 
        .Y(n2300) );
  NAND2XL U4067 ( .A(n2854), .B(core_r9[10]), .Y(n2307) );
  NAND2XL U4068 ( .A(n2855), .B(core_r10[10]), .Y(n2306) );
  NAND2XL U4069 ( .A(n2856), .B(core_r8[10]), .Y(n2305) );
  NAND2XL U4070 ( .A(n2741), .B(core_r11[10]), .Y(n2304) );
  NAND4XL U4071 ( .A(n2307), .B(n2306), .C(n2305), .D(n2304), .Y(n2313) );
  NAND2XL U4072 ( .A(n2861), .B(core_r13[10]), .Y(n2311) );
  NAND2XL U4073 ( .A(n2862), .B(core_r12[10]), .Y(n2310) );
  NAND2XL U4074 ( .A(n2260), .B(core_r14[10]), .Y(n2309) );
  NAND2XL U4075 ( .A(n2746), .B(core_r15[10]), .Y(n2308) );
  NAND4XL U4076 ( .A(n2311), .B(n2310), .C(n2309), .D(n2308), .Y(n2312) );
  NAND2XL U4077 ( .A(n2846), .B(core_r4[10]), .Y(n2314) );
  OAI2BB1XL U4078 ( .A0N(core_r6[10]), .A1N(n2845), .B0(n2314), .Y(n2317) );
  NAND2XL U4079 ( .A(n2844), .B(core_r5[10]), .Y(n2315) );
  OAI2BB1XL U4080 ( .A0N(core_r7[10]), .A1N(n2847), .B0(n2315), .Y(n2316) );
  AOI22XL U4081 ( .A0(n2614), .A1(core_r1[10]), .B0(n2839), .B1(core_r3[10]), 
        .Y(n2319) );
  AOI22XL U4082 ( .A0(n2837), .A1(core_r0[10]), .B0(n2838), .B1(core_r2[10]), 
        .Y(n2318) );
  OAI22XL U4083 ( .A0(n4866), .A1(n3979), .B0(n4826), .B1(n4154), .Y(n4485) );
  NAND2XL U4084 ( .A(n2798), .B(core_r5[14]), .Y(n2325) );
  NAND2XL U4085 ( .A(n2799), .B(core_r1[14]), .Y(n2324) );
  NAND2XL U4086 ( .A(n2800), .B(core_r3[14]), .Y(n2323) );
  NAND2XL U4087 ( .A(n2801), .B(core_r7[14]), .Y(n2322) );
  NAND4XL U4088 ( .A(n2325), .B(n2324), .C(n2323), .D(n2322), .Y(n2331) );
  NAND2XL U4089 ( .A(n2806), .B(core_r9[14]), .Y(n2329) );
  NAND2XL U4090 ( .A(n2807), .B(core_r11[14]), .Y(n2328) );
  NAND2XL U4091 ( .A(n2808), .B(core_r13[14]), .Y(n2327) );
  NAND2XL U4092 ( .A(n2809), .B(core_r15[14]), .Y(n2326) );
  NAND4XL U4093 ( .A(n2329), .B(n2328), .C(n2327), .D(n2326), .Y(n2330) );
  NAND2XL U4094 ( .A(n2237), .B(core_r8[14]), .Y(n2332) );
  OAI2BB1XL U4095 ( .A0N(core_r12[14]), .A1N(n2826), .B0(n2332), .Y(n2335) );
  NAND2XL U4096 ( .A(n2824), .B(core_r10[14]), .Y(n2333) );
  OAI2BB1XL U4097 ( .A0N(core_r14[14]), .A1N(n2827), .B0(n2333), .Y(n2334) );
  AOI22XL U4098 ( .A0(n2775), .A1(core_r0[14]), .B0(n2248), .B1(core_r4[14]), 
        .Y(n2336) );
  NAND2XL U4099 ( .A(n2854), .B(core_r9[14]), .Y(n2343) );
  NAND2XL U4100 ( .A(n2855), .B(core_r10[14]), .Y(n2342) );
  NAND2XL U4101 ( .A(n2856), .B(core_r8[14]), .Y(n2341) );
  NAND2XL U4102 ( .A(n2741), .B(core_r11[14]), .Y(n2340) );
  NAND4XL U4103 ( .A(n2343), .B(n2342), .C(n2341), .D(n2340), .Y(n2349) );
  NAND2XL U4104 ( .A(n2861), .B(core_r13[14]), .Y(n2347) );
  NAND2XL U4105 ( .A(n2862), .B(core_r12[14]), .Y(n2346) );
  NAND2XL U4106 ( .A(n2260), .B(core_r14[14]), .Y(n2345) );
  NAND2XL U4107 ( .A(n2746), .B(core_r15[14]), .Y(n2344) );
  NAND4XL U4108 ( .A(n2347), .B(n2346), .C(n2345), .D(n2344), .Y(n2348) );
  NAND2XL U4109 ( .A(n2846), .B(core_r4[14]), .Y(n2350) );
  OAI2BB1XL U4110 ( .A0N(core_r6[14]), .A1N(n2845), .B0(n2350), .Y(n2353) );
  NAND2XL U4111 ( .A(n2844), .B(core_r5[14]), .Y(n2351) );
  OAI2BB1XL U4112 ( .A0N(core_r7[14]), .A1N(n2847), .B0(n2351), .Y(n2352) );
  AOI22XL U4113 ( .A0(n2837), .A1(core_r0[14]), .B0(n2838), .B1(core_r2[14]), 
        .Y(n2354) );
  NAND2XL U4114 ( .A(n2798), .B(core_r5[15]), .Y(n2361) );
  NAND2XL U4115 ( .A(n2799), .B(core_r1[15]), .Y(n2360) );
  NAND2XL U4116 ( .A(n2800), .B(core_r3[15]), .Y(n2359) );
  NAND2XL U4117 ( .A(n2801), .B(core_r7[15]), .Y(n2358) );
  NAND4XL U4118 ( .A(n2361), .B(n2360), .C(n2359), .D(n2358), .Y(n2367) );
  NAND2XL U4119 ( .A(n2806), .B(core_r9[15]), .Y(n2365) );
  NAND2XL U4120 ( .A(n2807), .B(core_r11[15]), .Y(n2364) );
  NAND2XL U4121 ( .A(n2808), .B(core_r13[15]), .Y(n2363) );
  NAND2XL U4122 ( .A(n2809), .B(core_r15[15]), .Y(n2362) );
  NAND4XL U4123 ( .A(n2365), .B(n2364), .C(n2363), .D(n2362), .Y(n2366) );
  NOR2X1 U4124 ( .A(n2367), .B(n2366), .Y(n2375) );
  NAND2XL U4125 ( .A(n2237), .B(core_r8[15]), .Y(n2368) );
  OAI2BB1XL U4126 ( .A0N(core_r12[15]), .A1N(n2826), .B0(n2368), .Y(n2371) );
  NAND2XL U4127 ( .A(n2824), .B(core_r10[15]), .Y(n2369) );
  OAI2BB1XL U4128 ( .A0N(core_r14[15]), .A1N(n2827), .B0(n2369), .Y(n2370) );
  AOI22XL U4129 ( .A0(n2816), .A1(core_r6[15]), .B0(n2818), .B1(core_r2[15]), 
        .Y(n2373) );
  AOI22XL U4130 ( .A0(n2775), .A1(core_r0[15]), .B0(n2248), .B1(core_r4[15]), 
        .Y(n2372) );
  NAND2XL U4131 ( .A(n2854), .B(core_r9[15]), .Y(n2379) );
  NAND2XL U4132 ( .A(n2855), .B(core_r10[15]), .Y(n2378) );
  NAND2XL U4133 ( .A(n2856), .B(core_r8[15]), .Y(n2377) );
  NAND2XL U4134 ( .A(n2741), .B(core_r11[15]), .Y(n2376) );
  NAND4XL U4135 ( .A(n2379), .B(n2378), .C(n2377), .D(n2376), .Y(n2385) );
  NAND2XL U4136 ( .A(n2861), .B(core_r13[15]), .Y(n2383) );
  NAND2XL U4137 ( .A(n2862), .B(core_r12[15]), .Y(n2382) );
  NAND2XL U4138 ( .A(n2260), .B(core_r14[15]), .Y(n2381) );
  NAND2XL U4139 ( .A(n2746), .B(core_r15[15]), .Y(n2380) );
  NAND4XL U4140 ( .A(n2383), .B(n2382), .C(n2381), .D(n2380), .Y(n2384) );
  NAND2XL U4141 ( .A(n2846), .B(core_r4[15]), .Y(n2386) );
  OAI2BB1XL U4142 ( .A0N(core_r6[15]), .A1N(n2845), .B0(n2386), .Y(n2389) );
  NAND2XL U4143 ( .A(n2844), .B(core_r5[15]), .Y(n2387) );
  OAI2BB1XL U4144 ( .A0N(core_r7[15]), .A1N(n2847), .B0(n2387), .Y(n2388) );
  AOI22XL U4145 ( .A0(n2614), .A1(core_r1[15]), .B0(n2839), .B1(core_r3[15]), 
        .Y(n2391) );
  AOI22XL U4146 ( .A0(n2837), .A1(core_r0[15]), .B0(n2838), .B1(core_r2[15]), 
        .Y(n2390) );
  NAND2XL U4147 ( .A(n4841), .B(n4780), .Y(n4499) );
  NAND2XL U4148 ( .A(n2798), .B(core_r5[8]), .Y(n2398) );
  NAND2XL U4149 ( .A(n2799), .B(core_r1[8]), .Y(n2397) );
  NAND2XL U4150 ( .A(n2800), .B(core_r3[8]), .Y(n2396) );
  NAND2XL U4151 ( .A(n2801), .B(core_r7[8]), .Y(n2395) );
  NAND4XL U4152 ( .A(n2398), .B(n2397), .C(n2396), .D(n2395), .Y(n2404) );
  NAND2XL U4153 ( .A(n2806), .B(core_r9[8]), .Y(n2402) );
  NAND2XL U4154 ( .A(n2807), .B(core_r11[8]), .Y(n2401) );
  NAND2XL U4155 ( .A(n2808), .B(core_r13[8]), .Y(n2400) );
  NAND2XL U4156 ( .A(n2809), .B(core_r15[8]), .Y(n2399) );
  NAND4XL U4157 ( .A(n2402), .B(n2401), .C(n2400), .D(n2399), .Y(n2403) );
  NAND2XL U4158 ( .A(n2237), .B(core_r8[8]), .Y(n2405) );
  OAI2BB1XL U4159 ( .A0N(core_r12[8]), .A1N(n2826), .B0(n2405), .Y(n2408) );
  NAND2XL U4160 ( .A(n2824), .B(core_r10[8]), .Y(n2406) );
  OAI2BB1XL U4161 ( .A0N(core_r14[8]), .A1N(n2827), .B0(n2406), .Y(n2407) );
  AOI22XL U4162 ( .A0(n2775), .A1(core_r0[8]), .B0(n2248), .B1(core_r4[8]), 
        .Y(n2409) );
  NAND4X2 U4163 ( .A(n2412), .B(n2411), .C(n2410), .D(n2409), .Y(n4637) );
  NAND2XL U4164 ( .A(n2854), .B(core_r9[8]), .Y(n2416) );
  NAND2XL U4165 ( .A(n2855), .B(core_r10[8]), .Y(n2415) );
  NAND2XL U4166 ( .A(n2856), .B(core_r8[8]), .Y(n2414) );
  NAND2XL U4167 ( .A(n2741), .B(core_r11[8]), .Y(n2413) );
  NAND4XL U4168 ( .A(n2416), .B(n2415), .C(n2414), .D(n2413), .Y(n2422) );
  NAND2XL U4169 ( .A(n2861), .B(core_r13[8]), .Y(n2420) );
  NAND2XL U4170 ( .A(n2862), .B(core_r12[8]), .Y(n2419) );
  NAND2XL U4171 ( .A(n2260), .B(core_r14[8]), .Y(n2418) );
  NAND2XL U4172 ( .A(n2746), .B(core_r15[8]), .Y(n2417) );
  NAND4XL U4173 ( .A(n2420), .B(n2419), .C(n2418), .D(n2417), .Y(n2421) );
  NAND2XL U4174 ( .A(n2846), .B(core_r4[8]), .Y(n2423) );
  OAI2BB1XL U4175 ( .A0N(core_r6[8]), .A1N(n2845), .B0(n2423), .Y(n2426) );
  NAND2XL U4176 ( .A(n2844), .B(core_r5[8]), .Y(n2424) );
  OAI2BB1XL U4177 ( .A0N(core_r7[8]), .A1N(n2847), .B0(n2424), .Y(n2425) );
  AOI22XL U4178 ( .A0(n2614), .A1(core_r1[8]), .B0(n2839), .B1(core_r3[8]), 
        .Y(n2428) );
  AOI22XL U4179 ( .A0(n2837), .A1(core_r0[8]), .B0(n2838), .B1(core_r2[8]), 
        .Y(n2427) );
  AOI22XL U4180 ( .A0(n4866), .A1(n3979), .B0(n4863), .B1(n3980), .Y(n4486) );
  NAND2XL U4181 ( .A(n2798), .B(core_r5[6]), .Y(n2434) );
  NAND2XL U4182 ( .A(n2799), .B(core_r1[6]), .Y(n2433) );
  NAND2XL U4183 ( .A(n2800), .B(core_r3[6]), .Y(n2432) );
  NAND2XL U4184 ( .A(n2801), .B(core_r7[6]), .Y(n2431) );
  NAND2XL U4185 ( .A(n2806), .B(core_r9[6]), .Y(n2438) );
  NAND2XL U4186 ( .A(n2807), .B(core_r11[6]), .Y(n2437) );
  NAND2XL U4187 ( .A(n2809), .B(core_r15[6]), .Y(n2435) );
  NAND2XL U4188 ( .A(n2237), .B(core_r8[6]), .Y(n2441) );
  OAI2BB1XL U4189 ( .A0N(core_r12[6]), .A1N(n2826), .B0(n2441), .Y(n2444) );
  NAND2XL U4190 ( .A(n2824), .B(core_r10[6]), .Y(n2442) );
  OAI2BB1XL U4191 ( .A0N(core_r14[6]), .A1N(n2827), .B0(n2442), .Y(n2443) );
  AOI22XL U4192 ( .A0(n2816), .A1(core_r6[6]), .B0(n2818), .B1(core_r2[6]), 
        .Y(n2446) );
  NAND4X2 U4193 ( .A(n2448), .B(n2447), .C(n2446), .D(n2445), .Y(n4623) );
  INVX2 U4194 ( .A(n4623), .Y(n2467) );
  NAND2XL U4195 ( .A(n2854), .B(core_r9[6]), .Y(n2452) );
  NAND2XL U4196 ( .A(n2855), .B(core_r10[6]), .Y(n2451) );
  NAND2XL U4197 ( .A(n2856), .B(core_r8[6]), .Y(n2450) );
  NAND4XL U4198 ( .A(n2452), .B(n2451), .C(n2450), .D(n2449), .Y(n2458) );
  NAND2XL U4199 ( .A(n2861), .B(core_r13[6]), .Y(n2456) );
  NAND2XL U4200 ( .A(n2862), .B(core_r12[6]), .Y(n2455) );
  NAND2XL U4201 ( .A(n2260), .B(core_r14[6]), .Y(n2454) );
  NAND2XL U4202 ( .A(n2746), .B(core_r15[6]), .Y(n2453) );
  NAND2XL U4203 ( .A(n2846), .B(core_r4[6]), .Y(n2459) );
  OAI2BB1XL U4204 ( .A0N(core_r6[6]), .A1N(n2845), .B0(n2459), .Y(n2462) );
  NAND2XL U4205 ( .A(n2844), .B(core_r5[6]), .Y(n2460) );
  OAI2BB1XL U4206 ( .A0N(core_r7[6]), .A1N(n2847), .B0(n2460), .Y(n2461) );
  NOR2X1 U4207 ( .A(n2462), .B(n2461), .Y(n2465) );
  AOI22XL U4208 ( .A0(n2614), .A1(core_r1[6]), .B0(n2839), .B1(core_r3[6]), 
        .Y(n2464) );
  AOI22XL U4209 ( .A0(n2837), .A1(core_r0[6]), .B0(n2838), .B1(core_r2[6]), 
        .Y(n2463) );
  NAND4X2 U4210 ( .A(n2466), .B(n2465), .C(n2464), .D(n2463), .Y(n4474) );
  NAND2XL U4211 ( .A(n2798), .B(core_r5[0]), .Y(n2472) );
  NAND2XL U4212 ( .A(n2799), .B(core_r1[0]), .Y(n2471) );
  NAND2XL U4213 ( .A(n2800), .B(core_r3[0]), .Y(n2470) );
  NAND2XL U4214 ( .A(n2801), .B(core_r7[0]), .Y(n2469) );
  NAND4X1 U4215 ( .A(n2472), .B(n2471), .C(n2470), .D(n2469), .Y(n2478) );
  NAND2XL U4216 ( .A(n2806), .B(core_r9[0]), .Y(n2476) );
  NAND2XL U4217 ( .A(n2808), .B(core_r13[0]), .Y(n2475) );
  NAND2XL U4218 ( .A(n2807), .B(core_r11[0]), .Y(n2474) );
  NAND2XL U4219 ( .A(n2809), .B(core_r15[0]), .Y(n2473) );
  NAND4XL U4220 ( .A(n2476), .B(n2475), .C(n2474), .D(n2473), .Y(n2477) );
  NAND2XL U4221 ( .A(n2237), .B(core_r8[0]), .Y(n2479) );
  NAND2XL U4222 ( .A(n2824), .B(core_r10[0]), .Y(n2480) );
  AOI22XL U4223 ( .A0(n2816), .A1(core_r6[0]), .B0(n2818), .B1(core_r2[0]), 
        .Y(n2484) );
  NAND2XL U4224 ( .A(n2854), .B(core_r9[0]), .Y(n2490) );
  NAND2XL U4225 ( .A(n2855), .B(core_r10[0]), .Y(n2489) );
  NAND2XL U4226 ( .A(n2856), .B(core_r8[0]), .Y(n2488) );
  NAND2XL U4227 ( .A(n2741), .B(core_r11[0]), .Y(n2487) );
  NAND2XL U4228 ( .A(n2861), .B(core_r13[0]), .Y(n2494) );
  NAND2XL U4229 ( .A(n2862), .B(core_r12[0]), .Y(n2493) );
  NAND2XL U4230 ( .A(n2260), .B(core_r14[0]), .Y(n2492) );
  NAND2XL U4231 ( .A(n2746), .B(core_r15[0]), .Y(n2491) );
  NAND2XL U4232 ( .A(n2846), .B(core_r4[0]), .Y(n2497) );
  NAND2XL U4233 ( .A(n2844), .B(core_r5[0]), .Y(n2498) );
  NAND2XL U4234 ( .A(n2854), .B(core_r9[4]), .Y(n2508) );
  NAND2XL U4235 ( .A(n2855), .B(core_r10[4]), .Y(n2507) );
  NAND2XL U4236 ( .A(n2856), .B(core_r8[4]), .Y(n2506) );
  NAND2XL U4237 ( .A(n2741), .B(core_r11[4]), .Y(n2505) );
  NAND4XL U4238 ( .A(n2508), .B(n2507), .C(n2506), .D(n2505), .Y(n2514) );
  NAND2XL U4239 ( .A(n2861), .B(core_r13[4]), .Y(n2512) );
  NAND2XL U4240 ( .A(n2862), .B(core_r12[4]), .Y(n2511) );
  NAND2XL U4241 ( .A(n2260), .B(core_r14[4]), .Y(n2510) );
  NAND2XL U4242 ( .A(n2746), .B(core_r15[4]), .Y(n2509) );
  NAND4XL U4243 ( .A(n2512), .B(n2511), .C(n2510), .D(n2509), .Y(n2513) );
  NAND2XL U4244 ( .A(n2846), .B(core_r4[4]), .Y(n2515) );
  OAI2BB1XL U4245 ( .A0N(core_r6[4]), .A1N(n2845), .B0(n2515), .Y(n2518) );
  NAND2XL U4246 ( .A(n2844), .B(core_r5[4]), .Y(n2516) );
  OAI2BB1XL U4247 ( .A0N(core_r7[4]), .A1N(n2847), .B0(n2516), .Y(n2517) );
  AOI22XL U4248 ( .A0(n2614), .A1(core_r1[4]), .B0(n2839), .B1(core_r3[4]), 
        .Y(n2520) );
  AOI22XL U4249 ( .A0(n2837), .A1(core_r0[4]), .B0(n2838), .B1(core_r2[4]), 
        .Y(n2519) );
  NAND2XL U4250 ( .A(n2798), .B(core_r5[4]), .Y(n2526) );
  NAND2XL U4251 ( .A(n2799), .B(core_r1[4]), .Y(n2525) );
  NAND2XL U4252 ( .A(n2801), .B(core_r7[4]), .Y(n2523) );
  NAND4XL U4253 ( .A(n2526), .B(n2525), .C(n2524), .D(n2523), .Y(n2533) );
  NAND2XL U4254 ( .A(n2527), .B(core_r9[4]), .Y(n2531) );
  NAND2XL U4255 ( .A(n2807), .B(core_r11[4]), .Y(n2530) );
  NAND2XL U4256 ( .A(n2808), .B(core_r13[4]), .Y(n2529) );
  NAND2XL U4257 ( .A(n2809), .B(core_r15[4]), .Y(n2528) );
  NAND4XL U4258 ( .A(n2531), .B(n2530), .C(n2529), .D(n2528), .Y(n2532) );
  NAND2XL U4259 ( .A(n2237), .B(core_r8[4]), .Y(n2534) );
  OAI2BB1XL U4260 ( .A0N(core_r12[4]), .A1N(n2826), .B0(n2534), .Y(n2537) );
  NAND2XL U4261 ( .A(n2824), .B(core_r10[4]), .Y(n2535) );
  OAI2BB1XL U4262 ( .A0N(core_r14[4]), .A1N(n2827), .B0(n2535), .Y(n2536) );
  NOR2X1 U4263 ( .A(n2537), .B(n2536), .Y(n2540) );
  NAND2XL U4264 ( .A(n2854), .B(core_r9[5]), .Y(n2545) );
  NAND2XL U4265 ( .A(n2855), .B(core_r10[5]), .Y(n2544) );
  NAND2XL U4266 ( .A(n2856), .B(core_r8[5]), .Y(n2543) );
  NAND2XL U4267 ( .A(n2741), .B(core_r11[5]), .Y(n2542) );
  NAND2XL U4268 ( .A(n2861), .B(core_r13[5]), .Y(n2549) );
  NAND2XL U4269 ( .A(n2862), .B(core_r12[5]), .Y(n2548) );
  NAND2XL U4270 ( .A(n2746), .B(core_r15[5]), .Y(n2547) );
  NAND2XL U4271 ( .A(n2260), .B(core_r14[5]), .Y(n2546) );
  NAND2XL U4272 ( .A(n2846), .B(core_r4[5]), .Y(n2552) );
  NAND2XL U4273 ( .A(n2844), .B(core_r5[5]), .Y(n2553) );
  AOI22X1 U4274 ( .A0(n2837), .A1(core_r0[5]), .B0(n2838), .B1(core_r2[5]), 
        .Y(n2556) );
  NAND2XL U4275 ( .A(n2798), .B(core_r5[5]), .Y(n2563) );
  NAND2XL U4276 ( .A(n2799), .B(core_r1[5]), .Y(n2562) );
  NAND2XL U4277 ( .A(n2800), .B(core_r3[5]), .Y(n2561) );
  NAND2XL U4278 ( .A(n2801), .B(core_r7[5]), .Y(n2560) );
  NAND4XL U4279 ( .A(n2563), .B(n2562), .C(n2561), .D(n2560), .Y(n2569) );
  NAND2XL U4280 ( .A(n2806), .B(core_r9[5]), .Y(n2567) );
  NAND2XL U4281 ( .A(n2807), .B(core_r11[5]), .Y(n2566) );
  NAND2XL U4282 ( .A(n2808), .B(core_r13[5]), .Y(n2565) );
  NAND2XL U4283 ( .A(n2809), .B(core_r15[5]), .Y(n2564) );
  NAND4XL U4284 ( .A(n2567), .B(n2566), .C(n2565), .D(n2564), .Y(n2568) );
  NAND2XL U4285 ( .A(n2237), .B(core_r8[5]), .Y(n2570) );
  OAI2BB1XL U4286 ( .A0N(core_r12[5]), .A1N(n2826), .B0(n2570), .Y(n2573) );
  NAND2XL U4287 ( .A(n2824), .B(core_r10[5]), .Y(n2571) );
  OAI2BB1XL U4288 ( .A0N(core_r14[5]), .A1N(n2827), .B0(n2571), .Y(n2572) );
  NAND2XL U4289 ( .A(n2798), .B(core_r5[7]), .Y(n2581) );
  NAND2XL U4290 ( .A(n2799), .B(core_r1[7]), .Y(n2580) );
  NAND2XL U4291 ( .A(n2800), .B(core_r3[7]), .Y(n2579) );
  NAND2XL U4292 ( .A(n2801), .B(core_r7[7]), .Y(n2578) );
  NAND2XL U4293 ( .A(n2806), .B(core_r9[7]), .Y(n2585) );
  NAND2XL U4294 ( .A(n2807), .B(core_r11[7]), .Y(n2584) );
  NAND2XL U4295 ( .A(n2808), .B(core_r13[7]), .Y(n2583) );
  NAND2XL U4296 ( .A(n2809), .B(core_r15[7]), .Y(n2582) );
  NAND2XL U4297 ( .A(n2237), .B(core_r8[7]), .Y(n2588) );
  OAI2BB1XL U4298 ( .A0N(core_r12[7]), .A1N(n2826), .B0(n2588), .Y(n2591) );
  NAND2XL U4299 ( .A(n2824), .B(core_r10[7]), .Y(n2589) );
  NOR2X1 U4300 ( .A(n2591), .B(n2590), .Y(n2594) );
  AOI22XL U4301 ( .A0(n2816), .A1(core_r6[7]), .B0(n2818), .B1(core_r2[7]), 
        .Y(n2593) );
  AOI22XL U4302 ( .A0(n2775), .A1(core_r0[7]), .B0(n2248), .B1(core_r4[7]), 
        .Y(n2592) );
  NAND4X2 U4303 ( .A(n2595), .B(n2594), .C(n2593), .D(n2592), .Y(n4158) );
  INVX1 U4304 ( .A(n4158), .Y(n4860) );
  NAND2XL U4305 ( .A(n2854), .B(core_r9[7]), .Y(n2599) );
  NAND2XL U4306 ( .A(n2855), .B(core_r10[7]), .Y(n2598) );
  NAND2XL U4307 ( .A(n2856), .B(core_r8[7]), .Y(n2597) );
  NAND2XL U4308 ( .A(n2741), .B(core_r11[7]), .Y(n2596) );
  NAND4XL U4309 ( .A(n2599), .B(n2598), .C(n2597), .D(n2596), .Y(n2605) );
  NAND2XL U4310 ( .A(n2861), .B(core_r13[7]), .Y(n2603) );
  NAND2XL U4311 ( .A(n2862), .B(core_r12[7]), .Y(n2602) );
  NAND2XL U4312 ( .A(n2260), .B(core_r14[7]), .Y(n2601) );
  NAND2XL U4313 ( .A(n2746), .B(core_r15[7]), .Y(n2600) );
  NAND4XL U4314 ( .A(n2603), .B(n2602), .C(n2601), .D(n2600), .Y(n2604) );
  NAND2XL U4315 ( .A(n2846), .B(core_r4[7]), .Y(n2606) );
  OAI2BB1XL U4316 ( .A0N(core_r6[7]), .A1N(n2845), .B0(n2606), .Y(n2609) );
  NAND2XL U4317 ( .A(n2844), .B(core_r5[7]), .Y(n2607) );
  OAI2BB1XL U4318 ( .A0N(core_r7[7]), .A1N(n2847), .B0(n2607), .Y(n2608) );
  AOI22XL U4319 ( .A0(n2614), .A1(core_r1[7]), .B0(n2839), .B1(core_r3[7]), 
        .Y(n2611) );
  AOI22XL U4320 ( .A0(n2837), .A1(core_r0[7]), .B0(n2838), .B1(core_r2[7]), 
        .Y(n2610) );
  NOR2X1 U4321 ( .A(n4860), .B(n3936), .Y(n4477) );
  OR4X2 U4322 ( .A(n4460), .B(n4473), .C(n4470), .D(n4477), .Y(n2644) );
  AOI22XL U4323 ( .A0(n2845), .A1(core_r6[3]), .B0(n2846), .B1(core_r4[3]), 
        .Y(n2617) );
  AOI22XL U4324 ( .A0(n2614), .A1(core_r1[3]), .B0(n2839), .B1(core_r3[3]), 
        .Y(n2616) );
  AOI22XL U4325 ( .A0(n2844), .A1(core_r5[3]), .B0(n2847), .B1(core_r7[3]), 
        .Y(n2615) );
  NAND4X1 U4326 ( .A(n2618), .B(n2617), .C(n2616), .D(n2615), .Y(n2624) );
  AOI22XL U4327 ( .A0(n2854), .A1(core_r9[3]), .B0(n2741), .B1(core_r11[3]), 
        .Y(n2622) );
  AOI22XL U4328 ( .A0(n2855), .A1(core_r10[3]), .B0(n2856), .B1(core_r8[3]), 
        .Y(n2621) );
  AOI22XL U4329 ( .A0(n2862), .A1(core_r12[3]), .B0(n2260), .B1(core_r14[3]), 
        .Y(n2620) );
  OR2X4 U4330 ( .A(n2624), .B(n2623), .Y(n4693) );
  NAND2XL U4331 ( .A(n2798), .B(core_r5[3]), .Y(n2628) );
  NAND2XL U4332 ( .A(n2799), .B(core_r1[3]), .Y(n2627) );
  NAND2XL U4333 ( .A(n2800), .B(core_r3[3]), .Y(n2626) );
  NAND2XL U4334 ( .A(n2801), .B(core_r7[3]), .Y(n2625) );
  NAND4XL U4335 ( .A(n2628), .B(n2627), .C(n2626), .D(n2625), .Y(n2634) );
  NAND2XL U4336 ( .A(n2806), .B(core_r9[3]), .Y(n2632) );
  NAND2XL U4337 ( .A(n2807), .B(core_r11[3]), .Y(n2631) );
  NAND2XL U4338 ( .A(n2808), .B(core_r13[3]), .Y(n2630) );
  NAND2XL U4339 ( .A(n2809), .B(core_r15[3]), .Y(n2629) );
  NAND4XL U4340 ( .A(n2632), .B(n2631), .C(n2630), .D(n2629), .Y(n2633) );
  NAND2XL U4341 ( .A(n2237), .B(core_r8[3]), .Y(n2635) );
  OAI2BB1XL U4342 ( .A0N(core_r12[3]), .A1N(n2826), .B0(n2635), .Y(n2638) );
  NAND2XL U4343 ( .A(n2824), .B(core_r10[3]), .Y(n2636) );
  OAI2BB1XL U4344 ( .A0N(core_r14[3]), .A1N(n2827), .B0(n2636), .Y(n2637) );
  NAND2XL U4345 ( .A(n3760), .B(n4169), .Y(n4472) );
  OAI21X1 U4346 ( .A0(n4693), .A1(n4849), .B0(n4472), .Y(n4467) );
  NAND2BX2 U4347 ( .AN(n2646), .B(n2645), .Y(n2876) );
  INVXL U4348 ( .A(n4687), .Y(n4662) );
  NAND2XL U4349 ( .A(n2854), .B(core_r9[12]), .Y(n2650) );
  NAND2XL U4350 ( .A(n2855), .B(core_r10[12]), .Y(n2649) );
  NAND2XL U4351 ( .A(n2856), .B(core_r8[12]), .Y(n2648) );
  NAND2XL U4352 ( .A(n2741), .B(core_r11[12]), .Y(n2647) );
  NAND4XL U4353 ( .A(n2650), .B(n2649), .C(n2648), .D(n2647), .Y(n2656) );
  NAND2XL U4354 ( .A(n2861), .B(core_r13[12]), .Y(n2654) );
  NAND2XL U4355 ( .A(n2862), .B(core_r12[12]), .Y(n2653) );
  NAND2XL U4356 ( .A(n2260), .B(core_r14[12]), .Y(n2652) );
  NAND2XL U4357 ( .A(n2746), .B(core_r15[12]), .Y(n2651) );
  NAND4XL U4358 ( .A(n2654), .B(n2653), .C(n2652), .D(n2651), .Y(n2655) );
  NAND2XL U4359 ( .A(n2846), .B(core_r4[12]), .Y(n2657) );
  OAI2BB1XL U4360 ( .A0N(core_r6[12]), .A1N(n2845), .B0(n2657), .Y(n2660) );
  NAND2XL U4361 ( .A(n2844), .B(core_r5[12]), .Y(n2658) );
  OAI2BB1XL U4362 ( .A0N(core_r7[12]), .A1N(n2847), .B0(n2658), .Y(n2659) );
  AOI22XL U4363 ( .A0(n2614), .A1(core_r1[12]), .B0(n2839), .B1(core_r3[12]), 
        .Y(n2662) );
  AOI22XL U4364 ( .A0(n2837), .A1(core_r0[12]), .B0(n2838), .B1(core_r2[12]), 
        .Y(n2661) );
  NAND2XL U4365 ( .A(n2798), .B(core_r5[12]), .Y(n2668) );
  NAND2XL U4366 ( .A(n2799), .B(core_r1[12]), .Y(n2667) );
  NAND2XL U4367 ( .A(n2800), .B(core_r3[12]), .Y(n2666) );
  NAND2XL U4368 ( .A(n2801), .B(core_r7[12]), .Y(n2665) );
  NAND4XL U4369 ( .A(n2668), .B(n2667), .C(n2666), .D(n2665), .Y(n2674) );
  NAND2XL U4370 ( .A(n2806), .B(core_r9[12]), .Y(n2672) );
  NAND2XL U4371 ( .A(n2807), .B(core_r11[12]), .Y(n2671) );
  NAND2XL U4372 ( .A(n2808), .B(core_r13[12]), .Y(n2670) );
  NAND2XL U4373 ( .A(n2809), .B(core_r15[12]), .Y(n2669) );
  NAND4XL U4374 ( .A(n2672), .B(n2671), .C(n2670), .D(n2669), .Y(n2673) );
  NAND2XL U4375 ( .A(n2237), .B(core_r8[12]), .Y(n2675) );
  OAI2BB1XL U4376 ( .A0N(core_r12[12]), .A1N(n2826), .B0(n2675), .Y(n2678) );
  NAND2XL U4377 ( .A(n2824), .B(core_r10[12]), .Y(n2676) );
  OAI2BB1XL U4378 ( .A0N(core_r14[12]), .A1N(n2827), .B0(n2676), .Y(n2677) );
  AOI22XL U4379 ( .A0(n2816), .A1(core_r6[12]), .B0(n2818), .B1(core_r2[12]), 
        .Y(n2680) );
  AOI22XL U4380 ( .A0(n2775), .A1(core_r0[12]), .B0(n2248), .B1(core_r4[12]), 
        .Y(n2679) );
  NAND2XL U4381 ( .A(n4247), .B(n4626), .Y(n4493) );
  AOI21XL U4382 ( .A0(n4821), .A1(n3060), .B0(n4498), .Y(n2684) );
  INVXL U4383 ( .A(n4626), .Y(n4832) );
  NAND2XL U4384 ( .A(n2854), .B(core_r9[2]), .Y(n2689) );
  NAND2XL U4385 ( .A(n2855), .B(core_r10[2]), .Y(n2688) );
  NAND2XL U4386 ( .A(n2856), .B(core_r8[2]), .Y(n2687) );
  NAND2XL U4387 ( .A(n2741), .B(core_r11[2]), .Y(n2686) );
  NAND4XL U4388 ( .A(n2689), .B(n2688), .C(n2687), .D(n2686), .Y(n2695) );
  NAND2XL U4389 ( .A(n2861), .B(core_r13[2]), .Y(n2693) );
  NAND2XL U4390 ( .A(n2862), .B(core_r12[2]), .Y(n2692) );
  NAND2XL U4391 ( .A(n2260), .B(core_r14[2]), .Y(n2691) );
  NAND2XL U4392 ( .A(n2746), .B(core_r15[2]), .Y(n2690) );
  NAND4XL U4393 ( .A(n2693), .B(n2692), .C(n2691), .D(n2690), .Y(n2694) );
  NAND2XL U4394 ( .A(n2846), .B(core_r4[2]), .Y(n2696) );
  OAI2BB1XL U4395 ( .A0N(core_r6[2]), .A1N(n2845), .B0(n2696), .Y(n2699) );
  NAND2XL U4396 ( .A(n2844), .B(core_r5[2]), .Y(n2697) );
  OAI2BB1XL U4397 ( .A0N(core_r7[2]), .A1N(n2847), .B0(n2697), .Y(n2698) );
  NOR2X1 U4398 ( .A(n2699), .B(n2698), .Y(n2702) );
  AOI22XL U4399 ( .A0(n2614), .A1(core_r1[2]), .B0(n2839), .B1(core_r3[2]), 
        .Y(n2701) );
  AOI22XL U4400 ( .A0(n2837), .A1(core_r0[2]), .B0(n2838), .B1(core_r2[2]), 
        .Y(n2700) );
  INVX1 U4401 ( .A(n4466), .Y(n4463) );
  NAND2XL U4402 ( .A(n2798), .B(core_r5[2]), .Y(n2708) );
  NAND2XL U4403 ( .A(n2704), .B(core_r1[2]), .Y(n2707) );
  NAND2XL U4404 ( .A(n2801), .B(core_r7[2]), .Y(n2705) );
  NAND4XL U4405 ( .A(n2708), .B(n2707), .C(n2706), .D(n2705), .Y(n2714) );
  NAND2XL U4406 ( .A(n2806), .B(core_r9[2]), .Y(n2712) );
  NAND2XL U4407 ( .A(n2807), .B(core_r11[2]), .Y(n2711) );
  NAND2XL U4408 ( .A(n2808), .B(core_r13[2]), .Y(n2710) );
  NAND2XL U4409 ( .A(n2809), .B(core_r15[2]), .Y(n2709) );
  NAND4XL U4410 ( .A(n2712), .B(n2711), .C(n2710), .D(n2709), .Y(n2713) );
  NAND2XL U4411 ( .A(n2237), .B(core_r8[2]), .Y(n2715) );
  NAND2XL U4412 ( .A(n2824), .B(core_r10[2]), .Y(n2716) );
  AOI22XL U4413 ( .A0(n2816), .A1(core_r6[2]), .B0(n2818), .B1(core_r2[2]), 
        .Y(n2720) );
  AOI22XL U4414 ( .A0(n2775), .A1(core_r0[2]), .B0(n2248), .B1(core_r4[2]), 
        .Y(n2719) );
  NAND2XL U4415 ( .A(n2798), .B(core_r5[1]), .Y(n2726) );
  NAND2XL U4416 ( .A(n2799), .B(core_r1[1]), .Y(n2725) );
  NAND2XL U4417 ( .A(n2800), .B(core_r3[1]), .Y(n2724) );
  NAND2XL U4418 ( .A(n2801), .B(core_r7[1]), .Y(n2723) );
  NAND4X1 U4419 ( .A(n2726), .B(n2725), .C(n2724), .D(n2723), .Y(n2732) );
  NAND2XL U4420 ( .A(n2806), .B(core_r9[1]), .Y(n2730) );
  NAND2XL U4421 ( .A(n2807), .B(core_r11[1]), .Y(n2729) );
  NAND2XL U4422 ( .A(n2808), .B(core_r13[1]), .Y(n2728) );
  NAND2XL U4423 ( .A(n2809), .B(core_r15[1]), .Y(n2727) );
  NAND4X1 U4424 ( .A(n2730), .B(n2729), .C(n2728), .D(n2727), .Y(n2731) );
  NOR2X2 U4425 ( .A(n2732), .B(n2731), .Y(n2740) );
  NAND2XL U4426 ( .A(n2237), .B(core_r8[1]), .Y(n2733) );
  NAND2XL U4427 ( .A(n2824), .B(core_r10[1]), .Y(n2734) );
  AOI22X1 U4428 ( .A0(n2775), .A1(core_r0[1]), .B0(n2248), .B1(core_r4[1]), 
        .Y(n2737) );
  NAND4X4 U4429 ( .A(n2740), .B(n2739), .C(n2738), .D(n2737), .Y(n4689) );
  INVX1 U4430 ( .A(n4689), .Y(n4459) );
  NAND2XL U4431 ( .A(n2854), .B(core_r9[1]), .Y(n2745) );
  NAND2XL U4432 ( .A(n2855), .B(core_r10[1]), .Y(n2744) );
  NAND2XL U4433 ( .A(n2856), .B(core_r8[1]), .Y(n2743) );
  NAND2XL U4434 ( .A(n2741), .B(core_r11[1]), .Y(n2742) );
  NAND2XL U4435 ( .A(n2861), .B(core_r13[1]), .Y(n2750) );
  NAND2XL U4436 ( .A(n2862), .B(core_r12[1]), .Y(n2749) );
  NAND2XL U4437 ( .A(n2746), .B(core_r15[1]), .Y(n2748) );
  NAND2XL U4438 ( .A(n2260), .B(core_r14[1]), .Y(n2747) );
  NOR2X1 U4439 ( .A(n2752), .B(n2751), .Y(n2760) );
  NAND2XL U4440 ( .A(n2846), .B(core_r4[1]), .Y(n2753) );
  NOR2X1 U4441 ( .A(n2756), .B(n2755), .Y(n2759) );
  AOI22XL U4442 ( .A0(n2614), .A1(core_r1[1]), .B0(n2839), .B1(core_r3[1]), 
        .Y(n2758) );
  AOI22X1 U4443 ( .A0(n2837), .A1(core_r0[1]), .B0(n2838), .B1(core_r2[1]), 
        .Y(n2757) );
  NAND4X2 U4444 ( .A(n2760), .B(n2759), .C(n2758), .D(n2757), .Y(n4182) );
  XOR2XL U4445 ( .A(n4459), .B(n4182), .Y(n3064) );
  NAND2XL U4446 ( .A(n2798), .B(core_r5[11]), .Y(n2764) );
  NAND2XL U4447 ( .A(n2799), .B(core_r1[11]), .Y(n2763) );
  NAND2XL U4448 ( .A(n2800), .B(core_r3[11]), .Y(n2762) );
  NAND2XL U4449 ( .A(n2801), .B(core_r7[11]), .Y(n2761) );
  NAND4XL U4450 ( .A(n2764), .B(n2763), .C(n2762), .D(n2761), .Y(n2770) );
  NAND2XL U4451 ( .A(n2806), .B(core_r9[11]), .Y(n2768) );
  NAND2XL U4452 ( .A(n2807), .B(core_r11[11]), .Y(n2767) );
  NAND2XL U4453 ( .A(n2808), .B(core_r13[11]), .Y(n2766) );
  NAND2XL U4454 ( .A(n2809), .B(core_r15[11]), .Y(n2765) );
  NAND4XL U4455 ( .A(n2768), .B(n2767), .C(n2766), .D(n2765), .Y(n2769) );
  NAND2XL U4456 ( .A(n2237), .B(core_r8[11]), .Y(n2771) );
  OAI2BB1XL U4457 ( .A0N(core_r12[11]), .A1N(n2826), .B0(n2771), .Y(n2774) );
  NAND2XL U4458 ( .A(n2824), .B(core_r10[11]), .Y(n2772) );
  OAI2BB1XL U4459 ( .A0N(core_r14[11]), .A1N(n2827), .B0(n2772), .Y(n2773) );
  NOR2X1 U4460 ( .A(n2774), .B(n2773), .Y(n2778) );
  AOI22XL U4461 ( .A0(n2775), .A1(core_r0[11]), .B0(n2248), .B1(core_r4[11]), 
        .Y(n2776) );
  NAND4X2 U4462 ( .A(n2779), .B(n2778), .C(n2777), .D(n2776), .Y(n4738) );
  NAND2XL U4463 ( .A(n2854), .B(core_r9[11]), .Y(n2783) );
  NAND2XL U4464 ( .A(n2855), .B(core_r10[11]), .Y(n2782) );
  NAND2XL U4465 ( .A(n2856), .B(core_r8[11]), .Y(n2781) );
  NAND2XL U4466 ( .A(n2861), .B(core_r13[11]), .Y(n2787) );
  NAND2XL U4467 ( .A(n2862), .B(core_r12[11]), .Y(n2786) );
  NAND2XL U4468 ( .A(n2260), .B(core_r14[11]), .Y(n2785) );
  NAND2XL U4469 ( .A(n2846), .B(core_r4[11]), .Y(n2790) );
  NAND2XL U4470 ( .A(n2844), .B(core_r5[11]), .Y(n2791) );
  OAI2BB1XL U4471 ( .A0N(core_r7[11]), .A1N(n2847), .B0(n2791), .Y(n2792) );
  NOR2X1 U4472 ( .A(n2793), .B(n2792), .Y(n2796) );
  AOI22XL U4473 ( .A0(n2837), .A1(core_r0[11]), .B0(n2838), .B1(core_r2[11]), 
        .Y(n2794) );
  NAND2XL U4474 ( .A(n2798), .B(core_r5[13]), .Y(n2805) );
  NAND2XL U4475 ( .A(n2799), .B(core_r1[13]), .Y(n2804) );
  NAND2XL U4476 ( .A(n2800), .B(core_r3[13]), .Y(n2803) );
  NAND2XL U4477 ( .A(n2801), .B(core_r7[13]), .Y(n2802) );
  NAND4XL U4478 ( .A(n2805), .B(n2804), .C(n2803), .D(n2802), .Y(n2815) );
  NAND2XL U4479 ( .A(n2806), .B(core_r9[13]), .Y(n2813) );
  NAND2XL U4480 ( .A(n2807), .B(core_r11[13]), .Y(n2812) );
  NAND2XL U4481 ( .A(n2808), .B(core_r13[13]), .Y(n2811) );
  NAND2XL U4482 ( .A(n2809), .B(core_r15[13]), .Y(n2810) );
  NAND4XL U4483 ( .A(n2813), .B(n2812), .C(n2811), .D(n2810), .Y(n2814) );
  NAND2XL U4484 ( .A(n2816), .B(core_r6[13]), .Y(n2823) );
  NAND2XL U4485 ( .A(n2817), .B(core_r0[13]), .Y(n2822) );
  NAND2XL U4486 ( .A(n2818), .B(core_r2[13]), .Y(n2821) );
  NAND2XL U4487 ( .A(n2248), .B(core_r4[13]), .Y(n2820) );
  NAND4XL U4488 ( .A(n2823), .B(n2822), .C(n2821), .D(n2820), .Y(n2833) );
  NAND2XL U4489 ( .A(n2824), .B(core_r10[13]), .Y(n2831) );
  NAND2XL U4490 ( .A(n2237), .B(core_r8[13]), .Y(n2830) );
  NAND2XL U4491 ( .A(n2826), .B(core_r12[13]), .Y(n2829) );
  NAND2XL U4492 ( .A(n2827), .B(core_r14[13]), .Y(n2828) );
  NAND4XL U4493 ( .A(n2831), .B(n2830), .C(n2829), .D(n2828), .Y(n2832) );
  NAND2XL U4494 ( .A(n2614), .B(core_r1[13]), .Y(n2843) );
  NAND2XL U4495 ( .A(n2837), .B(core_r0[13]), .Y(n2842) );
  NAND2XL U4496 ( .A(n2838), .B(core_r2[13]), .Y(n2841) );
  NAND2XL U4497 ( .A(n2839), .B(core_r3[13]), .Y(n2840) );
  NAND4XL U4498 ( .A(n2843), .B(n2842), .C(n2841), .D(n2840), .Y(n2853) );
  NAND2XL U4499 ( .A(n2844), .B(core_r5[13]), .Y(n2851) );
  NAND2XL U4500 ( .A(n2845), .B(core_r6[13]), .Y(n2850) );
  NAND2XL U4501 ( .A(n2846), .B(core_r4[13]), .Y(n2849) );
  NAND2XL U4502 ( .A(n2847), .B(core_r7[13]), .Y(n2848) );
  NAND4XL U4503 ( .A(n2851), .B(n2850), .C(n2849), .D(n2848), .Y(n2852) );
  NOR2X1 U4504 ( .A(n2853), .B(n2852), .Y(n2870) );
  NAND2XL U4505 ( .A(n2854), .B(core_r9[13]), .Y(n2860) );
  NAND2XL U4506 ( .A(n2855), .B(core_r10[13]), .Y(n2859) );
  NAND2XL U4507 ( .A(n2856), .B(core_r8[13]), .Y(n2858) );
  NAND2XL U4508 ( .A(n2741), .B(core_r11[13]), .Y(n2857) );
  NAND2XL U4509 ( .A(n2861), .B(core_r13[13]), .Y(n2866) );
  NAND2XL U4510 ( .A(n2862), .B(core_r12[13]), .Y(n2865) );
  NAND2XL U4511 ( .A(n2260), .B(core_r14[13]), .Y(n2864) );
  NAND2XL U4512 ( .A(n2746), .B(core_r15[13]), .Y(n2863) );
  NAND4XL U4513 ( .A(n2866), .B(n2865), .C(n2864), .D(n2863), .Y(n2867) );
  NAND4X1 U4514 ( .A(n2873), .B(n3064), .C(n2872), .D(n2871), .Y(n2874) );
  NAND2XL U4515 ( .A(n2954), .B(IF_DEC_instr[13]), .Y(n4615) );
  INVXL U4516 ( .A(n4615), .Y(n2884) );
  BUFX2 U4517 ( .A(n2884), .Y(n4781) );
  INVXL U4518 ( .A(IF_DEC_PC[2]), .Y(n4379) );
  NAND2X1 U4519 ( .A(n4615), .B(n3081), .Y(n2903) );
  INVXL U4520 ( .A(IF_DEC_instr[14]), .Y(n2878) );
  INVXL U4521 ( .A(IF_DEC_instr[15]), .Y(n2877) );
  NAND2X1 U4522 ( .A(n2878), .B(n2877), .Y(n4415) );
  INVXL U4523 ( .A(IF_DEC_instr[0]), .Y(n2879) );
  NAND2X1 U4524 ( .A(n2879), .B(n4414), .Y(n2880) );
  NOR2X2 U4525 ( .A(n4415), .B(n2880), .Y(n4777) );
  OAI2BB1X1 U4526 ( .A0N(IF_DEC_instr[2]), .A1N(n2903), .B0(n2881), .Y(n3056)
         );
  OAI21X1 U4527 ( .A0(n2882), .A1(n4414), .B0(n2954), .Y(n2883) );
  BUFX8 U4528 ( .A(n2883), .Y(n3036) );
  MX2X2 U4529 ( .A(n3056), .B(IF_DEC_PC[2]), .S0(n3036), .Y(n2886) );
  INVXL U4530 ( .A(IF_DEC_PC[3]), .Y(n4381) );
  AND2X1 U4531 ( .A(n3038), .B(n3669), .Y(n2902) );
  MXI2XL U4532 ( .A(n4777), .B(n4776), .S0(n4698), .Y(n2885) );
  OAI2BB1X1 U4533 ( .A0N(IF_DEC_instr[3]), .A1N(n2903), .B0(n2885), .Y(n3670)
         );
  NOR2X1 U4534 ( .A(n2898), .B(n2897), .Y(n3954) );
  ADDHX1 U4535 ( .A(n2887), .B(n2886), .CO(n2898), .S(n2896) );
  OAI2BB1X1 U4536 ( .A0N(IF_DEC_instr[0]), .A1N(n2903), .B0(n2888), .Y(n4457)
         );
  AND2X2 U4537 ( .A(n3038), .B(n4457), .Y(n3749) );
  MXI2XL U4538 ( .A(n4777), .B(n4776), .S0(n4689), .Y(n2889) );
  OAI2BB1X1 U4539 ( .A0N(IF_DEC_instr[1]), .A1N(n2903), .B0(n2889), .Y(n3053)
         );
  AND2X1 U4540 ( .A(n3038), .B(n3053), .Y(n2892) );
  NOR2X1 U4541 ( .A(n2896), .B(n2895), .Y(n4293) );
  NAND2XL U4542 ( .A(n3060), .B(n4615), .Y(n2890) );
  MX2X1 U4543 ( .A(n3051), .B(IF_DEC_PC[0]), .S0(n3036), .Y(n3748) );
  ADDHX1 U4544 ( .A(n3749), .B(n2892), .CO(n2895), .S(n2894) );
  INVXL U4545 ( .A(IF_DEC_PC[1]), .Y(n4377) );
  MX2X1 U4546 ( .A(n3054), .B(IF_DEC_PC[1]), .S0(n3036), .Y(n2893) );
  NAND2XL U4547 ( .A(n2894), .B(n2893), .Y(n4283) );
  NAND2XL U4548 ( .A(n2896), .B(n2895), .Y(n4294) );
  NAND2XL U4549 ( .A(n2898), .B(n2897), .Y(n3955) );
  INVXL U4550 ( .A(IF_DEC_PC[4]), .Y(n4383) );
  NAND2XL U4551 ( .A(n2903), .B(IF_DEC_instr[4]), .Y(n4778) );
  NAND2XL U4552 ( .A(n2904), .B(n4778), .Y(n3697) );
  ADDHXL U4553 ( .A(n2906), .B(n2905), .CO(n2911), .S(n2908) );
  MXI2X1 U4554 ( .A(n4777), .B(n4776), .S0(n4169), .Y(n2907) );
  NAND2XL U4555 ( .A(n2907), .B(n4778), .Y(n3761) );
  NOR2X1 U4556 ( .A(n2935), .B(n2937), .Y(n3009) );
  NAND2X1 U4557 ( .A(n2909), .B(n2908), .Y(n4303) );
  NAND2XL U4558 ( .A(n2911), .B(n2910), .Y(n2938) );
  OAI21X1 U4559 ( .A0(n2937), .A1(n4303), .B0(n2938), .Y(n3014) );
  AOI21XL U4560 ( .A0(n4306), .A1(n3009), .B0(n3014), .Y(n2918) );
  NAND2XL U4561 ( .A(n4474), .B(n4615), .Y(n2912) );
  NAND2XL U4562 ( .A(n2913), .B(n4778), .Y(n3890) );
  MX2X2 U4563 ( .A(n3890), .B(IF_DEC_PC[6]), .S0(n3036), .Y(n2926) );
  INVXL U4564 ( .A(n3008), .Y(n2916) );
  NAND2XL U4565 ( .A(n2915), .B(n2914), .Y(n3011) );
  XOR2X1 U4566 ( .A(n2918), .B(n2917), .Y(n2921) );
  OAI2BB1X2 U4567 ( .A0N(n4335), .A1N(n2921), .B0(n2920), .Y(n1334) );
  INVXL U4568 ( .A(n3014), .Y(n2923) );
  OAI21XL U4569 ( .A0(n2923), .A1(n3008), .B0(n3011), .Y(n2924) );
  AOI21XL U4570 ( .A0(n4306), .A1(n2925), .B0(n2924), .Y(n2932) );
  ADDHXL U4571 ( .A(n2927), .B(n2926), .CO(n2929), .S(n2914) );
  INVXL U4572 ( .A(n3012), .Y(n2930) );
  NAND2XL U4573 ( .A(n2929), .B(n2928), .Y(n3010) );
  XOR2X1 U4574 ( .A(n2932), .B(n2931), .Y(n2934) );
  OAI2BB1X2 U4575 ( .A0N(n4335), .A1N(n2934), .B0(n2933), .Y(n1335) );
  INVXL U4576 ( .A(n2935), .Y(n4304) );
  INVXL U4577 ( .A(n4303), .Y(n2936) );
  AOI21XL U4578 ( .A0(n4306), .A1(n4304), .B0(n2936), .Y(n2941) );
  INVXL U4579 ( .A(n2937), .Y(n2939) );
  XOR2X1 U4580 ( .A(n2941), .B(n2940), .Y(n2943) );
  OAI2BB1X2 U4581 ( .A0N(n4335), .A1N(n2943), .B0(n2942), .Y(n1333) );
  NOR2X1 U4582 ( .A(n2948), .B(n3814), .Y(n2949) );
  INVXL U4583 ( .A(data_memory_dmem_write_ok), .Y(n2951) );
  NAND2X4 U4584 ( .A(n2952), .B(n2951), .Y(n3631) );
  NAND2XL U4585 ( .A(n3631), .B(n3082), .Y(n2953) );
  INVXL U4586 ( .A(patcal[2]), .Y(n3200) );
  NAND2XL U4587 ( .A(patcal[3]), .B(n3200), .Y(n3197) );
  INVXL U4588 ( .A(instruction_memory_instmem_cs[0]), .Y(n4365) );
  INVXL U4589 ( .A(instruction_memory_instmem_cs[1]), .Y(n4360) );
  INVXL U4590 ( .A(cpufe_cs[0]), .Y(n3640) );
  NAND2X4 U4591 ( .A(n3631), .B(n3220), .Y(n3844) );
  INVXL U4592 ( .A(IF_PC[2]), .Y(n4380) );
  NAND2XL U4593 ( .A(n4380), .B(IF_PC[0]), .Y(n2962) );
  INVXL U4594 ( .A(n3239), .Y(n3094) );
  OAI21X1 U4595 ( .A0(cpube_ns[2]), .A1(n3094), .B0(n3207), .Y(n3641) );
  XNOR2XL U4596 ( .A(IF_DEC_PC[0]), .B(EXE_MEM_PCnxt[0]), .Y(n2966) );
  XNOR2XL U4597 ( .A(IF_DEC_PC[8]), .B(EXE_MEM_PCnxt[8]), .Y(n2965) );
  XNOR2XL U4598 ( .A(IF_DEC_PC[6]), .B(EXE_MEM_PCnxt[6]), .Y(n2964) );
  XNOR2XL U4599 ( .A(IF_DEC_PC[7]), .B(EXE_MEM_PCnxt[7]), .Y(n2963) );
  XOR2XL U4600 ( .A(IF_DEC_PC[10]), .B(EXE_MEM_PCnxt[10]), .Y(n2968) );
  INVXL U4601 ( .A(IF_DEC_PC[9]), .Y(n4376) );
  XOR2XL U4602 ( .A(IF_DEC_PC[5]), .B(EXE_MEM_PCnxt[5]), .Y(n2971) );
  XOR2XL U4603 ( .A(IF_DEC_PC[3]), .B(EXE_MEM_PCnxt[3]), .Y(n2970) );
  XOR2XL U4604 ( .A(IF_DEC_PC[4]), .B(EXE_MEM_PCnxt[4]), .Y(n2973) );
  INVXL U4605 ( .A(EXE_MEM_PCnxt[9]), .Y(n2978) );
  NOR2X1 U4606 ( .A(n2982), .B(n2990), .Y(n2979) );
  NAND2X2 U4607 ( .A(n3641), .B(n2979), .Y(n2986) );
  INVXL U4608 ( .A(cpube_cs[1]), .Y(n3085) );
  AOI21X4 U4609 ( .A0(n2986), .A1(n2985), .B0(n2989), .Y(n4399) );
  AOI222X1 U4610 ( .A0(n2991), .A1(n4399), .B0(EXE_MEM_PCnxt[2]), .B1(n4796), 
        .C0(n4289), .C1(IF_PC[2]), .Y(n2992) );
  OAI2BB1XL U4611 ( .A0N(data_memory_writeback_count[5]), .A1N(
        data_memory_writeback_count[6]), .B0(n2993), .Y(n3003) );
  NAND2XL U4612 ( .A(n2997), .B(wready_m_inf_0_), .Y(n3000) );
  INVX1 U4613 ( .A(n3108), .Y(n2999) );
  NAND2X4 U4614 ( .A(n2999), .B(n2998), .Y(n4608) );
  OAI21XL U4615 ( .A0(n3001), .A1(n3000), .B0(n4608), .Y(n3855) );
  AOI222XL U4616 ( .A0(n3003), .A1(n3792), .B0(n3805), .B1(
        data_memory_writeback_count[6]), .C0(n3801), .C1(n3802), .Y(n3004) );
  INVXL U4617 ( .A(n3004), .Y(n1386) );
  ADDHXL U4618 ( .A(n3041), .B(IF_DEC_PC[7]), .CO(n3020), .S(n2928) );
  INVXL U4619 ( .A(IF_DEC_PC[8]), .Y(n4390) );
  NOR2X1 U4620 ( .A(n3008), .B(n3012), .Y(n3015) );
  NAND2XL U4621 ( .A(n3009), .B(n3015), .Y(n3017) );
  OAI21XL U4622 ( .A0(n3012), .A1(n3011), .B0(n3010), .Y(n3013) );
  AOI21X1 U4623 ( .A0(n3015), .A1(n3014), .B0(n3013), .Y(n3016) );
  OAI21X1 U4624 ( .A0(n3018), .A1(n3017), .B0(n3016), .Y(n4328) );
  OAI2BB1X2 U4625 ( .A0N(n4330), .A1N(n4328), .B0(n4329), .Y(n3025) );
  ADDHXL U4626 ( .A(n3022), .B(n3021), .CO(n3024), .S(n3019) );
  AOI22X1 U4627 ( .A0(n4612), .A1(n4149), .B0(EXE_MEM_PCnxt[9]), .B1(n4865), 
        .Y(n3026) );
  OAI2BB1X2 U4628 ( .A0N(n4335), .A1N(n3027), .B0(n3026), .Y(n1337) );
  INVXL U4629 ( .A(n3029), .Y(n3030) );
  INVXL U4630 ( .A(n3032), .Y(n3033) );
  AOI21XL U4631 ( .A0(n4328), .A1(n3034), .B0(n3033), .Y(n3047) );
  MX2XL U4632 ( .A(n3970), .B(IF_DEC_PC[10]), .S0(n3036), .Y(n3040) );
  INVXL U4633 ( .A(IF_DEC_PC[10]), .Y(n4392) );
  ADDHXL U4634 ( .A(n3041), .B(IF_DEC_PC[9]), .CO(n3042), .S(n3023) );
  XOR2X1 U4635 ( .A(n3047), .B(n3046), .Y(n3050) );
  OAI2BB1X2 U4636 ( .A0N(n4335), .A1N(n3050), .B0(n3049), .Y(n1338) );
  BUFXL U4637 ( .A(awaddr_m_inf[12]), .Y(awvalid_m_inf_0_) );
  INVXL U4638 ( .A(n4457), .Y(n3052) );
  NAND2XL U4639 ( .A(n3051), .B(n4777), .Y(n4455) );
  OAI21XL U4640 ( .A0(n4454), .A1(n3052), .B0(n4455), .Y(n3667) );
  INVXL U4641 ( .A(n3667), .Y(n3072) );
  NAND2XL U4642 ( .A(n3054), .B(n3053), .Y(n3664) );
  NAND2XL U4643 ( .A(n3056), .B(n3055), .Y(n3663) );
  NAND2XL U4644 ( .A(n3057), .B(n3663), .Y(n3058) );
  XNOR2X1 U4645 ( .A(n4706), .B(n2020), .Y(n3672) );
  OAI22XL U4646 ( .A0(n4620), .A1(n3064), .B0(n3672), .B1(n4707), .Y(n3063) );
  CLKINVX8 U4647 ( .A(n3061), .Y(n4695) );
  NAND2XL U4648 ( .A(n3063), .B(n3062), .Y(n3680) );
  NAND2XL U4649 ( .A(n3683), .B(n3680), .Y(n3066) );
  OAI22XL U4650 ( .A0(n4620), .A1(n4743), .B0(n3064), .B1(n4707), .Y(n3075) );
  NAND2BXL U4651 ( .AN(n4743), .B(n4706), .Y(n3065) );
  NAND2XL U4652 ( .A(n3065), .B(n4620), .Y(n3074) );
  XNOR2XL U4653 ( .A(n3066), .B(n3682), .Y(n3068) );
  AOI222XL U4654 ( .A0(n4865), .A1(EXE_MEM_result[2]), .B0(n4786), .B1(n3069), 
        .C0(n3068), .C1(n4790), .Y(n3070) );
  INVXL U4655 ( .A(n3662), .Y(n3071) );
  NAND2XL U4656 ( .A(n3071), .B(n3664), .Y(n3073) );
  OR2XL U4657 ( .A(n3075), .B(n3074), .Y(n3077) );
  AOI222XL U4658 ( .A0(n4865), .A1(EXE_MEM_result[1]), .B0(n4786), .B1(n3079), 
        .C0(n3078), .C1(n4790), .Y(n3080) );
  OAI21XL U4659 ( .A0(n3082), .A1(n3085), .B0(n3627), .Y(n3083) );
  INVXL U4660 ( .A(n3627), .Y(n3084) );
  NOR3BXL U4661 ( .AN(n4262), .B(n3095), .C(n3094), .Y(n3096) );
  INVXL U4662 ( .A(cpube_ns[0]), .Y(n3101) );
  AOI222XL U4663 ( .A0(n4865), .A1(EXE_MEM_target[3]), .B0(IF_DEC_instr[8]), 
        .B1(n3234), .C0(n3134), .C1(IF_DEC_instr[4]), .Y(n3106) );
  INVXL U4664 ( .A(n3106), .Y(n1319) );
  INVXL U4665 ( .A(instruction_memory_icache_cs[1]), .Y(n3111) );
  XNOR2XL U4666 ( .A(n3813), .B(instruction_memory_lookup_pc[0]), .Y(n3549) );
  INVXL U4667 ( .A(n4270), .Y(n3112) );
  OAI2BB1XL U4668 ( .A0N(n4368), .A1N(n3549), .B0(n3112), .Y(
        instruction_memory_icache_a[0]) );
  INVXL U4669 ( .A(instruction_memory_icache_ready_idx[6]), .Y(n3639) );
  INVXL U4670 ( .A(instruction_memory_icache_headpc[5]), .Y(n3570) );
  INVXL U4671 ( .A(n3573), .Y(n3122) );
  INVXL U4672 ( .A(instruction_memory_icache_headpc[3]), .Y(n3887) );
  INVXL U4673 ( .A(instruction_memory_icache_headpc[2]), .Y(n3215) );
  NAND2XL U4674 ( .A(n3213), .B(instruction_memory_lookup_pc[1]), .Y(n3114) );
  OAI21XL U4675 ( .A0(n3115), .A1(n3545), .B0(n3114), .Y(n3119) );
  NAND2XL U4676 ( .A(n3215), .B(instruction_memory_lookup_pc[2]), .Y(n3223) );
  NAND2XL U4677 ( .A(n3887), .B(instruction_memory_lookup_pc[3]), .Y(n3116) );
  OAI21XL U4678 ( .A0(n3117), .A1(n3223), .B0(n3116), .Y(n3118) );
  INVXL U4679 ( .A(instruction_memory_icache_headpc[4]), .Y(n3883) );
  NAND2XL U4680 ( .A(n3883), .B(instruction_memory_lookup_pc[4]), .Y(n3572) );
  INVXL U4681 ( .A(instruction_memory_lookup_pc[4]), .Y(n4313) );
  INVXL U4682 ( .A(instruction_memory_lookup_pc[5]), .Y(n4798) );
  INVXL U4683 ( .A(n3126), .Y(n3121) );
  INVXL U4684 ( .A(instruction_memory_lookup_pc[6]), .Y(n4322) );
  XOR2XL U4685 ( .A(n4322), .B(instruction_memory_icache_headpc[6]), .Y(n3574)
         );
  OAI2BB1XL U4686 ( .A0N(n4368), .A1N(n3566), .B0(n3638), .Y(
        instruction_memory_icache_a[5]) );
  INVXL U4687 ( .A(n3132), .Y(n1318) );
  INVXL U4688 ( .A(n3133), .Y(n1320) );
  INVXL U4689 ( .A(data_memory_datamem_ns[1]), .Y(n3136) );
  INVXL U4690 ( .A(instruction_memory_icache_cs[0]), .Y(n3192) );
  INVXL U4691 ( .A(instruction_memory_icache_headpc[6]), .Y(n3851) );
  INVXL U4692 ( .A(IF_PC[4]), .Y(n4384) );
  INVXL U4693 ( .A(IF_PC[1]), .Y(n4378) );
  NAND2XL U4694 ( .A(n4378), .B(instruction_memory_icache_headpc[1]), .Y(n3138) );
  OAI21XL U4695 ( .A0(IF_PC[0]), .A1(n3813), .B0(n3138), .Y(n3139) );
  NAND2XL U4696 ( .A(n3140), .B(IF_PC[2]), .Y(n3141) );
  INVXL U4697 ( .A(IF_PC[5]), .Y(n4797) );
  INVXL U4698 ( .A(IF_PC[6]), .Y(n4387) );
  INVXL U4699 ( .A(IF_PC[7]), .Y(n4389) );
  INVXL U4700 ( .A(n3150), .Y(n3151) );
  INVXL U4701 ( .A(IF_PC[9]), .Y(n4395) );
  INVXL U4702 ( .A(n3163), .Y(n3162) );
  INVXL U4703 ( .A(IF_PC[10]), .Y(n4402) );
  INVXL U4704 ( .A(instruction_memory_icache_headpc[9]), .Y(n3732) );
  INVXL U4705 ( .A(IF_PC[8]), .Y(n4391) );
  INVXL U4706 ( .A(instruction_memory_icache_headpc[7]), .Y(n3587) );
  INVXL U4707 ( .A(instruction_memory_icache_ready_idx[3]), .Y(n3692) );
  INVXL U4708 ( .A(IM_invalid), .Y(n3180) );
  INVXL U4709 ( .A(arready_m_inf[1]), .Y(n3191) );
  NAND2XL U4710 ( .A(n3194), .B(n3193), .Y(instruction_memory_icache_ns[1]) );
  OR2XL U4711 ( .A(DM_flush), .B(DM_wen), .Y(n3195) );
  NAND2XL U4712 ( .A(n3195), .B(DM_invalid), .Y(n3196) );
  OAI21XL U4713 ( .A0(DM_invalid), .A1(n4946), .B0(n3196), .Y(n1249) );
  NAND2XL U4714 ( .A(patcal[2]), .B(n4938), .Y(n4936) );
  INVXL U4715 ( .A(n3197), .Y(n3198) );
  OAI21XL U4716 ( .A0(patcal[1]), .A1(n3198), .B0(n4935), .Y(n4933) );
  AOI32XL U4717 ( .A0(n3200), .A1(patcal[3]), .A2(n3199), .B0(n4933), .B1(
        patcal[3]), .Y(n3201) );
  OAI21XL U4718 ( .A0(patcal[3]), .A1(n4936), .B0(n3201), .Y(n1247) );
  NOR4XL U4719 ( .A(data_memory_writeback_count[1]), .B(n3854), .C(
        data_memory_writeback_count[2]), .D(data_memory_writeback_count[4]), 
        .Y(n3203) );
  NAND4XL U4720 ( .A(n3203), .B(wready_m_inf_0_), .C(n3202), .D(n3790), .Y(
        n3204) );
  OAI21XL U4721 ( .A0(n4611), .A1(n3206), .B0(n3205), .Y(n1266) );
  INVXL U4722 ( .A(n3207), .Y(n3208) );
  INVXL U4723 ( .A(n4263), .Y(n3211) );
  NOR4BXL U4724 ( .AN(instruction_memory_instmem_cs[2]), .B(n3211), .C(n3210), 
        .D(n3640), .Y(n3212) );
  OAI22XL U4725 ( .A0(n3212), .A1(cpufe_cs[1]), .B0(cpufe_cs[0]), .B1(n4263), 
        .Y(n1793) );
  INVXL U4726 ( .A(instruction_memory_lookup_pc[0]), .Y(n4315) );
  NAND2XL U4727 ( .A(n4315), .B(instruction_memory_icache_headpc[0]), .Y(n3217) );
  INVXL U4728 ( .A(instruction_memory_lookup_pc[1]), .Y(n4316) );
  NAND2XL U4729 ( .A(n4316), .B(instruction_memory_icache_headpc[1]), .Y(n3214) );
  AOI22XL U4730 ( .A0(n3217), .A1(n3214), .B0(instruction_memory_lookup_pc[1]), 
        .B1(n3213), .Y(n3224) );
  XOR2XL U4731 ( .A(n3215), .B(instruction_memory_lookup_pc[2]), .Y(n3216) );
  XOR2XL U4732 ( .A(instruction_memory_icache_headpc[1]), .B(
        instruction_memory_lookup_pc[1]), .Y(n3546) );
  NAND2XL U4733 ( .A(n4509), .B(n4522), .Y(N579) );
  AOI22XL U4734 ( .A0(DM_wen), .A1(n4949), .B0(EXE_MEM_instcode[4]), .B1(n4823), .Y(n3221) );
  NAND2XL U4735 ( .A(n3221), .B(N579), .Y(n1446) );
  XOR2XL U4736 ( .A(n3883), .B(instruction_memory_lookup_pc[4]), .Y(n3222) );
  INVXL U4737 ( .A(instruction_memory_icache_ready_idx[4]), .Y(n3717) );
  OAI22XL U4738 ( .A0(n3561), .A1(n4363), .B0(instruction_memory_N222), .B1(
        n3717), .Y(instruction_memory_icache_a[4]) );
  INVXL U4739 ( .A(instruction_memory_lookup_pc[2]), .Y(n4342) );
  XOR2XL U4740 ( .A(instruction_memory_icache_headpc[3]), .B(
        instruction_memory_lookup_pc[3]), .Y(n3556) );
  NAND2XL U4741 ( .A(data_memory_lookup_pc[5]), .B(data_memory_lookup_pc[4]), 
        .Y(n3227) );
  INVXL U4742 ( .A(data_memory_lookup_pc[7]), .Y(n4519) );
  INVXL U4743 ( .A(data_memory_lookup_pc[9]), .Y(n4524) );
  INVXL U4744 ( .A(data_memory_lookup_pc[4]), .Y(n4536) );
  INVXL U4745 ( .A(n3230), .Y(n4530) );
  OAI2BB1XL U4746 ( .A0N(n4537), .A1N(data_memory_lookup_pc[6]), .B0(n4530), 
        .Y(n3231) );
  XOR2XL U4747 ( .A(n4541), .B(data_memory_lookup_pc[2]), .Y(n3232) );
  INVXL U4748 ( .A(n3234), .Y(n3235) );
  INVXL U4749 ( .A(EXE_MEM_instcode[4]), .Y(n4822) );
  NAND2XL U4750 ( .A(n4548), .B(C303_DATA2_0), .Y(n3236) );
  INVXL U4751 ( .A(EXE_MEM_target[3]), .Y(n3241) );
  INVXL U4752 ( .A(n3351), .Y(n3242) );
  NAND2XL U4753 ( .A(n3340), .B(core_r8[2]), .Y(n3243) );
  INVXL U4754 ( .A(EXE_MEM_target[2]), .Y(n3244) );
  NAND2XL U4755 ( .A(n3342), .B(core_r12[3]), .Y(n3245) );
  INVXL U4756 ( .A(EXE_MEM_target[1]), .Y(n3246) );
  NAND2XL U4757 ( .A(n3338), .B(core_r10[1]), .Y(n3247) );
  NAND2XL U4758 ( .A(n3340), .B(core_r8[1]), .Y(n3248) );
  NAND2XL U4759 ( .A(n3340), .B(core_r8[3]), .Y(n3249) );
  NAND2XL U4760 ( .A(n3338), .B(core_r10[3]), .Y(n3250) );
  NAND2XL U4761 ( .A(n3338), .B(core_r10[4]), .Y(n3251) );
  NAND2XL U4762 ( .A(n3342), .B(core_r12[4]), .Y(n3252) );
  NAND2XL U4763 ( .A(n3340), .B(core_r8[0]), .Y(n3253) );
  NAND2XL U4764 ( .A(n3338), .B(core_r10[2]), .Y(n3254) );
  NAND2XL U4765 ( .A(n3338), .B(core_r10[0]), .Y(n3255) );
  NAND2XL U4766 ( .A(n3342), .B(core_r12[0]), .Y(n3256) );
  NAND2XL U4767 ( .A(n3340), .B(core_r8[5]), .Y(n3257) );
  NAND2XL U4768 ( .A(n3340), .B(core_r8[4]), .Y(n3258) );
  NAND2XL U4769 ( .A(n3338), .B(core_r10[5]), .Y(n3259) );
  NAND2XL U4770 ( .A(n3342), .B(core_r12[5]), .Y(n3260) );
  NAND2XL U4771 ( .A(n3340), .B(core_r8[10]), .Y(n3261) );
  NAND2XL U4772 ( .A(n3342), .B(core_r12[1]), .Y(n3262) );
  NAND2XL U4773 ( .A(n3338), .B(core_r10[10]), .Y(n3263) );
  NAND2XL U4774 ( .A(n3342), .B(core_r12[15]), .Y(n3264) );
  NAND2XL U4775 ( .A(n3338), .B(core_r10[15]), .Y(n3265) );
  NAND2XL U4776 ( .A(n3340), .B(core_r8[6]), .Y(n3266) );
  NAND2XL U4777 ( .A(n3338), .B(core_r10[6]), .Y(n3267) );
  NAND2XL U4778 ( .A(n3342), .B(core_r12[10]), .Y(n3268) );
  NAND2XL U4779 ( .A(n3342), .B(core_r12[6]), .Y(n3269) );
  NAND2XL U4780 ( .A(n3340), .B(core_r8[15]), .Y(n3270) );
  NAND2XL U4781 ( .A(n3340), .B(core_r8[7]), .Y(n3271) );
  NAND2XL U4782 ( .A(n3340), .B(core_r8[11]), .Y(n3272) );
  NAND2XL U4783 ( .A(n3338), .B(core_r10[7]), .Y(n3273) );
  NAND2XL U4784 ( .A(n3338), .B(core_r10[11]), .Y(n3274) );
  NAND2XL U4785 ( .A(n3342), .B(core_r12[2]), .Y(n3275) );
  NAND2XL U4786 ( .A(n3342), .B(core_r12[7]), .Y(n3276) );
  NAND2XL U4787 ( .A(n3342), .B(core_r12[11]), .Y(n3277) );
  NAND2XL U4788 ( .A(n3340), .B(core_r8[8]), .Y(n3278) );
  NAND2XL U4789 ( .A(n3342), .B(core_r12[8]), .Y(n3279) );
  NAND2XL U4790 ( .A(n3340), .B(core_r8[13]), .Y(n3280) );
  NAND2XL U4791 ( .A(n3342), .B(core_r12[13]), .Y(n3281) );
  NAND2XL U4792 ( .A(n3338), .B(core_r10[8]), .Y(n3282) );
  NAND2XL U4793 ( .A(n3340), .B(core_r8[12]), .Y(n3283) );
  NAND2XL U4794 ( .A(n3338), .B(core_r10[13]), .Y(n3284) );
  NAND2XL U4795 ( .A(n3338), .B(core_r10[9]), .Y(n3285) );
  NAND2XL U4796 ( .A(n3340), .B(core_r8[9]), .Y(n3286) );
  NAND2XL U4797 ( .A(n3338), .B(core_r10[12]), .Y(n3287) );
  NAND2XL U4798 ( .A(n3342), .B(core_r12[12]), .Y(n3288) );
  NAND2XL U4799 ( .A(n3342), .B(core_r12[9]), .Y(n3289) );
  INVXL U4800 ( .A(n3349), .Y(n3291) );
  NAND2XL U4801 ( .A(n3346), .B(core_r2[11]), .Y(n3292) );
  NAND2XL U4802 ( .A(n3348), .B(core_r0[7]), .Y(n3293) );
  NAND2XL U4803 ( .A(n3344), .B(core_r4[7]), .Y(n3294) );
  NAND2XL U4804 ( .A(n3344), .B(core_r4[6]), .Y(n3295) );
  NAND2XL U4805 ( .A(n3346), .B(core_r2[12]), .Y(n3296) );
  NAND2XL U4806 ( .A(n3348), .B(core_r0[8]), .Y(n3297) );
  NAND2XL U4807 ( .A(n3348), .B(core_r0[6]), .Y(n3298) );
  NAND2XL U4808 ( .A(n3346), .B(core_r2[15]), .Y(n3299) );
  NAND2XL U4809 ( .A(n3346), .B(core_r2[6]), .Y(n3300) );
  NAND2XL U4810 ( .A(n3348), .B(core_r0[12]), .Y(n3301) );
  NAND2XL U4811 ( .A(n3344), .B(core_r4[13]), .Y(n3302) );
  NAND2XL U4812 ( .A(n3346), .B(core_r2[10]), .Y(n3303) );
  NAND2XL U4813 ( .A(n3344), .B(core_r4[15]), .Y(n3304) );
  NAND2XL U4814 ( .A(n3348), .B(core_r0[10]), .Y(n3305) );
  NAND2XL U4815 ( .A(n3348), .B(core_r0[1]), .Y(n3306) );
  NAND2XL U4816 ( .A(n3344), .B(core_r4[5]), .Y(n3307) );
  NAND2XL U4817 ( .A(n3346), .B(core_r2[7]), .Y(n3308) );
  NAND2XL U4818 ( .A(n3346), .B(core_r2[13]), .Y(n3309) );
  NAND2XL U4819 ( .A(n3348), .B(core_r0[5]), .Y(n3310) );
  NAND2XL U4820 ( .A(n3348), .B(core_r0[9]), .Y(n3311) );
  NAND2XL U4821 ( .A(n3346), .B(core_r2[9]), .Y(n3312) );
  NAND2XL U4822 ( .A(n3348), .B(core_r0[11]), .Y(n3313) );
  NAND2XL U4823 ( .A(n3344), .B(core_r4[9]), .Y(n3314) );
  NAND2XL U4824 ( .A(n3344), .B(core_r4[0]), .Y(n3315) );
  NAND2XL U4825 ( .A(n3346), .B(core_r2[8]), .Y(n3316) );
  NAND2XL U4826 ( .A(n3346), .B(core_r2[0]), .Y(n3317) );
  NAND2XL U4827 ( .A(n3344), .B(core_r4[8]), .Y(n3318) );
  NAND2XL U4828 ( .A(n3346), .B(core_r2[1]), .Y(n3319) );
  NAND2XL U4829 ( .A(n3346), .B(core_r2[5]), .Y(n3320) );
  NAND2XL U4830 ( .A(n3348), .B(core_r0[0]), .Y(n3321) );
  NAND2XL U4831 ( .A(n3344), .B(core_r4[4]), .Y(n3322) );
  NAND2XL U4832 ( .A(n3344), .B(core_r4[1]), .Y(n3323) );
  NAND2XL U4833 ( .A(n3346), .B(core_r2[4]), .Y(n3324) );
  NAND2XL U4834 ( .A(n3348), .B(core_r0[15]), .Y(n3325) );
  NAND2XL U4835 ( .A(n3348), .B(core_r0[4]), .Y(n3326) );
  NAND2XL U4836 ( .A(n3344), .B(core_r4[12]), .Y(n3327) );
  NAND2XL U4837 ( .A(n3348), .B(core_r0[13]), .Y(n3328) );
  NAND2XL U4838 ( .A(n3344), .B(core_r4[10]), .Y(n3329) );
  NAND2XL U4839 ( .A(n3344), .B(core_r4[2]), .Y(n3330) );
  NAND2XL U4840 ( .A(n3348), .B(core_r0[2]), .Y(n3331) );
  NAND2XL U4841 ( .A(n3344), .B(core_r4[11]), .Y(n3332) );
  NAND2XL U4842 ( .A(n3346), .B(core_r2[2]), .Y(n3333) );
  NAND2XL U4843 ( .A(n3344), .B(core_r4[3]), .Y(n3334) );
  NAND2XL U4844 ( .A(n3346), .B(core_r2[3]), .Y(n3335) );
  NAND2XL U4845 ( .A(n3348), .B(core_r0[3]), .Y(n3336) );
  NAND2XL U4846 ( .A(n3338), .B(core_r10[14]), .Y(n3337) );
  NAND2XL U4847 ( .A(n3340), .B(core_r8[14]), .Y(n3339) );
  NAND2XL U4848 ( .A(n3342), .B(core_r12[14]), .Y(n3341) );
  NAND2XL U4849 ( .A(n3344), .B(core_r4[14]), .Y(n3343) );
  NAND2XL U4850 ( .A(n3346), .B(core_r2[14]), .Y(n3345) );
  NAND2XL U4851 ( .A(n3348), .B(core_r0[14]), .Y(n3347) );
  NAND2XL U4852 ( .A(n3453), .B(core_r1[3]), .Y(n3350) );
  NAND2XL U4853 ( .A(n3445), .B(core_r13[2]), .Y(n3352) );
  NAND2XL U4854 ( .A(n3455), .B(core_r3[3]), .Y(n3353) );
  NAND2XL U4855 ( .A(n3449), .B(core_r5[2]), .Y(n3355) );
  NAND2XL U4856 ( .A(n3451), .B(core_r9[2]), .Y(n3357) );
  NAND2XL U4857 ( .A(n3455), .B(core_r3[2]), .Y(n3358) );
  NAND2XL U4858 ( .A(n3451), .B(core_r9[3]), .Y(n3359) );
  NAND2XL U4859 ( .A(n3449), .B(core_r5[3]), .Y(n3360) );
  NAND2XL U4860 ( .A(n3447), .B(core_r11[3]), .Y(n3362) );
  NAND2XL U4861 ( .A(n3445), .B(core_r13[1]), .Y(n3363) );
  NAND2XL U4862 ( .A(n3445), .B(core_r13[3]), .Y(n3364) );
  NAND2XL U4863 ( .A(n3447), .B(core_r11[1]), .Y(n3365) );
  NAND2XL U4864 ( .A(n3453), .B(core_r1[4]), .Y(n3366) );
  NAND2XL U4865 ( .A(n3451), .B(core_r9[1]), .Y(n3367) );
  NAND2XL U4866 ( .A(n3455), .B(core_r3[4]), .Y(n3368) );
  NAND2XL U4867 ( .A(n3453), .B(core_r1[2]), .Y(n3369) );
  NAND2XL U4868 ( .A(n3449), .B(core_r5[4]), .Y(n3370) );
  NAND2XL U4869 ( .A(n3447), .B(core_r11[2]), .Y(n3371) );
  NAND2XL U4870 ( .A(n3451), .B(core_r9[4]), .Y(n3372) );
  NAND2XL U4871 ( .A(n3453), .B(core_r1[0]), .Y(n3373) );
  NAND2XL U4872 ( .A(n3447), .B(core_r11[4]), .Y(n3374) );
  NAND2XL U4873 ( .A(n3455), .B(core_r3[0]), .Y(n3375) );
  NAND2XL U4874 ( .A(n3445), .B(core_r13[4]), .Y(n3376) );
  NAND2XL U4875 ( .A(n3449), .B(core_r5[0]), .Y(n3377) );
  NAND2XL U4876 ( .A(n3451), .B(core_r9[0]), .Y(n3378) );
  NAND2XL U4877 ( .A(n3453), .B(core_r1[5]), .Y(n3379) );
  NAND2XL U4878 ( .A(n3447), .B(core_r11[0]), .Y(n3380) );
  NAND2XL U4879 ( .A(n3455), .B(core_r3[5]), .Y(n3381) );
  NAND2XL U4880 ( .A(n3445), .B(core_r13[0]), .Y(n3382) );
  NAND2XL U4881 ( .A(n3449), .B(core_r5[5]), .Y(n3383) );
  NAND2XL U4882 ( .A(n3453), .B(core_r1[1]), .Y(n3384) );
  NAND2XL U4883 ( .A(n3451), .B(core_r9[5]), .Y(n3385) );
  NAND2XL U4884 ( .A(n3453), .B(core_r1[10]), .Y(n3386) );
  NAND2XL U4885 ( .A(n3449), .B(core_r5[1]), .Y(n3387) );
  NAND2XL U4886 ( .A(n3455), .B(core_r3[10]), .Y(n3388) );
  NAND2XL U4887 ( .A(n3455), .B(core_r3[1]), .Y(n3389) );
  NAND2XL U4888 ( .A(n3449), .B(core_r5[10]), .Y(n3390) );
  NAND2XL U4889 ( .A(n3453), .B(core_r1[6]), .Y(n3391) );
  NAND2XL U4890 ( .A(n3451), .B(core_r9[10]), .Y(n3392) );
  NAND2XL U4891 ( .A(n3455), .B(core_r3[6]), .Y(n3393) );
  NAND2XL U4892 ( .A(n3445), .B(core_r13[15]), .Y(n3394) );
  NAND2XL U4893 ( .A(n3449), .B(core_r5[6]), .Y(n3395) );
  NAND2XL U4894 ( .A(n3447), .B(core_r11[15]), .Y(n3396) );
  NAND2XL U4895 ( .A(n3451), .B(core_r9[6]), .Y(n3397) );
  NAND2XL U4896 ( .A(n3451), .B(core_r9[15]), .Y(n3398) );
  NAND2XL U4897 ( .A(n3447), .B(core_r11[6]), .Y(n3399) );
  NAND2XL U4898 ( .A(n3447), .B(core_r11[10]), .Y(n3400) );
  NAND2XL U4899 ( .A(n3445), .B(core_r13[6]), .Y(n3401) );
  NAND2XL U4900 ( .A(n3445), .B(core_r13[10]), .Y(n3402) );
  NAND2XL U4901 ( .A(n3453), .B(core_r1[7]), .Y(n3403) );
  NAND2XL U4902 ( .A(n3449), .B(core_r5[15]), .Y(n3404) );
  NAND2XL U4903 ( .A(n3455), .B(core_r3[7]), .Y(n3405) );
  NAND2XL U4904 ( .A(n3453), .B(core_r1[11]), .Y(n3406) );
  NAND2XL U4905 ( .A(n3449), .B(core_r5[7]), .Y(n3407) );
  NAND2XL U4906 ( .A(n3455), .B(core_r3[11]), .Y(n3408) );
  NAND2XL U4907 ( .A(n3451), .B(core_r9[7]), .Y(n3409) );
  NAND2XL U4908 ( .A(n3449), .B(core_r5[11]), .Y(n3410) );
  NAND2XL U4909 ( .A(n3447), .B(core_r11[7]), .Y(n3411) );
  NAND2XL U4910 ( .A(n3451), .B(core_r9[11]), .Y(n3412) );
  NAND2XL U4911 ( .A(n3445), .B(core_r13[7]), .Y(n3413) );
  NAND2XL U4912 ( .A(n3447), .B(core_r11[11]), .Y(n3414) );
  NAND2XL U4913 ( .A(n3453), .B(core_r1[8]), .Y(n3415) );
  NAND2XL U4914 ( .A(n3445), .B(core_r13[11]), .Y(n3416) );
  NAND2XL U4915 ( .A(n3455), .B(core_r3[8]), .Y(n3417) );
  NAND2XL U4916 ( .A(n3455), .B(core_r3[15]), .Y(n3418) );
  NAND2XL U4917 ( .A(n3449), .B(core_r5[8]), .Y(n3419) );
  NAND2XL U4918 ( .A(n3453), .B(core_r1[12]), .Y(n3420) );
  NAND2XL U4919 ( .A(n3451), .B(core_r9[8]), .Y(n3421) );
  NAND2XL U4920 ( .A(n3455), .B(core_r3[12]), .Y(n3422) );
  NAND2XL U4921 ( .A(n3447), .B(core_r11[8]), .Y(n3423) );
  NAND2XL U4922 ( .A(n3453), .B(core_r1[15]), .Y(n3424) );
  NAND2XL U4923 ( .A(n3445), .B(core_r13[8]), .Y(n3425) );
  NAND2XL U4924 ( .A(n3449), .B(core_r5[12]), .Y(n3426) );
  NAND2XL U4925 ( .A(n3453), .B(core_r1[9]), .Y(n3427) );
  NAND2XL U4926 ( .A(n3447), .B(core_r11[5]), .Y(n3428) );
  NAND2XL U4927 ( .A(n3455), .B(core_r3[9]), .Y(n3429) );
  NAND2XL U4928 ( .A(n3445), .B(core_r13[5]), .Y(n3430) );
  NAND2XL U4929 ( .A(n3449), .B(core_r5[9]), .Y(n3431) );
  NAND2XL U4930 ( .A(n3445), .B(core_r13[13]), .Y(n3432) );
  NAND2XL U4931 ( .A(n3451), .B(core_r9[9]), .Y(n3433) );
  NAND2XL U4932 ( .A(n3447), .B(core_r11[13]), .Y(n3434) );
  NAND2XL U4933 ( .A(n3447), .B(core_r11[9]), .Y(n3435) );
  NAND2XL U4934 ( .A(n3451), .B(core_r9[13]), .Y(n3436) );
  NAND2XL U4935 ( .A(n3445), .B(core_r13[9]), .Y(n3437) );
  NAND2XL U4936 ( .A(n3449), .B(core_r5[13]), .Y(n3438) );
  NAND2XL U4937 ( .A(n3451), .B(core_r9[12]), .Y(n3439) );
  NAND2XL U4938 ( .A(n3455), .B(core_r3[13]), .Y(n3440) );
  NAND2XL U4939 ( .A(n3445), .B(core_r13[12]), .Y(n3441) );
  NAND2XL U4940 ( .A(n3453), .B(core_r1[13]), .Y(n3442) );
  NAND2XL U4941 ( .A(n3447), .B(core_r11[12]), .Y(n3443) );
  NAND2XL U4942 ( .A(n3445), .B(core_r13[14]), .Y(n3444) );
  NAND2XL U4943 ( .A(n3447), .B(core_r11[14]), .Y(n3446) );
  NAND2XL U4944 ( .A(n3449), .B(core_r5[14]), .Y(n3448) );
  NAND2XL U4945 ( .A(n3451), .B(core_r9[14]), .Y(n3450) );
  NAND2XL U4946 ( .A(n3453), .B(core_r1[14]), .Y(n3452) );
  NAND2XL U4947 ( .A(n3455), .B(core_r3[14]), .Y(n3454) );
  NAND2XL U4948 ( .A(n3489), .B(core_r14[15]), .Y(n3457) );
  NAND2XL U4949 ( .A(n3489), .B(core_r14[6]), .Y(n3458) );
  NAND2XL U4950 ( .A(n3489), .B(core_r14[5]), .Y(n3459) );
  NAND2XL U4951 ( .A(n3489), .B(core_r14[12]), .Y(n3460) );
  NAND2XL U4952 ( .A(n3489), .B(core_r14[10]), .Y(n3461) );
  NAND2XL U4953 ( .A(n3489), .B(core_r14[0]), .Y(n3462) );
  NAND2XL U4954 ( .A(n3489), .B(core_r14[9]), .Y(n3463) );
  NAND2XL U4955 ( .A(n3489), .B(core_r14[11]), .Y(n3464) );
  NAND2XL U4956 ( .A(n3489), .B(core_r14[13]), .Y(n3465) );
  NAND2XL U4957 ( .A(n3489), .B(core_r14[2]), .Y(n3466) );
  NAND2XL U4958 ( .A(n3489), .B(core_r14[7]), .Y(n3467) );
  NAND2XL U4959 ( .A(n3489), .B(core_r14[3]), .Y(n3468) );
  NAND2XL U4960 ( .A(n3489), .B(core_r14[4]), .Y(n3469) );
  NAND2XL U4961 ( .A(n3489), .B(core_r14[1]), .Y(n3470) );
  NAND2XL U4962 ( .A(n3489), .B(core_r14[8]), .Y(n3471) );
  NAND2XL U4963 ( .A(n3491), .B(core_r6[10]), .Y(n3473) );
  NAND2XL U4964 ( .A(n3491), .B(core_r6[0]), .Y(n3474) );
  NAND2XL U4965 ( .A(n3491), .B(core_r6[13]), .Y(n3475) );
  NAND2XL U4966 ( .A(n3491), .B(core_r6[9]), .Y(n3476) );
  NAND2XL U4967 ( .A(n3491), .B(core_r6[3]), .Y(n3477) );
  NAND2XL U4968 ( .A(n3491), .B(core_r6[8]), .Y(n3478) );
  NAND2XL U4969 ( .A(n3491), .B(core_r6[4]), .Y(n3479) );
  NAND2XL U4970 ( .A(n3491), .B(core_r6[15]), .Y(n3480) );
  NAND2XL U4971 ( .A(n3491), .B(core_r6[11]), .Y(n3481) );
  NAND2XL U4972 ( .A(n3491), .B(core_r6[2]), .Y(n3482) );
  NAND2XL U4973 ( .A(n3491), .B(core_r6[12]), .Y(n3483) );
  NAND2XL U4974 ( .A(n3491), .B(core_r6[6]), .Y(n3484) );
  NAND2XL U4975 ( .A(n3491), .B(core_r6[1]), .Y(n3485) );
  NAND2XL U4976 ( .A(n3491), .B(core_r6[7]), .Y(n3486) );
  NAND2XL U4977 ( .A(n3491), .B(core_r6[5]), .Y(n3487) );
  NAND2XL U4978 ( .A(n3489), .B(core_r14[14]), .Y(n3488) );
  NAND2XL U4979 ( .A(n3491), .B(core_r6[14]), .Y(n3490) );
  NAND2XL U4980 ( .A(n3543), .B(core_r7[5]), .Y(n3493) );
  NAND2XL U4981 ( .A(n3543), .B(core_r7[9]), .Y(n3494) );
  NAND2XL U4982 ( .A(n3543), .B(core_r7[12]), .Y(n3495) );
  NAND2XL U4983 ( .A(n3541), .B(core_r15[7]), .Y(n3498) );
  NAND2XL U4984 ( .A(n3541), .B(core_r15[9]), .Y(n3499) );
  NAND2XL U4985 ( .A(n3543), .B(core_r7[11]), .Y(n3501) );
  NAND2XL U4986 ( .A(n3543), .B(core_r7[13]), .Y(n3502) );
  NAND2XL U4987 ( .A(n3543), .B(core_r7[6]), .Y(n3503) );
  NAND2XL U4988 ( .A(n3541), .B(core_r15[11]), .Y(n3504) );
  NAND2XL U4989 ( .A(n3543), .B(core_r7[8]), .Y(n3506) );
  NAND2XL U4990 ( .A(n3543), .B(core_r7[7]), .Y(n3507) );
  NAND2XL U4991 ( .A(n3541), .B(core_r15[1]), .Y(n3509) );
  NAND2XL U4992 ( .A(n3541), .B(core_r15[5]), .Y(n3510) );
  NAND2XL U4993 ( .A(n3543), .B(core_r7[4]), .Y(n3512) );
  NAND2XL U4994 ( .A(n3541), .B(core_r15[15]), .Y(n3513) );
  NAND2XL U4995 ( .A(n3541), .B(core_r15[12]), .Y(n3514) );
  NAND2XL U4996 ( .A(n3541), .B(core_r15[6]), .Y(n3516) );
  NAND2XL U4997 ( .A(n3541), .B(core_r15[8]), .Y(n3518) );
  NAND2XL U4998 ( .A(n3543), .B(core_r7[15]), .Y(n3520) );
  NAND2XL U4999 ( .A(n3541), .B(core_r15[13]), .Y(n3522) );
  NAND2XL U5000 ( .A(n3543), .B(core_r7[10]), .Y(n3524) );
  NAND2XL U5001 ( .A(n3541), .B(core_r15[10]), .Y(n3525) );
  NAND2XL U5002 ( .A(n3543), .B(core_r7[1]), .Y(n3527) );
  NAND2XL U5003 ( .A(n3541), .B(core_r15[4]), .Y(n3529) );
  NAND2XL U5004 ( .A(n3541), .B(core_r15[2]), .Y(n3531) );
  NAND2XL U5005 ( .A(n3543), .B(core_r7[2]), .Y(n3532) );
  NAND2XL U5006 ( .A(n3541), .B(core_r15[3]), .Y(n3534) );
  NAND2XL U5007 ( .A(n3543), .B(core_r7[3]), .Y(n3535) );
  NAND2XL U5008 ( .A(n3541), .B(core_r15[0]), .Y(n3537) );
  NAND2XL U5009 ( .A(n3543), .B(core_r7[0]), .Y(n3538) );
  NAND2XL U5010 ( .A(n3541), .B(core_r15[14]), .Y(n3540) );
  NAND2XL U5011 ( .A(n3543), .B(core_r7[14]), .Y(n3542) );
  XOR2XL U5012 ( .A(n3546), .B(n3545), .Y(n3547) );
  INVXL U5013 ( .A(instruction_memory_icache_ready_idx[1]), .Y(n3721) );
  XNOR2XL U5014 ( .A(n3547), .B(n3721), .Y(n3551) );
  INVXL U5015 ( .A(instruction_memory_icache_ready_idx[0]), .Y(n3548) );
  XNOR2XL U5016 ( .A(n3549), .B(n3548), .Y(n3550) );
  INVXL U5017 ( .A(n3552), .Y(n3553) );
  INVXL U5018 ( .A(instruction_memory_icache_ready_idx[2]), .Y(n4269) );
  XOR2XL U5019 ( .A(n3553), .B(n4269), .Y(n3554) );
  NAND2XL U5020 ( .A(n3555), .B(n3554), .Y(n3560) );
  XNOR2XL U5021 ( .A(n3558), .B(n3692), .Y(n3559) );
  XOR2XL U5022 ( .A(n3562), .B(n3717), .Y(n3563) );
  NAND2XL U5023 ( .A(n3564), .B(n3563), .Y(n3568) );
  INVXL U5024 ( .A(instruction_memory_icache_ready_idx[5]), .Y(n3565) );
  XNOR2XL U5025 ( .A(n3566), .B(n3565), .Y(n3567) );
  INVXL U5026 ( .A(n3599), .Y(n3585) );
  NAND2XL U5027 ( .A(n3570), .B(instruction_memory_lookup_pc[5]), .Y(n3571) );
  OAI21XL U5028 ( .A0(n3573), .A1(n3572), .B0(n3571), .Y(n3595) );
  AOI21XL U5029 ( .A0(n3585), .A1(n3580), .B0(n3595), .Y(n3576) );
  INVXL U5030 ( .A(n3574), .Y(n3575) );
  XOR2XL U5031 ( .A(n3576), .B(n3575), .Y(n3577) );
  XOR2XL U5032 ( .A(n3577), .B(n3639), .Y(n3578) );
  NAND2XL U5033 ( .A(n3579), .B(n3578), .Y(n3591) );
  INVXL U5034 ( .A(n3581), .Y(n3596) );
  NAND2XL U5035 ( .A(n3580), .B(n3596), .Y(n3598) );
  INVXL U5036 ( .A(n3598), .Y(n3584) );
  INVXL U5037 ( .A(n3595), .Y(n3582) );
  NAND2XL U5038 ( .A(n3851), .B(instruction_memory_lookup_pc[6]), .Y(n3592) );
  OAI21XL U5039 ( .A0(n3582), .A1(n3581), .B0(n3592), .Y(n3583) );
  AOI21XL U5040 ( .A0(n3585), .A1(n3584), .B0(n3583), .Y(n3589) );
  NAND2XL U5041 ( .A(n3587), .B(instruction_memory_lookup_pc[7]), .Y(n3593) );
  NAND2XL U5042 ( .A(n3586), .B(n3593), .Y(n3588) );
  XOR2XL U5043 ( .A(n3589), .B(n3588), .Y(n3590) );
  NAND2XL U5044 ( .A(n3593), .B(n3592), .Y(n3594) );
  AOI21XL U5045 ( .A0(n3596), .A1(n3595), .B0(n3594), .Y(n3597) );
  INVXL U5046 ( .A(instruction_memory_icache_headpc[8]), .Y(n3600) );
  OR2XL U5047 ( .A(n3600), .B(instruction_memory_lookup_pc[8]), .Y(n3601) );
  NAND2XL U5048 ( .A(n3600), .B(instruction_memory_lookup_pc[8]), .Y(n3605) );
  NAND2XL U5049 ( .A(n3601), .B(n3605), .Y(n3602) );
  INVXL U5050 ( .A(n3605), .Y(n3613) );
  OR2XL U5051 ( .A(n3732), .B(instruction_memory_lookup_pc[9]), .Y(n3606) );
  NAND2XL U5052 ( .A(n3732), .B(instruction_memory_lookup_pc[9]), .Y(n3611) );
  NAND2XL U5053 ( .A(n3606), .B(n3611), .Y(n3607) );
  INVXL U5054 ( .A(n3611), .Y(n3612) );
  INVXL U5055 ( .A(instruction_memory_icache_headpc[10]), .Y(n3616) );
  OR2XL U5056 ( .A(n3616), .B(instruction_memory_lookup_pc[10]), .Y(n3618) );
  NAND2XL U5057 ( .A(n3616), .B(instruction_memory_lookup_pc[10]), .Y(n3617)
         );
  NAND2XL U5058 ( .A(n3618), .B(n3617), .Y(n3619) );
  OAI21XL U5059 ( .A0(cpube_cs[0]), .A1(n3627), .B0(n3626), .Y(n3628) );
  INVXL U5060 ( .A(n4144), .Y(n3644) );
  NAND3XL U5061 ( .A(cpufe_cs[0]), .B(cpufe_cs[1]), .C(IM_invalid), .Y(n3642)
         );
  INVXL U5062 ( .A(n4548), .Y(n3646) );
  INVXL U5063 ( .A(n3649), .Y(n3650) );
  INVXL U5064 ( .A(n3723), .Y(n3653) );
  INVXL U5065 ( .A(n3654), .Y(n3657) );
  INVXL U5066 ( .A(n3795), .Y(n3651) );
  NAND3XL U5067 ( .A(n3651), .B(data_memory_dcache_ready_idx[6]), .C(
        data_memory_dcache_ready_idx[5]), .Y(n3652) );
  OAI21XL U5068 ( .A0(n3654), .A1(data_memory_dcache_ready_idx[4]), .B0(
        data_memory_dcache_ready_idx[3]), .Y(n3655) );
  INVXL U5069 ( .A(n4948), .Y(n3661) );
  INVXL U5070 ( .A(data_memory_writeback_headpc[6]), .Y(n3744) );
  INVXL U5071 ( .A(data_memory_writeback_headpc[10]), .Y(n3753) );
  OAI21XL U5072 ( .A0(n3665), .A1(n3664), .B0(n3663), .Y(n3666) );
  AOI21XL U5073 ( .A0(n3668), .A1(n3667), .B0(n3666), .Y(n3923) );
  INVXL U5074 ( .A(n3755), .Y(n3695) );
  NAND2XL U5075 ( .A(n3670), .B(n3669), .Y(n3757) );
  NAND2XL U5076 ( .A(n3695), .B(n3757), .Y(n3671) );
  XNOR2X1 U5077 ( .A(n4706), .B(n4698), .Y(n3701) );
  XOR2X1 U5078 ( .A(n4466), .B(n4693), .Y(n3673) );
  NAND2X4 U5079 ( .A(n4695), .B(n3673), .Y(n4210) );
  INVXL U5080 ( .A(n4693), .Y(n3675) );
  NAND2BXL U5081 ( .AN(n4743), .B(n4693), .Y(n3674) );
  OAI22XL U5082 ( .A0(n4210), .A1(n3675), .B0(n4695), .B1(n3674), .Y(n3703) );
  INVXL U5083 ( .A(n3709), .Y(n3679) );
  NAND2XL U5084 ( .A(n3678), .B(n3677), .Y(n3707) );
  NAND2XL U5085 ( .A(n3679), .B(n3707), .Y(n3684) );
  INVXL U5086 ( .A(n3680), .Y(n3681) );
  XOR2XL U5087 ( .A(n3684), .B(n3708), .Y(n3685) );
  AOI222XL U5088 ( .A0(n4865), .A1(EXE_MEM_result[3]), .B0(n4786), .B1(n3686), 
        .C0(n3685), .C1(n4790), .Y(n3687) );
  INVXL U5089 ( .A(n3687), .Y(n1315) );
  NAND2XL U5090 ( .A(n3688), .B(instruction_memory_icache_ready_idx[5]), .Y(
        n3689) );
  AOI31XL U5091 ( .A0(n2023), .A1(n3690), .A2(n3692), .B0(n4274), .Y(n3691) );
  INVXL U5092 ( .A(araddr_m_inf[44]), .Y(n3693) );
  INVXL U5093 ( .A(n4800), .Y(n4359) );
  INVXL U5094 ( .A(n3757), .Y(n3694) );
  INVXL U5095 ( .A(n3758), .Y(n3698) );
  NAND2XL U5096 ( .A(n3697), .B(n3696), .Y(n3756) );
  NAND2XL U5097 ( .A(n3698), .B(n3756), .Y(n3699) );
  XOR2X4 U5098 ( .A(n1803), .B(n4693), .Y(n4740) );
  OAI22XL U5099 ( .A0(n4210), .A1(n3702), .B0(n4695), .B1(n3768), .Y(n3771) );
  NAND2XL U5100 ( .A(n3706), .B(n3705), .Y(n3777) );
  OAI21XL U5101 ( .A0(n3709), .A1(n3708), .B0(n3707), .Y(n3780) );
  AOI222XL U5102 ( .A0(n4865), .A1(EXE_MEM_result[4]), .B0(n4786), .B1(n3712), 
        .C0(n3711), .C1(n4790), .Y(n3713) );
  INVXL U5103 ( .A(n3713), .Y(n1314) );
  OAI21XL U5104 ( .A0(n3714), .A1(instruction_memory_icache_ready_idx[4]), 
        .B0(instruction_memory_icache_ready_idx[3]), .Y(n3715) );
  OAI211XL U5105 ( .A0(instruction_memory_icache_ready_idx[3]), .A1(
        instruction_memory_icache_ready_idx[4]), .B0(n3715), .C0(n2023), .Y(
        n3716) );
  NAND2XL U5106 ( .A(n4270), .B(n3721), .Y(n3719) );
  OAI21XL U5107 ( .A0(n4819), .A1(data_memory_dcache_ready_idx[2]), .B0(
        data_memory_dcache_ready_idx[1]), .Y(n3726) );
  INVXL U5108 ( .A(instruction_memory_lookup_pc[7]), .Y(n4327) );
  INVXL U5109 ( .A(instruction_memory_lookup_pc[9]), .Y(n4341) );
  INVXL U5110 ( .A(n4357), .Y(n4353) );
  INVXL U5111 ( .A(n4354), .Y(n3730) );
  OAI21XL U5112 ( .A0(n3795), .A1(data_memory_dcache_ready_idx[6]), .B0(
        data_memory_dcache_ready_idx[5]), .Y(n3735) );
  ADDFXL U5113 ( .A(n2120), .B(n3742), .CI(n3824), .CO(n3187), .S(n3743) );
  AOI222XL U5114 ( .A0(n4865), .A1(EXE_MEM_PCnxt[0]), .B0(n4612), .B1(
        IF_DEC_instr[1]), .C0(n3750), .C1(n4335), .Y(n3751) );
  INVXL U5115 ( .A(n3751), .Y(n1339) );
  XOR2XL U5116 ( .A(n3846), .B(data_memory_dcache_headpc[10]), .Y(n3754) );
  OAI21XL U5117 ( .A0(n3758), .A1(n3757), .B0(n3756), .Y(n3919) );
  INVXL U5118 ( .A(IF_DEC_PC[5]), .Y(n4385) );
  INVXL U5119 ( .A(n3913), .Y(n3763) );
  NAND2XL U5120 ( .A(n3762), .B(n3761), .Y(n3916) );
  NAND2XL U5121 ( .A(n3763), .B(n3916), .Y(n3764) );
  XOR2X1 U5122 ( .A(n3765), .B(n4737), .Y(n3766) );
  NAND2X4 U5123 ( .A(n3766), .B(n4740), .Y(n4636) );
  NAND2BXL U5124 ( .AN(n4743), .B(n4737), .Y(n3767) );
  OAI22XL U5125 ( .A0(n4210), .A1(n3768), .B0(n4695), .B1(n3894), .Y(n3901) );
  XNOR2XL U5126 ( .A(n4743), .B(n4737), .Y(n3769) );
  XNOR2XL U5127 ( .A(n4689), .B(n4737), .Y(n3899) );
  OAI22XL U5128 ( .A0(n4636), .A1(n3769), .B0(n4740), .B1(n3899), .Y(n3896) );
  XNOR2XL U5129 ( .A(n4706), .B(n4169), .Y(n3898) );
  AOI21XL U5130 ( .A0(n3780), .A1(n3779), .B0(n3778), .Y(n3908) );
  AOI222XL U5131 ( .A0(n4865), .A1(EXE_MEM_result[5]), .B0(n4786), .B1(n3783), 
        .C0(n3782), .C1(n4790), .Y(n3784) );
  INVXL U5132 ( .A(n3784), .Y(n1313) );
  INVXL U5133 ( .A(data_memory_writeback_type[0]), .Y(n4595) );
  AOI22XL U5134 ( .A0(n4603), .A1(data_memory_dcache_dirty[3]), .B0(
        data_memory_dcache_dirty[0]), .B1(data_memory_dcache_dirty[1]), .Y(
        n3804) );
  AOI21XL U5135 ( .A0(data_memory_dcache_dirty[2]), .A1(n4597), .B0(n3801), 
        .Y(n3803) );
  NAND2XL U5136 ( .A(instruction_memory_lookup_pc[10]), .B(
        instruction_memory_lookup_pc[9]), .Y(n3810) );
  NAND2XL U5137 ( .A(instruction_memory_lookup_pc[8]), .B(
        instruction_memory_lookup_pc[7]), .Y(n3809) );
  AOI222XL U5138 ( .A0(n3844), .A1(MEM_WB_memout[13]), .B0(n2016), .B1(
        data_memory_dcache_q[13]), .C0(rdata_m_inf[13]), .C1(n3843), .Y(n3818)
         );
  INVXL U5139 ( .A(n3818), .Y(n1427) );
  AOI222XL U5140 ( .A0(n3844), .A1(MEM_WB_memout[3]), .B0(n3843), .B1(
        rdata_m_inf[3]), .C0(data_memory_dcache_q[3]), .C1(n2016), .Y(n3828)
         );
  INVXL U5141 ( .A(n3828), .Y(n1417) );
  AOI222XL U5142 ( .A0(n3844), .A1(MEM_WB_memout[1]), .B0(n3843), .B1(
        rdata_m_inf[1]), .C0(data_memory_dcache_q[1]), .C1(n2016), .Y(n3829)
         );
  INVXL U5143 ( .A(n3829), .Y(n1415) );
  AOI222XL U5144 ( .A0(n3844), .A1(MEM_WB_memout[9]), .B0(n3843), .B1(
        rdata_m_inf[9]), .C0(data_memory_dcache_q[9]), .C1(n2016), .Y(n3830)
         );
  INVXL U5145 ( .A(n3830), .Y(n1423) );
  AOI222XL U5146 ( .A0(n3844), .A1(MEM_WB_memout[12]), .B0(n3843), .B1(
        rdata_m_inf[12]), .C0(data_memory_dcache_q[12]), .C1(n2016), .Y(n3831)
         );
  INVXL U5147 ( .A(n3831), .Y(n1426) );
  AOI222XL U5148 ( .A0(n3844), .A1(MEM_WB_memout[7]), .B0(n3843), .B1(
        rdata_m_inf[7]), .C0(data_memory_dcache_q[7]), .C1(n2016), .Y(n3832)
         );
  INVXL U5149 ( .A(n3832), .Y(n1421) );
  AOI222XL U5150 ( .A0(n3844), .A1(MEM_WB_memout[15]), .B0(n3843), .B1(
        rdata_m_inf[15]), .C0(data_memory_dcache_q[15]), .C1(n2016), .Y(n3833)
         );
  INVXL U5151 ( .A(n3833), .Y(n1778) );
  AOI222XL U5152 ( .A0(n3844), .A1(MEM_WB_memout[11]), .B0(n3843), .B1(
        rdata_m_inf[11]), .C0(data_memory_dcache_q[11]), .C1(n2016), .Y(n3834)
         );
  INVXL U5153 ( .A(n3834), .Y(n1425) );
  AOI222XL U5154 ( .A0(n3844), .A1(MEM_WB_memout[0]), .B0(n3843), .B1(
        rdata_m_inf[0]), .C0(data_memory_dcache_q[0]), .C1(n2016), .Y(n3835)
         );
  INVXL U5155 ( .A(n3835), .Y(n1429) );
  AOI222XL U5156 ( .A0(n3844), .A1(MEM_WB_memout[6]), .B0(n3843), .B1(
        rdata_m_inf[6]), .C0(data_memory_dcache_q[6]), .C1(n2016), .Y(n3836)
         );
  INVXL U5157 ( .A(n3836), .Y(n1420) );
  AOI222XL U5158 ( .A0(n3844), .A1(MEM_WB_memout[2]), .B0(n3843), .B1(
        rdata_m_inf[2]), .C0(data_memory_dcache_q[2]), .C1(n2016), .Y(n3837)
         );
  INVXL U5159 ( .A(n3837), .Y(n1416) );
  AOI222XL U5160 ( .A0(n3844), .A1(MEM_WB_memout[8]), .B0(n3843), .B1(
        rdata_m_inf[8]), .C0(data_memory_dcache_q[8]), .C1(n2016), .Y(n3838)
         );
  INVXL U5161 ( .A(n3838), .Y(n1422) );
  AOI222XL U5162 ( .A0(n3844), .A1(MEM_WB_memout[14]), .B0(n3843), .B1(
        rdata_m_inf[14]), .C0(data_memory_dcache_q[14]), .C1(n2016), .Y(n3839)
         );
  INVXL U5163 ( .A(n3839), .Y(n1428) );
  AOI222XL U5164 ( .A0(n3844), .A1(MEM_WB_memout[10]), .B0(n3843), .B1(
        rdata_m_inf[10]), .C0(data_memory_dcache_q[10]), .C1(n2016), .Y(n3840)
         );
  INVXL U5165 ( .A(n3840), .Y(n1424) );
  AOI222XL U5166 ( .A0(n3844), .A1(MEM_WB_memout[4]), .B0(n3843), .B1(
        rdata_m_inf[4]), .C0(data_memory_dcache_q[4]), .C1(n2016), .Y(n3841)
         );
  INVXL U5167 ( .A(n3841), .Y(n1418) );
  AOI222XL U5168 ( .A0(n3844), .A1(MEM_WB_memout[5]), .B0(n3843), .B1(
        rdata_m_inf[5]), .C0(data_memory_dcache_q[5]), .C1(n2016), .Y(n3845)
         );
  INVXL U5169 ( .A(n3845), .Y(n1419) );
  INVXL U5170 ( .A(n3852), .Y(n3853) );
  NAND2XL U5171 ( .A(n3857), .B(n3856), .Y(n3858) );
  XOR2XL U5172 ( .A(n2033), .B(DM_idx[4]), .Y(n3864) );
  XOR2XL U5173 ( .A(DM_idx[5]), .B(data_memory_dcache_headpc[5]), .Y(n3871) );
  OAI21XL U5174 ( .A0(DM_idx[2]), .A1(n4546), .B0(n3875), .Y(n3877) );
  XOR2XL U5175 ( .A(DM_idx[1]), .B(C303_DATA2_1), .Y(n3879) );
  XOR2XL U5176 ( .A(n3879), .B(n4815), .Y(n3881) );
  INVXL U5177 ( .A(n3884), .Y(n3885) );
  INVXL U5178 ( .A(n3917), .Y(n3891) );
  NAND2XL U5179 ( .A(n3890), .B(n3889), .Y(n3915) );
  NAND2XL U5180 ( .A(n3891), .B(n3915), .Y(n3892) );
  OAI22XL U5181 ( .A0(n4210), .A1(n3894), .B0(n4695), .B1(n3932), .Y(n3944) );
  XNOR2X1 U5182 ( .A(n4706), .B(n4623), .Y(n3931) );
  OAI22X1 U5183 ( .A0(n4620), .A1(n3898), .B0(n3931), .B1(n4707), .Y(n3934) );
  OAI22XL U5184 ( .A0(n4636), .A1(n3899), .B0(n4740), .B1(n3941), .Y(n3933) );
  ADDFX1 U5185 ( .A(n3902), .B(n3901), .CI(n3900), .CO(n3903), .S(n3775) );
  NAND2XL U5186 ( .A(n3904), .B(n3903), .Y(n3974) );
  AOI222XL U5187 ( .A0(n4865), .A1(EXE_MEM_result[6]), .B0(n4786), .B1(n3911), 
        .C0(n3910), .C1(n4790), .Y(n3912) );
  INVXL U5188 ( .A(n3912), .Y(n1312) );
  NOR2X1 U5189 ( .A(n3913), .B(n3917), .Y(n3920) );
  OAI21XL U5190 ( .A0(n3917), .A1(n3916), .B0(n3915), .Y(n3918) );
  INVXL U5191 ( .A(IF_DEC_PC[7]), .Y(n4388) );
  INVXL U5192 ( .A(n4047), .Y(n3928) );
  NAND2XL U5193 ( .A(n3928), .B(n4046), .Y(n3929) );
  XNOR2XL U5194 ( .A(n4706), .B(n4158), .Y(n3993) );
  ADDFHX1 U5195 ( .A(n3935), .B(n3934), .CI(n3933), .CO(n4013), .S(n3942) );
  BUFX8 U5196 ( .A(n3936), .Y(n4730) );
  XOR2X1 U5197 ( .A(n4730), .B(n4474), .Y(n3937) );
  INVXL U5198 ( .A(n4730), .Y(n3939) );
  NAND2BXL U5199 ( .AN(n4743), .B(n4730), .Y(n3938) );
  OAI22XL U5200 ( .A0(n4639), .A1(n3939), .B0(n4732), .B1(n3938), .Y(n4001) );
  OAI22XL U5201 ( .A0(n4636), .A1(n3941), .B0(n4740), .B1(n3988), .Y(n3999) );
  NAND2XL U5202 ( .A(n3946), .B(n3945), .Y(n3973) );
  AOI222XL U5203 ( .A0(n4865), .A1(EXE_MEM_result[7]), .B0(n4786), .B1(n3951), 
        .C0(n3950), .C1(n4790), .Y(n3952) );
  INVXL U5204 ( .A(n3952), .Y(n1311) );
  NAND2XL U5205 ( .A(n3956), .B(n3955), .Y(n3957) );
  AOI222X1 U5206 ( .A0(n4865), .A1(EXE_MEM_PCnxt[3]), .B0(n4612), .B1(
        IF_DEC_instr[4]), .C0(n3959), .C1(n4335), .Y(n3960) );
  INVXL U5207 ( .A(n3960), .Y(n1331) );
  NAND2XL U5208 ( .A(n3962), .B(n3961), .Y(n4050) );
  OAI21X1 U5209 ( .A0(n4130), .A1(n4131), .B0(n4132), .Y(n4242) );
  NAND2XL U5210 ( .A(n4241), .B(n4239), .Y(n3971) );
  XNOR2X1 U5211 ( .A(n4242), .B(n3971), .Y(n4044) );
  OAI21XL U5212 ( .A0(n3975), .A1(n3974), .B0(n3973), .Y(n3976) );
  AOI21X1 U5213 ( .A0(n3978), .A1(n3977), .B0(n3976), .Y(n4054) );
  BUFX8 U5214 ( .A(n3979), .Y(n4710) );
  NAND2BXL U5215 ( .AN(n3982), .B(n4710), .Y(n3983) );
  OAI22XL U5216 ( .A0(n4714), .A1(n3984), .B0(n4712), .B1(n3983), .Y(n4035) );
  XNOR2X1 U5217 ( .A(n4737), .B(n4621), .Y(n3987) );
  XNOR2X1 U5218 ( .A(n4737), .B(n4169), .Y(n4025) );
  OAI22XL U5219 ( .A0(n4636), .A1(n3987), .B0(n4740), .B1(n4025), .Y(n4033) );
  OAI22XL U5220 ( .A0(n4639), .A1(n3986), .B0(n3985), .B1(n4732), .Y(n4004) );
  OAI22XL U5221 ( .A0(n4636), .A1(n3988), .B0(n4740), .B1(n3987), .Y(n4003) );
  ADDHXL U5222 ( .A(n3990), .B(n3989), .CO(n4002), .S(n4014) );
  XNOR2X1 U5223 ( .A(n4689), .B(n4710), .Y(n4023) );
  OAI22XL U5224 ( .A0(n4714), .A1(n3991), .B0(n4712), .B1(n4023), .Y(n4028) );
  XNOR2X1 U5225 ( .A(n4706), .B(n4637), .Y(n3992) );
  XNOR2X1 U5226 ( .A(n4706), .B(n4729), .Y(n4031) );
  OAI22X1 U5227 ( .A0(n4620), .A1(n3992), .B0(n4031), .B1(n4707), .Y(n4030) );
  XNOR2XL U5228 ( .A(n4623), .B(n4693), .Y(n3994) );
  OAI22X1 U5229 ( .A0(n4210), .A1(n3994), .B0(n4695), .B1(n4024), .Y(n4029) );
  ADDFHX1 U5230 ( .A(n3998), .B(n3997), .CI(n3996), .CO(n4026), .S(n4008) );
  ADDFHX1 U5231 ( .A(n4001), .B(n4000), .CI(n3999), .CO(n4011), .S(n4012) );
  NAND2XL U5232 ( .A(n4008), .B(n4011), .Y(n4005) );
  XNOR3X2 U5233 ( .A(n4011), .B(n4010), .C(n4009), .Y(n4017) );
  ADDFX1 U5234 ( .A(n4014), .B(n4013), .CI(n4012), .CO(n4016), .S(n3946) );
  NAND2XL U5235 ( .A(n4017), .B(n4016), .Y(n4055) );
  NAND2XL U5236 ( .A(n4019), .B(n4018), .Y(n4138) );
  OAI21X2 U5237 ( .A0(n4054), .A1(n4022), .B0(n4021), .Y(n4440) );
  INVX2 U5238 ( .A(n4440), .Y(n4425) );
  OAI22X1 U5239 ( .A0(n4714), .A1(n4023), .B0(n4712), .B1(n4153), .Y(n4168) );
  XNOR2X1 U5240 ( .A(n4693), .B(n4637), .Y(n4173) );
  OAI22X2 U5241 ( .A0(n4210), .A1(n4024), .B0(n4695), .B1(n4173), .Y(n4167) );
  XNOR2XL U5242 ( .A(n4623), .B(n4737), .Y(n4159) );
  OAI22X1 U5243 ( .A0(n4742), .A1(n4025), .B0(n4740), .B1(n4159), .Y(n4166) );
  ADDFHX1 U5244 ( .A(n4028), .B(n4027), .CI(n4026), .CO(n4175), .S(n4036) );
  ADDHX1 U5245 ( .A(n4030), .B(n4029), .CO(n4162), .S(n4027) );
  NOR2BX1 U5246 ( .AN(n4743), .B(n4716), .Y(n4164) );
  OAI22XL U5247 ( .A0(n4639), .A1(n4032), .B0(n4170), .B1(n4732), .Y(n4163) );
  ADDFHX1 U5248 ( .A(n4035), .B(n4034), .CI(n4033), .CO(n4160), .S(n4038) );
  ADDFHX1 U5249 ( .A(n4038), .B(n4037), .CI(n4036), .CO(n4040), .S(n4019) );
  NOR2X1 U5250 ( .A(n4041), .B(n4040), .Y(n4039) );
  INVX2 U5251 ( .A(n4039), .Y(n4441) );
  NAND2X2 U5252 ( .A(n4041), .B(n4040), .Y(n4439) );
  NAND2XL U5253 ( .A(n4441), .B(n4439), .Y(n4042) );
  XOR2X2 U5254 ( .A(n4425), .B(n4042), .Y(n4043) );
  INVX1 U5255 ( .A(n4045), .Y(n1308) );
  INVXL U5256 ( .A(n4049), .Y(n4051) );
  NAND2XL U5257 ( .A(n4051), .B(n4050), .Y(n4052) );
  NAND2XL U5258 ( .A(n4136), .B(n4055), .Y(n4056) );
  XNOR2X1 U5259 ( .A(n4137), .B(n4056), .Y(n4057) );
  AOI222XL U5260 ( .A0(n4865), .A1(EXE_MEM_result[8]), .B0(n4786), .B1(n4058), 
        .C0(n4057), .C1(n4790), .Y(n4059) );
  INVXL U5261 ( .A(n4059), .Y(n1310) );
  INVXL U5262 ( .A(n4060), .Y(n4125) );
  ADDHXL U5263 ( .A(data_memory_dcache_headpc[9]), .B(n4062), .CO(n4089), .S(
        n4090) );
  INVXL U5264 ( .A(n4090), .Y(n4063) );
  ADDHXL U5265 ( .A(data_memory_dcache_headpc[8]), .B(n4064), .CO(n4062), .S(
        n4065) );
  ADDHXL U5266 ( .A(data_memory_dcache_headpc[7]), .B(n4066), .CO(n4064), .S(
        n4086) );
  ADDHXL U5267 ( .A(data_memory_dcache_headpc[6]), .B(n4067), .CO(n4066), .S(
        n4068) );
  ADDHXL U5268 ( .A(data_memory_dcache_headpc[5]), .B(n4557), .CO(n4067), .S(
        n4080) );
  XOR2X1 U5269 ( .A(C303_DATA2_3), .B(n4069), .Y(n4077) );
  OR2XL U5270 ( .A(C303_DATA2_1), .B(C303_DATA2_0), .Y(n4070) );
  XOR2X1 U5271 ( .A(C303_DATA2_2), .B(n4070), .Y(n4074) );
  XOR2X2 U5272 ( .A(C303_DATA2_1), .B(C303_DATA2_0), .Y(n4072) );
  OAI211XL U5273 ( .A0(n4072), .A1(DM_idx[1]), .B0(DM_idx[0]), .C0(
        C303_DATA2_0), .Y(n4071) );
  OAI2BB1X1 U5274 ( .A0N(DM_idx[1]), .A1N(n4072), .B0(n4071), .Y(n4073) );
  AOI222X1 U5275 ( .A0(DM_idx[2]), .A1(n4074), .B0(DM_idx[2]), .B1(n4073), 
        .C0(n4074), .C1(n4073), .Y(n4075) );
  AOI222X1 U5276 ( .A0(n4077), .A1(n4076), .B0(n4077), .B1(n4075), .C0(n4076), 
        .C1(n4075), .Y(n4078) );
  AOI222X1 U5277 ( .A0(n4080), .A1(n4559), .B0(n4080), .B1(n2019), .C0(n4559), 
        .C1(n2019), .Y(n4081) );
  AOI222X1 U5278 ( .A0(DM_idx[6]), .A1(n4082), .B0(DM_idx[6]), .B1(n4081), 
        .C0(n4082), .C1(n4081), .Y(n4084) );
  AOI222XL U5279 ( .A0(DM_idx[8]), .A1(n4088), .B0(n4088), .B1(n4087), .C0(
        DM_idx[8]), .C1(n4087), .Y(n4096) );
  ADDHXL U5280 ( .A(data_memory_dcache_headpc[10]), .B(n4089), .CO(n4094), .S(
        n4061) );
  ADDHXL U5281 ( .A(data_memory_dcache_headpc[9]), .B(n4100), .CO(n4115), .S(
        n4116) );
  INVXL U5282 ( .A(n4116), .Y(n4101) );
  ADDHXL U5283 ( .A(data_memory_dcache_headpc[8]), .B(n4102), .CO(n4100), .S(
        n4103) );
  ADDHXL U5284 ( .A(data_memory_dcache_headpc[7]), .B(n4104), .CO(n4102), .S(
        n4112) );
  ADDHXL U5285 ( .A(data_memory_dcache_headpc[6]), .B(n4105), .CO(n4104), .S(
        n4106) );
  AOI222X1 U5286 ( .A0(DM_idx[6]), .A1(n4110), .B0(DM_idx[6]), .B1(n4109), 
        .C0(n4110), .C1(n4109), .Y(n4111) );
  AOI222X1 U5287 ( .A0(n4112), .A1(n4518), .B0(n4112), .B1(n4111), .C0(n4518), 
        .C1(n4111), .Y(n4113) );
  AOI222X1 U5288 ( .A0(DM_idx[8]), .A1(n4114), .B0(n4114), .B1(n4113), .C0(
        DM_idx[8]), .C1(n4113), .Y(n4122) );
  ADDHXL U5289 ( .A(data_memory_dcache_headpc[10]), .B(n4115), .CO(n4120), .S(
        n4099) );
  OAI211XL U5290 ( .A0(data_memory_lookup_wen), .A1(n4125), .B0(n4124), .C0(
        n4581), .Y(n4126) );
  OAI2BB1X1 U5291 ( .A0N(C303_DATA2_0), .A1N(n4129), .B0(n4128), .Y(n1403) );
  INVXL U5292 ( .A(EXE_MEM_result[9]), .Y(n4143) );
  INVXL U5293 ( .A(n4131), .Y(n4133) );
  NAND2XL U5294 ( .A(n4133), .B(n4132), .Y(n4134) );
  AOI21XL U5295 ( .A0(n4137), .A1(n4136), .B0(n4135), .Y(n4141) );
  INVXL U5296 ( .A(n4790), .Y(n4419) );
  OAI222XL U5297 ( .A0(n4416), .A1(n4143), .B0(n4142), .B1(n2021), .C0(n1800), 
        .C1(n4419), .Y(n4942) );
  NAND2XL U5298 ( .A(instruction_memory_icache_q[8]), .B(n4405), .Y(n4145) );
  NAND2XL U5299 ( .A(instruction_memory_icache_q[5]), .B(n4405), .Y(n4146) );
  OAI2BB1X1 U5300 ( .A0N(IF_DEC_instr[5]), .A1N(n4407), .B0(n4146), .Y(n1728)
         );
  INVXL U5301 ( .A(EXE_MEM_storedata[1]), .Y(n4844) );
  NAND2XL U5302 ( .A(instruction_memory_icache_q[6]), .B(n4405), .Y(n4147) );
  OAI2BB1X1 U5303 ( .A0N(IF_DEC_instr[6]), .A1N(n4407), .B0(n4147), .Y(n1727)
         );
  NAND2XL U5304 ( .A(instruction_memory_icache_q[10]), .B(n4405), .Y(n4148) );
  MX2XL U5305 ( .A(EXE_MEM_storedata[5]), .B(n4169), .S0(n4416), .Y(n1261) );
  NAND2XL U5306 ( .A(instruction_memory_icache_q[12]), .B(n4405), .Y(n4150) );
  OAI2BB1X1 U5307 ( .A0N(IF_DEC_instr[12]), .A1N(n4407), .B0(n4150), .Y(n1721)
         );
  NAND2XL U5308 ( .A(instruction_memory_icache_q[11]), .B(n4405), .Y(n4151) );
  NAND2XL U5309 ( .A(instruction_memory_icache_q[7]), .B(n4405), .Y(n4152) );
  NAND2X1 U5310 ( .A(n4155), .B(n4716), .Y(n4719) );
  XNOR2X1 U5311 ( .A(n4689), .B(n2017), .Y(n4179) );
  ADDFHX4 U5312 ( .A(n4162), .B(n4161), .CI(n4160), .CO(n4198), .S(n4174) );
  ADDFHX4 U5313 ( .A(n4165), .B(n4164), .CI(n4163), .CO(n4187), .S(n4161) );
  ADDFHX4 U5314 ( .A(n4168), .B(n4167), .CI(n4166), .CO(n4186), .S(n4176) );
  OAI22XL U5315 ( .A0(n4639), .A1(n4170), .B0(n4196), .B1(n4732), .Y(n4190) );
  NAND2BXL U5316 ( .AN(n4743), .B(n2017), .Y(n4171) );
  OAI22X1 U5317 ( .A0(n4719), .A1(n4172), .B0(n4716), .B1(n4171), .Y(n4189) );
  OAI22XL U5318 ( .A0(n4210), .A1(n4173), .B0(n4695), .B1(n4195), .Y(n4188) );
  INVX4 U5319 ( .A(n4178), .Y(n4442) );
  OAI22XL U5320 ( .A0(n4719), .A1(n4179), .B0(n4226), .B1(n4716), .Y(n4231) );
  XNOR2X2 U5321 ( .A(n2017), .B(n4220), .Y(n4700) );
  NOR2BX1 U5322 ( .AN(n4743), .B(n4700), .Y(n4213) );
  XNOR2X1 U5323 ( .A(n4182), .B(n4626), .Y(n4208) );
  OAI22XL U5324 ( .A0(n4636), .A1(n4184), .B0(n4740), .B1(n4228), .Y(n4211) );
  ADDFHX1 U5325 ( .A(n4190), .B(n4189), .CI(n4188), .CO(n4219), .S(n4185) );
  XNOR2X1 U5326 ( .A(n4621), .B(n4710), .Y(n4227) );
  OAI22XL U5327 ( .A0(n4714), .A1(n4194), .B0(n4712), .B1(n4227), .Y(n4216) );
  OAI22X1 U5328 ( .A0(n4210), .A1(n4195), .B0(n4695), .B1(n4209), .Y(n4215) );
  OAI22XL U5329 ( .A0(n4639), .A1(n4196), .B0(n4224), .B1(n4732), .Y(n4214) );
  NOR2X2 U5330 ( .A(n4204), .B(n4205), .Y(n4427) );
  NOR2X2 U5331 ( .A(n4426), .B(n4427), .Y(n4207) );
  INVX2 U5332 ( .A(n4439), .Y(n4203) );
  NAND2X2 U5333 ( .A(n4201), .B(n4200), .Y(n4443) );
  INVX2 U5334 ( .A(n4443), .Y(n4202) );
  AOI21X4 U5335 ( .A0(n4442), .A1(n4203), .B0(n4202), .Y(n4424) );
  NAND2X1 U5336 ( .A(n4205), .B(n4204), .Y(n4428) );
  OAI21X2 U5337 ( .A0(n4424), .A1(n4427), .B0(n4428), .Y(n4206) );
  AOI21X2 U5338 ( .A0(n4207), .A1(n4440), .B0(n4206), .Y(n4680) );
  XNOR2XL U5339 ( .A(n4706), .B(n4692), .Y(n4619) );
  OAI22XL U5340 ( .A0(n4620), .A1(n4208), .B0(n4619), .B1(n4707), .Y(n4641) );
  OAI22X1 U5341 ( .A0(n4210), .A1(n4209), .B0(n4695), .B1(n4627), .Y(n4640) );
  ADDFHX1 U5342 ( .A(n4213), .B(n4212), .CI(n4211), .CO(n4645), .S(n4229) );
  ADDFHX1 U5343 ( .A(n4216), .B(n4215), .CI(n4214), .CO(n4643), .S(n4217) );
  XOR3X2 U5344 ( .A(n4646), .B(n4645), .C(n4643), .Y(n4651) );
  ADDFHX1 U5345 ( .A(n4219), .B(n4218), .CI(n4217), .CO(n4650), .S(n4232) );
  NAND2BXL U5346 ( .AN(n4743), .B(n4697), .Y(n4222) );
  XNOR2XL U5347 ( .A(n4730), .B(n4158), .Y(n4638) );
  OAI22XL U5348 ( .A0(n4702), .A1(n4225), .B0(n4700), .B1(n4625), .Y(n4631) );
  XNOR2XL U5349 ( .A(n2017), .B(n4698), .Y(n4622) );
  OAI22XL U5350 ( .A0(n4719), .A1(n4226), .B0(n4622), .B1(n4716), .Y(n4618) );
  XNOR2XL U5351 ( .A(n4737), .B(n4729), .Y(n4635) );
  OAI22XL U5352 ( .A0(n4636), .A1(n4228), .B0(n4740), .B1(n4635), .Y(n4616) );
  NOR2X2 U5353 ( .A(n4236), .B(n4235), .Y(n4672) );
  NAND2XL U5354 ( .A(n4237), .B(n4675), .Y(n4238) );
  AOI21X1 U5355 ( .A0(n4242), .A1(n4241), .B0(n4240), .Y(n4450) );
  OAI21X1 U5356 ( .A0(n4450), .A1(n4446), .B0(n4447), .Y(n4435) );
  AOI21X1 U5357 ( .A0(n4435), .A1(n4433), .B0(n4250), .Y(n4659) );
  INVXL U5358 ( .A(n4658), .Y(n4254) );
  NAND2XL U5359 ( .A(n4254), .B(n4657), .Y(n4255) );
  AOI22XL U5360 ( .A0(n4256), .A1(n4786), .B0(EXE_MEM_result[13]), .B1(n4865), 
        .Y(n4257) );
  OAI2BB1XL U5361 ( .A0N(n4790), .A1N(n4258), .B0(n4257), .Y(n1305) );
  NAND2XL U5362 ( .A(instruction_memory_icache_q[9]), .B(n4405), .Y(n4259) );
  XNOR2XL U5363 ( .A(IO_stall), .B(patcal[0]), .Y(n1248) );
  NAND2XL U5364 ( .A(data_memory_lookup_pc[10]), .B(n4260), .Y(n4880) );
  AND2XL U5365 ( .A(n4263), .B(n4262), .Y(n1794) );
  NAND2XL U5366 ( .A(instruction_memory_icache_q[15]), .B(n4405), .Y(n4264) );
  NAND2XL U5367 ( .A(instruction_memory_icache_q[14]), .B(n4405), .Y(n4265) );
  NOR3XL U5368 ( .A(n4275), .B(instruction_memory_icache_ready_idx[5]), .C(
        instruction_memory_N222), .Y(n4273) );
  NAND2XL U5369 ( .A(instruction_memory_icache_q[1]), .B(n4405), .Y(n4279) );
  NAND2XL U5370 ( .A(instruction_memory_icache_q[2]), .B(n4405), .Y(n4281) );
  NAND2XL U5371 ( .A(n4284), .B(n4283), .Y(n4286) );
  XOR2XL U5372 ( .A(n4286), .B(n4285), .Y(n4287) );
  NAND2XL U5373 ( .A(instruction_memory_icache_q[3]), .B(n4405), .Y(n4292) );
  NAND2XL U5374 ( .A(n4295), .B(n4294), .Y(n4296) );
  XOR2X1 U5375 ( .A(n4297), .B(n4296), .Y(n4298) );
  NAND2XL U5376 ( .A(instruction_memory_icache_q[4]), .B(n4405), .Y(n4300) );
  AOI2BB2XL U5377 ( .B0(EXE_MEM_PCnxt[4]), .B1(n4796), .A0N(n4792), .A1N(n4310), .Y(n4311) );
  INVXL U5378 ( .A(instruction_memory_lookup_pc[3]), .Y(n4314) );
  INVXL U5379 ( .A(IF_PC[0]), .Y(n4394) );
  INVXL U5380 ( .A(n4317), .Y(n4318) );
  AOI2BB2XL U5381 ( .B0(EXE_MEM_PCnxt[6]), .B1(n4796), .A0N(n4792), .A1N(n4320), .Y(n4321) );
  NAND2XL U5382 ( .A(IF_PC[6]), .B(IF_PC[5]), .Y(n4323) );
  NAND2XL U5383 ( .A(n4796), .B(EXE_MEM_PCnxt[7]), .Y(n4325) );
  OAI211XL U5384 ( .A0(n4339), .A1(n4389), .B0(n4326), .C0(n4325), .Y(n1766)
         );
  XNOR2X1 U5385 ( .A(n4328), .B(n4331), .Y(n4334) );
  OAI2BB1XL U5386 ( .A0N(n4391), .A1N(n4372), .B0(IF_PC[7]), .Y(n4336) );
  NAND2XL U5387 ( .A(n4796), .B(EXE_MEM_PCnxt[8]), .Y(n4337) );
  OAI211XL U5388 ( .A0(n4339), .A1(n4391), .B0(n4338), .C0(n4337), .Y(n1765)
         );
  INVXL U5389 ( .A(instruction_memory_lookup_pc[8]), .Y(n4340) );
  INVXL U5390 ( .A(n4345), .Y(n4347) );
  INVXL U5391 ( .A(n4350), .Y(n4351) );
  INVXL U5392 ( .A(instruction_memory_instmem_cs[2]), .Y(n4362) );
  NAND4XL U5393 ( .A(n4365), .B(n4360), .C(n4362), .D(IM_invalid), .Y(n4367)
         );
  OAI211XL U5394 ( .A0(n4363), .A1(n4365), .B0(
        instruction_memory_instmem_cs[1]), .C0(n4362), .Y(n4364) );
  AOI22XL U5395 ( .A0(n4399), .A1(n4374), .B0(EXE_MEM_PCnxt[9]), .B1(n4796), 
        .Y(n4375) );
  INVXL U5396 ( .A(IF_DEC_PC[6]), .Y(n4386) );
  INVXL U5397 ( .A(IF_DEC_PC[0]), .Y(n4393) );
  AOI22XL U5398 ( .A0(n4399), .A1(n4398), .B0(EXE_MEM_PCnxt[10]), .B1(n4796), 
        .Y(n4400) );
  INVXL U5399 ( .A(instruction_memory_lookup_pc[10]), .Y(n4403) );
  NAND2XL U5400 ( .A(instruction_memory_icache_q[13]), .B(n4405), .Y(n4404) );
  NAND2XL U5401 ( .A(instruction_memory_icache_q[0]), .B(n4405), .Y(n4406) );
  OAI2BB2XL U5402 ( .B0(n4408), .B1(n4522), .A0N(EXE_MEM_result[4]), .A1N(
        n4823), .Y(n1410) );
  OAI2BB2XL U5403 ( .B0(n4559), .B1(n4522), .A0N(EXE_MEM_result[5]), .A1N(
        n4823), .Y(n1409) );
  INVXL U5404 ( .A(data_memory_lookup_pc[5]), .Y(n4409) );
  NAND2XL U5405 ( .A(n4823), .B(EXE_MEM_result[2]), .Y(n4410) );
  OAI2BB1XL U5406 ( .A0N(n4949), .A1N(DM_idx[2]), .B0(n4410), .Y(n1412) );
  NAND2XL U5407 ( .A(n4670), .B(data_memory_lookup_pc[2]), .Y(n4411) );
  NAND2XL U5408 ( .A(n4823), .B(EXE_MEM_result[3]), .Y(n4412) );
  OAI2BB1XL U5409 ( .A0N(n4949), .A1N(DM_idx[3]), .B0(n4412), .Y(n1411) );
  NAND2XL U5410 ( .A(n4670), .B(data_memory_lookup_pc[3]), .Y(n4413) );
  INVXL U5411 ( .A(EXE_MEM_instcode[0]), .Y(n4418) );
  NAND3BXL U5412 ( .AN(n4415), .B(IF_DEC_instr[0]), .C(n4414), .Y(n4417) );
  NAND2XL U5413 ( .A(n4420), .B(IF_DEC_instr[0]), .Y(n4497) );
  INVXL U5414 ( .A(EXE_MEM_instcode[2]), .Y(n4421) );
  INVXL U5415 ( .A(n4777), .Y(n4423) );
  INVXL U5416 ( .A(EXE_MEM_instcode[1]), .Y(n4422) );
  OAI21X1 U5417 ( .A0(n4426), .A1(n4425), .B0(n4424), .Y(n4431) );
  INVXL U5418 ( .A(n4427), .Y(n4429) );
  NAND2XL U5419 ( .A(n4429), .B(n4428), .Y(n4430) );
  XNOR2X1 U5420 ( .A(n4431), .B(n4430), .Y(n4438) );
  NAND2XL U5421 ( .A(n4433), .B(n4432), .Y(n4434) );
  AOI22XL U5422 ( .A0(n4436), .A1(n4786), .B0(EXE_MEM_result[12]), .B1(n4865), 
        .Y(n4437) );
  OAI2BB1X1 U5423 ( .A0N(n4441), .A1N(n4440), .B0(n4439), .Y(n4445) );
  INVXL U5424 ( .A(n4446), .Y(n4448) );
  NAND2XL U5425 ( .A(n4448), .B(n4447), .Y(n4449) );
  INVXL U5426 ( .A(n4454), .Y(n4456) );
  NAND2XL U5427 ( .A(n4456), .B(n4455), .Y(n4458) );
  XNOR2XL U5428 ( .A(n4458), .B(n4457), .Y(n4508) );
  INVXL U5429 ( .A(n2020), .Y(n4846) );
  NAND2XL U5430 ( .A(n4459), .B(n4706), .Y(n4461) );
  INVXL U5431 ( .A(n4476), .Y(n4479) );
  OAI21XL U5432 ( .A0(n4484), .A1(n4483), .B0(n4482), .Y(n4487) );
  AOI21XL U5433 ( .A0(n4487), .A1(n4486), .B0(n4485), .Y(n4489) );
  OAI22XL U5434 ( .A0(n4489), .A1(n4488), .B0(n4829), .B1(n2017), .Y(n4490) );
  OAI2BB1X2 U5435 ( .A0N(n4493), .A1N(n4492), .B0(n4491), .Y(n4494) );
  OAI2BB1X2 U5436 ( .A0N(n4503), .A1N(n4502), .B0(n4501), .Y(n4504) );
  INVXL U5437 ( .A(EXE_MEM_result[0]), .Y(n4510) );
  MXI2X1 U5438 ( .A(n4504), .B(n4510), .S0(n4865), .Y(n4505) );
  OAI2BB2XL U5439 ( .B0(n4510), .B1(n4509), .A0N(DM_idx[0]), .A1N(n4949), .Y(
        n1414) );
  INVXL U5440 ( .A(data_memory_lookup_pc[0]), .Y(n4512) );
  OAI2BB2XL U5441 ( .B0(n4513), .B1(n4522), .A0N(EXE_MEM_result[1]), .A1N(
        n4823), .Y(n1413) );
  NAND2XL U5442 ( .A(n4670), .B(data_memory_lookup_pc[1]), .Y(n4514) );
  NAND2XL U5443 ( .A(n4823), .B(EXE_MEM_result[6]), .Y(n4515) );
  OAI2BB1XL U5444 ( .A0N(n4949), .A1N(DM_idx[6]), .B0(n4515), .Y(n1408) );
  INVXL U5445 ( .A(data_memory_lookup_pc[6]), .Y(n4517) );
  OAI2BB2XL U5446 ( .B0(n4518), .B1(n4522), .A0N(EXE_MEM_result[7]), .A1N(
        n4823), .Y(n1407) );
  OAI2BB2XL U5447 ( .B0(n4520), .B1(n4522), .A0N(EXE_MEM_result[8]), .A1N(
        n4823), .Y(n1406) );
  NAND2XL U5448 ( .A(n4670), .B(data_memory_lookup_pc[8]), .Y(n4521) );
  OAI2BB2XL U5449 ( .B0(n2043), .B1(n4522), .A0N(EXE_MEM_result[9]), .A1N(
        n4823), .Y(n1405) );
  AOI31XL U5450 ( .A0(n4526), .A1(data_memory_lookup_pc[10]), .A2(n4524), .B0(
        n4523), .Y(n4879) );
  AOI21XL U5451 ( .A0(data_memory_lookup_pc[8]), .A1(n4529), .B0(n4526), .Y(
        n4527) );
  OAI2BB1XL U5452 ( .A0N(data_memory_lookup_pc[7]), .A1N(n4530), .B0(n4529), 
        .Y(n4533) );
  INVXL U5453 ( .A(n4531), .Y(n4532) );
  NAND2XL U5454 ( .A(n4533), .B(n4532), .Y(n4877) );
  ADDHXL U5455 ( .A(data_memory_dcache_headpc[9]), .B(n4552), .CO(n4571), .S(
        n4572) );
  INVXL U5456 ( .A(n4572), .Y(n4553) );
  AOI22XL U5457 ( .A0(DM_idx[10]), .A1(n4573), .B0(DM_idx[9]), .B1(n4553), .Y(
        n4579) );
  ADDHXL U5458 ( .A(data_memory_dcache_headpc[8]), .B(n4554), .CO(n4552), .S(
        n4555) );
  INVXL U5459 ( .A(n4555), .Y(n4570) );
  ADDHXL U5460 ( .A(data_memory_dcache_headpc[7]), .B(n4556), .CO(n4554), .S(
        n4568) );
  ADDHXL U5461 ( .A(data_memory_dcache_headpc[5]), .B(n4557), .CO(n4561), .S(
        n4560) );
  INVXL U5462 ( .A(DM_idx[5]), .Y(n4559) );
  AOI222XL U5463 ( .A0(n4560), .A1(n4559), .B0(n4560), .B1(n2019), .C0(n4559), 
        .C1(n2019), .Y(n4563) );
  AOI222XL U5464 ( .A0(n4568), .A1(n4518), .B0(n4568), .B1(n4567), .C0(n4518), 
        .C1(n4567), .Y(n4569) );
  AOI222XL U5465 ( .A0(DM_idx[8]), .A1(n4570), .B0(n4570), .B1(n4569), .C0(
        DM_idx[8]), .C1(n4569), .Y(n4578) );
  ADDHXL U5466 ( .A(data_memory_dcache_headpc[10]), .B(n4571), .CO(n4576), .S(
        n4551) );
  OAI22XL U5467 ( .A0(DM_idx[9]), .A1(n4574), .B0(n4573), .B1(DM_idx[10]), .Y(
        n4575) );
  INVXL U5468 ( .A(data_memory_dcache_dirty[3]), .Y(n4602) );
  NAND3XL U5469 ( .A(n4598), .B(n4590), .C(n4589), .Y(n4591) );
  INVXL U5470 ( .A(data_memory_writeback_type[1]), .Y(n4813) );
  INVXL U5471 ( .A(n4592), .Y(n4593) );
  INVXL U5472 ( .A(n4597), .Y(n4599) );
  OAI22XL U5473 ( .A0(n4599), .A1(data_memory_dcache_dirty[2]), .B0(
        data_memory_dcache_dirty[1]), .B1(n4598), .Y(n4601) );
  AOI211XL U5474 ( .A0(n4603), .A1(n4602), .B0(n4601), .C0(n4600), .Y(n4605)
         );
  INVXL U5475 ( .A(data_memory_writeback_type[2]), .Y(n4604) );
  OR2XL U5476 ( .A(n4611), .B(data_memory_datamem_js[1]), .Y(n1776) );
  INVXL U5477 ( .A(n4612), .Y(n4613) );
  INVXL U5478 ( .A(EXE_MEM_instcode_6), .Y(n4614) );
  OAI21X1 U5479 ( .A0(n4680), .A1(n4672), .B0(n4675), .Y(n4656) );
  ADDFHX1 U5480 ( .A(n4618), .B(n4617), .CI(n4616), .CO(n4755), .S(n4629) );
  XNOR2XL U5481 ( .A(n4697), .B(n4687), .Y(n4745) );
  XNOR2XL U5482 ( .A(n4706), .B(n4660), .Y(n4709) );
  OAI22XL U5483 ( .A0(n4620), .A1(n4619), .B0(n4709), .B1(n4707), .Y(n4735) );
  XNOR2XL U5484 ( .A(n2017), .B(n4621), .Y(n4718) );
  OAI22XL U5485 ( .A0(n4719), .A1(n4622), .B0(n4718), .B1(n4716), .Y(n4734) );
  OAI22XL U5486 ( .A0(n4714), .A1(n4624), .B0(n4712), .B1(n4713), .Y(n4686) );
  OAI22XL U5487 ( .A0(n4702), .A1(n4625), .B0(n4700), .B1(n4701), .Y(n4685) );
  XNOR2XL U5488 ( .A(n4693), .B(n4626), .Y(n4696) );
  OAI22XL U5489 ( .A0(n4210), .A1(n4627), .B0(n4695), .B1(n4696), .Y(n4684) );
  OAI22XL U5490 ( .A0(n4636), .A1(n4635), .B0(n4740), .B1(n4741), .Y(n4728) );
  XNOR2XL U5491 ( .A(n4730), .B(n4637), .Y(n4733) );
  OAI22XL U5492 ( .A0(n4639), .A1(n4638), .B0(n4733), .B1(n4732), .Y(n4727) );
  NAND2XL U5493 ( .A(n4646), .B(n4645), .Y(n4647) );
  NOR2X2 U5494 ( .A(n4653), .B(n4652), .Y(n4676) );
  NAND2XL U5495 ( .A(n4653), .B(n4652), .Y(n4674) );
  NAND2XL U5496 ( .A(n4661), .B(n4778), .Y(n4664) );
  NAND2XL U5497 ( .A(n4774), .B(n4772), .Y(n4665) );
  XNOR2XL U5498 ( .A(n4773), .B(n4665), .Y(n4666) );
  AOI22XL U5499 ( .A0(n4666), .A1(n4786), .B0(EXE_MEM_result[14]), .B1(n4865), 
        .Y(n4667) );
  OAI2BB1X2 U5500 ( .A0N(n4790), .A1N(n4668), .B0(n4667), .Y(n1304) );
  NAND2XL U5501 ( .A(n4823), .B(EXE_MEM_result[10]), .Y(n4669) );
  NAND2XL U5502 ( .A(n4670), .B(data_memory_lookup_pc[10]), .Y(n4671) );
  OAI21XL U5503 ( .A0(n4676), .A1(n4675), .B0(n4674), .Y(n4677) );
  INVXL U5504 ( .A(n4677), .Y(n4678) );
  OAI21X1 U5505 ( .A0(n4680), .A1(n4679), .B0(n4678), .Y(n4771) );
  ADDFX1 U5506 ( .A(n4686), .B(n4685), .CI(n4684), .CO(n4725), .S(n4753) );
  XOR2XL U5507 ( .A(n4780), .B(n4687), .Y(n4688) );
  NAND2XL U5508 ( .A(n4745), .B(n4688), .Y(n4747) );
  XNOR2XL U5509 ( .A(n4743), .B(n4780), .Y(n4691) );
  XNOR2XL U5510 ( .A(n4689), .B(n4780), .Y(n4690) );
  OAI22XL U5511 ( .A0(n4747), .A1(n4691), .B0(n4690), .B1(n4745), .Y(n4705) );
  XNOR2XL U5512 ( .A(n4698), .B(n4697), .Y(n4699) );
  XOR3X2 U5513 ( .A(n4705), .B(n4704), .C(n4703), .Y(n4724) );
  XNOR2XL U5514 ( .A(n4706), .B(n4775), .Y(n4708) );
  OAI22XL U5515 ( .A0(n4620), .A1(n4709), .B0(n4708), .B1(n4707), .Y(n4722) );
  XNOR2XL U5516 ( .A(n4158), .B(n4710), .Y(n4711) );
  XNOR2XL U5517 ( .A(n2017), .B(n4169), .Y(n4717) );
  OAI22XL U5518 ( .A0(n4719), .A1(n4718), .B0(n4717), .B1(n4716), .Y(n4720) );
  XOR3X2 U5519 ( .A(n4722), .B(n4721), .C(n4720), .Y(n4723) );
  XOR3X2 U5520 ( .A(n4725), .B(n4724), .C(n4723), .Y(n4760) );
  ADDFX1 U5521 ( .A(n4728), .B(n4727), .CI(n4726), .CO(n4758), .S(n4682) );
  XNOR2XL U5522 ( .A(n4730), .B(n4729), .Y(n4731) );
  OAI22XL U5523 ( .A0(n4639), .A1(n4733), .B0(n4732), .B1(n4731), .Y(n4752) );
  XNOR2XL U5524 ( .A(n4738), .B(n4737), .Y(n4739) );
  OAI22XL U5525 ( .A0(n4742), .A1(n4741), .B0(n4740), .B1(n4739), .Y(n4749) );
  INVXL U5526 ( .A(n4780), .Y(n4746) );
  NAND2BXL U5527 ( .AN(n4743), .B(n4780), .Y(n4744) );
  OAI22XL U5528 ( .A0(n4747), .A1(n4746), .B0(n4745), .B1(n4744), .Y(n4748) );
  XOR3X2 U5529 ( .A(n4752), .B(n4751), .C(n4750), .Y(n4757) );
  XOR3X2 U5530 ( .A(n4758), .B(n4757), .C(n4756), .Y(n4759) );
  XOR3X2 U5531 ( .A(n4761), .B(n4760), .C(n4759), .Y(n4767) );
  NAND2XL U5532 ( .A(n4767), .B(n4766), .Y(n4768) );
  XNOR2X1 U5533 ( .A(n4771), .B(n4770), .Y(n4789) );
  OAI2BB1X2 U5534 ( .A0N(n4774), .A1N(n4773), .B0(n4772), .Y(n4785) );
  NAND2XL U5535 ( .A(n4779), .B(n4778), .Y(n4783) );
  AOI22X1 U5536 ( .A0(n4787), .A1(n4786), .B0(EXE_MEM_result[15]), .B1(n4865), 
        .Y(n4788) );
  OAI2BB1X2 U5537 ( .A0N(n4790), .A1N(n4789), .B0(n4788), .Y(n1303) );
  OAI2BB1XL U5538 ( .A0N(DM_idx[0]), .A1N(n4816), .B0(n4815), .Y(n4818) );
  INVXL U5539 ( .A(EXE_MEM_storedata[0]), .Y(n4824) );
  OAI2BB2XL U5540 ( .B0(n4868), .B1(n4824), .A0N(DM_data[0]), .A1N(n4949), .Y(
        n1462) );
  NAND2XL U5541 ( .A(n4869), .B(data_memory_lookup_data[0]), .Y(n4825) );
  INVXL U5542 ( .A(EXE_MEM_storedata[10]), .Y(n4827) );
  OAI2BB2XL U5543 ( .B0(n4868), .B1(n4827), .A0N(DM_data[10]), .A1N(n4949), 
        .Y(n1452) );
  NAND2XL U5544 ( .A(n4869), .B(data_memory_lookup_data[10]), .Y(n4828) );
  INVXL U5545 ( .A(EXE_MEM_storedata[11]), .Y(n4830) );
  OAI2BB2XL U5546 ( .B0(n4868), .B1(n4830), .A0N(DM_data[11]), .A1N(n4949), 
        .Y(n1451) );
  NAND2XL U5547 ( .A(n4869), .B(data_memory_lookup_data[11]), .Y(n4831) );
  INVXL U5548 ( .A(EXE_MEM_storedata[12]), .Y(n4833) );
  OAI2BB2XL U5549 ( .B0(n4868), .B1(n4833), .A0N(DM_data[12]), .A1N(n4949), 
        .Y(n1450) );
  NAND2XL U5550 ( .A(n4869), .B(data_memory_lookup_data[12]), .Y(n4834) );
  INVXL U5551 ( .A(EXE_MEM_storedata[13]), .Y(n4836) );
  OAI2BB2XL U5552 ( .B0(n4868), .B1(n4836), .A0N(DM_data[13]), .A1N(n4949), 
        .Y(n1449) );
  NAND2XL U5553 ( .A(n4869), .B(data_memory_lookup_data[13]), .Y(n4837) );
  INVXL U5554 ( .A(EXE_MEM_storedata[14]), .Y(n4839) );
  OAI2BB2XL U5555 ( .B0(n4868), .B1(n4839), .A0N(DM_data[14]), .A1N(n4949), 
        .Y(n1448) );
  NAND2XL U5556 ( .A(n4869), .B(data_memory_lookup_data[14]), .Y(n4840) );
  INVXL U5557 ( .A(EXE_MEM_storedata[15]), .Y(n4842) );
  OAI2BB2XL U5558 ( .B0(n4868), .B1(n4842), .A0N(DM_data[15]), .A1N(n4949), 
        .Y(n1447) );
  NAND2XL U5559 ( .A(n4869), .B(data_memory_lookup_data[15]), .Y(n4843) );
  OAI2BB2XL U5560 ( .B0(n4868), .B1(n4844), .A0N(DM_data[1]), .A1N(n4949), .Y(
        n1461) );
  NAND2XL U5561 ( .A(n4869), .B(data_memory_lookup_data[1]), .Y(n4845) );
  INVXL U5562 ( .A(EXE_MEM_storedata[2]), .Y(n4847) );
  OAI2BB2XL U5563 ( .B0(n4868), .B1(n4847), .A0N(DM_data[2]), .A1N(n4949), .Y(
        n1460) );
  NAND2XL U5564 ( .A(n4869), .B(data_memory_lookup_data[2]), .Y(n4848) );
  INVXL U5565 ( .A(EXE_MEM_storedata[3]), .Y(n4850) );
  OAI2BB2XL U5566 ( .B0(n4868), .B1(n4850), .A0N(DM_data[3]), .A1N(n4949), .Y(
        n1459) );
  NAND2XL U5567 ( .A(n4869), .B(data_memory_lookup_data[3]), .Y(n4851) );
  INVXL U5568 ( .A(EXE_MEM_storedata[4]), .Y(n4853) );
  OAI2BB2XL U5569 ( .B0(n4868), .B1(n4853), .A0N(DM_data[4]), .A1N(n4949), .Y(
        n1458) );
  NAND2XL U5570 ( .A(n4869), .B(data_memory_lookup_data[4]), .Y(n4854) );
  INVXL U5571 ( .A(n4868), .Y(n4855) );
  NAND2XL U5572 ( .A(n4855), .B(EXE_MEM_storedata[5]), .Y(n4856) );
  OAI2BB1XL U5573 ( .A0N(n4949), .A1N(DM_data[5]), .B0(n4856), .Y(n1457) );
  NAND2XL U5574 ( .A(n4869), .B(data_memory_lookup_data[5]), .Y(n4857) );
  INVXL U5575 ( .A(EXE_MEM_storedata[6]), .Y(n4858) );
  OAI2BB2XL U5576 ( .B0(n4868), .B1(n4858), .A0N(DM_data[6]), .A1N(n4949), .Y(
        n1456) );
  NAND2XL U5577 ( .A(n4869), .B(data_memory_lookup_data[6]), .Y(n4859) );
  INVXL U5578 ( .A(EXE_MEM_storedata[7]), .Y(n4861) );
  OAI2BB2XL U5579 ( .B0(n4868), .B1(n4861), .A0N(DM_data[7]), .A1N(n4949), .Y(
        n1455) );
  NAND2XL U5580 ( .A(n4869), .B(data_memory_lookup_data[7]), .Y(n4862) );
  OAI2BB2XL U5581 ( .B0(n4868), .B1(n4947), .A0N(DM_data[8]), .A1N(n4949), .Y(
        n1454) );
  NAND2XL U5582 ( .A(n4869), .B(data_memory_lookup_data[8]), .Y(n4864) );
  INVXL U5583 ( .A(EXE_MEM_storedata[9]), .Y(n4867) );
  OAI2BB2XL U5584 ( .B0(n4868), .B1(n4867), .A0N(DM_data[9]), .A1N(n4949), .Y(
        n1453) );
  NAND2XL U5585 ( .A(n4869), .B(data_memory_lookup_data[9]), .Y(n4870) );
  NAND2XL U5586 ( .A(data_memory_writeback_storeq2[0]), .B(n4897), .Y(n4882)
         );
  OAI2BB1XL U5587 ( .A0N(n4899), .A1N(data_memory_writeback_storeq[0]), .B0(
        n4882), .Y(wdata_m_inf[0]) );
  NAND2XL U5588 ( .A(data_memory_writeback_storeq2[1]), .B(n4897), .Y(n4883)
         );
  OAI2BB1XL U5589 ( .A0N(n4899), .A1N(data_memory_writeback_storeq[1]), .B0(
        n4883), .Y(wdata_m_inf[1]) );
  NAND2XL U5590 ( .A(data_memory_writeback_storeq2[2]), .B(n4897), .Y(n4884)
         );
  OAI2BB1XL U5591 ( .A0N(n4899), .A1N(data_memory_writeback_storeq[2]), .B0(
        n4884), .Y(wdata_m_inf[2]) );
  NAND2XL U5592 ( .A(data_memory_writeback_storeq2[3]), .B(n4897), .Y(n4885)
         );
  OAI2BB1XL U5593 ( .A0N(n4899), .A1N(data_memory_writeback_storeq[3]), .B0(
        n4885), .Y(wdata_m_inf[3]) );
  NAND2XL U5594 ( .A(data_memory_writeback_storeq2[4]), .B(n4897), .Y(n4886)
         );
  OAI2BB1XL U5595 ( .A0N(n4899), .A1N(data_memory_writeback_storeq[4]), .B0(
        n4886), .Y(wdata_m_inf[4]) );
  NAND2XL U5596 ( .A(data_memory_writeback_storeq2[5]), .B(n4897), .Y(n4887)
         );
  OAI2BB1XL U5597 ( .A0N(n4899), .A1N(data_memory_writeback_storeq[5]), .B0(
        n4887), .Y(wdata_m_inf[5]) );
  NAND2XL U5598 ( .A(data_memory_writeback_storeq2[6]), .B(n4897), .Y(n4888)
         );
  OAI2BB1XL U5599 ( .A0N(n4899), .A1N(data_memory_writeback_storeq[6]), .B0(
        n4888), .Y(wdata_m_inf[6]) );
  NAND2XL U5600 ( .A(data_memory_writeback_storeq2[7]), .B(n4897), .Y(n4889)
         );
  OAI2BB1XL U5601 ( .A0N(n4899), .A1N(data_memory_writeback_storeq[7]), .B0(
        n4889), .Y(wdata_m_inf[7]) );
  NAND2XL U5602 ( .A(data_memory_writeback_storeq2[8]), .B(n4897), .Y(n4890)
         );
  OAI2BB1XL U5603 ( .A0N(n4899), .A1N(data_memory_writeback_storeq[8]), .B0(
        n4890), .Y(wdata_m_inf[8]) );
  NAND2XL U5604 ( .A(data_memory_writeback_storeq2[9]), .B(n4897), .Y(n4891)
         );
  OAI2BB1XL U5605 ( .A0N(n4899), .A1N(data_memory_writeback_storeq[9]), .B0(
        n4891), .Y(wdata_m_inf[9]) );
  NAND2XL U5606 ( .A(data_memory_writeback_storeq2[10]), .B(n4897), .Y(n4892)
         );
  OAI2BB1XL U5607 ( .A0N(n4899), .A1N(data_memory_writeback_storeq[10]), .B0(
        n4892), .Y(wdata_m_inf[10]) );
  NAND2XL U5608 ( .A(data_memory_writeback_storeq2[11]), .B(n4897), .Y(n4893)
         );
  OAI2BB1XL U5609 ( .A0N(n4899), .A1N(data_memory_writeback_storeq[11]), .B0(
        n4893), .Y(wdata_m_inf[11]) );
  NAND2XL U5610 ( .A(data_memory_writeback_storeq2[12]), .B(n4897), .Y(n4894)
         );
  OAI2BB1XL U5611 ( .A0N(n4899), .A1N(data_memory_writeback_storeq[12]), .B0(
        n4894), .Y(wdata_m_inf[12]) );
  NAND2XL U5612 ( .A(data_memory_writeback_storeq2[13]), .B(n4897), .Y(n4895)
         );
  OAI2BB1XL U5613 ( .A0N(n4899), .A1N(data_memory_writeback_storeq[13]), .B0(
        n4895), .Y(wdata_m_inf[13]) );
  NAND2XL U5614 ( .A(data_memory_writeback_storeq2[14]), .B(n4897), .Y(n4896)
         );
  OAI2BB1XL U5615 ( .A0N(n4899), .A1N(data_memory_writeback_storeq[14]), .B0(
        n4896), .Y(wdata_m_inf[14]) );
  NAND2XL U5616 ( .A(data_memory_writeback_storeq2[15]), .B(n4897), .Y(n4898)
         );
  OAI2BB1XL U5617 ( .A0N(n4899), .A1N(data_memory_writeback_storeq[15]), .B0(
        n4898), .Y(wdata_m_inf[15]) );
  NAND2XL U5619 ( .A(data_memory_writeback_storeq[0]), .B(n2075), .Y(n4900) );
  OAI2BB1XL U5620 ( .A0N(data_memory_dcache_q[0]), .A1N(n4932), .B0(n4900), 
        .Y(n1383) );
  NAND2XL U5621 ( .A(data_memory_writeback_storeq2[0]), .B(n2075), .Y(n4901)
         );
  OAI2BB1XL U5622 ( .A0N(data_memory_writeback_storeq[0]), .A1N(n4932), .B0(
        n4901), .Y(n1382) );
  NAND2XL U5623 ( .A(data_memory_writeback_storeq[15]), .B(n2075), .Y(n4902)
         );
  OAI2BB1XL U5624 ( .A0N(data_memory_dcache_q[15]), .A1N(n4932), .B0(n4902), 
        .Y(n1381) );
  NAND2XL U5625 ( .A(data_memory_writeback_storeq2[15]), .B(n2075), .Y(n4903)
         );
  OAI2BB1XL U5626 ( .A0N(data_memory_writeback_storeq[15]), .A1N(n4932), .B0(
        n4903), .Y(n1380) );
  NAND2XL U5627 ( .A(data_memory_writeback_storeq[14]), .B(n2075), .Y(n4904)
         );
  OAI2BB1XL U5628 ( .A0N(data_memory_dcache_q[14]), .A1N(n4932), .B0(n4904), 
        .Y(n1379) );
  NAND2XL U5629 ( .A(data_memory_writeback_storeq2[14]), .B(n2075), .Y(n4905)
         );
  OAI2BB1XL U5630 ( .A0N(data_memory_writeback_storeq[14]), .A1N(n4932), .B0(
        n4905), .Y(n1378) );
  NAND2XL U5631 ( .A(data_memory_writeback_storeq[13]), .B(n2075), .Y(n4906)
         );
  OAI2BB1XL U5632 ( .A0N(data_memory_dcache_q[13]), .A1N(n4932), .B0(n4906), 
        .Y(n1377) );
  NAND2XL U5633 ( .A(data_memory_writeback_storeq2[13]), .B(n2075), .Y(n4907)
         );
  OAI2BB1XL U5634 ( .A0N(data_memory_writeback_storeq[13]), .A1N(n4932), .B0(
        n4907), .Y(n1376) );
  NAND2XL U5635 ( .A(data_memory_writeback_storeq[12]), .B(n2075), .Y(n4908)
         );
  OAI2BB1XL U5636 ( .A0N(data_memory_dcache_q[12]), .A1N(n4932), .B0(n4908), 
        .Y(n1375) );
  NAND2XL U5637 ( .A(data_memory_writeback_storeq2[12]), .B(n2075), .Y(n4909)
         );
  OAI2BB1XL U5638 ( .A0N(data_memory_writeback_storeq[12]), .A1N(n4932), .B0(
        n4909), .Y(n1374) );
  NAND2XL U5639 ( .A(data_memory_writeback_storeq[11]), .B(n2075), .Y(n4910)
         );
  OAI2BB1XL U5640 ( .A0N(data_memory_dcache_q[11]), .A1N(n4932), .B0(n4910), 
        .Y(n1373) );
  NAND2XL U5641 ( .A(data_memory_writeback_storeq2[11]), .B(n2075), .Y(n4911)
         );
  OAI2BB1XL U5642 ( .A0N(data_memory_writeback_storeq[11]), .A1N(n4932), .B0(
        n4911), .Y(n1372) );
  NAND2XL U5643 ( .A(data_memory_writeback_storeq[10]), .B(n2075), .Y(n4912)
         );
  OAI2BB1XL U5644 ( .A0N(data_memory_dcache_q[10]), .A1N(n4932), .B0(n4912), 
        .Y(n1371) );
  NAND2XL U5645 ( .A(data_memory_writeback_storeq2[10]), .B(n2075), .Y(n4913)
         );
  OAI2BB1XL U5646 ( .A0N(data_memory_writeback_storeq[10]), .A1N(n4932), .B0(
        n4913), .Y(n1370) );
  NAND2XL U5647 ( .A(data_memory_writeback_storeq[9]), .B(n2075), .Y(n4914) );
  OAI2BB1XL U5648 ( .A0N(data_memory_dcache_q[9]), .A1N(n4932), .B0(n4914), 
        .Y(n1369) );
  NAND2XL U5649 ( .A(data_memory_writeback_storeq2[9]), .B(n2075), .Y(n4915)
         );
  OAI2BB1XL U5650 ( .A0N(data_memory_writeback_storeq[9]), .A1N(n4932), .B0(
        n4915), .Y(n1368) );
  NAND2XL U5651 ( .A(data_memory_writeback_storeq[8]), .B(n2075), .Y(n4916) );
  OAI2BB1XL U5652 ( .A0N(data_memory_dcache_q[8]), .A1N(n4932), .B0(n4916), 
        .Y(n1367) );
  NAND2XL U5653 ( .A(data_memory_writeback_storeq2[8]), .B(n2075), .Y(n4917)
         );
  OAI2BB1XL U5654 ( .A0N(data_memory_writeback_storeq[8]), .A1N(n4932), .B0(
        n4917), .Y(n1366) );
  NAND2XL U5655 ( .A(data_memory_writeback_storeq[7]), .B(n2075), .Y(n4918) );
  OAI2BB1XL U5656 ( .A0N(data_memory_dcache_q[7]), .A1N(n4932), .B0(n4918), 
        .Y(n1365) );
  NAND2XL U5657 ( .A(data_memory_writeback_storeq2[7]), .B(n2075), .Y(n4919)
         );
  OAI2BB1XL U5658 ( .A0N(data_memory_writeback_storeq[7]), .A1N(n4932), .B0(
        n4919), .Y(n1364) );
  NAND2XL U5659 ( .A(data_memory_writeback_storeq[6]), .B(n2075), .Y(n4920) );
  OAI2BB1XL U5660 ( .A0N(data_memory_dcache_q[6]), .A1N(n4932), .B0(n4920), 
        .Y(n1363) );
  NAND2XL U5661 ( .A(data_memory_writeback_storeq2[6]), .B(n2075), .Y(n4921)
         );
  OAI2BB1XL U5662 ( .A0N(data_memory_writeback_storeq[6]), .A1N(n4932), .B0(
        n4921), .Y(n1362) );
  NAND2XL U5663 ( .A(data_memory_writeback_storeq[5]), .B(n2075), .Y(n4922) );
  OAI2BB1XL U5664 ( .A0N(data_memory_dcache_q[5]), .A1N(n4932), .B0(n4922), 
        .Y(n1361) );
  NAND2XL U5665 ( .A(data_memory_writeback_storeq2[5]), .B(n2075), .Y(n4923)
         );
  OAI2BB1XL U5666 ( .A0N(data_memory_writeback_storeq[5]), .A1N(n4932), .B0(
        n4923), .Y(n1360) );
  NAND2XL U5667 ( .A(data_memory_writeback_storeq[4]), .B(n2075), .Y(n4924) );
  OAI2BB1XL U5668 ( .A0N(data_memory_dcache_q[4]), .A1N(n4932), .B0(n4924), 
        .Y(n1359) );
  NAND2XL U5669 ( .A(data_memory_writeback_storeq2[4]), .B(n2075), .Y(n4925)
         );
  OAI2BB1XL U5670 ( .A0N(data_memory_writeback_storeq[4]), .A1N(n4932), .B0(
        n4925), .Y(n1358) );
  NAND2XL U5671 ( .A(data_memory_writeback_storeq[3]), .B(n2075), .Y(n4926) );
  OAI2BB1XL U5672 ( .A0N(data_memory_dcache_q[3]), .A1N(n4932), .B0(n4926), 
        .Y(n1357) );
  NAND2XL U5673 ( .A(data_memory_writeback_storeq2[3]), .B(n2075), .Y(n4927)
         );
  OAI2BB1XL U5674 ( .A0N(data_memory_writeback_storeq[3]), .A1N(n4932), .B0(
        n4927), .Y(n1356) );
  NAND2XL U5675 ( .A(data_memory_writeback_storeq[2]), .B(n2075), .Y(n4928) );
  OAI2BB1XL U5676 ( .A0N(data_memory_dcache_q[2]), .A1N(n4932), .B0(n4928), 
        .Y(n1355) );
  NAND2XL U5677 ( .A(data_memory_writeback_storeq2[2]), .B(n2075), .Y(n4929)
         );
  OAI2BB1XL U5678 ( .A0N(data_memory_writeback_storeq[2]), .A1N(n4932), .B0(
        n4929), .Y(n1354) );
  NAND2XL U5679 ( .A(data_memory_writeback_storeq[1]), .B(n2075), .Y(n4930) );
  OAI2BB1XL U5680 ( .A0N(data_memory_dcache_q[1]), .A1N(n4932), .B0(n4930), 
        .Y(n1353) );
  NAND2XL U5681 ( .A(data_memory_writeback_storeq2[1]), .B(n2075), .Y(n4931)
         );
  OAI2BB1XL U5682 ( .A0N(data_memory_writeback_storeq[1]), .A1N(n4932), .B0(
        n4931), .Y(n1351) );
  INVXL U5683 ( .A(n4933), .Y(n4934) );
  AOI2BB1XL U5684 ( .A0N(patcal[1]), .A1N(n4935), .B0(n4934), .Y(n1279) );
  INVXL U5685 ( .A(n4936), .Y(n4937) );
  AOI2BB1XL U5686 ( .A0N(patcal[2]), .A1N(n4938), .B0(n4937), .Y(n1278) );
endmodule

