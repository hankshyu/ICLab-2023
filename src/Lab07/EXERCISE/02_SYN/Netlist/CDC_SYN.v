/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03
// Date      : Tue May  9 02:00:02 2023
/////////////////////////////////////////////////////////////


module CDC ( rst_n, clk1, clk2, in_valid, doraemon_id, size, iq_score, 
        eq_score, size_weight, iq_weight, eq_weight, ready, out_valid, out );
  input [4:0] doraemon_id;
  input [7:0] size;
  input [7:0] iq_score;
  input [7:0] eq_score;
  input [2:0] size_weight;
  input [2:0] iq_weight;
  input [2:0] eq_weight;
  output [7:0] out;
  input rst_n, clk1, clk2, in_valid;
  output ready, out_valid;
  wire   n2029, n2030, n2031, n2032, n2033, n2034, n2035, n2036, n2037,
         cmp1_out, cmp2_out, af_rinc, af_winc, af_rempty, N235, N236, N237,
         N238, N239, N240, N241, N242, N243, N244, N245, N246, N247, N349,
         N366, N368, N372, N373, N374, N375, N376, N377, N378, N379, afifo_n1,
         afifo_rptr_empty_m0_rempty_val, afifo_wptr_full_m0_wfull_val, n602,
         n603, n604, n605, n606, n607, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n618, n619, n620, n621, n622, n623, n624, n625,
         n626, n627, n628, n629, n630, n631, n632, n633, n634, n635, n636,
         n637, n638, n639, n640, n641, n642, n643, n644, n645, n646, n647,
         n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658,
         n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669,
         n670, n671, n672, n673, n674, n675, n676, n677, n678, n679, n680,
         n681, n682, n683, n684, n685, n686, n687, n688, n689, n690, n691,
         n692, n693, n694, n695, n696, n697, n698, n699, n700, n701, n702,
         n703, n704, n705, n706, n707, n708, n709, n710, n711, n712, n713,
         n714, n715, n716, n717, n718, n719, n720, n721, n722, n723, n724,
         n725, n726, n727, n728, n729, n730, n731, n732, n733, n734, n735,
         n736, n737, n738, n739, n740, n741, n742, n743, n744, n745, n746,
         n747, n748, n749, n750, n751, n752, n753, n754, n755, n756, n757,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n769, n770, n771, n772, n773, n774, n775, n776, n777, n778, n779,
         n780, n781, n782, n783, n784, n785, n786, n787, n788, n789, n790,
         n791, n792, n793, n794, n795, n796, n797, n798, n799, n800, n801,
         n802, n803, n804, n805, n806, n807, n808, n809, n810, n811, n812,
         n813, n814, n815, n816, n817, n818, n819, n820, n821, n822, n823,
         n824, n825, n826, n827, n828, n829, n830, n831, n832, n833, n834,
         n835, n836, n837, n838, n839, n840, n841, n842, n843, n844, n845,
         n846, n847, n848, n849, n850, n851, n852, n853, n854, n855, n856,
         n857, n858, n859, n860, n861, n862, n863, n864, n865, n866, n867,
         n868, n869, n870, n871, n873, n874, n875, n876, n877, n878, n879,
         n880, n881, n882, n883, n884, n885, n886, n887, n888, n889, n890,
         n891, n892, n893, n894, n895, n896, n897, n898, n899, n900, n901,
         n902, n903, n904, n905, n906, n907, n908, n909, n910, n911, n912,
         n913, n914, n915, n916, n917, n918, n919, n920, n921, n922, n923,
         n924, n925, n926, n927, n928, n929, n930, n931, n932, n933, n934,
         n935, n936, n937, n938, n939, n940, n941, n942, n943, n944, n945,
         n946, n947, n948, n949, n950, n951, n952, n953, n954, n955, n956,
         n957, n958, n959, n960, n961, n962, n963, n964, n965, n966, n967,
         n968, n969, n970, n971, n972, n973, n974, n975, n976, n977, n978,
         n979, n980, n981, n982, n983, n984, n985, n986, n987,
         DP_OP_81J1_122_2750_n288, DP_OP_81J1_122_2750_n259, n988, n989, n990,
         n991, n992, n993, n994, n995, n996, n997, n998, n999, n1000, n1001,
         n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011,
         n1012, n1013, n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021,
         n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031,
         n1032, n1033, n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041,
         n1042, n1043, n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051,
         n1052, n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061,
         n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071,
         n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081,
         n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091,
         n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101,
         n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111,
         n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121,
         n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131,
         n1132, n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141,
         n1142, n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151,
         n1152, n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161,
         n1162, n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171,
         n1172, n1173, n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181,
         n1182, n1183, n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191,
         n1192, n1193, n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201,
         n1202, n1203, n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211,
         n1212, n1213, n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221,
         n1222, n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231,
         n1232, n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241,
         n1242, n1243, n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251,
         n1252, n1253, n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261,
         n1262, n1263, n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271,
         n1272, n1273, n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281,
         n1282, n1283, n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291,
         n1292, n1293, n1294, n1295, n1296, n1297, n1298, n1299, n1300, n1301,
         n1302, n1303, n1304, n1305, n1306, n1307, n1308, n1309, n1310, n1311,
         n1312, n1313, n1314, n1315, n1316, n1317, n1318, n1319, n1320, n1321,
         n1322, n1323, n1324, n1325, n1326, n1327, n1328, n1329, n1330, n1331,
         n1332, n1333, n1334, n1335, n1336, n1337, n1338, n1339, n1340, n1341,
         n1342, n1343, n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351,
         n1352, n1353, n1354, n1355, n1356, n1357, n1358, n1359, n1360, n1361,
         n1362, n1363, n1364, n1365, n1366, n1367, n1368, n1369, n1370, n1371,
         n1372, n1373, n1374, n1375, n1376, n1377, n1378, n1379, n1380, n1381,
         n1382, n1383, n1384, n1385, n1386, n1387, n1388, n1389, n1390, n1391,
         n1392, n1393, n1394, n1395, n1396, n1397, n1398, n1399, n1400, n1401,
         n1402, n1403, n1404, n1405, n1406, n1407, n1408, n1409, n1410, n1411,
         n1412, n1413, n1414, n1415, n1416, n1417, n1418, n1419, n1420, n1421,
         n1422, n1423, n1424, n1425, n1426, n1427, n1428, n1429, n1430, n1431,
         n1432, n1433, n1434, n1435, n1436, n1437, n1438, n1439, n1440, n1441,
         n1442, n1443, n1444, n1445, n1446, n1447, n1448, n1449, n1450, n1451,
         n1452, n1453, n1454, n1455, n1456, n1457, n1458, n1459, n1460, n1461,
         n1462, n1463, n1464, n1465, n1466, n1467, n1468, n1469, n1470, n1471,
         n1472, n1473, n1474, n1475, n1476, n1477, n1478, n1479, n1480, n1481,
         n1482, n1483, n1484, n1485, n1486, n1487, n1488, n1489, n1490, n1491,
         n1492, n1493, n1494, n1495, n1496, n1497, n1498, n1499, n1500, n1501,
         n1502, n1503, n1504, n1505, n1506, n1507, n1508, n1509, n1510, n1511,
         n1512, n1513, n1514, n1515, n1516, n1517, n1518, n1519, n1520, n1521,
         n1522, n1523, n1524, n1525, n1526, n1527, n1528, n1529, n1530, n1531,
         n1532, n1533, n1534, n1535, n1536, n1537, n1538, n1539, n1540, n1541,
         n1542, n1543, n1544, n1545, n1546, n1547, n1548, n1549, n1550, n1551,
         n1552, n1553, n1554, n1555, n1556, n1557, n1558, n1559, n1560, n1561,
         n1562, n1563, n1564, n1565, n1566, n1567, n1568, n1569, n1570, n1571,
         n1572, n1573, n1574, n1575, n1576, n1577, n1578, n1579, n1580, n1581,
         n1582, n1583, n1584, n1585, n1586, n1587, n1588, n1589, n1590, n1591,
         n1592, n1593, n1594, n1595, n1596, n1597, n1598, n1599, n1600, n1601,
         n1602, n1603, n1604, n1605, n1606, n1607, n1608, n1609, n1610, n1611,
         n1612, n1613, n1614, n1615, n1616, n1617, n1618, n1619, n1620, n1621,
         n1622, n1623, n1624, n1625, n1626, n1627, n1628, n1629, n1630, n1631,
         n1632, n1633, n1634, n1635, n1636, n1637, n1638, n1639, n1640, n1641,
         n1642, n1643, n1644, n1645, n1646, n1647, n1648, n1649, n1650, n1651,
         n1652, n1653, n1654, n1655, n1656, n1657, n1658, n1659, n1660, n1661,
         n1662, n1663, n1664, n1665, n1666, n1667, n1668, n1669, n1670, n1671,
         n1672, n1673, n1674, n1675, n1676, n1677, n1678, n1679, n1680, n1681,
         n1682, n1683, n1684, n1685, n1686, n1687, n1688, n1689, n1690, n1691,
         n1692, n1693, n1694, n1695, n1696, n1697, n1698, n1699, n1700, n1701,
         n1702, n1703, n1704, n1705, n1706, n1707, n1708, n1709, n1710, n1711,
         n1712, n1713, n1714, n1715, n1716, n1717, n1718, n1719, n1720, n1721,
         n1722, n1723, n1724, n1725, n1726, n1727, n1728, n1729, n1730, n1731,
         n1732, n1733, n1734, n1735, n1736, n1737, n1738, n1739, n1740, n1741,
         n1742, n1743, n1744, n1745, n1746, n1747, n1748, n1749, n1750, n1751,
         n1752, n1753, n1754, n1755, n1756, n1757, n1758, n1759, n1760, n1761,
         n1762, n1763, n1764, n1765, n1766, n1767, n1768, n1769, n1770, n1771,
         n1772, n1773, n1774, n1775, n1776, n1777, n1778, n1779, n1780, n1781,
         n1782, n1783, n1784, n1785, n1786, n1787, n1788, n1789, n1790, n1791,
         n1792, n1793, n1794, n1795, n1796, n1797, n1798, n1799, n1800, n1801,
         n1802, n1803, n1804, n1805, n1806, n1807, n1808, n1809, n1810, n1811,
         n1812, n1813, n1814, n1815, n1816, n1817, n1818, n1819, n1820, n1821,
         n1822, n1823, n1824, n1825, n1826, n1827, n1828, n1829, n1830, n1831,
         n1832, n1833, n1834, n1835, n1836, n1837, n1838, n1839, n1840, n1841,
         n1842, n1843, n1844, n1845, n1846, n1847, n1848, n1849, n1850, n1851,
         n1852, n1853, n1854, n1855, n1856, n1857, n1858, n1859, n1860, n1861,
         n1862, n1863, n1864, n1865, n1866, n1867, n1868, n1869, n1870, n1871,
         n1872, n1873, n1874, n1875, n1876, n1877, n1878, n1879, n1880, n1881,
         n1882, n1883, n1884, n1885, n1886, n1887, n1888, n1889, n1890, n1891,
         n1892, n1893, n1894, n1895, n1896, n1897, n1898, n1899, n1900, n1901,
         n1902, n1903, n1904, n1905, n1906, n1907, n1908, n1909, n1910, n1911,
         n1912, n1913, n1914, n1915, n1916, n1917, n1918, n1919, n1920, n1921,
         n1922, n1923, n1924, n1925, n1926, n1927, n1928, n1929, n1930, n1931,
         n1932, n1933, n1934, n1935, n1936, n1937, n1938, n1939, n1940, n1941,
         n1942, n1943, n1944, n1945, n1946, n1947, n1948, n1949, n1950, n1951,
         n1952, n1953, n1954, n1955, n1956, n1957, n1958, n1959, n1960, n1961,
         n1962, n1963, n1964, n1965, n1966, n1967, n1968, n1969, n1970, n1971,
         n1972, n1973, n1974, n1975, n1976, n1977, n1978, n1979, n1980, n1981,
         n1982, n1983, n1984, n1985, n1986, n1987, n1988, n1989, n1990, n1991,
         n1992, n1993, n1994, n1995, n1996, n1997, n1998, n1999, n2000, n2001,
         n2002, n2003, n2004, n2005, n2006, n2007, n2008, n2009, n2010, n2011,
         n2023, n2024, n2025, n2026, n2027, n2028;
  wire   [39:0] dora_size;
  wire   [2:0] w_size;
  wire   [39:0] dora_iq;
  wire   [2:1] w_iq;
  wire   [39:0] dora_eq;
  wire   [2:0] w_eq;
  wire   [25:0] cmp1_op;
  wire   [25:0] cmp2_op;
  wire   [2:0] cmp_rst1;
  wire   [1:0] cmp_rst2;
  wire   [7:0] af_wdata;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  wire   [3:0] cnt;
  wire   [12:0] stopmachine;
  wire   [24:0] dora_id;
  wire   [12:0] dora_score2;
  wire   [12:0] m1_out;
  wire   [12:0] dora_score3;
  wire   [3:0] afifo_raddr;
  wire   [3:0] afifo_waddr;
  wire   [4:0] afifo_wptr;
  wire   [4:0] afifo_rq2_wptr;
  wire   [4:0] afifo_rptr;
  wire   [4:0] afifo_wq2_rptr;
  wire   [127:0] afifo_fifomem_m0_mem;
  wire   [3:0] afifo_rptr_empty_m0_rgraynext;
  wire   [4:0] afifo_rptr_empty_m0_rbinnext;
  wire   [3:0] afifo_wptr_full_m0_wgraynext;
  wire   [4:0] afifo_wptr_full_m0_wbinnext;

  sync_w2r afifo_sync_w2r_m0 ( .wptr(afifo_wptr), .rclk(clk2), .rst_n(rst_n), 
        .rq2_wptr(afifo_rq2_wptr) );
  sync_r2w afifo_sync_r2w_m0 ( .rptr(afifo_rptr), .wclk(clk1), .rst_n(rst_n), 
        .wq2_rptr(afifo_wq2_rptr) );
  DFFHQX4 cmp1_op_reg_0__1_ ( .D(n819), .CK(clk1), .Q(cmp1_op[14]) );
  DFFHQX4 cmp1_op_reg_0__2_ ( .D(n818), .CK(clk1), .Q(cmp1_op[15]) );
  DFFHQX4 cmp1_op_reg_0__3_ ( .D(n817), .CK(clk1), .Q(cmp1_op[16]) );
  DFFHQX4 cmp1_op_reg_1__0_ ( .D(n807), .CK(clk1), .Q(cmp1_op[0]) );
  DFFHQX4 cmp1_op_reg_1__3_ ( .D(n804), .CK(clk1), .Q(cmp1_op[3]) );
  DFFHQX4 cmp1_op_reg_1__2_ ( .D(n805), .CK(clk1), .Q(cmp1_op[2]) );
  DFFHQX4 cmp1_op_reg_1__1_ ( .D(n806), .CK(clk1), .Q(cmp1_op[1]) );
  DFFHQX4 dora_eq_reg_0__0_ ( .D(n962), .CK(clk1), .Q(dora_eq[32]) );
  DFFHQX4 dora_eq_reg_0__1_ ( .D(n957), .CK(clk1), .Q(dora_eq[33]) );
  DFFHQX4 dora_eq_reg_0__2_ ( .D(n952), .CK(clk1), .Q(dora_eq[34]) );
  DFFHQX4 dora_eq_reg_0__3_ ( .D(n947), .CK(clk1), .Q(dora_eq[35]) );
  DFFHQX4 dora_eq_reg_0__4_ ( .D(n942), .CK(clk1), .Q(dora_eq[36]) );
  DFFHQX4 dora_eq_reg_0__6_ ( .D(n932), .CK(clk1), .Q(dora_eq[38]) );
  DFFHQX4 dora_iq_reg_0__1_ ( .D(n917), .CK(clk1), .Q(dora_iq[33]) );
  DFFHQX4 dora_iq_reg_0__2_ ( .D(n912), .CK(clk1), .Q(dora_iq[34]) );
  DFFHQX4 dora_iq_reg_0__3_ ( .D(n907), .CK(clk1), .Q(dora_iq[35]) );
  DFFHQX4 dora_iq_reg_0__4_ ( .D(n902), .CK(clk1), .Q(dora_iq[36]) );
  DFFHQX4 dora_iq_reg_0__5_ ( .D(n897), .CK(clk1), .Q(dora_iq[37]) );
  DFFHQX4 dora_iq_reg_0__6_ ( .D(n892), .CK(clk1), .Q(dora_iq[38]) );
  DFFHQX4 dora_iq_reg_0__7_ ( .D(n887), .CK(clk1), .Q(dora_iq[39]) );
  DFFHQX4 dora_size_reg_0__3_ ( .D(n867), .CK(clk1), .Q(dora_size[35]) );
  DFFHQX4 dora_size_reg_0__4_ ( .D(n862), .CK(clk1), .Q(dora_size[36]) );
  DFFHQX4 dora_size_reg_0__5_ ( .D(n857), .CK(clk1), .Q(dora_size[37]) );
  DFFHQX4 dora_size_reg_0__6_ ( .D(n852), .CK(clk1), .Q(dora_size[38]) );
  DFFHQX4 dora_size_reg_0__7_ ( .D(n847), .CK(clk1), .Q(dora_size[39]) );
  DFFHQX4 w_size_reg_0_ ( .D(n623), .CK(clk1), .Q(w_size[0]) );
  DFFHQX4 w_eq_reg_2_ ( .D(n622), .CK(clk1), .Q(w_eq[2]) );
  DFFHQX4 w_eq_reg_1_ ( .D(n621), .CK(clk1), .Q(w_eq[1]) );
  DFFHQX4 w_eq_reg_0_ ( .D(n620), .CK(clk1), .Q(w_eq[0]) );
  DFFHQX4 w_iq_reg_2_ ( .D(n619), .CK(clk1), .Q(w_iq[2]) );
  DFFHQX4 w_iq_reg_1_ ( .D(n618), .CK(clk1), .Q(w_iq[1]) );
  DFFHQX4 w_size_reg_2_ ( .D(n616), .CK(clk1), .Q(w_size[2]) );
  DFFHQX4 w_size_reg_1_ ( .D(n615), .CK(clk1), .Q(w_size[1]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_6__7_ ( .D(n715), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[55]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_6__5_ ( .D(n713), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[53]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_6__6_ ( .D(n714), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[54]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_15__7_ ( .D(n643), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[127]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_15__5_ ( .D(n641), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[125]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_0__7_ ( .D(n763), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[7]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_0__5_ ( .D(n761), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[5]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_1__7_ ( .D(n755), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[15]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_1__5_ ( .D(n753), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[13]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_3__7_ ( .D(n739), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[31]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_3__5_ ( .D(n737), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[29]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_12__7_ ( .D(n667), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[103]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_12__5_ ( .D(n665), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[101]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_14__7_ ( .D(n651), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[119]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_14__5_ ( .D(n649), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[117]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_9__7_ ( .D(n691), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[79]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_9__5_ ( .D(n689), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[77]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_0__6_ ( .D(n762), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[6]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_1__6_ ( .D(n754), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[14]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_3__6_ ( .D(n738), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[30]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_12__6_ ( .D(n666), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[102]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_14__6_ ( .D(n650), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[118]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_9__6_ ( .D(n690), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[78]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_15__6_ ( .D(n642), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[126]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_4__7_ ( .D(n731), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[39]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_4__5_ ( .D(n729), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[37]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_5__7_ ( .D(n723), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[47]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_5__5_ ( .D(n721), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[45]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_7__7_ ( .D(n707), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[63]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_7__5_ ( .D(n705), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[61]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_8__7_ ( .D(n699), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[71]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_8__5_ ( .D(n697), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[69]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_10__7_ ( .D(n683), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[87]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_10__5_ ( .D(n681), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[85]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_11__7_ ( .D(n675), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[95]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_11__5_ ( .D(n673), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[93]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_13__7_ ( .D(n659), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[111]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_13__5_ ( .D(n657), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[109]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_2__7_ ( .D(n747), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[23]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_2__5_ ( .D(n745), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[21]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_4__6_ ( .D(n730), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[38]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_5__6_ ( .D(n722), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[46]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_7__6_ ( .D(n706), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[62]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_8__6_ ( .D(n698), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[70]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_10__6_ ( .D(n682), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[86]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_11__6_ ( .D(n674), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[94]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_13__6_ ( .D(n658), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[110]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_2__6_ ( .D(n746), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[22]) );
  DFFHQX1 dora_eq_reg_3__6_ ( .D(n935), .CK(clk1), .Q(dora_eq[14]) );
  DFFHQX1 dora_eq_reg_2__6_ ( .D(n934), .CK(clk1), .Q(dora_eq[22]) );
  DFFHQX1 dora_eq_reg_1__6_ ( .D(n933), .CK(clk1), .Q(dora_eq[30]) );
  DFFHQX1 dora_eq_reg_3__7_ ( .D(n930), .CK(clk1), .Q(dora_eq[15]) );
  DFFHQX1 dora_eq_reg_2__7_ ( .D(n929), .CK(clk1), .Q(dora_eq[23]) );
  DFFHQX1 dora_eq_reg_1__7_ ( .D(n928), .CK(clk1), .Q(dora_eq[31]) );
  DFFHQX1 dora_iq_reg_3__0_ ( .D(n925), .CK(clk1), .Q(dora_iq[8]) );
  DFFHQX1 dora_iq_reg_2__0_ ( .D(n924), .CK(clk1), .Q(dora_iq[16]) );
  DFFHQX1 dora_iq_reg_1__0_ ( .D(n923), .CK(clk1), .Q(dora_iq[24]) );
  DFFHQX1 dora_iq_reg_3__1_ ( .D(n920), .CK(clk1), .Q(dora_iq[9]) );
  DFFHQX1 dora_iq_reg_2__1_ ( .D(n919), .CK(clk1), .Q(dora_iq[17]) );
  DFFHQX1 dora_iq_reg_1__1_ ( .D(n918), .CK(clk1), .Q(dora_iq[25]) );
  DFFHQX1 dora_iq_reg_3__2_ ( .D(n915), .CK(clk1), .Q(dora_iq[10]) );
  DFFHQX1 dora_iq_reg_2__2_ ( .D(n914), .CK(clk1), .Q(dora_iq[18]) );
  DFFHQX1 dora_iq_reg_1__2_ ( .D(n913), .CK(clk1), .Q(dora_iq[26]) );
  DFFHQX1 dora_iq_reg_3__3_ ( .D(n910), .CK(clk1), .Q(dora_iq[11]) );
  DFFHQX1 dora_iq_reg_2__3_ ( .D(n909), .CK(clk1), .Q(dora_iq[19]) );
  DFFHQX1 dora_size_reg_3__2_ ( .D(n875), .CK(clk1), .Q(dora_size[10]) );
  DFFHQX1 dora_size_reg_2__2_ ( .D(n874), .CK(clk1), .Q(dora_size[18]) );
  DFFHQX1 dora_size_reg_1__2_ ( .D(n873), .CK(clk1), .Q(dora_size[26]) );
  DFFHQX1 dora_size_reg_3__3_ ( .D(n870), .CK(clk1), .Q(dora_size[11]) );
  DFFHQX1 dora_size_reg_2__3_ ( .D(n869), .CK(clk1), .Q(dora_size[19]) );
  DFFHQX1 dora_size_reg_3__4_ ( .D(n865), .CK(clk1), .Q(dora_size[12]) );
  DFFHQX1 dora_size_reg_2__4_ ( .D(n864), .CK(clk1), .Q(dora_size[20]) );
  DFFHQX1 dora_size_reg_1__4_ ( .D(n863), .CK(clk1), .Q(dora_size[28]) );
  DFFHQX1 dora_size_reg_3__5_ ( .D(n860), .CK(clk1), .Q(dora_size[13]) );
  DFFHQX1 dora_size_reg_2__5_ ( .D(n859), .CK(clk1), .Q(dora_size[21]) );
  DFFHQX1 dora_size_reg_1__5_ ( .D(n858), .CK(clk1), .Q(dora_size[29]) );
  DFFHQX1 dora_size_reg_3__6_ ( .D(n855), .CK(clk1), .Q(dora_size[14]) );
  DFFHQX1 dora_size_reg_2__6_ ( .D(n854), .CK(clk1), .Q(dora_size[22]) );
  DFFHQX1 dora_size_reg_1__6_ ( .D(n853), .CK(clk1), .Q(dora_size[30]) );
  DFFHQX1 dora_size_reg_3__7_ ( .D(n850), .CK(clk1), .Q(dora_size[15]) );
  DFFHQX1 dora_size_reg_2__7_ ( .D(n849), .CK(clk1), .Q(dora_size[23]) );
  DFFHQX1 dora_size_reg_1__7_ ( .D(n848), .CK(clk1), .Q(dora_size[31]) );
  DFFHQX1 dora_id_reg_1__1_ ( .D(n785), .CK(clk1), .Q(dora_id[16]) );
  DFFHQX1 dora_id_reg_3__1_ ( .D(n787), .CK(clk1), .Q(dora_id[6]) );
  DFFHQX1 dora_id_reg_2__1_ ( .D(n786), .CK(clk1), .Q(dora_id[11]) );
  DFFHQX1 dora_id_reg_2__2_ ( .D(n782), .CK(clk1), .Q(dora_id[12]) );
  DFFHQX1 dora_id_reg_1__2_ ( .D(n781), .CK(clk1), .Q(dora_id[17]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_15__4_ ( .D(n640), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[124]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_15__3_ ( .D(n639), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[123]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_15__2_ ( .D(n638), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[122]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_15__1_ ( .D(n637), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[121]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_15__0_ ( .D(n644), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[120]) );
  DFFHQX1 dora_score2_reg_7_ ( .D(n630), .CK(clk1), .Q(dora_score2[7]) );
  DFFHQX1 dora_score2_reg_11_ ( .D(n634), .CK(clk1), .Q(dora_score2[11]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_6__0_ ( .D(n716), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[48]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_6__4_ ( .D(n712), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[52]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_6__3_ ( .D(n711), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[51]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_6__2_ ( .D(n710), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[50]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_6__1_ ( .D(n709), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[49]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_1__2_ ( .D(n750), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[10]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_1__1_ ( .D(n749), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[9]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_3__4_ ( .D(n736), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[28]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_3__3_ ( .D(n735), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[27]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_3__2_ ( .D(n734), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[26]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_3__1_ ( .D(n733), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[25]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_12__0_ ( .D(n668), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[96]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_12__4_ ( .D(n664), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[100]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_12__3_ ( .D(n663), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[99]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_12__2_ ( .D(n662), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[98]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_12__1_ ( .D(n661), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[97]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_0__0_ ( .D(n764), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[0]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_0__4_ ( .D(n760), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[4]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_0__3_ ( .D(n759), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[3]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_0__2_ ( .D(n758), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[2]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_0__1_ ( .D(n757), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[1]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_1__4_ ( .D(n752), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[12]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_1__3_ ( .D(n751), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[11]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_14__0_ ( .D(n652), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[112]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_14__4_ ( .D(n648), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[116]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_14__3_ ( .D(n647), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[115]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_14__2_ ( .D(n646), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[114]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_14__1_ ( .D(n645), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[113]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_9__4_ ( .D(n688), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[76]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_9__3_ ( .D(n687), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[75]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_9__2_ ( .D(n686), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[74]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_9__1_ ( .D(n685), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[73]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_1__0_ ( .D(n756), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[8]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_3__0_ ( .D(n740), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[24]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_9__0_ ( .D(n692), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[72]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_5__0_ ( .D(n724), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[40]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_7__0_ ( .D(n708), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[56]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_11__0_ ( .D(n676), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[88]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_13__0_ ( .D(n660), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[104]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_4__0_ ( .D(n732), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[32]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_4__4_ ( .D(n728), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[36]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_4__3_ ( .D(n727), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[35]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_4__2_ ( .D(n726), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[34]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_4__1_ ( .D(n725), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[33]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_5__4_ ( .D(n720), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[44]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_5__3_ ( .D(n719), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[43]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_5__2_ ( .D(n718), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[42]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_5__1_ ( .D(n717), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[41]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_10__0_ ( .D(n684), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[80]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_10__4_ ( .D(n680), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[84]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_10__3_ ( .D(n679), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[83]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_10__2_ ( .D(n678), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[82]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_10__1_ ( .D(n677), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[81]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_7__4_ ( .D(n704), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[60]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_7__3_ ( .D(n703), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[59]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_7__2_ ( .D(n702), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[58]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_7__1_ ( .D(n701), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[57]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_8__0_ ( .D(n700), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[64]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_8__4_ ( .D(n696), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[68]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_8__3_ ( .D(n695), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[67]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_8__2_ ( .D(n694), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[66]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_8__1_ ( .D(n693), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[65]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_11__4_ ( .D(n672), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[92]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_11__3_ ( .D(n671), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[91]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_11__2_ ( .D(n670), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[90]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_11__1_ ( .D(n669), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[89]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_13__4_ ( .D(n656), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[108]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_13__3_ ( .D(n655), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[107]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_13__2_ ( .D(n654), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[106]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_13__1_ ( .D(n653), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[105]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_2__0_ ( .D(n748), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[16]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_2__4_ ( .D(n744), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[20]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_2__3_ ( .D(n743), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[19]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_2__2_ ( .D(n742), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[18]) );
  DFFHQX1 afifo_fifomem_m0_mem_reg_2__1_ ( .D(n741), .CK(clk1), .Q(
        afifo_fifomem_m0_mem[17]) );
  DFFHQX1 dora_score2_reg_12_ ( .D(n635), .CK(clk1), .Q(dora_score2[12]) );
  DFFHQX1 dora_score2_reg_10_ ( .D(n633), .CK(clk1), .Q(dora_score2[10]) );
  DFFHQX1 dora_score2_reg_9_ ( .D(n632), .CK(clk1), .Q(dora_score2[9]) );
  DFFHQX1 dora_score2_reg_8_ ( .D(n631), .CK(clk1), .Q(dora_score2[8]) );
  DFFHQX1 dora_score2_reg_5_ ( .D(n628), .CK(clk1), .Q(dora_score2[5]) );
  DFFHQX1 dora_score2_reg_3_ ( .D(n626), .CK(clk1), .Q(dora_score2[3]) );
  DFFHQX1 dora_score2_reg_2_ ( .D(n625), .CK(clk1), .Q(dora_score2[2]) );
  DFFHQX1 dora_score2_reg_1_ ( .D(n624), .CK(clk1), .Q(dora_score2[1]) );
  DFFHQX1 dora_score2_reg_0_ ( .D(n636), .CK(clk1), .Q(dora_score2[0]) );
  DFFHQX1 dora_score2_reg_4_ ( .D(n627), .CK(clk1), .Q(dora_score2[4]) );
  DFFHQX1 dora_score2_reg_6_ ( .D(n629), .CK(clk1), .Q(dora_score2[6]) );
  DFFHQX1 dora_iq_reg_1__3_ ( .D(n908), .CK(clk1), .Q(dora_iq[27]) );
  DFFHQX1 dora_size_reg_1__3_ ( .D(n868), .CK(clk1), .Q(dora_size[27]) );
  DFFHQX1 dora_score3_reg_0_ ( .D(n614), .CK(clk1), .Q(dora_score3[0]) );
  DFFHQX1 dora_score3_reg_4_ ( .D(n605), .CK(clk1), .Q(dora_score3[4]) );
  DFFHQX1 dora_score3_reg_6_ ( .D(n607), .CK(clk1), .Q(dora_score3[6]) );
  DFFHQX1 dora_score3_reg_1_ ( .D(n602), .CK(clk1), .Q(dora_score3[1]) );
  DFFHQX1 m1_out_reg_4_ ( .D(N239), .CK(clk1), .Q(m1_out[4]) );
  DFFHQX1 m1_out_reg_0_ ( .D(N235), .CK(clk1), .Q(m1_out[0]) );
  DFFHQX1 m1_out_reg_1_ ( .D(N236), .CK(clk1), .Q(m1_out[1]) );
  DFFHQX1 m1_out_reg_6_ ( .D(N241), .CK(clk1), .Q(m1_out[6]) );
  DFFHQX1 dora_id_reg_0__1_ ( .D(n967), .CK(clk1), .Q(dora_id[21]) );
  DFFHQX1 dora_id_reg_0__2_ ( .D(n780), .CK(clk1), .Q(dora_id[22]) );
  DFFHQX1 m1_out_reg_12_ ( .D(N247), .CK(clk1), .Q(m1_out[12]) );
  DFFHQX1 m1_out_reg_5_ ( .D(N240), .CK(clk1), .Q(m1_out[5]) );
  DFFHQX1 m1_out_reg_3_ ( .D(N238), .CK(clk1), .Q(m1_out[3]) );
  DFFHQX1 m1_out_reg_2_ ( .D(N237), .CK(clk1), .Q(m1_out[2]) );
  DFFHQX1 dora_iq_reg_4__4_ ( .D(n906), .CK(clk1), .Q(dora_iq[4]) );
  DFFHQX1 dora_score3_reg_10_ ( .D(n611), .CK(clk1), .Q(dora_score3[10]) );
  DFFHQX1 dora_score3_reg_11_ ( .D(n612), .CK(clk1), .Q(dora_score3[11]) );
  DFFHQX1 dora_score3_reg_7_ ( .D(n608), .CK(clk1), .Q(dora_score3[7]) );
  DFFHQX1 dora_score3_reg_12_ ( .D(n613), .CK(clk1), .Q(dora_score3[12]) );
  DFFHQX1 dora_score3_reg_9_ ( .D(n610), .CK(clk1), .Q(dora_score3[9]) );
  DFFHQX1 dora_score3_reg_8_ ( .D(n609), .CK(clk1), .Q(dora_score3[8]) );
  DFFHQX1 dora_score3_reg_5_ ( .D(n606), .CK(clk1), .Q(dora_score3[5]) );
  DFFHQX1 dora_score3_reg_3_ ( .D(n604), .CK(clk1), .Q(dora_score3[3]) );
  DFFHQX1 dora_score3_reg_2_ ( .D(n603), .CK(clk1), .Q(dora_score3[2]) );
  DFFHQX1 cmp_rst2_reg_0_ ( .D(cmp2_out), .CK(clk1), .Q(cmp_rst2[0]) );
  DFFHQX1 cmp_rst2_reg_1_ ( .D(cmp_rst2[0]), .CK(clk1), .Q(cmp_rst2[1]) );
  DFFHQX1 cmp2_op_reg_0__7_ ( .D(n826), .CK(clk1), .Q(cmp2_op[20]) );
  DFFHQX1 cmp2_op_reg_1__7_ ( .D(n839), .CK(clk1), .Q(cmp2_op[7]) );
  DFFHQX1 cmp_rst1_reg_0_ ( .D(cmp1_out), .CK(clk1), .Q(cmp_rst1[0]) );
  DFFHQX1 cmp2_op_reg_0__6_ ( .D(n827), .CK(clk1), .Q(cmp2_op[19]) );
  DFFHQX1 cmp_rst1_reg_2_ ( .D(cmp_rst1[1]), .CK(clk1), .Q(cmp_rst1[2]) );
  DFFHQX1 cmp_rst1_reg_1_ ( .D(cmp_rst1[0]), .CK(clk1), .Q(cmp_rst1[1]) );
  DFFHQX1 cmp1_op_reg_0__12_ ( .D(n808), .CK(clk1), .Q(cmp1_op[25]) );
  DFFHQX1 cmp2_op_reg_1__6_ ( .D(n840), .CK(clk1), .Q(cmp2_op[6]) );
  DFFHQX1 cmp2_op_reg_1__10_ ( .D(n836), .CK(clk1), .Q(cmp2_op[10]) );
  DFFHQX1 cmp2_op_reg_1__8_ ( .D(n838), .CK(clk1), .Q(cmp2_op[8]) );
  DFFHQX1 cmp2_op_reg_0__8_ ( .D(n825), .CK(clk1), .Q(cmp2_op[21]) );
  DFFHQX1 cmp1_op_reg_1__11_ ( .D(n796), .CK(clk1), .Q(cmp1_op[11]) );
  DFFHQX1 cmp1_op_reg_1__12_ ( .D(n795), .CK(clk1), .Q(cmp1_op[12]) );
  DFFHQX1 cmp2_op_reg_1__12_ ( .D(n834), .CK(clk1), .Q(cmp2_op[12]) );
  DFFHQX1 cmp2_op_reg_1__9_ ( .D(n837), .CK(clk1), .Q(cmp2_op[9]) );
  DFFHQX1 cmp2_op_reg_0__10_ ( .D(n823), .CK(clk1), .Q(cmp2_op[23]) );
  DFFHQX1 cmp1_op_reg_0__11_ ( .D(n809), .CK(clk1), .Q(cmp1_op[24]) );
  DFFHQX1 cmp2_op_reg_1__11_ ( .D(n835), .CK(clk1), .Q(cmp2_op[11]) );
  DFFHQX1 cmp2_op_reg_0__11_ ( .D(n822), .CK(clk1), .Q(cmp2_op[24]) );
  DFFHQX1 cmp2_op_reg_0__12_ ( .D(n821), .CK(clk1), .Q(cmp2_op[25]) );
  DFFHQX1 cmp2_op_reg_0__9_ ( .D(n824), .CK(clk1), .Q(cmp2_op[22]) );
  DFFHQX1 cmp1_op_reg_0__10_ ( .D(n810), .CK(clk1), .Q(cmp1_op[23]) );
  DFFHQX1 cmp2_op_reg_0__5_ ( .D(n828), .CK(clk1), .Q(cmp2_op[18]) );
  DFFHQX1 cmp1_op_reg_0__6_ ( .D(n814), .CK(clk1), .Q(cmp1_op[19]) );
  DFFHQX1 cmp2_op_reg_1__5_ ( .D(n841), .CK(clk1), .Q(cmp2_op[5]) );
  DFFHQX1 cmp1_op_reg_1__6_ ( .D(n801), .CK(clk1), .Q(cmp1_op[6]) );
  DFFHQX1 cmp1_op_reg_0__5_ ( .D(n815), .CK(clk1), .Q(cmp1_op[18]) );
  DFFHQX1 cmp1_op_reg_0__9_ ( .D(n811), .CK(clk1), .Q(cmp1_op[22]) );
  DFFHQX1 cmp2_op_reg_1__3_ ( .D(n843), .CK(clk1), .Q(cmp2_op[3]) );
  DFFHQX1 cmp1_op_reg_1__10_ ( .D(n797), .CK(clk1), .Q(cmp1_op[10]) );
  DFFHQX1 cmp1_op_reg_1__9_ ( .D(n798), .CK(clk1), .Q(cmp1_op[9]) );
  DFFHQX1 cmp2_op_reg_1__4_ ( .D(n842), .CK(clk1), .Q(cmp2_op[4]) );
  DFFRHQX2 cnt_reg_0_ ( .D(n985), .CK(clk1), .RN(rst_n), .Q(cnt[0]) );
  DFFHQX1 cmp1_op_reg_0__7_ ( .D(n813), .CK(clk1), .Q(cmp1_op[20]) );
  DFFHQX1 cmp1_op_reg_0__8_ ( .D(n812), .CK(clk1), .Q(cmp1_op[21]) );
  DFFRHQX1 af_winc_reg ( .D(N349), .CK(clk1), .RN(rst_n), .Q(af_winc) );
  DFFHQX4 m1_out_reg_10_ ( .D(N245), .CK(clk1), .Q(m1_out[10]) );
  DFFHQX4 m1_out_reg_9_ ( .D(N244), .CK(clk1), .Q(m1_out[9]) );
  DFFHQX4 m1_out_reg_8_ ( .D(N243), .CK(clk1), .Q(m1_out[8]) );
  DFFHQX4 dora_eq_reg_4__5_ ( .D(n941), .CK(clk1), .Q(dora_eq[5]) );
  DFFHQX4 dora_iq_reg_4__5_ ( .D(n901), .CK(clk1), .Q(dora_iq[5]) );
  DFFHQX4 dora_size_reg_4__4_ ( .D(n866), .CK(clk1), .Q(dora_size[4]) );
  DFFHQX4 dora_id_reg_4__0_ ( .D(n793), .CK(clk1), .Q(dora_id[0]) );
  DFFHQX4 m1_out_reg_11_ ( .D(N246), .CK(clk1), .Q(m1_out[11]) );
  DFFSX1 ans1_door_reg_1_ ( .D(n981), .CK(clk1), .SN(rst_n), .Q(af_wdata[6]), 
        .QN(n2025) );
  DFFRX1 cnt_reg_1_ ( .D(n984), .CK(clk1), .RN(rst_n), .Q(cnt[1]), .QN(n2024)
         );
  DFFSX1 ans1_door_reg_2_ ( .D(n794), .CK(clk1), .SN(rst_n), .Q(af_wdata[7]), 
        .QN(n2028) );
  EDFFTRX4 w_iq_reg_0_ ( .RN(n2026), .D(1'b1), .E(n2027), .CK(clk1), .Q(
        DP_OP_81J1_122_2750_n288) );
  EDFFTRX4 dora_size_reg_0__2_ ( .RN(1'b1), .D(dora_size[26]), .E(n1858), .CK(
        clk1), .Q(dora_size[34]), .QN(DP_OP_81J1_122_2750_n259) );
  DFFSX1 afifo_rptr_empty_m0_rempty_reg ( .D(afifo_rptr_empty_m0_rempty_val), 
        .CK(clk2), .SN(rst_n), .Q(af_rempty), .QN(n987) );
  DFFRHQXL afifo_rptr_empty_m0_rptr_reg_1_ ( .D(
        afifo_rptr_empty_m0_rgraynext[1]), .CK(clk2), .RN(rst_n), .Q(
        afifo_rptr[1]) );
  DFFRHQXL afifo_rptr_empty_m0_rbin_reg_0_ ( .D(
        afifo_rptr_empty_m0_rbinnext[0]), .CK(clk2), .RN(rst_n), .Q(
        afifo_raddr[0]) );
  DFFRHQXL ans1_idx_reg_0_ ( .D(n765), .CK(clk1), .RN(rst_n), .Q(af_wdata[0])
         );
  DFFRHQXL stopmachine_reg_12_ ( .D(n968), .CK(clk1), .RN(rst_n), .Q(
        stopmachine[12]) );
  DFFRHQXL stopmachine_reg_1_ ( .D(n980), .CK(clk1), .RN(rst_n), .Q(
        stopmachine[1]) );
  DFFRHQXL afifo_wptr_full_m0_wbin_reg_1_ ( .D(afifo_wptr_full_m0_wbinnext[1]), 
        .CK(clk1), .RN(rst_n), .Q(afifo_waddr[1]) );
  DFFRHQXL afifo_wptr_full_m0_wbin_reg_0_ ( .D(afifo_wptr_full_m0_wbinnext[0]), 
        .CK(clk1), .RN(rst_n), .Q(afifo_waddr[0]) );
  DFFHQX1 cmp1_op_reg_1__8_ ( .D(n799), .CK(clk1), .Q(cmp1_op[8]) );
  DFFHQX1 cmp1_op_reg_1__5_ ( .D(n802), .CK(clk1), .Q(cmp1_op[5]) );
  DFFHQX1 cmp2_op_reg_1__0_ ( .D(n846), .CK(clk1), .Q(cmp2_op[0]) );
  DFFHQX1 cmp2_op_reg_1__2_ ( .D(n844), .CK(clk1), .Q(cmp2_op[2]) );
  DFFHQX1 cmp2_op_reg_0__1_ ( .D(n832), .CK(clk1), .Q(cmp2_op[14]) );
  DFFHQX2 dora_iq_reg_0__0_ ( .D(n922), .CK(clk1), .Q(dora_iq[32]) );
  DFFRHQX1 cnt_reg_2_ ( .D(n983), .CK(clk1), .RN(rst_n), .Q(cnt[2]) );
  DFFRHQXL out_reg_7_ ( .D(N379), .CK(clk2), .RN(rst_n), .Q(n2030) );
  DFFRHQXL out_reg_6_ ( .D(N378), .CK(clk2), .RN(rst_n), .Q(n2031) );
  DFFRHQXL out_reg_5_ ( .D(N377), .CK(clk2), .RN(rst_n), .Q(n2032) );
  DFFRHQXL out_reg_4_ ( .D(N376), .CK(clk2), .RN(rst_n), .Q(n2033) );
  DFFRHQXL out_reg_3_ ( .D(N375), .CK(clk2), .RN(rst_n), .Q(n2034) );
  DFFRHQXL out_reg_2_ ( .D(N374), .CK(clk2), .RN(rst_n), .Q(n2035) );
  DFFRHQXL out_reg_1_ ( .D(N373), .CK(clk2), .RN(rst_n), .Q(n2036) );
  DFFRHQXL out_reg_0_ ( .D(N372), .CK(clk2), .RN(rst_n), .Q(n2037) );
  DFFRHQXL stopmachine_reg_4_ ( .D(n976), .CK(clk1), .RN(rst_n), .Q(
        stopmachine[4]) );
  DFFRHQXL stopmachine_reg_7_ ( .D(n973), .CK(clk1), .RN(rst_n), .Q(
        stopmachine[7]) );
  DFFRHQXL stopmachine_reg_2_ ( .D(n978), .CK(clk1), .RN(rst_n), .Q(
        stopmachine[2]) );
  DFFRHQXL afifo_rptr_empty_m0_rptr_reg_0_ ( .D(
        afifo_rptr_empty_m0_rgraynext[0]), .CK(clk2), .RN(rst_n), .Q(
        afifo_rptr[0]) );
  DFFRHQXL afifo_rptr_empty_m0_rptr_reg_2_ ( .D(
        afifo_rptr_empty_m0_rgraynext[2]), .CK(clk2), .RN(rst_n), .Q(
        afifo_rptr[2]) );
  DFFRHQXL afifo_rptr_empty_m0_rptr_reg_3_ ( .D(
        afifo_rptr_empty_m0_rgraynext[3]), .CK(clk2), .RN(rst_n), .Q(
        afifo_rptr[3]) );
  DFFRHQXL afifo_wptr_full_m0_wptr_reg_0_ ( .D(afifo_wptr_full_m0_wgraynext[0]), .CK(clk1), .RN(rst_n), .Q(afifo_wptr[0]) );
  DFFRHQXL afifo_wptr_full_m0_wptr_reg_1_ ( .D(afifo_wptr_full_m0_wgraynext[1]), .CK(clk1), .RN(rst_n), .Q(afifo_wptr[1]) );
  DFFRHQXL afifo_wptr_full_m0_wptr_reg_2_ ( .D(afifo_wptr_full_m0_wgraynext[2]), .CK(clk1), .RN(rst_n), .Q(afifo_wptr[2]) );
  DFFRHQXL afifo_wptr_full_m0_wptr_reg_3_ ( .D(afifo_wptr_full_m0_wgraynext[3]), .CK(clk1), .RN(rst_n), .Q(afifo_wptr[3]) );
  DFFRHQXL afifo_rptr_empty_m0_rptr_reg_4_ ( .D(
        afifo_rptr_empty_m0_rbinnext[4]), .CK(clk2), .RN(rst_n), .Q(
        afifo_rptr[4]) );
  DFFRHQXL afifo_rptr_empty_m0_rbin_reg_3_ ( .D(
        afifo_rptr_empty_m0_rbinnext[3]), .CK(clk2), .RN(rst_n), .Q(
        afifo_raddr[3]) );
  DFFRHQXL afifo_rptr_empty_m0_rbin_reg_2_ ( .D(
        afifo_rptr_empty_m0_rbinnext[2]), .CK(clk2), .RN(rst_n), .Q(
        afifo_raddr[2]) );
  DFFRHQXL afifo_rptr_empty_m0_rbin_reg_1_ ( .D(
        afifo_rptr_empty_m0_rbinnext[1]), .CK(clk2), .RN(rst_n), .Q(
        afifo_raddr[1]) );
  DFFRHQXL ans1_idx_reg_4_ ( .D(n769), .CK(clk1), .RN(rst_n), .Q(af_wdata[4])
         );
  DFFRHQXL ans1_idx_reg_3_ ( .D(n768), .CK(clk1), .RN(rst_n), .Q(af_wdata[3])
         );
  DFFRHQXL ans1_idx_reg_2_ ( .D(n767), .CK(clk1), .RN(rst_n), .Q(af_wdata[2])
         );
  DFFRHQXL ans1_idx_reg_1_ ( .D(n766), .CK(clk1), .RN(rst_n), .Q(af_wdata[1])
         );
  DFFRHQXL stopmachine_reg_11_ ( .D(n969), .CK(clk1), .RN(rst_n), .Q(
        stopmachine[11]) );
  DFFRHQXL stopmachine_reg_10_ ( .D(n970), .CK(clk1), .RN(rst_n), .Q(
        stopmachine[10]) );
  DFFRHQXL stopmachine_reg_9_ ( .D(n971), .CK(clk1), .RN(rst_n), .Q(
        stopmachine[9]) );
  DFFRHQXL stopmachine_reg_8_ ( .D(n972), .CK(clk1), .RN(rst_n), .Q(
        stopmachine[8]) );
  DFFRHQXL afifo_wptr_full_m0_wptr_reg_4_ ( .D(afifo_wptr_full_m0_wbinnext[4]), 
        .CK(clk1), .RN(rst_n), .Q(afifo_wptr[4]) );
  DFFRHQXL ans1_door_reg_0_ ( .D(n986), .CK(clk1), .RN(rst_n), .Q(af_wdata[5])
         );
  DFFRHQXL ready_reg ( .D(N366), .CK(clk1), .RN(rst_n), .Q(ready) );
  DFFRHQXL stopmachine_reg_6_ ( .D(n974), .CK(clk1), .RN(rst_n), .Q(
        stopmachine[6]) );
  DFFRHQXL stopmachine_reg_5_ ( .D(n975), .CK(clk1), .RN(rst_n), .Q(
        stopmachine[5]) );
  DFFRHQXL stopmachine_reg_3_ ( .D(n977), .CK(clk1), .RN(rst_n), .Q(
        stopmachine[3]) );
  DFFRHQXL stopmachine_reg_0_ ( .D(n979), .CK(clk1), .RN(rst_n), .Q(
        stopmachine[0]) );
  DFFRHQXL afifo_wptr_full_m0_wbin_reg_2_ ( .D(afifo_wptr_full_m0_wbinnext[2]), 
        .CK(clk1), .RN(rst_n), .Q(afifo_waddr[2]) );
  DFFRHQXL afifo_wptr_full_m0_wbin_reg_3_ ( .D(afifo_wptr_full_m0_wbinnext[3]), 
        .CK(clk1), .RN(rst_n), .Q(afifo_waddr[3]) );
  DFFHQX1 cmp2_op_reg_0__3_ ( .D(n830), .CK(clk1), .Q(cmp2_op[16]) );
  DFFRHQX1 current_state_reg_1_ ( .D(next_state[1]), .CK(clk1), .RN(rst_n), 
        .Q(current_state[1]) );
  DFFHQX1 cmp2_op_reg_0__4_ ( .D(n829), .CK(clk1), .Q(cmp2_op[17]) );
  DFFRHQXL afifo_wptr_full_m0_wfull_reg ( .D(afifo_wptr_full_m0_wfull_val), 
        .CK(clk1), .RN(rst_n), .Q(afifo_n1) );
  DFFRHQXL cnt_reg_3_ ( .D(n982), .CK(clk1), .RN(rst_n), .Q(cnt[3]) );
  DFFHQX1 cmp2_op_reg_0__2_ ( .D(n831), .CK(clk1), .Q(cmp2_op[15]) );
  DFFHQX1 cmp2_op_reg_0__0_ ( .D(n833), .CK(clk1), .Q(cmp2_op[13]) );
  DFFHQX1 dora_size_reg_0__0_ ( .D(n882), .CK(clk1), .Q(dora_size[32]) );
  DFFHQX1 dora_eq_reg_4__4_ ( .D(n946), .CK(clk1), .Q(dora_eq[4]) );
  DFFHQX1 dora_id_reg_4__2_ ( .D(n784), .CK(clk1), .Q(dora_id[2]) );
  DFFHQX1 dora_id_reg_4__4_ ( .D(n774), .CK(clk1), .Q(dora_id[4]) );
  DFFHQX1 dora_iq_reg_3__7_ ( .D(n890), .CK(clk1), .Q(dora_iq[15]) );
  DFFHQX1 dora_iq_reg_2__7_ ( .D(n889), .CK(clk1), .Q(dora_iq[23]) );
  DFFHQX1 dora_iq_reg_1__7_ ( .D(n888), .CK(clk1), .Q(dora_iq[31]) );
  DFFHQX1 dora_size_reg_3__0_ ( .D(n885), .CK(clk1), .Q(dora_size[8]) );
  DFFHQX1 dora_size_reg_2__0_ ( .D(n884), .CK(clk1), .Q(dora_size[16]) );
  DFFHQX1 dora_size_reg_1__0_ ( .D(n883), .CK(clk1), .Q(dora_size[24]) );
  DFFHQX1 dora_size_reg_3__1_ ( .D(n880), .CK(clk1), .Q(dora_size[9]) );
  DFFHQX1 dora_size_reg_2__1_ ( .D(n879), .CK(clk1), .Q(dora_size[17]) );
  DFFHQX1 dora_size_reg_1__1_ ( .D(n878), .CK(clk1), .Q(dora_size[25]) );
  DFFHQX1 dora_id_reg_3__0_ ( .D(n792), .CK(clk1), .Q(dora_id[5]) );
  DFFHQX1 dora_id_reg_2__0_ ( .D(n791), .CK(clk1), .Q(dora_id[10]) );
  DFFHQX1 dora_id_reg_1__0_ ( .D(n790), .CK(clk1), .Q(dora_id[15]) );
  DFFHQX1 dora_id_reg_3__3_ ( .D(n778), .CK(clk1), .Q(dora_id[8]) );
  DFFHQX1 dora_id_reg_2__3_ ( .D(n777), .CK(clk1), .Q(dora_id[13]) );
  DFFHQX1 dora_id_reg_1__3_ ( .D(n776), .CK(clk1), .Q(dora_id[18]) );
  DFFHQX1 dora_id_reg_3__4_ ( .D(n773), .CK(clk1), .Q(dora_id[9]) );
  DFFHQX1 dora_id_reg_2__4_ ( .D(n772), .CK(clk1), .Q(dora_id[14]) );
  DFFHQX1 dora_id_reg_1__4_ ( .D(n771), .CK(clk1), .Q(dora_id[19]) );
  DFFHQX1 dora_id_reg_0__0_ ( .D(n789), .CK(clk1), .Q(dora_id[20]) );
  DFFHQX1 dora_iq_reg_1__4_ ( .D(n903), .CK(clk1), .Q(dora_iq[28]) );
  DFFHQX1 dora_eq_reg_3__3_ ( .D(n950), .CK(clk1), .Q(dora_eq[11]) );
  DFFHQX1 dora_eq_reg_2__3_ ( .D(n949), .CK(clk1), .Q(dora_eq[19]) );
  DFFHQX1 dora_eq_reg_1__3_ ( .D(n948), .CK(clk1), .Q(dora_eq[27]) );
  DFFHQX1 dora_eq_reg_3__4_ ( .D(n945), .CK(clk1), .Q(dora_eq[12]) );
  DFFHQX1 dora_eq_reg_2__4_ ( .D(n944), .CK(clk1), .Q(dora_eq[20]) );
  DFFHQX1 dora_eq_reg_3__5_ ( .D(n940), .CK(clk1), .Q(dora_eq[13]) );
  DFFHQX1 dora_eq_reg_2__5_ ( .D(n939), .CK(clk1), .Q(dora_eq[21]) );
  DFFHQX1 dora_eq_reg_1__5_ ( .D(n938), .CK(clk1), .Q(dora_eq[29]) );
  DFFHQX1 dora_iq_reg_3__4_ ( .D(n905), .CK(clk1), .Q(dora_iq[12]) );
  DFFHQX1 dora_iq_reg_2__4_ ( .D(n904), .CK(clk1), .Q(dora_iq[20]) );
  DFFHQX1 dora_iq_reg_3__5_ ( .D(n900), .CK(clk1), .Q(dora_iq[13]) );
  DFFHQX1 dora_iq_reg_2__5_ ( .D(n899), .CK(clk1), .Q(dora_iq[21]) );
  DFFHQX1 dora_iq_reg_1__5_ ( .D(n898), .CK(clk1), .Q(dora_iq[29]) );
  DFFHQX1 dora_iq_reg_3__6_ ( .D(n895), .CK(clk1), .Q(dora_iq[14]) );
  DFFHQX1 dora_iq_reg_2__6_ ( .D(n894), .CK(clk1), .Q(dora_iq[22]) );
  DFFHQX1 dora_iq_reg_1__6_ ( .D(n893), .CK(clk1), .Q(dora_iq[30]) );
  DFFHQX1 dora_eq_reg_1__4_ ( .D(n943), .CK(clk1), .Q(dora_eq[28]) );
  DFFHQX1 dora_id_reg_0__3_ ( .D(n775), .CK(clk1), .Q(dora_id[23]) );
  DFFHQX1 dora_id_reg_0__4_ ( .D(n770), .CK(clk1), .Q(dora_id[24]) );
  DFFHQX1 dora_eq_reg_3__0_ ( .D(n965), .CK(clk1), .Q(dora_eq[8]) );
  DFFHQX1 dora_eq_reg_2__0_ ( .D(n964), .CK(clk1), .Q(dora_eq[16]) );
  DFFHQX1 dora_eq_reg_3__1_ ( .D(n960), .CK(clk1), .Q(dora_eq[9]) );
  DFFHQX1 dora_eq_reg_2__1_ ( .D(n959), .CK(clk1), .Q(dora_eq[17]) );
  DFFHQX1 dora_eq_reg_1__1_ ( .D(n958), .CK(clk1), .Q(dora_eq[25]) );
  DFFHQX1 dora_eq_reg_3__2_ ( .D(n955), .CK(clk1), .Q(dora_eq[10]) );
  DFFHQX1 dora_eq_reg_2__2_ ( .D(n954), .CK(clk1), .Q(dora_eq[18]) );
  DFFHQX1 dora_id_reg_3__2_ ( .D(n783), .CK(clk1), .Q(dora_id[7]) );
  DFFHQX1 dora_eq_reg_1__0_ ( .D(n963), .CK(clk1), .Q(dora_eq[24]) );
  DFFHQX1 dora_eq_reg_1__2_ ( .D(n953), .CK(clk1), .Q(dora_eq[26]) );
  DFFRHQXL out_valid_reg ( .D(N368), .CK(clk2), .RN(rst_n), .Q(n2029) );
  DFFRHQXL af_rinc_reg ( .D(n987), .CK(clk2), .RN(rst_n), .Q(af_rinc) );
  DFFHQX4 dora_size_reg_0__1_ ( .D(n877), .CK(clk1), .Q(dora_size[33]) );
  DFFHQX2 dora_eq_reg_0__5_ ( .D(n937), .CK(clk1), .Q(dora_eq[37]) );
  DFFHQX1 dora_size_reg_4__0_ ( .D(n886), .CK(clk1), .Q(dora_size[0]) );
  DFFHQX1 m1_out_reg_7_ ( .D(N242), .CK(clk1), .Q(m1_out[7]) );
  DFFRHQXL current_state_reg_2_ ( .D(next_state[2]), .CK(clk1), .RN(rst_n), 
        .Q(current_state[2]) );
  DFFRHQXL current_state_reg_0_ ( .D(next_state[0]), .CK(clk1), .RN(rst_n), 
        .Q(current_state[0]) );
  DFFHQX2 cmp1_op_reg_0__0_ ( .D(n820), .CK(clk1), .Q(cmp1_op[13]) );
  DFFHQX2 cmp1_op_reg_1__4_ ( .D(n803), .CK(clk1), .Q(cmp1_op[4]) );
  DFFHQX1 cmp1_op_reg_1__7_ ( .D(n800), .CK(clk1), .Q(cmp1_op[7]) );
  DFFHQX1 cmp1_op_reg_0__4_ ( .D(n816), .CK(clk1), .Q(cmp1_op[17]) );
  DFFHQX1 cmp2_op_reg_1__1_ ( .D(n845), .CK(clk1), .Q(cmp2_op[1]) );
  DFFHQX2 dora_eq_reg_0__7_ ( .D(n927), .CK(clk1), .Q(dora_eq[39]) );
  DFFHQX1 dora_eq_reg_4__0_ ( .D(n966), .CK(clk1), .Q(dora_eq[0]) );
  DFFHQX1 dora_eq_reg_4__2_ ( .D(n956), .CK(clk1), .Q(dora_eq[2]) );
  DFFHQX1 dora_eq_reg_4__3_ ( .D(n951), .CK(clk1), .Q(dora_eq[3]) );
  DFFHQX1 dora_eq_reg_4__6_ ( .D(n936), .CK(clk1), .Q(dora_eq[6]) );
  DFFHQX1 dora_iq_reg_4__0_ ( .D(n926), .CK(clk1), .Q(dora_iq[0]) );
  DFFHQX1 dora_iq_reg_4__1_ ( .D(n921), .CK(clk1), .Q(dora_iq[1]) );
  DFFHQX1 dora_iq_reg_4__2_ ( .D(n916), .CK(clk1), .Q(dora_iq[2]) );
  DFFHQX1 dora_iq_reg_4__3_ ( .D(n911), .CK(clk1), .Q(dora_iq[3]) );
  DFFHQX1 dora_iq_reg_4__6_ ( .D(n896), .CK(clk1), .Q(dora_iq[6]) );
  DFFHQX1 dora_iq_reg_4__7_ ( .D(n891), .CK(clk1), .Q(dora_iq[7]) );
  DFFHQX1 dora_size_reg_4__1_ ( .D(n881), .CK(clk1), .Q(dora_size[1]) );
  DFFHQX1 dora_size_reg_4__2_ ( .D(n876), .CK(clk1), .Q(dora_size[2]) );
  DFFHQX1 dora_size_reg_4__3_ ( .D(n871), .CK(clk1), .Q(dora_size[3]) );
  DFFHQX1 dora_size_reg_4__5_ ( .D(n861), .CK(clk1), .Q(dora_size[5]) );
  DFFHQX1 dora_size_reg_4__7_ ( .D(n851), .CK(clk1), .Q(dora_size[7]) );
  DFFHQX1 dora_id_reg_4__1_ ( .D(n788), .CK(clk1), .Q(dora_id[1]) );
  DFFHQX1 dora_id_reg_4__3_ ( .D(n779), .CK(clk1), .Q(dora_id[3]) );
  DFFHQX1 dora_eq_reg_4__1_ ( .D(n961), .CK(clk1), .Q(dora_eq[1]) );
  DFFHQX1 dora_eq_reg_4__7_ ( .D(n931), .CK(clk1), .Q(dora_eq[7]) );
  DFFHQX1 dora_size_reg_4__6_ ( .D(n856), .CK(clk1), .Q(dora_size[6]) );
  AND4X2 U1026 ( .A(afifo_raddr[0]), .B(n1927), .C(n1926), .D(n1925), .Y(n1934) );
  AND4X2 U1027 ( .A(afifo_raddr[0]), .B(n1949), .C(n1948), .D(n1947), .Y(n1966) );
  AND4X2 U1028 ( .A(afifo_raddr[0]), .B(n1938), .C(n1937), .D(n1936), .Y(n1945) );
  AND4X2 U1029 ( .A(afifo_raddr[0]), .B(n1883), .C(n1882), .D(n1881), .Y(n1890) );
  AND4X2 U1030 ( .A(afifo_raddr[0]), .B(n1905), .C(n1904), .D(n1903), .Y(n1912) );
  AND4X2 U1031 ( .A(afifo_raddr[0]), .B(n1872), .C(n1871), .D(n1870), .Y(n1879) );
  AND4X2 U1032 ( .A(afifo_raddr[0]), .B(n1894), .C(n1893), .D(n1892), .Y(n1901) );
  AND4X2 U1033 ( .A(afifo_raddr[0]), .B(n1916), .C(n1915), .D(n1914), .Y(n1923) );
  NOR2BXL U1034 ( .AN(n1406), .B(n1405), .Y(n1028) );
  NAND2XL U1035 ( .A(n1030), .B(n1002), .Y(n1029) );
  NOR2X1 U1036 ( .A(afifo_raddr[3]), .B(n1863), .Y(n1963) );
  NOR2X1 U1037 ( .A(n1721), .B(n1856), .Y(n1725) );
  NOR2X1 U1038 ( .A(afifo_raddr[3]), .B(n1869), .Y(n1950) );
  NOR2X1 U1039 ( .A(n1659), .B(n1790), .Y(n1752) );
  NOR2X1 U1040 ( .A(n1629), .B(n1628), .Y(n1631) );
  NOR2X1 U1041 ( .A(n1563), .B(n1611), .Y(n1994) );
  NOR2X1 U1042 ( .A(n1593), .B(n1611), .Y(n1995) );
  NOR2X1 U1043 ( .A(n1611), .B(n1541), .Y(n2002) );
  NOR2X1 U1044 ( .A(n1612), .B(n1607), .Y(n2001) );
  NOR2X1 U1045 ( .A(n1869), .B(n1868), .Y(n1953) );
  NOR2X1 U1046 ( .A(cnt[1]), .B(cnt[0]), .Y(n1720) );
  NOR2X1 U1047 ( .A(af_wdata[5]), .B(n2028), .Y(n1856) );
  NOR2X1 U1048 ( .A(n1453), .B(current_state[2]), .Y(n1778) );
  AOI2BB2X1 U1049 ( .B0(afifo_wptr_full_m0_wbinnext[3]), .B1(afifo_wptr[4]), 
        .A0N(afifo_wptr_full_m0_wbinnext[4]), .A1N(
        afifo_wptr_full_m0_wbinnext[3]), .Y(afifo_wptr_full_m0_wgraynext[3])
         );
  NOR2X1 U1050 ( .A(n1392), .B(n1400), .Y(n1035) );
  NOR2X1 U1051 ( .A(n1293), .B(n1292), .Y(n1392) );
  AOI211X1 U1052 ( .A0(n2024), .A1(n1728), .B0(n1435), .C0(cnt[3]), .Y(n1766)
         );
  OAI21XL U1053 ( .A0(in_valid), .A1(n1015), .B0(n1013), .Y(n1347) );
  NOR2X1 U1054 ( .A(n1538), .B(n1450), .Y(n1452) );
  ADDFX2 U1055 ( .A(n1144), .B(n1143), .CI(n1142), .CO(n1164), .S(n1287) );
  NOR2X1 U1056 ( .A(n2024), .B(cnt[3]), .Y(n1513) );
  NOR2X1 U1057 ( .A(n1441), .B(n1440), .Y(afifo_rptr_empty_m0_rbinnext[2]) );
  ADDFX1 U1058 ( .A(n1150), .B(n1149), .CI(n1148), .CO(n1172), .S(n1142) );
  NOR2X1 U1059 ( .A(n1189), .B(n1154), .Y(n1149) );
  XOR2X1 U1060 ( .A(cnt[1]), .B(cnt[0]), .Y(n1759) );
  NOR2X1 U1061 ( .A(n1443), .B(n1865), .Y(n1439) );
  NOR2X1 U1062 ( .A(n1575), .B(n1574), .Y(n1585) );
  OAI21X2 U1063 ( .A0(n1063), .A1(n1110), .B0(n1062), .Y(n1095) );
  NAND2X1 U1064 ( .A(n1082), .B(n1081), .Y(n1097) );
  NOR2X1 U1065 ( .A(n1265), .B(n1153), .Y(n1060) );
  NOR2X1 U1066 ( .A(n1229), .B(n1053), .Y(n1067) );
  NOR2X1 U1067 ( .A(n1326), .B(n1325), .Y(n1327) );
  AOI2BB2X1 U1068 ( .B0(n1321), .B1(cmp1_op[22]), .A0N(n1320), .A1N(cmp1_op[9]), .Y(n1326) );
  NOR2X1 U1069 ( .A(n1229), .B(n1227), .Y(n1238) );
  NOR2X1 U1070 ( .A(n1465), .B(cmp1_op[9]), .Y(n1324) );
  INVX4 U1071 ( .A(w_size[2]), .Y(n1151) );
  NOR2X1 U1072 ( .A(n1228), .B(n1263), .Y(n1266) );
  NOR2X1 U1073 ( .A(n1265), .B(n1264), .Y(n1430) );
  NOR2X1 U1074 ( .A(n1265), .B(n1184), .Y(n1224) );
  INVX2 U1075 ( .A(w_iq[2]), .Y(n1188) );
  NOR2X1 U1076 ( .A(n1229), .B(n1263), .Y(n1256) );
  CLKINVX2 U1077 ( .A(n1005), .Y(n1128) );
  NOR2X1 U1078 ( .A(n1228), .B(n1227), .Y(n1257) );
  NOR2X1 U1079 ( .A(n1306), .B(cmp1_op[18]), .Y(n1308) );
  INVX2 U1080 ( .A(dora_eq[33]), .Y(n1233) );
  INVX2 U1081 ( .A(w_eq[1]), .Y(n1226) );
  NAND2BX1 U1082 ( .AN(cmp1_op[8]), .B(cmp1_op[21]), .Y(n1316) );
  INVX4 U1083 ( .A(w_eq[0]), .Y(n1265) );
  INVX2 U1084 ( .A(w_eq[2]), .Y(n1186) );
  NAND2X1 U1085 ( .A(n1045), .B(n1044), .Y(n1072) );
  NAND2X1 U1086 ( .A(n1103), .B(n1102), .Y(n1288) );
  AND2X1 U1087 ( .A(n1533), .B(afifo_waddr[0]), .Y(n1580) );
  INVXL U1088 ( .A(cmp1_op[22]), .Y(n1465) );
  NAND2X1 U1089 ( .A(n1766), .B(n1733), .Y(n1782) );
  INVXL U1090 ( .A(af_wdata[0]), .Y(n2007) );
  NOR2XL U1091 ( .A(af_rempty), .B(n2029), .Y(N368) );
  XOR2X1 U1092 ( .A(n1029), .B(n1028), .Y(N243) );
  MX2XL U1093 ( .A(dora_size[27]), .B(dora_size[19]), .S0(n1784), .Y(n868) );
  AND2X1 U1094 ( .A(dora_eq[38]), .B(w_eq[1]), .Y(n988) );
  MX2X1 U1095 ( .A(dora_id[17]), .B(dora_id[12]), .S0(n2023), .Y(n781) );
  MX2X1 U1096 ( .A(dora_id[6]), .B(dora_id[1]), .S0(n995), .Y(n787) );
  MX2X1 U1097 ( .A(dora_size[22]), .B(dora_size[14]), .S0(n1857), .Y(n854) );
  MX2X1 U1098 ( .A(dora_size[31]), .B(dora_size[23]), .S0(n1857), .Y(n848) );
  MX2X1 U1099 ( .A(dora_iq[15]), .B(dora_iq[7]), .S0(n1860), .Y(n890) );
  MX2X1 U1100 ( .A(dora_iq[31]), .B(dora_iq[23]), .S0(n2023), .Y(n888) );
  MX2X1 U1101 ( .A(dora_eq[35]), .B(dora_eq[27]), .S0(n1859), .Y(n947) );
  MX2X1 U1102 ( .A(dora_size[8]), .B(dora_size[0]), .S0(n994), .Y(n885) );
  MX2X1 U1103 ( .A(dora_size[23]), .B(dora_size[15]), .S0(n1860), .Y(n849) );
  MX2X1 U1104 ( .A(dora_size[29]), .B(dora_size[21]), .S0(n1860), .Y(n858) );
  MX2X1 U1105 ( .A(dora_size[9]), .B(dora_size[1]), .S0(n1857), .Y(n880) );
  MX2X1 U1106 ( .A(dora_size[25]), .B(dora_size[17]), .S0(n1859), .Y(n878) );
  MX2X1 U1107 ( .A(dora_size[15]), .B(dora_size[7]), .S0(n1859), .Y(n850) );
  MX2X1 U1108 ( .A(dora_id[11]), .B(dora_id[6]), .S0(n1857), .Y(n786) );
  MX2X1 U1109 ( .A(dora_size[30]), .B(dora_size[22]), .S0(n995), .Y(n853) );
  MX2X1 U1110 ( .A(dora_eq[23]), .B(dora_eq[15]), .S0(n995), .Y(n929) );
  MX2X1 U1111 ( .A(dora_id[10]), .B(dora_id[5]), .S0(n1857), .Y(n791) );
  MX2X1 U1112 ( .A(dora_id[15]), .B(dora_id[10]), .S0(n1858), .Y(n790) );
  MX2X1 U1113 ( .A(dora_id[21]), .B(dora_id[16]), .S0(n995), .Y(n967) );
  MX2X1 U1114 ( .A(dora_iq[24]), .B(dora_iq[16]), .S0(n1858), .Y(n923) );
  MX2X1 U1115 ( .A(dora_iq[16]), .B(dora_iq[8]), .S0(n2023), .Y(n924) );
  MX2X1 U1116 ( .A(dora_eq[24]), .B(dora_eq[16]), .S0(n995), .Y(n963) );
  MX2X1 U1117 ( .A(dora_id[7]), .B(dora_id[2]), .S0(n1860), .Y(n783) );
  MX2X1 U1118 ( .A(dora_eq[18]), .B(dora_eq[10]), .S0(n1858), .Y(n954) );
  MX2X1 U1119 ( .A(dora_eq[10]), .B(dora_eq[2]), .S0(n1857), .Y(n955) );
  MX2X1 U1120 ( .A(dora_eq[25]), .B(dora_eq[17]), .S0(n1857), .Y(n958) );
  MX2X1 U1121 ( .A(dora_eq[17]), .B(dora_eq[9]), .S0(n1859), .Y(n959) );
  MX2X1 U1122 ( .A(dora_iq[8]), .B(dora_iq[0]), .S0(n2023), .Y(n925) );
  MX2X1 U1123 ( .A(dora_eq[8]), .B(dora_eq[0]), .S0(n2023), .Y(n965) );
  MX2X1 U1124 ( .A(dora_iq[30]), .B(dora_iq[22]), .S0(n1858), .Y(n893) );
  MX2X1 U1125 ( .A(dora_iq[14]), .B(dora_iq[6]), .S0(n994), .Y(n895) );
  MX2X1 U1126 ( .A(dora_iq[29]), .B(dora_iq[21]), .S0(n1860), .Y(n898) );
  MX2X1 U1127 ( .A(dora_iq[21]), .B(dora_iq[13]), .S0(n1857), .Y(n899) );
  MX2X1 U1128 ( .A(dora_iq[13]), .B(dora_iq[5]), .S0(n1858), .Y(n900) );
  MX2X1 U1129 ( .A(dora_iq[12]), .B(dora_iq[4]), .S0(n1857), .Y(n905) );
  MX2X1 U1130 ( .A(dora_eq[29]), .B(dora_eq[21]), .S0(n994), .Y(n938) );
  MX2X1 U1131 ( .A(dora_eq[27]), .B(dora_eq[19]), .S0(n1859), .Y(n948) );
  MX2X1 U1132 ( .A(dora_eq[11]), .B(dora_eq[3]), .S0(n1859), .Y(n950) );
  MX2X1 U1133 ( .A(dora_id[18]), .B(dora_id[13]), .S0(n995), .Y(n776) );
  MX2X1 U1134 ( .A(dora_id[8]), .B(dora_id[3]), .S0(n2023), .Y(n778) );
  MX2X1 U1135 ( .A(dora_id[13]), .B(dora_id[8]), .S0(n1859), .Y(n777) );
  INVX4 U1136 ( .A(n990), .Y(n989) );
  OAI21X1 U1137 ( .A0(n1836), .A1(n1343), .B0(n1342), .Y(n1345) );
  INVX1 U1138 ( .A(n1393), .Y(n1032) );
  NAND2X2 U1139 ( .A(n1315), .B(n1314), .Y(n1328) );
  OAI2BB1XL U1140 ( .A0N(n1855), .A1N(w_iq[2]), .B0(n1798), .Y(n619) );
  INVX2 U1141 ( .A(n1648), .Y(n1765) );
  INVX2 U1142 ( .A(n1855), .Y(n2027) );
  AOI2BB1X1 U1143 ( .A0N(n1452), .A1N(afifo_waddr[3]), .B0(n1451), .Y(
        afifo_wptr_full_m0_wbinnext[3]) );
  INVX1 U1144 ( .A(n1766), .Y(n1625) );
  INVX2 U1145 ( .A(n1665), .Y(n1800) );
  INVX2 U1146 ( .A(n1852), .Y(n1831) );
  NAND2X1 U1147 ( .A(n1638), .B(n1778), .Y(n1971) );
  INVX1 U1148 ( .A(n1848), .Y(n1844) );
  NAND2XL U1149 ( .A(n1270), .B(n1269), .Y(n1432) );
  OR2XL U1150 ( .A(n1269), .B(n1270), .Y(n1037) );
  NAND2X1 U1151 ( .A(afifo_waddr[3]), .B(n1553), .Y(n1541) );
  NAND2X1 U1152 ( .A(n1553), .B(n1579), .Y(n1563) );
  INVX2 U1153 ( .A(n1775), .Y(n1015) );
  NAND2X1 U1154 ( .A(n1499), .B(n1504), .Y(n1337) );
  OAI22X1 U1155 ( .A0(n1324), .A1(n1323), .B0(cmp1_op[23]), .B1(n1322), .Y(
        n1325) );
  NAND2X1 U1156 ( .A(n1340), .B(cnt[1]), .Y(n1343) );
  NAND2X1 U1157 ( .A(n1344), .B(current_state[1]), .Y(n1453) );
  NAND3BX1 U1158 ( .AN(cnt[2]), .B(n1706), .C(cnt[0]), .Y(n1785) );
  NAND2XL U1159 ( .A(n1468), .B(cmp1_op[8]), .Y(n1323) );
  NAND2X1 U1160 ( .A(n1538), .B(n1537), .Y(n1607) );
  NOR2BX1 U1161 ( .AN(n1533), .B(afifo_waddr[0]), .Y(n1553) );
  INVX1 U1162 ( .A(n1851), .Y(n1777) );
  INVX2 U1163 ( .A(n1861), .Y(n1850) );
  NAND2X1 U1164 ( .A(afifo_waddr[1]), .B(n1538), .Y(n1611) );
  NAND2X1 U1165 ( .A(afifo_waddr[2]), .B(n1537), .Y(n1609) );
  NAND2XL U1166 ( .A(n1759), .B(cnt[2]), .Y(n1341) );
  NAND2BX1 U1167 ( .AN(current_state[1]), .B(current_state[2]), .Y(n1861) );
  INVX2 U1168 ( .A(af_wdata[1]), .Y(n2011) );
  INVX1 U1169 ( .A(afifo_waddr[1]), .Y(n1537) );
  INVX2 U1170 ( .A(af_wdata[3]), .Y(n2009) );
  INVX2 U1171 ( .A(af_wdata[2]), .Y(n2010) );
  NOR2X1 U1172 ( .A(cnt[0]), .B(cnt[2]), .Y(n1514) );
  INVX2 U1173 ( .A(af_wdata[4]), .Y(n2008) );
  INVX1 U1174 ( .A(cnt[2]), .Y(n1728) );
  INVX2 U1175 ( .A(cnt[0]), .Y(n1722) );
  NAND2X1 U1176 ( .A(cnt[1]), .B(cnt[2]), .Y(n1660) );
  INVX1 U1177 ( .A(afifo_waddr[3]), .Y(n1579) );
  NAND2X1 U1178 ( .A(afifo_waddr[2]), .B(afifo_waddr[1]), .Y(n1583) );
  OR2XL U1179 ( .A(n2025), .B(n2028), .Y(n998) );
  NAND2XL U1180 ( .A(n1012), .B(n1011), .Y(n784) );
  OAI21XL U1181 ( .A0(n996), .A1(n1027), .B0(n1026), .Y(n937) );
  OAI211XL U1182 ( .A0(n1856), .A1(n1855), .B0(n1854), .C0(n1853), .Y(
        next_state[2]) );
  INVX8 U1183 ( .A(n1784), .Y(n990) );
  NAND2XL U1184 ( .A(n1388), .B(n1007), .Y(n1389) );
  AOI2BB1X2 U1185 ( .A0N(n1401), .A1N(n1392), .B0(n1032), .Y(n1031) );
  NAND2X1 U1186 ( .A(n1141), .B(n1140), .Y(n1284) );
  NAND2X2 U1187 ( .A(n1328), .B(n1327), .Y(n1329) );
  NAND2XL U1188 ( .A(n1293), .B(n1292), .Y(n1393) );
  ADDFHX2 U1189 ( .A(n1164), .B(n1163), .CI(n1162), .CO(n1293), .S(n1290) );
  XNOR2XL U1190 ( .A(n1426), .B(n1425), .Y(N237) );
  ADDFHX2 U1191 ( .A(n1287), .B(n1285), .CI(n1286), .CO(n1291), .S(n1104) );
  ADDFX1 U1192 ( .A(n1296), .B(n1295), .CI(n1294), .CO(n1407), .S(n1292) );
  INVX1 U1193 ( .A(n1272), .Y(n1425) );
  OAI2BB1XL U1194 ( .A0N(dora_score2[7]), .A1N(n1786), .B0(n1823), .Y(n630) );
  OAI2BB1XL U1195 ( .A0N(dora_score2[11]), .A1N(n1786), .B0(n1827), .Y(n634)
         );
  NOR2X1 U1196 ( .A(n1651), .B(n1650), .Y(n1703) );
  NAND2XL U1197 ( .A(n1826), .B(m1_out[11]), .Y(n1827) );
  NOR2X1 U1198 ( .A(n1014), .B(n998), .Y(n1013) );
  NAND2XL U1199 ( .A(n1826), .B(m1_out[7]), .Y(n1823) );
  INVX2 U1200 ( .A(n1451), .Y(n1973) );
  ADDFHX2 U1201 ( .A(n1243), .B(n1242), .CI(n1241), .CO(n1414), .S(n1278) );
  NOR2X1 U1202 ( .A(n1494), .B(cmp2_op[25]), .Y(n1497) );
  NAND2XL U1203 ( .A(n1642), .B(stopmachine[7]), .Y(n1651) );
  NOR2X1 U1204 ( .A(n1792), .B(n1791), .Y(n1801) );
  NOR2X1 U1205 ( .A(n1698), .B(n1775), .Y(n1659) );
  NOR2X1 U1206 ( .A(n1563), .B(n1609), .Y(n1996) );
  NOR2X1 U1207 ( .A(n1612), .B(n1611), .Y(n2003) );
  NOR2X1 U1208 ( .A(n1583), .B(n1563), .Y(n1998) );
  NAND2X1 U1209 ( .A(in_valid), .B(n1778), .Y(n1855) );
  NOR2X1 U1210 ( .A(n1612), .B(n1609), .Y(n2005) );
  NOR2X1 U1211 ( .A(n1862), .B(n1861), .Y(N349) );
  NOR2X1 U1212 ( .A(n1015), .B(n1298), .Y(n1014) );
  NOR2X1 U1213 ( .A(n1663), .B(n1753), .Y(n1723) );
  NOR2X1 U1214 ( .A(n1635), .B(n1634), .Y(n1642) );
  NOR2X1 U1215 ( .A(n1609), .B(n1541), .Y(n2004) );
  NOR2X1 U1216 ( .A(n1583), .B(n1593), .Y(n1999) );
  NOR2X1 U1217 ( .A(n1759), .B(n1753), .Y(n1758) );
  NOR2X1 U1218 ( .A(n1593), .B(n1609), .Y(n1997) );
  NOR2X1 U1219 ( .A(n1607), .B(n1593), .Y(n1993) );
  NOR2X1 U1220 ( .A(n1583), .B(n1541), .Y(n2006) );
  NOR2X1 U1221 ( .A(n1607), .B(n1563), .Y(n1992) );
  NOR2X1 U1222 ( .A(n1607), .B(n1541), .Y(n2000) );
  INVXL U1223 ( .A(n1068), .Y(n1052) );
  NAND2X1 U1224 ( .A(n1580), .B(n1579), .Y(n1593) );
  NAND4X1 U1225 ( .A(n1790), .B(n1706), .C(n1720), .D(cnt[2]), .Y(n1732) );
  OAI21X2 U1226 ( .A0(cmp1_op[1]), .A1(n1455), .B0(n1299), .Y(n1302) );
  NOR2X1 U1227 ( .A(n1151), .B(n1152), .Y(n1169) );
  NOR2X1 U1228 ( .A(n1776), .B(n1775), .Y(n1968) );
  INVX1 U1229 ( .A(n1776), .Y(n1698) );
  NAND2BX1 U1230 ( .AN(n1654), .B(n1776), .Y(n1702) );
  NOR2X1 U1231 ( .A(n1785), .B(cnt[1]), .Y(n1852) );
  NOR2X1 U1232 ( .A(n1267), .B(n1266), .Y(n1427) );
  AOI22X1 U1233 ( .A0(n1341), .A1(n1340), .B0(n1514), .B1(n1339), .Y(n1342) );
  AOI211XL U1234 ( .A0(n1489), .A1(n1488), .B0(n1487), .C0(n1486), .Y(n1490)
         );
  ADDFHX2 U1235 ( .A(n1206), .B(n1205), .CI(n1204), .CO(n1217), .S(n1246) );
  ADDFHX2 U1236 ( .A(n1261), .B(n1260), .CI(n1259), .CO(n1251), .S(n1270) );
  NAND2XL U1237 ( .A(n1330), .B(cmp1_op[24]), .Y(n1499) );
  NOR2X1 U1238 ( .A(n1338), .B(cnt[1]), .Y(n1339) );
  INVX1 U1239 ( .A(n1514), .Y(n1733) );
  INVXL U1240 ( .A(n1658), .Y(n1639) );
  NAND2XL U1241 ( .A(n1332), .B(cmp1_op[11]), .Y(n1502) );
  NAND2XL U1242 ( .A(n1331), .B(cmp1_op[25]), .Y(n1504) );
  NAND2BXL U1243 ( .AN(n1471), .B(n1322), .Y(n1010) );
  NOR2X1 U1244 ( .A(n1154), .B(n1188), .Y(n1165) );
  INVX1 U1245 ( .A(n1523), .Y(n1969) );
  NOR2X1 U1246 ( .A(n1660), .B(n1722), .Y(n1661) );
  NOR2X1 U1247 ( .A(n1658), .B(current_state[2]), .Y(n1790) );
  NOR2X1 U1248 ( .A(n1660), .B(cnt[3]), .Y(n1654) );
  NAND3BXL U1249 ( .AN(current_state[0]), .B(current_state[1]), .C(
        current_state[2]), .Y(n1523) );
  INVX1 U1250 ( .A(afifo_waddr[2]), .Y(n1538) );
  NAND2XL U1251 ( .A(stopmachine[1]), .B(stopmachine[0]), .Y(n1574) );
  INVX1 U1252 ( .A(cnt[3]), .Y(n1706) );
  NOR2BX1 U1253 ( .AN(af_winc), .B(afifo_n1), .Y(n1533) );
  INVX1 U1254 ( .A(current_state[2]), .Y(n1774) );
  NOR2X1 U1255 ( .A(current_state[0]), .B(current_state[2]), .Y(n1298) );
  NAND2X2 U1256 ( .A(n1008), .B(n1352), .Y(n1354) );
  NOR2X1 U1257 ( .A(n1151), .B(n1263), .Y(n1254) );
  MX2X1 U1258 ( .A(dora_iq[32]), .B(dora_iq[24]), .S0(n994), .Y(n922) );
  NAND2X1 U1259 ( .A(dora_iq[36]), .B(w_iq[2]), .Y(n1069) );
  AND2X1 U1260 ( .A(w_size[2]), .B(dora_size[33]), .Y(n1205) );
  NOR2X2 U1261 ( .A(n1189), .B(n1119), .Y(n1114) );
  NAND2X1 U1262 ( .A(n1398), .B(n1035), .Y(n1033) );
  NAND2X2 U1263 ( .A(n1219), .B(n1218), .Y(n1281) );
  NOR2X1 U1264 ( .A(DP_OP_81J1_122_2750_n288), .B(n1119), .Y(n1182) );
  INVX2 U1265 ( .A(dora_iq[36]), .Y(n1119) );
  XOR2X1 U1266 ( .A(n1036), .B(n997), .Y(N245) );
  NAND2X1 U1267 ( .A(n1130), .B(n1129), .Y(n1087) );
  OAI21X1 U1268 ( .A0(n1130), .A1(n1129), .B0(n1128), .Y(n1088) );
  XOR2X2 U1269 ( .A(n1129), .B(n1128), .Y(n1131) );
  INVX4 U1270 ( .A(n1795), .Y(n991) );
  INVX2 U1271 ( .A(n991), .Y(n992) );
  INVX4 U1272 ( .A(n991), .Y(n993) );
  NOR2X4 U1273 ( .A(n1265), .B(n1122), .Y(n1203) );
  INVX2 U1274 ( .A(dora_eq[35]), .Y(n1122) );
  NOR2X2 U1275 ( .A(n1226), .B(n1264), .Y(n1258) );
  INVX2 U1276 ( .A(n990), .Y(n994) );
  INVX2 U1277 ( .A(n990), .Y(n995) );
  INVXL U1278 ( .A(n1860), .Y(n996) );
  INVX2 U1279 ( .A(n990), .Y(n2023) );
  INVX2 U1280 ( .A(n990), .Y(n1858) );
  INVX2 U1281 ( .A(n990), .Y(n1857) );
  ADDFHX1 U1282 ( .A(n1258), .B(n1257), .CI(n1256), .CO(n1252), .S(n1269) );
  OAI21XL U1283 ( .A0(n1216), .A1(n1217), .B0(n1215), .Y(n1191) );
  AND2X2 U1284 ( .A(w_eq[1]), .B(dora_eq[35]), .Y(n1120) );
  NAND2XL U1285 ( .A(n1173), .B(n1174), .Y(n1140) );
  NOR2X1 U1286 ( .A(DP_OP_81J1_122_2750_n288), .B(n1183), .Y(n1204) );
  NOR2X1 U1287 ( .A(n1744), .B(cmp2_op[18]), .Y(n1480) );
  ADDFHX1 U1288 ( .A(n1169), .B(n1168), .CI(n1167), .CO(n1295), .S(n1171) );
  NOR2X2 U1289 ( .A(n1415), .B(n1414), .Y(n1280) );
  OAI211X1 U1290 ( .A0(n1511), .A1(n1665), .B0(n1510), .C0(n1792), .Y(n1789)
         );
  NAND2XL U1291 ( .A(cmp2_out), .B(cmp1_out), .Y(n1511) );
  NAND2XL U1292 ( .A(n1508), .B(n1764), .Y(n1510) );
  NAND2XL U1293 ( .A(n1507), .B(n1506), .Y(n1508) );
  NAND2XL U1294 ( .A(n1502), .B(cmp1_op[25]), .Y(n1335) );
  AOI21X1 U1295 ( .A0(n1037), .A1(n1433), .B0(n1271), .Y(n1272) );
  INVXL U1296 ( .A(n1432), .Y(n1271) );
  NAND2XL U1297 ( .A(n1267), .B(n1266), .Y(n1428) );
  AND2X1 U1298 ( .A(n1789), .B(n1790), .Y(n1849) );
  NAND2X1 U1299 ( .A(n1654), .B(n1722), .Y(n1835) );
  NAND2X1 U1300 ( .A(w_iq[1]), .B(dora_iq[38]), .Y(n1040) );
  INVX2 U1301 ( .A(dora_size[37]), .Y(n1053) );
  INVX2 U1302 ( .A(dora_size[38]), .Y(n1051) );
  NAND2X1 U1303 ( .A(w_size[0]), .B(dora_size[34]), .Y(n1185) );
  NAND2X1 U1304 ( .A(n1306), .B(cmp1_op[18]), .Y(n1307) );
  NAND2X1 U1305 ( .A(n1310), .B(cmp1_op[6]), .Y(n1311) );
  INVX2 U1306 ( .A(n1316), .Y(n1319) );
  INVX2 U1307 ( .A(dora_eq[39]), .Y(n1153) );
  NAND2XL U1308 ( .A(n1042), .B(n1041), .Y(n1158) );
  NAND2XL U1309 ( .A(n1050), .B(n1038), .Y(n1041) );
  OAI21XL U1310 ( .A0(n1050), .A1(n1038), .B0(n1049), .Y(n1042) );
  XOR3X2 U1311 ( .A(n1115), .B(n1114), .C(n1113), .Y(n1177) );
  XOR3X2 U1312 ( .A(n1006), .B(n1111), .C(n1112), .Y(n1178) );
  OAI21X1 U1313 ( .A0(n1134), .A1(n1092), .B0(n1091), .Y(n1116) );
  NAND2X2 U1314 ( .A(n1088), .B(n1087), .Y(n1117) );
  OAI21X1 U1315 ( .A0(n1133), .A1(n1090), .B0(n1132), .Y(n1091) );
  INVXL U1316 ( .A(dora_iq[33]), .Y(n1234) );
  NAND2X1 U1317 ( .A(n1124), .B(n1123), .Y(n1180) );
  NAND2XL U1318 ( .A(n1201), .B(n1203), .Y(n1123) );
  NAND2XL U1319 ( .A(n1509), .B(cnt[3]), .Y(n1792) );
  INVXL U1320 ( .A(n1663), .Y(n1509) );
  AOI211XL U1321 ( .A0(n1478), .A1(n1477), .B0(n1480), .C0(n1476), .Y(n1482)
         );
  OAI2BB2XL U1322 ( .B0(cmp2_op[15]), .B1(n1734), .A0N(n1475), .A1N(n1474), 
        .Y(n1478) );
  NAND2XL U1323 ( .A(n1743), .B(cmp2_op[22]), .Y(n1488) );
  NOR2X1 U1324 ( .A(DP_OP_81J1_122_2750_n288), .B(n1262), .Y(n1267) );
  NAND2XL U1325 ( .A(n1212), .B(n1246), .Y(n1213) );
  XOR3X2 U1326 ( .A(n1217), .B(n1216), .C(n1215), .Y(n1222) );
  NAND2XL U1327 ( .A(n1514), .B(n1513), .Y(n1776) );
  NAND2XL U1328 ( .A(n1514), .B(n2024), .Y(n1663) );
  NAND2XL U1329 ( .A(n1654), .B(cnt[0]), .Y(n1665) );
  INVXL U1330 ( .A(cmp1_op[21]), .Y(n1468) );
  INVX2 U1331 ( .A(cmp1_op[20]), .Y(n1463) );
  NAND2XL U1332 ( .A(current_state[0]), .B(current_state[1]), .Y(n1658) );
  INVXL U1333 ( .A(n1753), .Y(n1662) );
  NAND2XL U1334 ( .A(n1789), .B(n1774), .Y(n1773) );
  INVXL U1335 ( .A(cmp2_op[4]), .Y(n1741) );
  INVXL U1336 ( .A(cmp2_op[5]), .Y(n1744) );
  NAND2XL U1337 ( .A(n1764), .B(dora_score2[5]), .Y(n1688) );
  NAND2XL U1338 ( .A(n1764), .B(dora_score2[9]), .Y(n1673) );
  NAND2XL U1339 ( .A(n1764), .B(dora_score2[11]), .Y(n1829) );
  NAND2XL U1340 ( .A(n1764), .B(dora_score2[10]), .Y(n1679) );
  NAND2XL U1341 ( .A(n1764), .B(dora_score2[8]), .Y(n1682) );
  NAND2XL U1342 ( .A(n1764), .B(dora_score2[12]), .Y(n1676) );
  NAND2XL U1343 ( .A(n1764), .B(dora_score2[6]), .Y(n1655) );
  NAND2XL U1344 ( .A(n1764), .B(dora_score2[7]), .Y(n1685) );
  NAND2XL U1345 ( .A(n1585), .B(n1576), .Y(n1635) );
  NOR2X1 U1346 ( .A(n1628), .B(n1630), .Y(n1576) );
  NAND4XL U1347 ( .A(n1772), .B(stopmachine[3]), .C(stopmachine[1]), .D(n1771), 
        .Y(n1970) );
  NOR4XL U1348 ( .A(n1769), .B(n1768), .C(stopmachine[11]), .D(stopmachine[7]), 
        .Y(n1772) );
  INVXL U1349 ( .A(in_valid), .Y(n1638) );
  ADDHXL U1350 ( .A(stopmachine[9]), .B(n1703), .CO(n1840), .S(n1652) );
  ADDHXL U1351 ( .A(stopmachine[10]), .B(n1840), .CO(n1845), .S(n1704) );
  ADDHXL U1352 ( .A(stopmachine[11]), .B(n1845), .CO(n1841), .S(n1846) );
  AOI21X1 U1353 ( .A0(n1424), .A1(n1425), .B0(n1275), .Y(n1276) );
  INVXL U1354 ( .A(n1423), .Y(n1275) );
  INVXL U1355 ( .A(n1786), .Y(n1826) );
  NAND3BXL U1356 ( .AN(n1785), .B(cnt[1]), .C(n1790), .Y(n1786) );
  INVXL U1357 ( .A(n1994), .Y(n1569) );
  INVXL U1358 ( .A(n2003), .Y(n1619) );
  INVXL U1359 ( .A(n2002), .Y(n1547) );
  INVXL U1360 ( .A(n2000), .Y(n1549) );
  INVXL U1361 ( .A(n1999), .Y(n1590) );
  INVXL U1362 ( .A(n1997), .Y(n1599) );
  INVXL U1363 ( .A(n1996), .Y(n1567) );
  INVXL U1364 ( .A(n2001), .Y(n1617) );
  INVXL U1365 ( .A(n2006), .Y(n1551) );
  INVXL U1366 ( .A(n2004), .Y(n1545) );
  INVXL U1367 ( .A(n1993), .Y(n1588) );
  INVXL U1368 ( .A(n1992), .Y(n1560) );
  INVXL U1369 ( .A(n1998), .Y(n1558) );
  OAI22XL U1370 ( .A0(n1438), .A1(n1538), .B0(afifo_wptr_full_m0_wbinnext[2]), 
        .B1(afifo_wptr_full_m0_wbinnext[1]), .Y(n1975) );
  INVXL U1371 ( .A(n1574), .Y(n1528) );
  INVXL U1372 ( .A(n1585), .Y(n1629) );
  NAND2XL U1373 ( .A(n1775), .B(n1523), .Y(n1848) );
  NAND2XL U1374 ( .A(current_state[0]), .B(current_state[2]), .Y(n1851) );
  OAI21XL U1375 ( .A0(n1752), .A1(n1661), .B0(n1971), .Y(n1719) );
  NAND2XL U1376 ( .A(n1777), .B(current_state[1]), .Y(n1753) );
  INVXL U1377 ( .A(n1971), .Y(n1727) );
  AOI22X1 U1378 ( .A0(n1345), .A1(current_state[0]), .B0(current_state[2]), 
        .B1(n1453), .Y(n1346) );
  INVXL U1379 ( .A(n1660), .Y(n1435) );
  INVX2 U1380 ( .A(n1835), .Y(n1764) );
  NAND2XL U1381 ( .A(n1764), .B(dora_score2[4]), .Y(n1816) );
  NAND2XL U1382 ( .A(n1764), .B(dora_score2[3]), .Y(n1691) );
  NAND2XL U1383 ( .A(n1764), .B(dora_score2[2]), .Y(n1699) );
  NAND2X1 U1384 ( .A(n1831), .B(n1835), .Y(n1807) );
  NAND2XL U1385 ( .A(n1764), .B(dora_score2[1]), .Y(n1668) );
  INVXL U1386 ( .A(n1807), .Y(n1828) );
  NAND2XL U1387 ( .A(n1764), .B(dora_score2[0]), .Y(n1808) );
  OAI22XL U1388 ( .A0(n1849), .A1(n2028), .B0(cmp2_out), .B1(n1793), .Y(n794)
         );
  INVXL U1389 ( .A(n1801), .Y(n1793) );
  NAND2XL U1390 ( .A(n1802), .B(n1838), .Y(n981) );
  MXI2XL U1391 ( .A(af_wdata[6]), .B(n1800), .S0(n1849), .Y(n1802) );
  XOR2X1 U1392 ( .A(n1397), .B(n1016), .Y(N242) );
  INVXL U1393 ( .A(n1407), .Y(n1408) );
  NAND2XL U1394 ( .A(n1391), .B(n1401), .Y(n1402) );
  AND2XL U1395 ( .A(n1394), .B(n1393), .Y(n997) );
  INVXL U1396 ( .A(n1392), .Y(n1394) );
  NAND2XL U1397 ( .A(n1839), .B(n1838), .Y(n986) );
  NOR2XL U1398 ( .A(n1836), .B(n1835), .Y(n1837) );
  NAND2XL U1399 ( .A(n1037), .B(n1432), .Y(n1434) );
  OAI21XL U1400 ( .A0(n1732), .A1(n1805), .B0(n1710), .Y(n602) );
  NAND2XL U1401 ( .A(n1732), .B(dora_score3[1]), .Y(n1710) );
  OAI21XL U1402 ( .A0(n1732), .A1(n1818), .B0(n1714), .Y(n605) );
  NAND2XL U1403 ( .A(n1732), .B(dora_score3[4]), .Y(n1714) );
  OAI21XL U1404 ( .A0(n1732), .A1(n1810), .B0(n1717), .Y(n614) );
  NAND2XL U1405 ( .A(n1732), .B(dora_score3[0]), .Y(n1717) );
  INVXL U1406 ( .A(dora_iq[38]), .Y(n1058) );
  NOR2X1 U1407 ( .A(n1186), .B(n1085), .Y(n1083) );
  INVXL U1408 ( .A(dora_eq[36]), .Y(n1085) );
  NAND2X1 U1409 ( .A(dora_iq[35]), .B(w_iq[2]), .Y(n1076) );
  OAI21X1 U1410 ( .A0(n1019), .A1(n1084), .B0(n1083), .Y(n1045) );
  INVXL U1411 ( .A(dora_eq[37]), .Y(n1039) );
  NAND2XL U1412 ( .A(n1114), .B(n1115), .Y(n1081) );
  INVXL U1413 ( .A(n1083), .Y(n1020) );
  NAND2XL U1414 ( .A(n1077), .B(n1076), .Y(n1079) );
  INVXL U1415 ( .A(n1111), .Y(n1077) );
  NAND2XL U1416 ( .A(n1111), .B(n1112), .Y(n1078) );
  AND2X2 U1417 ( .A(w_size[0]), .B(dora_size[39]), .Y(n1038) );
  INVX2 U1418 ( .A(dora_eq[38]), .Y(n1043) );
  NOR2X2 U1419 ( .A(n1186), .B(n1122), .Y(n1109) );
  AND2X2 U1420 ( .A(dora_size[37]), .B(w_size[0]), .Y(n1111) );
  INVXL U1421 ( .A(n1076), .Y(n1112) );
  NOR2X1 U1422 ( .A(n1151), .B(n1125), .Y(n1115) );
  NOR2X2 U1423 ( .A(n1229), .B(n1089), .Y(n1006) );
  INVXL U1424 ( .A(n1134), .Y(n1090) );
  INVX1 U1425 ( .A(n1133), .Y(n1092) );
  NOR2X2 U1426 ( .A(n1186), .B(n1233), .Y(n1202) );
  INVX2 U1427 ( .A(n1086), .Y(n1129) );
  NAND2X1 U1428 ( .A(dora_size[35]), .B(w_size[1]), .Y(n1086) );
  INVXL U1429 ( .A(dora_iq[34]), .Y(n1187) );
  INVX2 U1430 ( .A(w_iq[1]), .Y(n1189) );
  NAND2XL U1431 ( .A(n1068), .B(n1054), .Y(n1055) );
  NAND2XL U1432 ( .A(n1052), .B(n1069), .Y(n1056) );
  NOR2X1 U1433 ( .A(DP_OP_81J1_122_2750_n288), .B(n1154), .Y(n1046) );
  INVX2 U1434 ( .A(n1040), .Y(n1048) );
  XOR3X2 U1435 ( .A(n1107), .B(n1106), .C(n1105), .Y(n1018) );
  NAND2X1 U1436 ( .A(n1463), .B(cmp1_op[7]), .Y(n1318) );
  INVXL U1437 ( .A(dora_size[39]), .Y(n1152) );
  OAI21X2 U1438 ( .A0(n1193), .A1(n1194), .B0(n1192), .Y(n1136) );
  INVX4 U1439 ( .A(w_size[0]), .Y(n1228) );
  INVXL U1440 ( .A(dora_iq[32]), .Y(n1262) );
  INVX2 U1441 ( .A(n1212), .Y(n1245) );
  NAND2XL U1442 ( .A(n1209), .B(n1208), .Y(n1126) );
  NAND2X1 U1443 ( .A(dora_size[34]), .B(w_size[2]), .Y(n1134) );
  INVXL U1444 ( .A(dora_size[32]), .Y(n1263) );
  NOR2X2 U1445 ( .A(n1186), .B(n1264), .Y(n1239) );
  NOR2X2 U1446 ( .A(n1018), .B(n1284), .Y(n1395) );
  NAND2X2 U1447 ( .A(n1018), .B(n1284), .Y(n1396) );
  INVXL U1448 ( .A(n1836), .Y(n1506) );
  NOR3X2 U1449 ( .A(n1313), .B(n1319), .C(n1324), .Y(n1314) );
  OAI22X1 U1450 ( .A0(cmp1_op[7]), .A1(n1463), .B0(n1310), .B1(cmp1_op[6]), 
        .Y(n1313) );
  AOI2BB1XL U1451 ( .A0N(n1502), .A1N(cmp1_op[25]), .B0(n1333), .Y(n1334) );
  NAND3XL U1452 ( .A(cmp_rst1[0]), .B(cmp_rst1[1]), .C(cmp_rst1[2]), .Y(n1333)
         );
  NAND2XL U1453 ( .A(n1349), .B(n1706), .Y(n1351) );
  NAND3XL U1454 ( .A(n2024), .B(cnt[2]), .C(cnt[0]), .Y(n1349) );
  OAI21XL U1455 ( .A0(n2024), .A1(n1706), .B0(n1639), .Y(n1350) );
  NAND2X1 U1456 ( .A(n1836), .B(n1348), .Y(n1008) );
  NOR3XL U1457 ( .A(n2024), .B(n1728), .C(cnt[0]), .Y(n1348) );
  NOR2X1 U1458 ( .A(n1186), .B(n1153), .Y(n1166) );
  ADDFHX1 U1459 ( .A(n1172), .B(n1171), .CI(n1170), .CO(n1294), .S(n1162) );
  NAND2XL U1460 ( .A(n1161), .B(n1160), .Y(n1170) );
  NAND2XL U1461 ( .A(n1220), .B(n1221), .Y(n1218) );
  OAI21X1 U1462 ( .A0(n1220), .A1(n1221), .B0(n1222), .Y(n1219) );
  NAND2XL U1463 ( .A(n1216), .B(n1217), .Y(n1190) );
  NOR2X1 U1464 ( .A(DP_OP_81J1_122_2750_n288), .B(n1234), .Y(n1259) );
  ADDFHX1 U1465 ( .A(n1254), .B(n1253), .CI(n1252), .CO(n1243), .S(n1273) );
  NOR2X1 U1466 ( .A(afifo_raddr[3]), .B(n1867), .Y(n1954) );
  NOR2X1 U1467 ( .A(n1868), .B(n1866), .Y(n1952) );
  NOR2X1 U1468 ( .A(n1868), .B(n1867), .Y(n1951) );
  NOR2X1 U1469 ( .A(afifo_raddr[3]), .B(n1866), .Y(n1955) );
  INVX2 U1470 ( .A(n990), .Y(n1860) );
  INVXL U1471 ( .A(n1395), .Y(n1404) );
  BUFX2 U1472 ( .A(n1396), .Y(n1002) );
  NOR3XL U1473 ( .A(n1512), .B(current_state[0]), .C(af_wdata[6]), .Y(n1862)
         );
  INVXL U1474 ( .A(cmp2_op[3]), .Y(n1745) );
  NAND2XL U1475 ( .A(n1580), .B(afifo_waddr[1]), .Y(n1450) );
  NAND2XL U1476 ( .A(cmp2_out), .B(n1801), .Y(n1838) );
  OAI22XL U1477 ( .A0(n1482), .A1(n1481), .B0(cmp2_op[19]), .B1(n1746), .Y(
        n1484) );
  NOR2X1 U1478 ( .A(n1748), .B(cmp2_op[21]), .Y(n1489) );
  OAI22XL U1479 ( .A0(cmp2_op[25]), .A1(n1742), .B0(n1485), .B1(cmp2_op[24]), 
        .Y(n1486) );
  OAI21XL U1480 ( .A0(cmp2_op[11]), .A1(n1473), .B0(n1472), .Y(n1494) );
  OAI2BB1XL U1481 ( .A0N(cmp2_op[11]), .A1N(n1473), .B0(cmp2_op[24]), .Y(n1472) );
  NAND2XL U1482 ( .A(n1783), .B(cmp2_op[23]), .Y(n1473) );
  NAND2X1 U1483 ( .A(n1274), .B(n1273), .Y(n1423) );
  INVXL U1484 ( .A(n1255), .Y(n1424) );
  NOR2X1 U1485 ( .A(n1274), .B(n1273), .Y(n1255) );
  BUFX1 U1486 ( .A(n1385), .Y(n1386) );
  NAND2X2 U1487 ( .A(n1003), .B(n1283), .Y(n1007) );
  INVXL U1488 ( .A(n1383), .Y(n1412) );
  OAI21XL U1489 ( .A0(n1427), .A1(n1268), .B0(n1428), .Y(n1433) );
  XOR2X2 U1490 ( .A(n1223), .B(n1222), .Y(n1415) );
  INVX2 U1491 ( .A(n1420), .Y(n1279) );
  NAND2X1 U1492 ( .A(n1414), .B(n1415), .Y(n1416) );
  NOR2X1 U1493 ( .A(n1443), .B(n1869), .Y(n1441) );
  OAI21XL U1494 ( .A0(n1580), .A1(afifo_waddr[1]), .B0(n1450), .Y(n1438) );
  NOR2X1 U1495 ( .A(n1868), .B(n1863), .Y(n1956) );
  AOI2BB1XL U1496 ( .A0N(af_wdata[5]), .A1N(af_wdata[6]), .B0(af_wdata[7]), 
        .Y(n1721) );
  NOR4XL U1497 ( .A(n1752), .B(cnt[2]), .C(n2024), .D(n1722), .Y(n1724) );
  INVX2 U1498 ( .A(n990), .Y(n1859) );
  INVXL U1499 ( .A(cmp2_op[2]), .Y(n1734) );
  INVXL U1500 ( .A(cmp2_op[1]), .Y(n1735) );
  INVXL U1501 ( .A(cmp2_op[0]), .Y(n1736) );
  AOI2BB1XL U1502 ( .A0N(n1533), .A1N(afifo_waddr[0]), .B0(n1580), .Y(
        afifo_wptr_full_m0_wbinnext[0]) );
  INVXL U1503 ( .A(n1438), .Y(afifo_wptr_full_m0_wbinnext[1]) );
  OAI2BB1XL U1504 ( .A0N(stopmachine[1]), .A1N(n1844), .B0(n1525), .Y(n980) );
  OAI2BB1XL U1505 ( .A0N(stopmachine[12]), .A1N(n1844), .B0(n1843), .Y(n968)
         );
  NAND2XL U1506 ( .A(n1842), .B(n1969), .Y(n1843) );
  OAI2BB1XL U1507 ( .A0N(af_wdata[0]), .A1N(n1861), .B0(n1518), .Y(n765) );
  NAND2XL U1508 ( .A(n2027), .B(iq_weight[0]), .Y(n2026) );
  MXI2XL U1509 ( .A(n2024), .B(n1761), .S0(n1971), .Y(n984) );
  AOI211XL U1510 ( .A0(n1760), .A1(n1759), .B0(n1758), .C0(n1757), .Y(n1761)
         );
  MX2XL U1511 ( .A(dora_eq[26]), .B(dora_eq[18]), .S0(n1784), .Y(n953) );
  MX2XL U1512 ( .A(dora_eq[9]), .B(dora_eq[1]), .S0(n989), .Y(n960) );
  MX2XL U1513 ( .A(dora_eq[16]), .B(dora_eq[8]), .S0(n989), .Y(n964) );
  MX2XL U1514 ( .A(dora_eq[28]), .B(dora_eq[20]), .S0(n989), .Y(n943) );
  MX2XL U1515 ( .A(dora_iq[22]), .B(dora_iq[14]), .S0(n1784), .Y(n894) );
  MX2XL U1516 ( .A(dora_iq[20]), .B(dora_iq[12]), .S0(n989), .Y(n904) );
  MX2XL U1517 ( .A(dora_eq[21]), .B(dora_eq[13]), .S0(n989), .Y(n939) );
  MX2XL U1518 ( .A(dora_eq[13]), .B(dora_eq[5]), .S0(n1784), .Y(n940) );
  MX2XL U1519 ( .A(dora_eq[20]), .B(dora_eq[12]), .S0(n989), .Y(n944) );
  MX2XL U1520 ( .A(dora_eq[12]), .B(dora_eq[4]), .S0(n989), .Y(n945) );
  MX2XL U1521 ( .A(dora_eq[19]), .B(dora_eq[11]), .S0(n989), .Y(n949) );
  MX2XL U1522 ( .A(dora_iq[28]), .B(dora_iq[20]), .S0(n989), .Y(n903) );
  MX2XL U1523 ( .A(dora_id[20]), .B(dora_id[15]), .S0(n1784), .Y(n789) );
  MX2XL U1524 ( .A(dora_id[19]), .B(dora_id[14]), .S0(n1784), .Y(n771) );
  MX2XL U1525 ( .A(dora_id[14]), .B(dora_id[9]), .S0(n989), .Y(n772) );
  MX2XL U1526 ( .A(dora_id[9]), .B(dora_id[4]), .S0(n1784), .Y(n773) );
  MX2XL U1527 ( .A(dora_id[5]), .B(dora_id[0]), .S0(n989), .Y(n792) );
  MX2XL U1528 ( .A(dora_size[17]), .B(dora_size[9]), .S0(n1784), .Y(n879) );
  MX2XL U1529 ( .A(dora_size[24]), .B(dora_size[16]), .S0(n989), .Y(n883) );
  MX2XL U1530 ( .A(dora_size[16]), .B(dora_size[8]), .S0(n1784), .Y(n884) );
  MX2XL U1531 ( .A(dora_iq[23]), .B(dora_iq[15]), .S0(n989), .Y(n889) );
  INVXL U1532 ( .A(n1379), .Y(n774) );
  AOI222XL U1533 ( .A0(n1796), .A1(dora_id[24]), .B0(dora_id[4]), .B1(n993), 
        .C0(n1794), .C1(doraemon_id[4]), .Y(n1379) );
  INVXL U1534 ( .A(n1380), .Y(n779) );
  AOI222XL U1535 ( .A0(n1796), .A1(dora_id[23]), .B0(dora_id[3]), .B1(n993), 
        .C0(n1381), .C1(doraemon_id[3]), .Y(n1380) );
  AOI22XL U1536 ( .A0(n1796), .A1(dora_id[22]), .B0(n1381), .B1(doraemon_id[2]), .Y(n1011) );
  NAND2XL U1537 ( .A(n993), .B(dora_id[2]), .Y(n1012) );
  INVXL U1538 ( .A(n1382), .Y(n788) );
  AOI222XL U1539 ( .A0(n1796), .A1(dora_id[21]), .B0(dora_id[1]), .B1(n993), 
        .C0(n1794), .C1(doraemon_id[1]), .Y(n1382) );
  INVXL U1540 ( .A(n1356), .Y(n851) );
  AOI222XL U1541 ( .A0(n1794), .A1(size[7]), .B0(dora_size[7]), .B1(n993), 
        .C0(n1796), .C1(dora_size[39]), .Y(n1356) );
  INVXL U1542 ( .A(n1357), .Y(n856) );
  AOI222XL U1543 ( .A0(n1796), .A1(dora_size[38]), .B0(dora_size[6]), .B1(n993), .C0(n1794), .C1(size[6]), .Y(n1357) );
  INVXL U1544 ( .A(n1358), .Y(n861) );
  AOI222XL U1545 ( .A0(n1796), .A1(dora_size[37]), .B0(dora_size[5]), .B1(n993), .C0(n1381), .C1(size[5]), .Y(n1358) );
  INVXL U1546 ( .A(n1359), .Y(n866) );
  INVXL U1547 ( .A(n1360), .Y(n871) );
  AOI222XL U1548 ( .A0(n1796), .A1(dora_size[35]), .B0(dora_size[3]), .B1(n993), .C0(n1794), .C1(size[3]), .Y(n1360) );
  INVXL U1549 ( .A(n1361), .Y(n876) );
  AOI222XL U1550 ( .A0(n1796), .A1(dora_size[34]), .B0(dora_size[2]), .B1(n993), .C0(n1381), .C1(size[2]), .Y(n1361) );
  INVXL U1551 ( .A(n1362), .Y(n881) );
  AOI222XL U1552 ( .A0(n1796), .A1(dora_size[33]), .B0(dora_size[1]), .B1(n993), .C0(n1381), .C1(size[1]), .Y(n1362) );
  INVXL U1553 ( .A(n1363), .Y(n886) );
  AOI222XL U1554 ( .A0(n1796), .A1(dora_size[32]), .B0(dora_size[0]), .B1(n993), .C0(n1794), .C1(size[0]), .Y(n1363) );
  INVXL U1555 ( .A(n1364), .Y(n891) );
  AOI222XL U1556 ( .A0(n1796), .A1(dora_iq[39]), .B0(dora_iq[7]), .B1(n993), 
        .C0(n1381), .C1(iq_score[7]), .Y(n1364) );
  INVXL U1557 ( .A(n1365), .Y(n896) );
  AOI222XL U1558 ( .A0(n1796), .A1(dora_iq[38]), .B0(dora_iq[6]), .B1(n993), 
        .C0(n1381), .C1(iq_score[6]), .Y(n1365) );
  INVXL U1559 ( .A(n1366), .Y(n901) );
  INVXL U1560 ( .A(n1367), .Y(n911) );
  AOI222XL U1561 ( .A0(n1796), .A1(dora_iq[35]), .B0(dora_iq[3]), .B1(n993), 
        .C0(n1381), .C1(iq_score[3]), .Y(n1367) );
  INVXL U1562 ( .A(n1368), .Y(n916) );
  AOI222XL U1563 ( .A0(n1796), .A1(dora_iq[34]), .B0(dora_iq[2]), .B1(n993), 
        .C0(n1381), .C1(iq_score[2]), .Y(n1368) );
  INVXL U1564 ( .A(n1369), .Y(n921) );
  AOI222XL U1565 ( .A0(n1796), .A1(dora_iq[33]), .B0(dora_iq[1]), .B1(n993), 
        .C0(n1381), .C1(iq_score[1]), .Y(n1369) );
  INVXL U1566 ( .A(n1370), .Y(n926) );
  AOI222XL U1567 ( .A0(n1796), .A1(dora_iq[32]), .B0(dora_iq[0]), .B1(n993), 
        .C0(n1381), .C1(iq_score[0]), .Y(n1370) );
  INVXL U1568 ( .A(n1371), .Y(n931) );
  AOI222XL U1569 ( .A0(n1796), .A1(dora_eq[39]), .B0(dora_eq[7]), .B1(n993), 
        .C0(n1794), .C1(eq_score[7]), .Y(n1371) );
  INVXL U1570 ( .A(n1372), .Y(n936) );
  AOI222XL U1571 ( .A0(n1796), .A1(dora_eq[38]), .B0(dora_eq[6]), .B1(n993), 
        .C0(n1381), .C1(eq_score[6]), .Y(n1372) );
  INVXL U1572 ( .A(n1373), .Y(n941) );
  INVXL U1573 ( .A(n1374), .Y(n951) );
  AOI222XL U1574 ( .A0(n1796), .A1(dora_eq[35]), .B0(dora_eq[3]), .B1(n993), 
        .C0(n1381), .C1(eq_score[3]), .Y(n1374) );
  INVXL U1575 ( .A(n1375), .Y(n956) );
  AOI222XL U1576 ( .A0(n1796), .A1(dora_eq[34]), .B0(dora_eq[2]), .B1(n993), 
        .C0(n1381), .C1(eq_score[2]), .Y(n1375) );
  INVXL U1577 ( .A(n1376), .Y(n961) );
  AOI222XL U1578 ( .A0(n1796), .A1(dora_eq[33]), .B0(dora_eq[1]), .B1(n993), 
        .C0(n1794), .C1(eq_score[1]), .Y(n1376) );
  INVXL U1579 ( .A(n1377), .Y(n966) );
  AOI222XL U1580 ( .A0(n1796), .A1(dora_eq[32]), .B0(dora_eq[0]), .B1(n993), 
        .C0(n1381), .C1(eq_score[0]), .Y(n1377) );
  INVXL U1581 ( .A(n1797), .Y(n946) );
  AOI222XL U1582 ( .A0(n1796), .A1(dora_eq[36]), .B0(dora_eq[4]), .B1(n993), 
        .C0(n1794), .C1(eq_score[4]), .Y(n1797) );
  MX2XL U1583 ( .A(dora_size[32]), .B(dora_size[24]), .S0(n1858), .Y(n882) );
  OAI211XL U1584 ( .A0(n1702), .A1(n1697), .B0(n1696), .C0(n1808), .Y(n833) );
  AOI22XL U1585 ( .A0(n1800), .A1(dora_score3[0]), .B0(n1698), .B1(m1_out[0]), 
        .Y(n1696) );
  OAI211XL U1586 ( .A0(n1702), .A1(n1701), .B0(n1700), .C0(n1699), .Y(n831) );
  AOI22XL U1587 ( .A0(n1800), .A1(dora_score3[2]), .B0(n1698), .B1(m1_out[2]), 
        .Y(n1700) );
  OAI22XL U1588 ( .A0(n1667), .A1(n1706), .B0(n1727), .B1(n1666), .Y(n982) );
  AOI2BB1XL U1589 ( .A0N(n1752), .A1N(n1665), .B0(n1664), .Y(n1666) );
  AOI21XL U1590 ( .A0(n1662), .A1(n1663), .B0(n1719), .Y(n1667) );
  OAI211XL U1591 ( .A0(n1807), .A1(n1468), .B0(n1682), .C0(n1467), .Y(n812) );
  AOI21XL U1592 ( .A0(n1981), .A1(afifo_wq2_rptr[2]), .B0(n1980), .Y(
        afifo_wptr_full_m0_wfull_val) );
  OAI211XL U1593 ( .A0(n1981), .A1(afifo_wq2_rptr[2]), .B0(n1979), .C0(n1978), 
        .Y(n1980) );
  INVXL U1594 ( .A(afifo_wptr_full_m0_wgraynext[2]), .Y(n1981) );
  OAI211XL U1595 ( .A0(n1807), .A1(n1463), .B0(n1685), .C0(n1462), .Y(n813) );
  OAI211XL U1596 ( .A0(n1789), .A1(n1658), .B0(n1516), .C0(n1515), .Y(
        next_state[0]) );
  AOI211XL U1597 ( .A0(n1862), .A1(n1850), .B0(n1659), .C0(n1662), .Y(n1516)
         );
  OAI2BB1XL U1598 ( .A0N(cnt[0]), .A1N(n1727), .B0(n1641), .Y(n985) );
  OAI2BB1XL U1599 ( .A0N(n1756), .A1N(n1640), .B0(n1971), .Y(n1641) );
  OAI211XL U1600 ( .A0(n1702), .A1(n1695), .B0(n1694), .C0(n1816), .Y(n829) );
  AOI22XL U1601 ( .A0(n1800), .A1(dora_score3[4]), .B0(n1698), .B1(m1_out[4]), 
        .Y(n1694) );
  NAND2XL U1602 ( .A(n1781), .B(n1780), .Y(next_state[1]) );
  NOR4XL U1603 ( .A(n1968), .B(n1779), .C(n1778), .D(n1777), .Y(n1780) );
  OAI211XL U1604 ( .A0(n1774), .A1(n1970), .B0(n1773), .C0(current_state[1]), 
        .Y(n1781) );
  MXI2XL U1605 ( .A(n1818), .B(n1741), .S0(n1782), .Y(n842) );
  OAI211XL U1606 ( .A0(n1702), .A1(n1693), .B0(n1692), .C0(n1691), .Y(n830) );
  AOI22XL U1607 ( .A0(n1800), .A1(dora_score3[3]), .B0(n1698), .B1(m1_out[3]), 
        .Y(n1692) );
  MXI2XL U1608 ( .A(n1814), .B(n1745), .S0(n1782), .Y(n843) );
  OAI211XL U1609 ( .A0(n1807), .A1(n1465), .B0(n1673), .C0(n1464), .Y(n811) );
  OAI211XL U1610 ( .A0(n1807), .A1(n1461), .B0(n1688), .C0(n1460), .Y(n815) );
  OAI21XL U1611 ( .A0(n1649), .A1(n1648), .B0(n1647), .Y(n801) );
  INVXL U1612 ( .A(cmp1_op[6]), .Y(n1649) );
  AOI22XL U1613 ( .A0(n1766), .A1(m1_out[6]), .B0(n1764), .B1(dora_score3[6]), 
        .Y(n1647) );
  MXI2XL U1614 ( .A(n1820), .B(n1744), .S0(n1782), .Y(n841) );
  OAI211XL U1615 ( .A0(n1807), .A1(n1310), .B0(n1655), .C0(n1466), .Y(n814) );
  OAI211XL U1616 ( .A0(n1702), .A1(n1690), .B0(n1689), .C0(n1688), .Y(n828) );
  AOI22XL U1617 ( .A0(n1800), .A1(dora_score3[5]), .B0(n1698), .B1(m1_out[5]), 
        .Y(n1689) );
  OAI211XL U1618 ( .A0(n1807), .A1(n1471), .B0(n1679), .C0(n1470), .Y(n810) );
  OAI211XL U1619 ( .A0(n1702), .A1(n1675), .B0(n1674), .C0(n1673), .Y(n824) );
  AOI22XL U1620 ( .A0(n1800), .A1(dora_score3[9]), .B0(n1698), .B1(m1_out[9]), 
        .Y(n1674) );
  OAI211XL U1621 ( .A0(n1702), .A1(n1678), .B0(n1677), .C0(n1676), .Y(n821) );
  AOI22XL U1622 ( .A0(n1800), .A1(dora_score3[12]), .B0(n1698), .B1(m1_out[12]), .Y(n1677) );
  OAI211XL U1623 ( .A0(n1702), .A1(n1672), .B0(n1671), .C0(n1829), .Y(n822) );
  AOI22XL U1624 ( .A0(n1800), .A1(dora_score3[11]), .B0(n1698), .B1(m1_out[11]), .Y(n1671) );
  OAI2BB1XL U1625 ( .A0N(cmp2_op[11]), .A1N(n1782), .B0(n1737), .Y(n835) );
  NAND2XL U1626 ( .A(n1738), .B(m1_out[11]), .Y(n1737) );
  OAI211XL U1627 ( .A0(n1832), .A1(n1831), .B0(n1830), .C0(n1829), .Y(n809) );
  NAND2XL U1628 ( .A(n1828), .B(cmp1_op[24]), .Y(n1830) );
  OAI211XL U1629 ( .A0(n1702), .A1(n1681), .B0(n1680), .C0(n1679), .Y(n823) );
  AOI22XL U1630 ( .A0(n1800), .A1(dora_score3[10]), .B0(n1698), .B1(m1_out[10]), .Y(n1680) );
  MXI2XL U1631 ( .A(n1825), .B(n1743), .S0(n1782), .Y(n837) );
  MXI2XL U1632 ( .A(n1834), .B(n1742), .S0(n1782), .Y(n834) );
  OAI211XL U1633 ( .A0(n1702), .A1(n1684), .B0(n1683), .C0(n1682), .Y(n825) );
  AOI22XL U1634 ( .A0(n1800), .A1(dora_score3[8]), .B0(n1698), .B1(m1_out[8]), 
        .Y(n1683) );
  MXI2XL U1635 ( .A(n1822), .B(n1748), .S0(n1782), .Y(n838) );
  MXI2XL U1636 ( .A(afifo_waddr[2]), .B(n1538), .S0(n1450), .Y(
        afifo_wptr_full_m0_wbinnext[2]) );
  MXI2XL U1637 ( .A(n1788), .B(n1783), .S0(n1782), .Y(n836) );
  MXI2XL U1638 ( .A(n1747), .B(n1746), .S0(n1782), .Y(n840) );
  OAI211XL U1639 ( .A0(n1807), .A1(n1500), .B0(n1676), .C0(n1469), .Y(n808) );
  MXI2XL U1640 ( .A(n1523), .B(n1848), .S0(stopmachine[0]), .Y(n979) );
  OAI211XL U1641 ( .A0(n1657), .A1(n1702), .B0(n1656), .C0(n1655), .Y(n827) );
  AOI22XL U1642 ( .A0(n1800), .A1(dora_score3[6]), .B0(n1698), .B1(m1_out[6]), 
        .Y(n1656) );
  NAND2XL U1643 ( .A(n1505), .B(n1504), .Y(cmp1_out) );
  OAI211XL U1644 ( .A0(n1498), .A1(n1503), .B0(n1502), .C0(n1501), .Y(n1505)
         );
  OAI2BB1XL U1645 ( .A0N(cmp2_op[7]), .A1N(n1782), .B0(n1739), .Y(n839) );
  NAND2XL U1646 ( .A(n1738), .B(m1_out[7]), .Y(n1739) );
  XOR2XL U1647 ( .A(n1530), .B(n1529), .Y(n1531) );
  OAI211XL U1648 ( .A0(n1702), .A1(n1687), .B0(n1686), .C0(n1685), .Y(n826) );
  AOI22XL U1649 ( .A0(n1800), .A1(dora_score3[7]), .B0(n1698), .B1(m1_out[7]), 
        .Y(n1686) );
  OAI2BB1XL U1650 ( .A0N(stopmachine[5]), .A1N(n1844), .B0(n1633), .Y(n975) );
  XNOR2XL U1651 ( .A(n1631), .B(n1630), .Y(n1632) );
  OAI2BB1XL U1652 ( .A0N(stopmachine[6]), .A1N(n1844), .B0(n1578), .Y(n974) );
  AOI21XL U1653 ( .A0(n1970), .A1(n1969), .B0(n1968), .Y(n1972) );
  MXI2XL U1654 ( .A(n1973), .B(n1451), .S0(afifo_wptr[4]), .Y(
        afifo_wptr_full_m0_wbinnext[4]) );
  OAI2BB1XL U1655 ( .A0N(stopmachine[8]), .A1N(n1844), .B0(n1644), .Y(n972) );
  XOR2XL U1656 ( .A(n1651), .B(n1650), .Y(n1643) );
  OAI2BB1XL U1657 ( .A0N(stopmachine[9]), .A1N(n1844), .B0(n1653), .Y(n971) );
  OAI2BB1XL U1658 ( .A0N(stopmachine[10]), .A1N(n1844), .B0(n1705), .Y(n970)
         );
  NAND2XL U1659 ( .A(n1704), .B(n1969), .Y(n1705) );
  OAI211X1 U1660 ( .A0(cmp2_op[12]), .A1(n1497), .B0(n1496), .C0(n1495), .Y(
        cmp2_out) );
  NAND2XL U1661 ( .A(n1494), .B(cmp2_op[25]), .Y(n1495) );
  OAI31XL U1662 ( .A0(n1493), .A1(n1492), .A2(n1491), .B0(n1490), .Y(n1496) );
  OAI2BB2XL U1663 ( .B0(n1848), .B1(n1847), .A0N(n1969), .A1N(n1846), .Y(n969)
         );
  OAI21XL U1664 ( .A0(n1732), .A1(n1812), .B0(n1712), .Y(n603) );
  NAND2XL U1665 ( .A(n1732), .B(dora_score3[2]), .Y(n1712) );
  OAI21XL U1666 ( .A0(n1732), .A1(n1814), .B0(n1709), .Y(n604) );
  NAND2XL U1667 ( .A(n1732), .B(dora_score3[3]), .Y(n1709) );
  OAI21XL U1668 ( .A0(n1732), .A1(n1820), .B0(n1711), .Y(n606) );
  NAND2XL U1669 ( .A(n1732), .B(dora_score3[5]), .Y(n1711) );
  OAI21XL U1670 ( .A0(n1732), .A1(n1822), .B0(n1715), .Y(n609) );
  NAND2XL U1671 ( .A(n1732), .B(dora_score3[8]), .Y(n1715) );
  OAI21XL U1672 ( .A0(n1732), .A1(n1825), .B0(n1716), .Y(n610) );
  NAND2XL U1673 ( .A(n1732), .B(dora_score3[9]), .Y(n1716) );
  OAI21XL U1674 ( .A0(n1732), .A1(n1834), .B0(n1708), .Y(n613) );
  NAND2XL U1675 ( .A(n1732), .B(dora_score3[12]), .Y(n1708) );
  OAI2BB1XL U1676 ( .A0N(dora_score3[7]), .A1N(n1732), .B0(n1718), .Y(n608) );
  OAI2BB1XL U1677 ( .A0N(dora_score3[11]), .A1N(n1732), .B0(n1731), .Y(n612)
         );
  OAI21XL U1678 ( .A0(n1732), .A1(n1788), .B0(n1707), .Y(n611) );
  NAND2XL U1679 ( .A(n1732), .B(dora_score3[10]), .Y(n1707) );
  INVXL U1680 ( .A(n1355), .Y(n906) );
  AOI222XL U1681 ( .A0(n1796), .A1(dora_iq[36]), .B0(dora_iq[4]), .B1(n993), 
        .C0(n1794), .C1(iq_score[4]), .Y(n1355) );
  XOR2XL U1682 ( .A(n1412), .B(n1411), .Y(N240) );
  NAND2XL U1683 ( .A(n1410), .B(n1386), .Y(n1411) );
  INVXL U1684 ( .A(n1384), .Y(n1410) );
  INVXL U1685 ( .A(n1297), .Y(N247) );
  NAND2XL U1686 ( .A(n1409), .B(n1407), .Y(n1297) );
  XNOR2XL U1687 ( .A(n1431), .B(n1430), .Y(N235) );
  XOR2XL U1688 ( .A(n1413), .B(n1418), .Y(N239) );
  NAND2XL U1689 ( .A(n1417), .B(n1416), .Y(n1418) );
  OR2XL U1690 ( .A(n1415), .B(n1414), .Y(n1417) );
  OAI21XL U1691 ( .A0(n1732), .A1(n1747), .B0(n1713), .Y(n607) );
  NAND2XL U1692 ( .A(n1732), .B(dora_score3[6]), .Y(n1713) );
  OAI2BB1XL U1693 ( .A0N(n1826), .A1N(m1_out[6]), .B0(n1803), .Y(n629) );
  OAI21XL U1694 ( .A0(n1786), .A1(n1818), .B0(n1815), .Y(n627) );
  NAND2XL U1695 ( .A(n1786), .B(dora_score2[4]), .Y(n1815) );
  OAI21XL U1696 ( .A0(n1786), .A1(n1810), .B0(n1806), .Y(n636) );
  NAND2XL U1697 ( .A(n1786), .B(dora_score2[0]), .Y(n1806) );
  OAI21XL U1698 ( .A0(n1786), .A1(n1805), .B0(n1804), .Y(n624) );
  NAND2XL U1699 ( .A(n1786), .B(dora_score2[1]), .Y(n1804) );
  OAI21XL U1700 ( .A0(n1786), .A1(n1812), .B0(n1811), .Y(n625) );
  NAND2XL U1701 ( .A(n1786), .B(dora_score2[2]), .Y(n1811) );
  OAI21XL U1702 ( .A0(n1786), .A1(n1814), .B0(n1813), .Y(n626) );
  NAND2XL U1703 ( .A(n1786), .B(dora_score2[3]), .Y(n1813) );
  OAI21XL U1704 ( .A0(n1786), .A1(n1820), .B0(n1819), .Y(n628) );
  NAND2XL U1705 ( .A(n1786), .B(dora_score2[5]), .Y(n1819) );
  OAI21XL U1706 ( .A0(n1786), .A1(n1822), .B0(n1821), .Y(n631) );
  NAND2XL U1707 ( .A(n1786), .B(dora_score2[8]), .Y(n1821) );
  OAI21XL U1708 ( .A0(n1786), .A1(n1825), .B0(n1824), .Y(n632) );
  NAND2XL U1709 ( .A(n1786), .B(dora_score2[9]), .Y(n1824) );
  NAND2XL U1710 ( .A(n1786), .B(dora_score2[10]), .Y(n1787) );
  OAI21XL U1711 ( .A0(n1786), .A1(n1834), .B0(n1833), .Y(n635) );
  NAND2XL U1712 ( .A(n1786), .B(dora_score2[12]), .Y(n1833) );
  OAI2BB1XL U1713 ( .A0N(af_wdata[1]), .A1N(n1861), .B0(n1520), .Y(n766) );
  OAI2BB1XL U1714 ( .A0N(af_wdata[2]), .A1N(n1861), .B0(n1521), .Y(n767) );
  OAI2BB1XL U1715 ( .A0N(af_wdata[3]), .A1N(n1861), .B0(n1519), .Y(n768) );
  OAI2BB1XL U1716 ( .A0N(af_wdata[4]), .A1N(n1861), .B0(n1517), .Y(n769) );
  AOI2BB2XL U1717 ( .B0(n1994), .B1(n2011), .A0N(afifo_fifomem_m0_mem[17]), 
        .A1N(n1994), .Y(n741) );
  AOI2BB2XL U1718 ( .B0(n1994), .B1(n2010), .A0N(afifo_fifomem_m0_mem[18]), 
        .A1N(n1994), .Y(n742) );
  AOI2BB2XL U1719 ( .B0(n1994), .B1(n2009), .A0N(afifo_fifomem_m0_mem[19]), 
        .A1N(n1994), .Y(n743) );
  AOI2BB2XL U1720 ( .B0(n1994), .B1(n2008), .A0N(afifo_fifomem_m0_mem[20]), 
        .A1N(n1994), .Y(n744) );
  AOI2BB2XL U1721 ( .B0(n1994), .B1(n2007), .A0N(afifo_fifomem_m0_mem[16]), 
        .A1N(n1994), .Y(n748) );
  AOI2BB2XL U1722 ( .B0(n2005), .B1(n2011), .A0N(afifo_fifomem_m0_mem[105]), 
        .A1N(n2005), .Y(n653) );
  AOI2BB2XL U1723 ( .B0(n2005), .B1(n2010), .A0N(afifo_fifomem_m0_mem[106]), 
        .A1N(n2005), .Y(n654) );
  AOI2BB2XL U1724 ( .B0(n2005), .B1(n2009), .A0N(afifo_fifomem_m0_mem[107]), 
        .A1N(n2005), .Y(n655) );
  AOI2BB2XL U1725 ( .B0(n2005), .B1(n2008), .A0N(afifo_fifomem_m0_mem[108]), 
        .A1N(n2005), .Y(n656) );
  AOI2BB2XL U1726 ( .B0(n2003), .B1(n2011), .A0N(afifo_fifomem_m0_mem[89]), 
        .A1N(n2003), .Y(n669) );
  AOI2BB2XL U1727 ( .B0(n2003), .B1(n2010), .A0N(afifo_fifomem_m0_mem[90]), 
        .A1N(n2003), .Y(n670) );
  AOI2BB2XL U1728 ( .B0(n2003), .B1(n2009), .A0N(afifo_fifomem_m0_mem[91]), 
        .A1N(n2003), .Y(n671) );
  AOI2BB2XL U1729 ( .B0(n2003), .B1(n2008), .A0N(afifo_fifomem_m0_mem[92]), 
        .A1N(n2003), .Y(n672) );
  AOI2BB2XL U1730 ( .B0(n2000), .B1(n2011), .A0N(afifo_fifomem_m0_mem[65]), 
        .A1N(n2000), .Y(n693) );
  AOI2BB2XL U1731 ( .B0(n2000), .B1(n2010), .A0N(afifo_fifomem_m0_mem[66]), 
        .A1N(n2000), .Y(n694) );
  AOI2BB2XL U1732 ( .B0(n2000), .B1(n2009), .A0N(afifo_fifomem_m0_mem[67]), 
        .A1N(n2000), .Y(n695) );
  AOI2BB2XL U1733 ( .B0(n2000), .B1(n2008), .A0N(afifo_fifomem_m0_mem[68]), 
        .A1N(n2000), .Y(n696) );
  AOI2BB2XL U1734 ( .B0(n2000), .B1(n2007), .A0N(afifo_fifomem_m0_mem[64]), 
        .A1N(n2000), .Y(n700) );
  AOI2BB2XL U1735 ( .B0(n1999), .B1(n2011), .A0N(afifo_fifomem_m0_mem[57]), 
        .A1N(n1999), .Y(n701) );
  AOI2BB2XL U1736 ( .B0(n1999), .B1(n2010), .A0N(afifo_fifomem_m0_mem[58]), 
        .A1N(n1999), .Y(n702) );
  AOI2BB2XL U1737 ( .B0(n1999), .B1(n2009), .A0N(afifo_fifomem_m0_mem[59]), 
        .A1N(n1999), .Y(n703) );
  AOI2BB2XL U1738 ( .B0(n1999), .B1(n2008), .A0N(afifo_fifomem_m0_mem[60]), 
        .A1N(n1999), .Y(n704) );
  AOI2BB2XL U1739 ( .B0(n2002), .B1(n2011), .A0N(afifo_fifomem_m0_mem[81]), 
        .A1N(n2002), .Y(n677) );
  AOI2BB2XL U1740 ( .B0(n2002), .B1(n2010), .A0N(afifo_fifomem_m0_mem[82]), 
        .A1N(n2002), .Y(n678) );
  AOI2BB2XL U1741 ( .B0(n2002), .B1(n2009), .A0N(afifo_fifomem_m0_mem[83]), 
        .A1N(n2002), .Y(n679) );
  AOI2BB2XL U1742 ( .B0(n2002), .B1(n2008), .A0N(afifo_fifomem_m0_mem[84]), 
        .A1N(n2002), .Y(n680) );
  AOI2BB2XL U1743 ( .B0(n2002), .B1(n2007), .A0N(afifo_fifomem_m0_mem[80]), 
        .A1N(n2002), .Y(n684) );
  AOI2BB2XL U1744 ( .B0(n1997), .B1(n2011), .A0N(afifo_fifomem_m0_mem[41]), 
        .A1N(n1997), .Y(n717) );
  AOI2BB2XL U1745 ( .B0(n1997), .B1(n2010), .A0N(afifo_fifomem_m0_mem[42]), 
        .A1N(n1997), .Y(n718) );
  AOI2BB2XL U1746 ( .B0(n1997), .B1(n2009), .A0N(afifo_fifomem_m0_mem[43]), 
        .A1N(n1997), .Y(n719) );
  AOI2BB2XL U1747 ( .B0(n1997), .B1(n2008), .A0N(afifo_fifomem_m0_mem[44]), 
        .A1N(n1997), .Y(n720) );
  AOI2BB2XL U1748 ( .B0(n1996), .B1(n2011), .A0N(afifo_fifomem_m0_mem[33]), 
        .A1N(n1996), .Y(n725) );
  AOI2BB2XL U1749 ( .B0(n1996), .B1(n2010), .A0N(afifo_fifomem_m0_mem[34]), 
        .A1N(n1996), .Y(n726) );
  AOI2BB2XL U1750 ( .B0(n1996), .B1(n2009), .A0N(afifo_fifomem_m0_mem[35]), 
        .A1N(n1996), .Y(n727) );
  AOI2BB2XL U1751 ( .B0(n1996), .B1(n2008), .A0N(afifo_fifomem_m0_mem[36]), 
        .A1N(n1996), .Y(n728) );
  AOI2BB2XL U1752 ( .B0(n1996), .B1(n2007), .A0N(afifo_fifomem_m0_mem[32]), 
        .A1N(n1996), .Y(n732) );
  AOI2BB2XL U1753 ( .B0(n2005), .B1(n2007), .A0N(afifo_fifomem_m0_mem[104]), 
        .A1N(n2005), .Y(n660) );
  AOI2BB2XL U1754 ( .B0(n2003), .B1(n2007), .A0N(afifo_fifomem_m0_mem[88]), 
        .A1N(n2003), .Y(n676) );
  AOI2BB2XL U1755 ( .B0(n1999), .B1(n2007), .A0N(afifo_fifomem_m0_mem[56]), 
        .A1N(n1999), .Y(n708) );
  AOI2BB2XL U1756 ( .B0(n1997), .B1(n2007), .A0N(afifo_fifomem_m0_mem[40]), 
        .A1N(n1997), .Y(n724) );
  AOI2BB2XL U1757 ( .B0(n2001), .B1(n2007), .A0N(afifo_fifomem_m0_mem[72]), 
        .A1N(n2001), .Y(n692) );
  AOI2BB2XL U1758 ( .B0(n1995), .B1(n2007), .A0N(afifo_fifomem_m0_mem[24]), 
        .A1N(n1995), .Y(n740) );
  AOI2BB2XL U1759 ( .B0(n1993), .B1(n2007), .A0N(afifo_fifomem_m0_mem[8]), 
        .A1N(n1993), .Y(n756) );
  AOI2BB2XL U1760 ( .B0(n2001), .B1(n2011), .A0N(afifo_fifomem_m0_mem[73]), 
        .A1N(n2001), .Y(n685) );
  AOI2BB2XL U1761 ( .B0(n2001), .B1(n2010), .A0N(afifo_fifomem_m0_mem[74]), 
        .A1N(n2001), .Y(n686) );
  AOI2BB2XL U1762 ( .B0(n2001), .B1(n2009), .A0N(afifo_fifomem_m0_mem[75]), 
        .A1N(n2001), .Y(n687) );
  AOI2BB2XL U1763 ( .B0(n2001), .B1(n2008), .A0N(afifo_fifomem_m0_mem[76]), 
        .A1N(n2001), .Y(n688) );
  AOI2BB2XL U1764 ( .B0(n2006), .B1(n2011), .A0N(afifo_fifomem_m0_mem[113]), 
        .A1N(n2006), .Y(n645) );
  AOI2BB2XL U1765 ( .B0(n2006), .B1(n2010), .A0N(afifo_fifomem_m0_mem[114]), 
        .A1N(n2006), .Y(n646) );
  AOI2BB2XL U1766 ( .B0(n2006), .B1(n2009), .A0N(afifo_fifomem_m0_mem[115]), 
        .A1N(n2006), .Y(n647) );
  AOI2BB2XL U1767 ( .B0(n2006), .B1(n2008), .A0N(afifo_fifomem_m0_mem[116]), 
        .A1N(n2006), .Y(n648) );
  AOI2BB2XL U1768 ( .B0(n2006), .B1(n2007), .A0N(afifo_fifomem_m0_mem[112]), 
        .A1N(n2006), .Y(n652) );
  AOI2BB2XL U1769 ( .B0(n1993), .B1(n2009), .A0N(afifo_fifomem_m0_mem[11]), 
        .A1N(n1993), .Y(n751) );
  AOI2BB2XL U1770 ( .B0(n1993), .B1(n2008), .A0N(afifo_fifomem_m0_mem[12]), 
        .A1N(n1993), .Y(n752) );
  AOI2BB2XL U1771 ( .B0(n1992), .B1(n2011), .A0N(afifo_fifomem_m0_mem[1]), 
        .A1N(n1992), .Y(n757) );
  AOI2BB2XL U1772 ( .B0(n1992), .B1(n2010), .A0N(afifo_fifomem_m0_mem[2]), 
        .A1N(n1992), .Y(n758) );
  AOI2BB2XL U1773 ( .B0(n1992), .B1(n2009), .A0N(afifo_fifomem_m0_mem[3]), 
        .A1N(n1992), .Y(n759) );
  AOI2BB2XL U1774 ( .B0(n1992), .B1(n2008), .A0N(afifo_fifomem_m0_mem[4]), 
        .A1N(n1992), .Y(n760) );
  AOI2BB2XL U1775 ( .B0(n1992), .B1(n2007), .A0N(afifo_fifomem_m0_mem[0]), 
        .A1N(n1992), .Y(n764) );
  AOI2BB2XL U1776 ( .B0(n2004), .B1(n2011), .A0N(afifo_fifomem_m0_mem[97]), 
        .A1N(n2004), .Y(n661) );
  AOI2BB2XL U1777 ( .B0(n2004), .B1(n2010), .A0N(afifo_fifomem_m0_mem[98]), 
        .A1N(n2004), .Y(n662) );
  AOI2BB2XL U1778 ( .B0(n2004), .B1(n2009), .A0N(afifo_fifomem_m0_mem[99]), 
        .A1N(n2004), .Y(n663) );
  AOI2BB2XL U1779 ( .B0(n2004), .B1(n2008), .A0N(afifo_fifomem_m0_mem[100]), 
        .A1N(n2004), .Y(n664) );
  AOI2BB2XL U1780 ( .B0(n2004), .B1(n2007), .A0N(afifo_fifomem_m0_mem[96]), 
        .A1N(n2004), .Y(n668) );
  AOI2BB2XL U1781 ( .B0(n1995), .B1(n2011), .A0N(afifo_fifomem_m0_mem[25]), 
        .A1N(n1995), .Y(n733) );
  AOI2BB2XL U1782 ( .B0(n1995), .B1(n2010), .A0N(afifo_fifomem_m0_mem[26]), 
        .A1N(n1995), .Y(n734) );
  AOI2BB2XL U1783 ( .B0(n1995), .B1(n2009), .A0N(afifo_fifomem_m0_mem[27]), 
        .A1N(n1995), .Y(n735) );
  AOI2BB2XL U1784 ( .B0(n1995), .B1(n2008), .A0N(afifo_fifomem_m0_mem[28]), 
        .A1N(n1995), .Y(n736) );
  AOI2BB2XL U1785 ( .B0(n1993), .B1(n2011), .A0N(afifo_fifomem_m0_mem[9]), 
        .A1N(n1993), .Y(n749) );
  AOI2BB2XL U1786 ( .B0(n1993), .B1(n2010), .A0N(afifo_fifomem_m0_mem[10]), 
        .A1N(n1993), .Y(n750) );
  AOI2BB2XL U1787 ( .B0(n1998), .B1(n2011), .A0N(afifo_fifomem_m0_mem[49]), 
        .A1N(n1998), .Y(n709) );
  AOI2BB2XL U1788 ( .B0(n1998), .B1(n2010), .A0N(afifo_fifomem_m0_mem[50]), 
        .A1N(n1998), .Y(n710) );
  AOI2BB2XL U1789 ( .B0(n1998), .B1(n2009), .A0N(afifo_fifomem_m0_mem[51]), 
        .A1N(n1998), .Y(n711) );
  AOI2BB2XL U1790 ( .B0(n1998), .B1(n2008), .A0N(afifo_fifomem_m0_mem[52]), 
        .A1N(n1998), .Y(n712) );
  AOI2BB2XL U1791 ( .B0(n1998), .B1(n2007), .A0N(afifo_fifomem_m0_mem[48]), 
        .A1N(n1998), .Y(n716) );
  AOI2BB2XL U1792 ( .B0(n1451), .B1(n2007), .A0N(afifo_fifomem_m0_mem[120]), 
        .A1N(n1451), .Y(n644) );
  AOI2BB2XL U1793 ( .B0(n1451), .B1(n2011), .A0N(afifo_fifomem_m0_mem[121]), 
        .A1N(n1451), .Y(n637) );
  AOI2BB2XL U1794 ( .B0(n1451), .B1(n2010), .A0N(afifo_fifomem_m0_mem[122]), 
        .A1N(n1451), .Y(n638) );
  AOI2BB2XL U1795 ( .B0(n1451), .B1(n2009), .A0N(afifo_fifomem_m0_mem[123]), 
        .A1N(n1451), .Y(n639) );
  AOI2BB2XL U1796 ( .B0(n1451), .B1(n2008), .A0N(afifo_fifomem_m0_mem[124]), 
        .A1N(n1451), .Y(n640) );
  OAI2BB1XL U1797 ( .A0N(n1994), .A1N(af_wdata[6]), .B0(n1570), .Y(n746) );
  OAI2BB1XL U1798 ( .A0N(n2005), .A1N(af_wdata[6]), .B0(n1622), .Y(n658) );
  OAI2BB1XL U1799 ( .A0N(n2003), .A1N(af_wdata[6]), .B0(n1620), .Y(n674) );
  OAI2BB1XL U1800 ( .A0N(n2002), .A1N(af_wdata[6]), .B0(n1548), .Y(n682) );
  OAI2BB1XL U1801 ( .A0N(n2000), .A1N(af_wdata[6]), .B0(n1550), .Y(n698) );
  OAI2BB1XL U1802 ( .A0N(n1999), .A1N(af_wdata[6]), .B0(n1591), .Y(n706) );
  OAI2BB1XL U1803 ( .A0N(n1997), .A1N(af_wdata[6]), .B0(n1600), .Y(n722) );
  OAI2BB1XL U1804 ( .A0N(n1996), .A1N(af_wdata[6]), .B0(n1568), .Y(n730) );
  OAI2BB1XL U1805 ( .A0N(n1994), .A1N(af_wdata[5]), .B0(n1564), .Y(n745) );
  OAI2BB1XL U1806 ( .A0N(n1994), .A1N(af_wdata[7]), .B0(n1565), .Y(n747) );
  OAI2BB1XL U1807 ( .A0N(n2005), .A1N(af_wdata[5]), .B0(n1610), .Y(n657) );
  OAI2BB1XL U1808 ( .A0N(n2005), .A1N(af_wdata[7]), .B0(n1616), .Y(n659) );
  OAI2BB1XL U1809 ( .A0N(n2003), .A1N(af_wdata[5]), .B0(n1613), .Y(n673) );
  OAI2BB1XL U1810 ( .A0N(n2003), .A1N(af_wdata[7]), .B0(n1615), .Y(n675) );
  OAI2BB1XL U1811 ( .A0N(n2002), .A1N(af_wdata[5]), .B0(n1536), .Y(n681) );
  OAI2BB1XL U1812 ( .A0N(n2002), .A1N(af_wdata[7]), .B0(n1540), .Y(n683) );
  OAI2BB1XL U1813 ( .A0N(n2000), .A1N(af_wdata[5]), .B0(n1539), .Y(n697) );
  OAI2BB1XL U1814 ( .A0N(n2000), .A1N(af_wdata[7]), .B0(n1543), .Y(n699) );
  OAI2BB1XL U1815 ( .A0N(n1999), .A1N(af_wdata[5]), .B0(n1584), .Y(n705) );
  OAI2BB1XL U1816 ( .A0N(n1999), .A1N(af_wdata[7]), .B0(n1587), .Y(n707) );
  OAI2BB1XL U1817 ( .A0N(n1997), .A1N(af_wdata[5]), .B0(n1594), .Y(n721) );
  OAI2BB1XL U1818 ( .A0N(n1997), .A1N(af_wdata[7]), .B0(n1596), .Y(n723) );
  OAI2BB1XL U1819 ( .A0N(n1996), .A1N(af_wdata[5]), .B0(n1562), .Y(n729) );
  OAI2BB1XL U1820 ( .A0N(n1996), .A1N(af_wdata[7]), .B0(n1566), .Y(n731) );
  OAI2BB1XL U1821 ( .A0N(n1451), .A1N(af_wdata[6]), .B0(n1573), .Y(n642) );
  OAI2BB1XL U1822 ( .A0N(n2001), .A1N(af_wdata[6]), .B0(n1618), .Y(n690) );
  OAI2BB1XL U1823 ( .A0N(n2006), .A1N(af_wdata[6]), .B0(n1552), .Y(n650) );
  OAI2BB1XL U1824 ( .A0N(n2004), .A1N(af_wdata[6]), .B0(n1546), .Y(n666) );
  OAI2BB1XL U1825 ( .A0N(n1995), .A1N(af_wdata[6]), .B0(n1598), .Y(n738) );
  OAI2BB1XL U1826 ( .A0N(n1993), .A1N(af_wdata[6]), .B0(n1589), .Y(n754) );
  OAI2BB1XL U1827 ( .A0N(n1992), .A1N(af_wdata[6]), .B0(n1561), .Y(n762) );
  OAI2BB1XL U1828 ( .A0N(n2001), .A1N(af_wdata[5]), .B0(n1608), .Y(n689) );
  OAI2BB1XL U1829 ( .A0N(n2001), .A1N(af_wdata[7]), .B0(n1614), .Y(n691) );
  OAI2BB1XL U1830 ( .A0N(n2006), .A1N(af_wdata[5]), .B0(n1542), .Y(n649) );
  OAI2BB1XL U1831 ( .A0N(n2006), .A1N(af_wdata[7]), .B0(n1544), .Y(n651) );
  OAI2BB1XL U1832 ( .A0N(n2004), .A1N(af_wdata[5]), .B0(n1534), .Y(n665) );
  OAI2BB1XL U1833 ( .A0N(n2004), .A1N(af_wdata[7]), .B0(n1535), .Y(n667) );
  OAI2BB1XL U1834 ( .A0N(n1995), .A1N(af_wdata[5]), .B0(n1592), .Y(n737) );
  OAI2BB1XL U1835 ( .A0N(n1995), .A1N(af_wdata[7]), .B0(n1595), .Y(n739) );
  OAI2BB1XL U1836 ( .A0N(n1993), .A1N(af_wdata[5]), .B0(n1581), .Y(n753) );
  OAI2BB1XL U1837 ( .A0N(n1993), .A1N(af_wdata[7]), .B0(n1582), .Y(n755) );
  OAI2BB1XL U1838 ( .A0N(n1992), .A1N(af_wdata[5]), .B0(n1556), .Y(n761) );
  OAI2BB1XL U1839 ( .A0N(n1992), .A1N(af_wdata[7]), .B0(n1557), .Y(n763) );
  OAI2BB1XL U1840 ( .A0N(n1451), .A1N(af_wdata[5]), .B0(n1571), .Y(n641) );
  OAI2BB1XL U1841 ( .A0N(n1451), .A1N(af_wdata[7]), .B0(n1572), .Y(n643) );
  OAI2BB1XL U1842 ( .A0N(n1998), .A1N(af_wdata[6]), .B0(n1559), .Y(n714) );
  OAI2BB1XL U1843 ( .A0N(n1998), .A1N(af_wdata[5]), .B0(n1554), .Y(n713) );
  OAI2BB1XL U1844 ( .A0N(n1998), .A1N(af_wdata[7]), .B0(n1555), .Y(n715) );
  NOR2X1 U1845 ( .A(afifo_raddr[2]), .B(n1439), .Y(n1440) );
  AOI2BB2XL U1846 ( .B0(afifo_wptr_full_m0_wbinnext[2]), .B1(afifo_waddr[3]), 
        .A0N(afifo_wptr_full_m0_wbinnext[3]), .A1N(
        afifo_wptr_full_m0_wbinnext[2]), .Y(afifo_wptr_full_m0_wgraynext[2])
         );
  MXI2XL U1847 ( .A(n1438), .B(afifo_waddr[1]), .S0(
        afifo_wptr_full_m0_wbinnext[0]), .Y(afifo_wptr_full_m0_wgraynext[0])
         );
  OAI2BB2XL U1848 ( .B0(n1848), .B1(n1527), .A0N(n1969), .A1N(n1526), .Y(n978)
         );
  XNOR2XL U1849 ( .A(n1528), .B(n1527), .Y(n1526) );
  OAI2BB2XL U1850 ( .B0(n1848), .B1(n1637), .A0N(n1969), .A1N(n1636), .Y(n973)
         );
  XNOR2XL U1851 ( .A(n1642), .B(n1637), .Y(n1636) );
  OAI2BB2XL U1852 ( .B0(n1848), .B1(n1628), .A0N(n1969), .A1N(n1586), .Y(n976)
         );
  XOR2XL U1853 ( .A(n1629), .B(n1628), .Y(n1586) );
  NAND2XL U1854 ( .A(n2027), .B(size_weight[1]), .Y(n1604) );
  NAND2XL U1855 ( .A(n2027), .B(size_weight[2]), .Y(n1603) );
  OAI2BB1XL U1856 ( .A0N(n1000), .A1N(n1855), .B0(n1602), .Y(n618) );
  NAND2XL U1857 ( .A(n2027), .B(iq_weight[1]), .Y(n1602) );
  NAND2XL U1858 ( .A(n2027), .B(iq_weight[2]), .Y(n1798) );
  NAND2XL U1859 ( .A(n2027), .B(eq_weight[0]), .Y(n1605) );
  NAND2XL U1860 ( .A(n2027), .B(eq_weight[1]), .Y(n1799) );
  OAI2BB1XL U1861 ( .A0N(w_eq[2]), .A1N(n1855), .B0(n1606), .Y(n622) );
  NAND2XL U1862 ( .A(n2027), .B(eq_weight[2]), .Y(n1606) );
  NAND2XL U1863 ( .A(n2027), .B(size_weight[0]), .Y(n1601) );
  AOI2BB1XL U1864 ( .A0N(n1852), .A1N(n1851), .B0(n1850), .Y(n1853) );
  OAI22XL U1865 ( .A0(n1729), .A1(n1728), .B0(n1727), .B1(n1726), .Y(n983) );
  AOI211XL U1866 ( .A0(n1778), .A1(n1725), .B0(n1724), .C0(n1723), .Y(n1726)
         );
  AOI2BB1XL U1867 ( .A0N(n1720), .A1N(n1753), .B0(n1719), .Y(n1729) );
  MX2XL U1868 ( .A(dora_size[33]), .B(dora_size[25]), .S0(n989), .Y(n877) );
  MX2XL U1869 ( .A(dora_iq[39]), .B(dora_iq[31]), .S0(n994), .Y(n887) );
  MX2XL U1870 ( .A(dora_iq[38]), .B(dora_iq[30]), .S0(n995), .Y(n892) );
  MX2XL U1871 ( .A(dora_iq[37]), .B(dora_iq[29]), .S0(n1859), .Y(n897) );
  MX2XL U1872 ( .A(dora_iq[36]), .B(dora_iq[28]), .S0(n995), .Y(n902) );
  INVXL U1873 ( .A(dora_eq[29]), .Y(n1027) );
  NAND2X1 U1874 ( .A(n990), .B(dora_eq[37]), .Y(n1026) );
  MX2XL U1875 ( .A(dora_eq[36]), .B(dora_eq[28]), .S0(n1858), .Y(n942) );
  MX2XL U1876 ( .A(dora_eq[33]), .B(dora_eq[25]), .S0(n2023), .Y(n957) );
  OAI21XL U1877 ( .A0(n1646), .A1(n1648), .B0(n1645), .Y(n806) );
  INVXL U1878 ( .A(cmp1_op[1]), .Y(n1646) );
  AOI22XL U1879 ( .A0(n1766), .A1(m1_out[1]), .B0(n1764), .B1(dora_score3[1]), 
        .Y(n1645) );
  OAI211XL U1880 ( .A0(n1702), .A1(n1670), .B0(n1669), .C0(n1668), .Y(n832) );
  AOI22XL U1881 ( .A0(n1800), .A1(dora_score3[1]), .B0(n1698), .B1(m1_out[1]), 
        .Y(n1669) );
  OAI222XL U1882 ( .A0(n1835), .A1(n1624), .B0(n1648), .B1(n1623), .C0(n1625), 
        .C1(n1818), .Y(n803) );
  OAI222XL U1883 ( .A0(n1835), .A1(n1627), .B0(n1648), .B1(n1626), .C0(n1625), 
        .C1(n1810), .Y(n807) );
  MXI2XL U1884 ( .A(n1812), .B(n1734), .S0(n1782), .Y(n844) );
  MXI2XL U1885 ( .A(n1805), .B(n1735), .S0(n1782), .Y(n845) );
  MXI2XL U1886 ( .A(n1810), .B(n1736), .S0(n1782), .Y(n846) );
  OAI211XL U1887 ( .A0(n1818), .A1(n1831), .B0(n1817), .C0(n1816), .Y(n816) );
  NAND2XL U1888 ( .A(n1828), .B(cmp1_op[17]), .Y(n1817) );
  OAI211XL U1889 ( .A0(n1807), .A1(n1459), .B0(n1691), .C0(n1458), .Y(n817) );
  OAI211XL U1890 ( .A0(n1807), .A1(n1457), .B0(n1699), .C0(n1456), .Y(n818) );
  OAI211XL U1891 ( .A0(n1807), .A1(n1455), .B0(n1668), .C0(n1454), .Y(n819) );
  OAI211XL U1892 ( .A0(n1810), .A1(n1831), .B0(n1809), .C0(n1808), .Y(n820) );
  NAND2XL U1893 ( .A(n1828), .B(cmp1_op[13]), .Y(n1809) );
  NOR2X2 U1894 ( .A(n1291), .B(n1290), .Y(n1400) );
  NAND2X2 U1895 ( .A(n1329), .B(n1010), .Y(n1498) );
  INVXL U1896 ( .A(cmp1_op[10]), .Y(n1322) );
  NAND2X2 U1897 ( .A(in_valid), .B(n1298), .Y(n1515) );
  INVXL U1898 ( .A(n999), .Y(n1127) );
  NOR2X1 U1899 ( .A(n1209), .B(n1208), .Y(n999) );
  AND2X4 U1900 ( .A(n1000), .B(dora_iq[34]), .Y(n1206) );
  NAND2X1 U1901 ( .A(n1398), .B(n1391), .Y(n1023) );
  OAI21X4 U1902 ( .A0(n1396), .A1(n1405), .B0(n1406), .Y(n1398) );
  BUFX1 U1903 ( .A(w_iq[1]), .Y(n1000) );
  NAND2X4 U1904 ( .A(n1001), .B(n1383), .Y(n1022) );
  NOR2X4 U1905 ( .A(n1387), .B(n1384), .Y(n1001) );
  AND2X4 U1906 ( .A(w_eq[0]), .B(dora_eq[36]), .Y(n1121) );
  OAI21X4 U1907 ( .A0(n1387), .A1(n1385), .B0(n1007), .Y(n1004) );
  NAND2X4 U1908 ( .A(n1282), .B(n1281), .Y(n1385) );
  NOR2X4 U1909 ( .A(n1003), .B(n1283), .Y(n1387) );
  XOR2X4 U1910 ( .A(n1176), .B(n1175), .Y(n1003) );
  INVX4 U1911 ( .A(n1004), .Y(n1021) );
  NAND2X2 U1912 ( .A(dora_eq[34]), .B(w_eq[2]), .Y(n1005) );
  OAI2BB1X2 U1913 ( .A0N(n1006), .A1N(n1079), .B0(n1078), .Y(n1098) );
  NOR2X2 U1914 ( .A(n1405), .B(n1395), .Y(n1399) );
  NAND3X2 U1915 ( .A(n1034), .B(n1033), .C(n1031), .Y(n1409) );
  NOR2X4 U1916 ( .A(n1009), .B(n1336), .Y(n1836) );
  NOR2X4 U1917 ( .A(n1498), .B(n1337), .Y(n1009) );
  NOR2X4 U1918 ( .A(n1796), .B(n1381), .Y(n1795) );
  NAND2X4 U1919 ( .A(n1354), .B(n1353), .Y(n1796) );
  NAND2X4 U1920 ( .A(n1515), .B(n1775), .Y(n1381) );
  NAND2X2 U1921 ( .A(n1404), .B(n1017), .Y(n1030) );
  NAND3X2 U1922 ( .A(n1017), .B(n1399), .C(n1391), .Y(n1024) );
  NAND3X2 U1923 ( .A(n1399), .B(n1017), .C(n1035), .Y(n1034) );
  AOI21X1 U1924 ( .A0(n1017), .A1(n1399), .B0(n1398), .Y(n1403) );
  CLKINVX2 U1925 ( .A(n1017), .Y(n1016) );
  NAND2X4 U1926 ( .A(n1021), .B(n1022), .Y(n1017) );
  OAI21X2 U1927 ( .A0(n1107), .A1(n1106), .B0(n1105), .Y(n1103) );
  NAND2X1 U1928 ( .A(n1084), .B(n1019), .Y(n1044) );
  INVX1 U1929 ( .A(n1025), .Y(n1019) );
  XOR3X2 U1930 ( .A(n1025), .B(n1084), .C(n1020), .Y(n1096) );
  NOR2X4 U1931 ( .A(n1104), .B(n1288), .Y(n1405) );
  OAI21X4 U1932 ( .A0(n1280), .A1(n1413), .B0(n1416), .Y(n1383) );
  NAND3X2 U1933 ( .A(n1024), .B(n1023), .C(n1401), .Y(n1036) );
  NAND2X1 U1934 ( .A(dora_eq[37]), .B(w_eq[1]), .Y(n1025) );
  NOR2X2 U1935 ( .A(n1612), .B(n1583), .Y(n1451) );
  INVXL U1936 ( .A(cmp1_op[19]), .Y(n1310) );
  INVX2 U1937 ( .A(cmp1_op[14]), .Y(n1455) );
  INVXL U1938 ( .A(cmp1_op[3]), .Y(n1303) );
  INVXL U1939 ( .A(cmp1_op[5]), .Y(n1306) );
  INVX1 U1940 ( .A(n1318), .Y(n1317) );
  OAI22XL U1941 ( .A0(cmp2_op[13]), .A1(n1736), .B0(n1735), .B1(cmp2_op[14]), 
        .Y(n1475) );
  NOR2X1 U1942 ( .A(n1189), .B(n1234), .Y(n1235) );
  OAI22XL U1943 ( .A0(n1480), .A1(n1479), .B0(cmp2_op[5]), .B1(n1690), .Y(
        n1481) );
  INVXL U1944 ( .A(afifo_wptr_full_m0_wgraynext[0]), .Y(n1977) );
  XOR2XL U1945 ( .A(n1635), .B(n1634), .Y(n1577) );
  INVXL U1946 ( .A(n1387), .Y(n1388) );
  INVXL U1947 ( .A(n1995), .Y(n1597) );
  INVX2 U1948 ( .A(cmp1_op[4]), .Y(n1623) );
  MX2X1 U1949 ( .A(dora_id[24]), .B(dora_id[19]), .S0(n989), .Y(n770) );
  MX2X1 U1950 ( .A(dora_iq[10]), .B(dora_iq[2]), .S0(n989), .Y(n915) );
  NOR2X1 U1953 ( .A(n1186), .B(n1039), .Y(n1059) );
  NOR2X4 U1954 ( .A(n1151), .B(n1053), .Y(n1047) );
  INVX2 U1955 ( .A(dora_iq[39]), .Y(n1154) );
  INVX2 U1956 ( .A(w_size[1]), .Y(n1229) );
  NOR2X1 U1957 ( .A(n1229), .B(n1152), .Y(n1150) );
  NOR2X1 U1958 ( .A(n1186), .B(n1043), .Y(n1148) );
  NOR2X1 U1959 ( .A(n1151), .B(n1051), .Y(n1159) );
  AND2X2 U1960 ( .A(dora_iq[38]), .B(w_iq[2]), .Y(n1156) );
  NOR2X1 U1961 ( .A(n1226), .B(n1153), .Y(n1155) );
  INVX2 U1962 ( .A(dora_iq[37]), .Y(n1080) );
  NOR2X2 U1963 ( .A(n1188), .B(n1080), .Y(n1050) );
  NOR2X1 U1964 ( .A(n1229), .B(n1051), .Y(n1049) );
  XOR3X2 U1965 ( .A(n1159), .B(n1157), .C(n1158), .Y(n1147) );
  NOR2X2 U1966 ( .A(n1265), .B(n1043), .Y(n1084) );
  ADDFHX4 U1967 ( .A(n1048), .B(n1047), .CI(n1046), .CO(n1143), .S(n1071) );
  XOR3X2 U1968 ( .A(n1038), .B(n1050), .C(n1049), .Y(n1070) );
  NOR2X2 U1969 ( .A(n1228), .B(n1051), .Y(n1068) );
  INVXL U1970 ( .A(n1069), .Y(n1054) );
  OAI2BB1X2 U1971 ( .A0N(n1056), .A1N(n1067), .B0(n1055), .Y(n1075) );
  NAND2X1 U1972 ( .A(w_iq[1]), .B(dora_iq[37]), .Y(n1057) );
  INVX2 U1973 ( .A(n1057), .Y(n1066) );
  INVX2 U1974 ( .A(dora_size[36]), .Y(n1089) );
  NOR2X4 U1975 ( .A(n1151), .B(n1089), .Y(n1065) );
  NOR2X1 U1976 ( .A(DP_OP_81J1_122_2750_n288), .B(n1058), .Y(n1064) );
  ADDFHX1 U1977 ( .A(n988), .B(n1060), .CI(n1059), .CO(n1144), .S(n1073) );
  AND2X2 U1978 ( .A(w_eq[0]), .B(dora_eq[37]), .Y(n1108) );
  INVX2 U1979 ( .A(n1108), .Y(n1063) );
  NAND2X4 U1980 ( .A(w_eq[1]), .B(dora_eq[36]), .Y(n1110) );
  INVXL U1981 ( .A(n1110), .Y(n1061) );
  OAI21X2 U1982 ( .A0(n1108), .A1(n1061), .B0(n1109), .Y(n1062) );
  ADDFHX4 U1983 ( .A(n1066), .B(n1065), .CI(n1064), .CO(n1074), .S(n1094) );
  XNOR3X2 U1984 ( .A(n1069), .B(n1068), .C(n1067), .Y(n1093) );
  ADDFHX4 U1985 ( .A(n1072), .B(n1071), .CI(n1070), .CO(n1146), .S(n1100) );
  ADDFHX2 U1986 ( .A(n1075), .B(n1074), .CI(n1073), .CO(n1145), .S(n1099) );
  INVX2 U1987 ( .A(dora_size[35]), .Y(n1125) );
  NOR2X1 U1988 ( .A(DP_OP_81J1_122_2750_n288), .B(n1080), .Y(n1113) );
  OAI21X1 U1989 ( .A0(n1114), .A1(n1115), .B0(n1113), .Y(n1082) );
  AND2X4 U1990 ( .A(w_iq[2]), .B(dora_iq[34]), .Y(n1130) );
  INVX2 U1991 ( .A(dora_iq[35]), .Y(n1183) );
  NOR2X4 U1992 ( .A(n1189), .B(n1183), .Y(n1133) );
  NOR2X1 U1993 ( .A(n1228), .B(n1089), .Y(n1132) );
  ADDFHX4 U1994 ( .A(n1095), .B(n1094), .CI(n1093), .CO(n1101), .S(n1138) );
  ADDFHX2 U1995 ( .A(n1098), .B(n1097), .CI(n1096), .CO(n1107), .S(n1137) );
  ADDFHX4 U1996 ( .A(n1101), .B(n1100), .CI(n1099), .CO(n1286), .S(n1105) );
  NAND2X1 U1997 ( .A(n1107), .B(n1106), .Y(n1102) );
  XNOR3X2 U1998 ( .A(n1110), .B(n1109), .C(n1108), .Y(n1179) );
  ADDFHX4 U1999 ( .A(n1118), .B(n1117), .CI(n1116), .CO(n1139), .S(n1193) );
  ADDHX2 U2000 ( .A(n1121), .B(n1120), .CO(n1118), .S(n1181) );
  AND2X2 U2001 ( .A(w_eq[1]), .B(dora_eq[34]), .Y(n1201) );
  OAI21XL U2002 ( .A0(n1201), .A1(n1203), .B0(n1202), .Y(n1124) );
  NOR2X1 U2003 ( .A(n1229), .B(DP_OP_81J1_122_2750_n259), .Y(n1211) );
  NOR2X2 U2004 ( .A(n1228), .B(n1125), .Y(n1209) );
  AND2X2 U2005 ( .A(w_iq[2]), .B(dora_iq[33]), .Y(n1208) );
  OAI2BB1X2 U2006 ( .A0N(n1211), .A1N(n1127), .B0(n1126), .Y(n1200) );
  XOR2X4 U2007 ( .A(n1131), .B(n1130), .Y(n1199) );
  XNOR3X2 U2008 ( .A(n1134), .B(n1133), .C(n1132), .Y(n1198) );
  NAND2X1 U2009 ( .A(n1193), .B(n1194), .Y(n1135) );
  NAND2X4 U2010 ( .A(n1136), .B(n1135), .Y(n1174) );
  ADDFHX4 U2011 ( .A(n1139), .B(n1138), .CI(n1137), .CO(n1106), .S(n1175) );
  OAI21X1 U2012 ( .A0(n1173), .A1(n1174), .B0(n1175), .Y(n1141) );
  ADDFHX4 U2013 ( .A(n1147), .B(n1146), .CI(n1145), .CO(n1163), .S(n1285) );
  ADDHX1 U2014 ( .A(n1156), .B(n1155), .CO(n1167), .S(n1157) );
  OAI21XL U2015 ( .A0(n1157), .A1(n1159), .B0(n1158), .Y(n1161) );
  NAND2XL U2016 ( .A(n1159), .B(n1157), .Y(n1160) );
  ADDHX1 U2017 ( .A(n1166), .B(n1165), .CO(n1296), .S(n1168) );
  XOR2X4 U2018 ( .A(n1174), .B(n1173), .Y(n1176) );
  ADDFHX4 U2019 ( .A(n1179), .B(n1178), .CI(n1177), .CO(n1173), .S(n1197) );
  ADDFHX4 U2020 ( .A(n1182), .B(n1181), .CI(n1180), .CO(n1194), .S(n1216) );
  NOR2X2 U2021 ( .A(n1226), .B(n1233), .Y(n1225) );
  INVX2 U2022 ( .A(dora_eq[34]), .Y(n1184) );
  CLKINVX2 U2023 ( .A(n1185), .Y(n1240) );
  INVX2 U2024 ( .A(dora_eq[32]), .Y(n1264) );
  INVX2 U2025 ( .A(dora_size[33]), .Y(n1227) );
  NOR2X2 U2026 ( .A(DP_OP_81J1_122_2750_n288), .B(n1187), .Y(n1237) );
  NOR2X4 U2027 ( .A(n1188), .B(n1262), .Y(n1236) );
  NAND2X2 U2028 ( .A(n1191), .B(n1190), .Y(n1196) );
  XOR3X2 U2029 ( .A(n1194), .B(n1193), .C(n1192), .Y(n1195) );
  ADDFHX4 U2030 ( .A(n1197), .B(n1196), .CI(n1195), .CO(n1283), .S(n1282) );
  ADDFHX4 U2031 ( .A(n1200), .B(n1199), .CI(n1198), .CO(n1192), .S(n1220) );
  XOR3X2 U2032 ( .A(n1203), .B(n1202), .C(n1201), .Y(n1212) );
  INVX2 U2033 ( .A(n1246), .Y(n1207) );
  NAND2X1 U2034 ( .A(n1207), .B(n1245), .Y(n1214) );
  XOR2X1 U2035 ( .A(n1209), .B(n1208), .Y(n1210) );
  XOR2X1 U2036 ( .A(n1211), .B(n1210), .Y(n1244) );
  OAI2BB1X4 U2037 ( .A0N(n1214), .A1N(n1244), .B0(n1213), .Y(n1221) );
  NOR2X4 U2038 ( .A(n1282), .B(n1281), .Y(n1384) );
  XOR2X4 U2039 ( .A(n1221), .B(n1220), .Y(n1223) );
  ADDHX1 U2040 ( .A(n1225), .B(n1224), .CO(n1232), .S(n1253) );
  ADDFHX4 U2041 ( .A(n1232), .B(n1231), .CI(n1230), .CO(n1215), .S(n1242) );
  NOR2X4 U2042 ( .A(n1265), .B(n1233), .Y(n1261) );
  AND2X2 U2043 ( .A(w_iq[1]), .B(dora_iq[32]), .Y(n1260) );
  ADDFHX4 U2044 ( .A(n1237), .B(n1236), .CI(n1235), .CO(n1230), .S(n1250) );
  ADDFHX4 U2045 ( .A(n1240), .B(n1239), .CI(n1238), .CO(n1231), .S(n1249) );
  CLKINVX3 U2046 ( .A(n1278), .Y(n1248) );
  XNOR3X2 U2047 ( .A(n1246), .B(n1245), .C(n1244), .Y(n1277) );
  INVX2 U2048 ( .A(n1277), .Y(n1247) );
  NAND2X4 U2049 ( .A(n1248), .B(n1247), .Y(n1419) );
  ADDFHX2 U2050 ( .A(n1251), .B(n1250), .CI(n1249), .CO(n1241), .S(n1274) );
  INVXL U2051 ( .A(n1430), .Y(n1268) );
  INVX2 U2052 ( .A(n1276), .Y(n1421) );
  NAND2X2 U2053 ( .A(n1278), .B(n1277), .Y(n1420) );
  AOI21X4 U2054 ( .A0(n1419), .A1(n1421), .B0(n1279), .Y(n1413) );
  XOR3X2 U2055 ( .A(n1287), .B(n1286), .C(n1285), .Y(n1289) );
  NAND2X2 U2056 ( .A(n1289), .B(n1288), .Y(n1406) );
  NAND2X1 U2057 ( .A(n1291), .B(n1290), .Y(n1401) );
  NAND3BX1 U2058 ( .AN(current_state[1]), .B(n1774), .C(current_state[0]), .Y(
        n1775) );
  INVXL U2059 ( .A(cmp1_op[23]), .Y(n1471) );
  INVX3 U2060 ( .A(cmp1_op[0]), .Y(n1626) );
  NOR2X2 U2061 ( .A(n1626), .B(cmp1_op[13]), .Y(n1299) );
  INVX2 U2062 ( .A(cmp1_op[15]), .Y(n1457) );
  AOI22X1 U2063 ( .A0(cmp1_op[1]), .A1(n1455), .B0(n1457), .B1(cmp1_op[2]), 
        .Y(n1301) );
  INVXL U2064 ( .A(cmp1_op[16]), .Y(n1459) );
  OAI22X1 U2065 ( .A0(cmp1_op[3]), .A1(n1459), .B0(n1457), .B1(cmp1_op[2]), 
        .Y(n1300) );
  AOI21X2 U2066 ( .A0(n1302), .A1(n1301), .B0(n1300), .Y(n1305) );
  OAI22X1 U2067 ( .A0(cmp1_op[17]), .A1(n1623), .B0(n1303), .B1(cmp1_op[16]), 
        .Y(n1304) );
  AOI2BB2X4 U2068 ( .B0(cmp1_op[17]), .B1(n1623), .A0N(n1305), .A1N(n1304), 
        .Y(n1309) );
  OAI21X4 U2069 ( .A0(n1309), .A1(n1308), .B0(n1307), .Y(n1312) );
  NAND2X4 U2070 ( .A(n1312), .B(n1311), .Y(n1315) );
  NAND3X1 U2071 ( .A(n1317), .B(n1316), .C(cmp1_op[9]), .Y(n1321) );
  NOR2X1 U2072 ( .A(n1319), .B(n1318), .Y(n1320) );
  INVXL U2073 ( .A(cmp1_op[11]), .Y(n1330) );
  INVXL U2074 ( .A(cmp1_op[12]), .Y(n1331) );
  INVXL U2075 ( .A(cmp1_op[24]), .Y(n1332) );
  OAI2BB1X1 U2076 ( .A0N(cmp1_op[12]), .A1N(n1335), .B0(n1334), .Y(n1336) );
  INVXL U2077 ( .A(current_state[1]), .Y(n1338) );
  NOR2X1 U2078 ( .A(n1338), .B(cnt[3]), .Y(n1340) );
  INVXL U2079 ( .A(current_state[0]), .Y(n1344) );
  NAND2X4 U2080 ( .A(n1347), .B(n1346), .Y(n1784) );
  MX2X1 U2081 ( .A(dora_iq[35]), .B(dora_iq[27]), .S0(n2023), .Y(n907) );
  AOI21X1 U2082 ( .A0(n1351), .A1(n1733), .B0(n1350), .Y(n1352) );
  NOR2X1 U2083 ( .A(n1850), .B(n1777), .Y(n1353) );
  BUFX4 U2084 ( .A(n1381), .Y(n1794) );
  AOI222X4 U2085 ( .A0(n1796), .A1(dora_size[36]), .B0(dora_size[4]), .B1(n992), .C0(n1794), .C1(size[4]), .Y(n1359) );
  AOI222X4 U2086 ( .A0(n1796), .A1(dora_iq[37]), .B0(dora_iq[5]), .B1(n992), 
        .C0(n1794), .C1(iq_score[5]), .Y(n1366) );
  AOI222X4 U2087 ( .A0(n1796), .A1(dora_eq[37]), .B0(dora_eq[5]), .B1(n992), 
        .C0(n1381), .C1(eq_score[5]), .Y(n1373) );
  AOI222X4 U2088 ( .A0(n1796), .A1(dora_id[20]), .B0(dora_id[0]), .B1(n992), 
        .C0(n1381), .C1(doraemon_id[0]), .Y(n1378) );
  INVX2 U2089 ( .A(n1378), .Y(n793) );
  OAI21X1 U2090 ( .A0(n1412), .A1(n1384), .B0(n1386), .Y(n1390) );
  XNOR2X1 U2091 ( .A(n1390), .B(n1389), .Y(N241) );
  INVX2 U2092 ( .A(n1400), .Y(n1391) );
  NAND2X1 U2093 ( .A(n1404), .B(n1002), .Y(n1397) );
  XOR2X1 U2094 ( .A(n1403), .B(n1402), .Y(N244) );
  XNOR2X2 U2095 ( .A(n1409), .B(n1408), .Y(N246) );
  NAND2X1 U2096 ( .A(n1420), .B(n1419), .Y(n1422) );
  XNOR2XL U2097 ( .A(n1422), .B(n1421), .Y(N238) );
  NAND2X1 U2098 ( .A(n1424), .B(n1423), .Y(n1426) );
  INVXL U2099 ( .A(n1427), .Y(n1429) );
  NAND2XL U2100 ( .A(n1429), .B(n1428), .Y(n1431) );
  XNOR2XL U2101 ( .A(n1434), .B(n1433), .Y(N236) );
  NAND2X1 U2102 ( .A(n1625), .B(n1835), .Y(n1648) );
  AOI222XL U2103 ( .A0(n1766), .A1(m1_out[2]), .B0(cmp1_op[2]), .B1(n1765), 
        .C0(n1764), .C1(dora_score3[2]), .Y(n1436) );
  INVXL U2104 ( .A(n1436), .Y(n805) );
  AOI222XL U2105 ( .A0(n1766), .A1(m1_out[3]), .B0(cmp1_op[3]), .B1(n1765), 
        .C0(n1764), .C1(dora_score3[3]), .Y(n1437) );
  INVXL U2106 ( .A(n1437), .Y(n804) );
  INVXL U2107 ( .A(n1975), .Y(afifo_wptr_full_m0_wgraynext[1]) );
  BUFX20 U2108 ( .A(n2029), .Y(out_valid) );
  NAND3XL U2109 ( .A(af_rinc), .B(afifo_raddr[0]), .C(n987), .Y(n1443) );
  INVXL U2110 ( .A(afifo_raddr[1]), .Y(n1865) );
  AOI21XL U2111 ( .A0(n1443), .A1(n1865), .B0(n1439), .Y(
        afifo_rptr_empty_m0_rbinnext[1]) );
  NAND2XL U2112 ( .A(afifo_raddr[1]), .B(afifo_raddr[2]), .Y(n1869) );
  INVXL U2113 ( .A(afifo_rptr_empty_m0_rbinnext[2]), .Y(n1442) );
  INVXL U2114 ( .A(afifo_rptr_empty_m0_rbinnext[1]), .Y(n1446) );
  OAI22XL U2115 ( .A0(afifo_rptr_empty_m0_rbinnext[1]), .A1(n1442), .B0(n1446), 
        .B1(afifo_raddr[2]), .Y(afifo_rptr_empty_m0_rgraynext[1]) );
  NAND2XL U2116 ( .A(n1441), .B(afifo_raddr[3]), .Y(n1447) );
  OAI21XL U2117 ( .A0(n1441), .A1(afifo_raddr[3]), .B0(n1447), .Y(n1449) );
  AOI22XL U2118 ( .A0(afifo_rptr_empty_m0_rbinnext[2]), .A1(afifo_raddr[3]), 
        .B0(n1449), .B1(n1442), .Y(afifo_rptr_empty_m0_rgraynext[2]) );
  NAND2XL U2119 ( .A(af_rinc), .B(n987), .Y(n1445) );
  INVXL U2120 ( .A(afifo_raddr[0]), .Y(n1957) );
  INVXL U2121 ( .A(n1443), .Y(n1444) );
  AOI21XL U2122 ( .A0(n1445), .A1(n1957), .B0(n1444), .Y(
        afifo_rptr_empty_m0_rbinnext[0]) );
  MXI2XL U2123 ( .A(n1446), .B(afifo_raddr[1]), .S0(
        afifo_rptr_empty_m0_rbinnext[0]), .Y(afifo_rptr_empty_m0_rgraynext[0])
         );
  INVXL U2124 ( .A(n1449), .Y(afifo_rptr_empty_m0_rbinnext[3]) );
  INVXL U2125 ( .A(afifo_rptr[4]), .Y(n1448) );
  MXI2XL U2126 ( .A(afifo_rptr[4]), .B(n1448), .S0(n1447), .Y(
        afifo_rptr_empty_m0_rbinnext[4]) );
  INVXL U2127 ( .A(afifo_rptr_empty_m0_rbinnext[4]), .Y(n1987) );
  AOI22XL U2128 ( .A0(afifo_rptr_empty_m0_rbinnext[3]), .A1(afifo_rptr[4]), 
        .B0(n1987), .B1(n1449), .Y(afifo_rptr_empty_m0_rgraynext[3]) );
  MX2XL U2129 ( .A(dora_size[38]), .B(dora_size[30]), .S0(n994), .Y(n852) );
  MX2XL U2130 ( .A(dora_size[39]), .B(dora_size[31]), .S0(n2023), .Y(n847) );
  BUFX20 U2131 ( .A(n2035), .Y(out[2]) );
  BUFX20 U2132 ( .A(n2037), .Y(out[0]) );
  BUFX20 U2133 ( .A(n2031), .Y(out[6]) );
  BUFX20 U2134 ( .A(n2033), .Y(out[4]) );
  BUFX20 U2135 ( .A(n2036), .Y(out[1]) );
  BUFX20 U2136 ( .A(n2034), .Y(out[3]) );
  BUFX20 U2137 ( .A(n2030), .Y(out[7]) );
  BUFX20 U2138 ( .A(n2032), .Y(out[5]) );
  NAND2X1 U2139 ( .A(n1580), .B(afifo_waddr[3]), .Y(n1612) );
  NAND2XL U2140 ( .A(n1852), .B(m1_out[1]), .Y(n1454) );
  NAND2XL U2141 ( .A(n1852), .B(m1_out[2]), .Y(n1456) );
  NAND2XL U2142 ( .A(n1852), .B(m1_out[3]), .Y(n1458) );
  INVXL U2143 ( .A(cmp1_op[18]), .Y(n1461) );
  NAND2XL U2144 ( .A(n1852), .B(m1_out[5]), .Y(n1460) );
  NAND2XL U2145 ( .A(n1852), .B(m1_out[7]), .Y(n1462) );
  NAND2XL U2146 ( .A(n1852), .B(m1_out[9]), .Y(n1464) );
  NAND2XL U2147 ( .A(n1852), .B(m1_out[6]), .Y(n1466) );
  NAND2XL U2148 ( .A(n1852), .B(m1_out[8]), .Y(n1467) );
  INVXL U2149 ( .A(cmp1_op[25]), .Y(n1500) );
  NAND2XL U2150 ( .A(n1852), .B(m1_out[12]), .Y(n1469) );
  NAND2XL U2151 ( .A(n1852), .B(m1_out[10]), .Y(n1470) );
  INVXL U2152 ( .A(cmp2_op[10]), .Y(n1783) );
  AOI22XL U2153 ( .A0(cmp2_op[15]), .A1(n1734), .B0(n1735), .B1(cmp2_op[14]), 
        .Y(n1474) );
  NAND2XL U2154 ( .A(n1745), .B(cmp2_op[16]), .Y(n1477) );
  OAI22XL U2155 ( .A0(cmp2_op[16]), .A1(n1745), .B0(n1741), .B1(cmp2_op[17]), 
        .Y(n1476) );
  NAND2XL U2156 ( .A(n1741), .B(cmp2_op[17]), .Y(n1479) );
  INVXL U2157 ( .A(cmp2_op[18]), .Y(n1690) );
  INVXL U2158 ( .A(cmp2_op[6]), .Y(n1746) );
  NAND2XL U2159 ( .A(n1746), .B(cmp2_op[19]), .Y(n1483) );
  INVXL U2160 ( .A(cmp2_op[20]), .Y(n1687) );
  AOI22XL U2161 ( .A0(n1484), .A1(n1483), .B0(cmp2_op[7]), .B1(n1687), .Y(
        n1493) );
  INVXL U2162 ( .A(cmp2_op[9]), .Y(n1743) );
  INVXL U2163 ( .A(n1488), .Y(n1492) );
  INVXL U2164 ( .A(cmp2_op[21]), .Y(n1684) );
  OAI22XL U2165 ( .A0(cmp2_op[8]), .A1(n1684), .B0(n1687), .B1(cmp2_op[7]), 
        .Y(n1491) );
  INVXL U2166 ( .A(cmp2_op[8]), .Y(n1748) );
  OAI22XL U2167 ( .A0(cmp2_op[22]), .A1(n1743), .B0(n1783), .B1(cmp2_op[23]), 
        .Y(n1487) );
  INVXL U2168 ( .A(cmp2_op[12]), .Y(n1742) );
  INVXL U2169 ( .A(cmp2_op[11]), .Y(n1485) );
  INVXL U2170 ( .A(n1499), .Y(n1503) );
  NAND2XL U2171 ( .A(n1500), .B(cmp1_op[12]), .Y(n1501) );
  NAND3XL U2172 ( .A(cmp2_out), .B(cmp_rst2[0]), .C(cmp_rst2[1]), .Y(n1507) );
  INVXL U2173 ( .A(n1856), .Y(n1512) );
  NAND2XL U2174 ( .A(n1850), .B(dora_id[24]), .Y(n1517) );
  NAND2XL U2175 ( .A(n1850), .B(dora_id[20]), .Y(n1518) );
  NAND2XL U2176 ( .A(n1850), .B(dora_id[23]), .Y(n1519) );
  NAND2XL U2177 ( .A(n1850), .B(dora_id[21]), .Y(n1520) );
  NAND2XL U2178 ( .A(n1850), .B(dora_id[22]), .Y(n1521) );
  INVXL U2179 ( .A(stopmachine[1]), .Y(n1522) );
  XNOR2XL U2180 ( .A(n1522), .B(stopmachine[0]), .Y(n1524) );
  NAND2XL U2181 ( .A(n1524), .B(n1969), .Y(n1525) );
  INVXL U2182 ( .A(stopmachine[2]), .Y(n1527) );
  NAND2XL U2183 ( .A(n1528), .B(stopmachine[2]), .Y(n1530) );
  INVXL U2184 ( .A(stopmachine[3]), .Y(n1529) );
  NAND2XL U2185 ( .A(n1531), .B(n1969), .Y(n1532) );
  OAI2BB1XL U2186 ( .A0N(stopmachine[3]), .A1N(n1844), .B0(n1532), .Y(n977) );
  NAND2XL U2187 ( .A(n1545), .B(afifo_fifomem_m0_mem[101]), .Y(n1534) );
  NAND2XL U2188 ( .A(n1545), .B(afifo_fifomem_m0_mem[103]), .Y(n1535) );
  NAND2XL U2189 ( .A(n1547), .B(afifo_fifomem_m0_mem[85]), .Y(n1536) );
  NAND2XL U2190 ( .A(n1549), .B(afifo_fifomem_m0_mem[69]), .Y(n1539) );
  NAND2XL U2191 ( .A(n1547), .B(afifo_fifomem_m0_mem[87]), .Y(n1540) );
  NAND2XL U2192 ( .A(n1551), .B(afifo_fifomem_m0_mem[117]), .Y(n1542) );
  NAND2XL U2193 ( .A(n1549), .B(afifo_fifomem_m0_mem[71]), .Y(n1543) );
  NAND2XL U2194 ( .A(n1551), .B(afifo_fifomem_m0_mem[119]), .Y(n1544) );
  NAND2XL U2195 ( .A(n1545), .B(afifo_fifomem_m0_mem[102]), .Y(n1546) );
  NAND2XL U2196 ( .A(n1547), .B(afifo_fifomem_m0_mem[86]), .Y(n1548) );
  NAND2XL U2197 ( .A(n1549), .B(afifo_fifomem_m0_mem[70]), .Y(n1550) );
  NAND2XL U2198 ( .A(n1551), .B(afifo_fifomem_m0_mem[118]), .Y(n1552) );
  NAND2XL U2199 ( .A(n1558), .B(afifo_fifomem_m0_mem[53]), .Y(n1554) );
  NAND2XL U2200 ( .A(n1558), .B(afifo_fifomem_m0_mem[55]), .Y(n1555) );
  NAND2XL U2201 ( .A(n1560), .B(afifo_fifomem_m0_mem[5]), .Y(n1556) );
  NAND2XL U2202 ( .A(n1560), .B(afifo_fifomem_m0_mem[7]), .Y(n1557) );
  NAND2XL U2203 ( .A(n1558), .B(afifo_fifomem_m0_mem[54]), .Y(n1559) );
  NAND2XL U2204 ( .A(n1560), .B(afifo_fifomem_m0_mem[6]), .Y(n1561) );
  NAND2XL U2205 ( .A(n1567), .B(afifo_fifomem_m0_mem[37]), .Y(n1562) );
  NAND2XL U2206 ( .A(n1569), .B(afifo_fifomem_m0_mem[21]), .Y(n1564) );
  NAND2XL U2207 ( .A(n1569), .B(afifo_fifomem_m0_mem[23]), .Y(n1565) );
  NAND2XL U2208 ( .A(n1567), .B(afifo_fifomem_m0_mem[39]), .Y(n1566) );
  NAND2XL U2209 ( .A(n1567), .B(afifo_fifomem_m0_mem[38]), .Y(n1568) );
  NAND2XL U2210 ( .A(n1569), .B(afifo_fifomem_m0_mem[22]), .Y(n1570) );
  NAND2XL U2211 ( .A(n1973), .B(afifo_fifomem_m0_mem[125]), .Y(n1571) );
  NAND2XL U2212 ( .A(n1973), .B(afifo_fifomem_m0_mem[127]), .Y(n1572) );
  NAND2XL U2213 ( .A(n1973), .B(afifo_fifomem_m0_mem[126]), .Y(n1573) );
  NAND2XL U2214 ( .A(stopmachine[2]), .B(stopmachine[3]), .Y(n1575) );
  INVXL U2215 ( .A(stopmachine[4]), .Y(n1628) );
  INVXL U2216 ( .A(stopmachine[5]), .Y(n1630) );
  INVXL U2217 ( .A(stopmachine[6]), .Y(n1634) );
  NAND2XL U2218 ( .A(n1577), .B(n1969), .Y(n1578) );
  NAND2XL U2219 ( .A(n1588), .B(afifo_fifomem_m0_mem[13]), .Y(n1581) );
  NAND2XL U2220 ( .A(n1588), .B(afifo_fifomem_m0_mem[15]), .Y(n1582) );
  NAND2XL U2221 ( .A(n1590), .B(afifo_fifomem_m0_mem[61]), .Y(n1584) );
  NAND2XL U2222 ( .A(n1590), .B(afifo_fifomem_m0_mem[63]), .Y(n1587) );
  NAND2XL U2223 ( .A(n1588), .B(afifo_fifomem_m0_mem[14]), .Y(n1589) );
  NAND2XL U2224 ( .A(n1590), .B(afifo_fifomem_m0_mem[62]), .Y(n1591) );
  NAND2XL U2225 ( .A(n1597), .B(afifo_fifomem_m0_mem[29]), .Y(n1592) );
  NAND2XL U2226 ( .A(n1599), .B(afifo_fifomem_m0_mem[45]), .Y(n1594) );
  NAND2XL U2227 ( .A(n1597), .B(afifo_fifomem_m0_mem[31]), .Y(n1595) );
  NAND2XL U2228 ( .A(n1599), .B(afifo_fifomem_m0_mem[47]), .Y(n1596) );
  NAND2XL U2229 ( .A(n1597), .B(afifo_fifomem_m0_mem[30]), .Y(n1598) );
  NAND2XL U2230 ( .A(n1599), .B(afifo_fifomem_m0_mem[46]), .Y(n1600) );
  OAI2BB1X1 U2231 ( .A0N(w_size[0]), .A1N(n1855), .B0(n1601), .Y(n623) );
  OAI2BB1X1 U2232 ( .A0N(w_size[2]), .A1N(n1855), .B0(n1603), .Y(n616) );
  OAI2BB1X1 U2233 ( .A0N(w_size[1]), .A1N(n1855), .B0(n1604), .Y(n615) );
  OAI2BB1X1 U2234 ( .A0N(w_eq[0]), .A1N(n1855), .B0(n1605), .Y(n620) );
  NAND2XL U2235 ( .A(n1617), .B(afifo_fifomem_m0_mem[77]), .Y(n1608) );
  INVXL U2236 ( .A(n2005), .Y(n1621) );
  NAND2XL U2237 ( .A(n1621), .B(afifo_fifomem_m0_mem[109]), .Y(n1610) );
  NAND2XL U2238 ( .A(n1619), .B(afifo_fifomem_m0_mem[93]), .Y(n1613) );
  NAND2XL U2239 ( .A(n1617), .B(afifo_fifomem_m0_mem[79]), .Y(n1614) );
  NAND2XL U2240 ( .A(n1619), .B(afifo_fifomem_m0_mem[95]), .Y(n1615) );
  NAND2XL U2241 ( .A(n1621), .B(afifo_fifomem_m0_mem[111]), .Y(n1616) );
  NAND2XL U2242 ( .A(n1617), .B(afifo_fifomem_m0_mem[78]), .Y(n1618) );
  NAND2XL U2243 ( .A(n1619), .B(afifo_fifomem_m0_mem[94]), .Y(n1620) );
  NAND2XL U2244 ( .A(n1621), .B(afifo_fifomem_m0_mem[110]), .Y(n1622) );
  INVXL U2245 ( .A(dora_score3[4]), .Y(n1624) );
  INVXL U2246 ( .A(m1_out[4]), .Y(n1818) );
  INVXL U2247 ( .A(dora_score3[0]), .Y(n1627) );
  INVXL U2248 ( .A(m1_out[0]), .Y(n1810) );
  NAND2XL U2249 ( .A(n1632), .B(n1969), .Y(n1633) );
  INVXL U2250 ( .A(stopmachine[7]), .Y(n1637) );
  NAND2XL U2251 ( .A(n1778), .B(af_wdata[5]), .Y(n1756) );
  OAI21XL U2252 ( .A0(n1659), .A1(n1639), .B0(n1722), .Y(n1640) );
  INVXL U2253 ( .A(stopmachine[8]), .Y(n1650) );
  NAND2XL U2254 ( .A(n1643), .B(n1969), .Y(n1644) );
  NAND2XL U2255 ( .A(n1652), .B(n1969), .Y(n1653) );
  INVXL U2256 ( .A(cmp2_op[19]), .Y(n1657) );
  OAI2BB2XL U2257 ( .B0(n2028), .B1(n1756), .A0N(n1706), .A1N(n1723), .Y(n1664) );
  INVXL U2258 ( .A(cmp2_op[14]), .Y(n1670) );
  INVXL U2259 ( .A(cmp2_op[24]), .Y(n1672) );
  INVXL U2260 ( .A(cmp2_op[22]), .Y(n1675) );
  INVXL U2261 ( .A(cmp2_op[25]), .Y(n1678) );
  INVXL U2262 ( .A(cmp2_op[23]), .Y(n1681) );
  INVXL U2263 ( .A(cmp2_op[16]), .Y(n1693) );
  INVXL U2264 ( .A(cmp2_op[17]), .Y(n1695) );
  INVXL U2265 ( .A(cmp2_op[13]), .Y(n1697) );
  INVXL U2266 ( .A(cmp2_op[15]), .Y(n1701) );
  INVXL U2267 ( .A(m1_out[10]), .Y(n1788) );
  INVXL U2268 ( .A(m1_out[12]), .Y(n1834) );
  INVXL U2269 ( .A(m1_out[3]), .Y(n1814) );
  INVXL U2270 ( .A(m1_out[1]), .Y(n1805) );
  INVXL U2271 ( .A(m1_out[5]), .Y(n1820) );
  INVXL U2272 ( .A(m1_out[2]), .Y(n1812) );
  INVXL U2273 ( .A(m1_out[6]), .Y(n1747) );
  INVXL U2274 ( .A(m1_out[8]), .Y(n1822) );
  INVXL U2275 ( .A(m1_out[9]), .Y(n1825) );
  INVXL U2276 ( .A(n1732), .Y(n1730) );
  NAND2XL U2277 ( .A(n1730), .B(m1_out[7]), .Y(n1718) );
  NAND2XL U2278 ( .A(n1730), .B(m1_out[11]), .Y(n1731) );
  INVXL U2279 ( .A(n1782), .Y(n1738) );
  AOI222XL U2280 ( .A0(n1766), .A1(m1_out[10]), .B0(cmp1_op[10]), .B1(n1765), 
        .C0(n1764), .C1(dora_score3[10]), .Y(n1740) );
  INVXL U2281 ( .A(n1740), .Y(n797) );
  MX2XL U2282 ( .A(dora_eq[15]), .B(dora_eq[7]), .S0(n989), .Y(n930) );
  MX2XL U2283 ( .A(dora_size[14]), .B(dora_size[6]), .S0(n989), .Y(n855) );
  AOI222XL U2284 ( .A0(n1766), .A1(m1_out[9]), .B0(cmp1_op[9]), .B1(n1765), 
        .C0(n1764), .C1(dora_score3[9]), .Y(n1749) );
  INVXL U2285 ( .A(n1749), .Y(n798) );
  AOI222XL U2286 ( .A0(n1766), .A1(m1_out[12]), .B0(cmp1_op[12]), .B1(n1765), 
        .C0(n1764), .C1(dora_score3[12]), .Y(n1750) );
  INVXL U2287 ( .A(n1750), .Y(n795) );
  AOI222XL U2288 ( .A0(n1766), .A1(m1_out[11]), .B0(cmp1_op[11]), .B1(n1765), 
        .C0(n1764), .C1(dora_score3[11]), .Y(n1751) );
  INVXL U2289 ( .A(n1751), .Y(n796) );
  INVXL U2290 ( .A(n1752), .Y(n1760) );
  INVXL U2291 ( .A(af_wdata[5]), .Y(n1754) );
  NAND4XL U2292 ( .A(n1778), .B(af_wdata[6]), .C(n2028), .D(n1754), .Y(n1755)
         );
  OAI21XL U2293 ( .A0(n1756), .A1(af_wdata[6]), .B0(n1755), .Y(n1757) );
  AOI222XL U2294 ( .A0(n1766), .A1(m1_out[8]), .B0(cmp1_op[8]), .B1(n1765), 
        .C0(n1764), .C1(dora_score3[8]), .Y(n1762) );
  INVXL U2295 ( .A(n1762), .Y(n799) );
  AOI222XL U2296 ( .A0(n1766), .A1(m1_out[5]), .B0(cmp1_op[5]), .B1(n1765), 
        .C0(n1764), .C1(dora_score3[5]), .Y(n1763) );
  INVXL U2297 ( .A(n1763), .Y(n802) );
  AOI222XL U2298 ( .A0(n1766), .A1(m1_out[7]), .B0(cmp1_op[7]), .B1(n1765), 
        .C0(n1764), .C1(dora_score3[7]), .Y(n1767) );
  INVXL U2299 ( .A(n1767), .Y(n800) );
  NAND4XL U2300 ( .A(stopmachine[8]), .B(stopmachine[6]), .C(stopmachine[9]), 
        .D(stopmachine[5]), .Y(n1769) );
  NAND2XL U2301 ( .A(stopmachine[12]), .B(stopmachine[10]), .Y(n1768) );
  INVXL U2302 ( .A(stopmachine[0]), .Y(n1770) );
  NOR3XL U2303 ( .A(n1770), .B(stopmachine[2]), .C(stopmachine[4]), .Y(n1771)
         );
  AOI21XL U2304 ( .A0(n1856), .A1(n2025), .B0(n1861), .Y(n1779) );
  OAI21XL U2305 ( .A0(n1786), .A1(n1788), .B0(n1787), .Y(n633) );
  INVXL U2306 ( .A(n1790), .Y(n1791) );
  MX2XL U2307 ( .A(dora_size[35]), .B(dora_size[27]), .S0(n1860), .Y(n867) );
  MX2XL U2308 ( .A(dora_eq[34]), .B(dora_eq[26]), .S0(n994), .Y(n952) );
  MX2XL U2309 ( .A(dora_eq[32]), .B(dora_eq[24]), .S0(n994), .Y(n962) );
  OAI2BB1X1 U2310 ( .A0N(n1855), .A1N(w_eq[1]), .B0(n1799), .Y(n621) );
  NAND2XL U2311 ( .A(n1786), .B(dora_score2[6]), .Y(n1803) );
  INVXL U2312 ( .A(m1_out[11]), .Y(n1832) );
  MXI2XL U2313 ( .A(af_wdata[5]), .B(n1837), .S0(n1849), .Y(n1839) );
  XOR2XL U2314 ( .A(n1841), .B(stopmachine[12]), .Y(n1842) );
  INVXL U2315 ( .A(stopmachine[11]), .Y(n1847) );
  INVXL U2316 ( .A(n1849), .Y(n1854) );
  MX2X1 U2317 ( .A(dora_size[13]), .B(dora_size[5]), .S0(n2023), .Y(n860) );
  MX2X1 U2318 ( .A(dora_size[21]), .B(dora_size[13]), .S0(n1858), .Y(n859) );
  MX2XL U2319 ( .A(dora_size[37]), .B(dora_size[29]), .S0(n1858), .Y(n857) );
  MX2X1 U2320 ( .A(dora_size[12]), .B(dora_size[4]), .S0(n1860), .Y(n865) );
  MX2X1 U2321 ( .A(dora_size[20]), .B(dora_size[12]), .S0(n994), .Y(n864) );
  MX2X1 U2322 ( .A(dora_size[28]), .B(dora_size[20]), .S0(n995), .Y(n863) );
  MX2XL U2323 ( .A(dora_size[36]), .B(dora_size[28]), .S0(n994), .Y(n862) );
  MX2X1 U2324 ( .A(dora_size[11]), .B(dora_size[3]), .S0(n1859), .Y(n870) );
  MX2X1 U2325 ( .A(dora_size[19]), .B(dora_size[11]), .S0(n995), .Y(n869) );
  MX2X1 U2326 ( .A(dora_size[10]), .B(dora_size[2]), .S0(n1859), .Y(n875) );
  MX2X1 U2327 ( .A(dora_size[18]), .B(dora_size[10]), .S0(n2023), .Y(n874) );
  MX2X1 U2328 ( .A(dora_size[26]), .B(dora_size[18]), .S0(n989), .Y(n873) );
  MX2X1 U2329 ( .A(dora_iq[11]), .B(dora_iq[3]), .S0(n1857), .Y(n910) );
  MX2X1 U2330 ( .A(dora_iq[19]), .B(dora_iq[11]), .S0(n2023), .Y(n909) );
  MX2X1 U2331 ( .A(dora_iq[27]), .B(dora_iq[19]), .S0(n1858), .Y(n908) );
  MX2X1 U2332 ( .A(dora_iq[18]), .B(dora_iq[10]), .S0(n1859), .Y(n914) );
  MX2X1 U2333 ( .A(dora_iq[26]), .B(dora_iq[18]), .S0(n1857), .Y(n913) );
  MX2X1 U2334 ( .A(dora_iq[34]), .B(dora_iq[26]), .S0(n1860), .Y(n912) );
  MX2X1 U2335 ( .A(dora_iq[9]), .B(dora_iq[1]), .S0(n989), .Y(n920) );
  MX2X1 U2336 ( .A(dora_iq[17]), .B(dora_iq[9]), .S0(n1860), .Y(n919) );
  MX2X2 U2337 ( .A(dora_iq[25]), .B(dora_iq[17]), .S0(n1784), .Y(n918) );
  MX2X1 U2338 ( .A(dora_iq[33]), .B(dora_iq[25]), .S0(n1860), .Y(n917) );
  MX2X1 U2339 ( .A(dora_eq[31]), .B(dora_eq[23]), .S0(n1860), .Y(n928) );
  MX2X1 U2340 ( .A(dora_eq[39]), .B(dora_eq[31]), .S0(n989), .Y(n927) );
  MX2X1 U2341 ( .A(dora_eq[14]), .B(dora_eq[6]), .S0(n1858), .Y(n935) );
  MX2X1 U2342 ( .A(dora_eq[22]), .B(dora_eq[14]), .S0(n995), .Y(n934) );
  MX2X1 U2343 ( .A(dora_eq[30]), .B(dora_eq[22]), .S0(n1859), .Y(n933) );
  MX2X1 U2344 ( .A(dora_eq[38]), .B(dora_eq[30]), .S0(n994), .Y(n932) );
  MX2X2 U2345 ( .A(dora_id[23]), .B(dora_id[18]), .S0(n1784), .Y(n775) );
  MX2X1 U2346 ( .A(dora_id[12]), .B(dora_id[7]), .S0(n989), .Y(n782) );
  MX2X1 U2347 ( .A(dora_id[22]), .B(dora_id[17]), .S0(n994), .Y(n780) );
  MX2X1 U2348 ( .A(dora_id[16]), .B(dora_id[11]), .S0(n995), .Y(n785) );
  INVXL U2349 ( .A(afifo_raddr[3]), .Y(n1868) );
  INVXL U2350 ( .A(afifo_raddr[2]), .Y(n1864) );
  NAND2XL U2351 ( .A(afifo_raddr[1]), .B(n1864), .Y(n1863) );
  AOI22XL U2352 ( .A0(afifo_fifomem_m0_mem[88]), .A1(n1956), .B0(
        afifo_fifomem_m0_mem[24]), .B1(n1963), .Y(n1880) );
  NAND2XL U2353 ( .A(n1865), .B(n1864), .Y(n1866) );
  AOI22XL U2354 ( .A0(afifo_fifomem_m0_mem[56]), .A1(n1950), .B0(
        afifo_fifomem_m0_mem[72]), .B1(n1952), .Y(n1872) );
  NAND2XL U2355 ( .A(afifo_raddr[2]), .B(n1865), .Y(n1867) );
  AOI22XL U2356 ( .A0(afifo_fifomem_m0_mem[104]), .A1(n1951), .B0(
        afifo_fifomem_m0_mem[8]), .B1(n1955), .Y(n1871) );
  AOI22XL U2357 ( .A0(afifo_fifomem_m0_mem[40]), .A1(n1954), .B0(
        afifo_fifomem_m0_mem[120]), .B1(n1953), .Y(n1870) );
  AND2XL U2358 ( .A(n1950), .B(afifo_fifomem_m0_mem[48]), .Y(n1877) );
  AOI22XL U2359 ( .A0(n1952), .A1(afifo_fifomem_m0_mem[64]), .B0(n1951), .B1(
        afifo_fifomem_m0_mem[96]), .Y(n1875) );
  AOI22XL U2360 ( .A0(n1954), .A1(afifo_fifomem_m0_mem[32]), .B0(n1953), .B1(
        afifo_fifomem_m0_mem[112]), .Y(n1874) );
  AOI22XL U2361 ( .A0(n1956), .A1(afifo_fifomem_m0_mem[80]), .B0(n1955), .B1(
        afifo_fifomem_m0_mem[0]), .Y(n1873) );
  NAND4XL U2362 ( .A(n1875), .B(n1874), .C(n1873), .D(n1957), .Y(n1876) );
  AOI211XL U2363 ( .A0(afifo_fifomem_m0_mem[16]), .A1(n1963), .B0(n1877), .C0(
        n1876), .Y(n1878) );
  INVXL U2364 ( .A(N368), .Y(n1964) );
  AOI211XL U2365 ( .A0(n1880), .A1(n1879), .B0(n1878), .C0(n1964), .Y(N372) );
  AOI22XL U2366 ( .A0(n1956), .A1(afifo_fifomem_m0_mem[89]), .B0(n1963), .B1(
        afifo_fifomem_m0_mem[25]), .Y(n1891) );
  AOI22XL U2367 ( .A0(n1950), .A1(afifo_fifomem_m0_mem[57]), .B0(n1952), .B1(
        afifo_fifomem_m0_mem[73]), .Y(n1883) );
  AOI22XL U2368 ( .A0(n1951), .A1(afifo_fifomem_m0_mem[105]), .B0(n1955), .B1(
        afifo_fifomem_m0_mem[9]), .Y(n1882) );
  AOI22XL U2369 ( .A0(n1954), .A1(afifo_fifomem_m0_mem[41]), .B0(n1953), .B1(
        afifo_fifomem_m0_mem[121]), .Y(n1881) );
  AND2XL U2370 ( .A(n1950), .B(afifo_fifomem_m0_mem[49]), .Y(n1888) );
  AOI22XL U2371 ( .A0(n1952), .A1(afifo_fifomem_m0_mem[65]), .B0(n1951), .B1(
        afifo_fifomem_m0_mem[97]), .Y(n1886) );
  AOI22XL U2372 ( .A0(n1954), .A1(afifo_fifomem_m0_mem[33]), .B0(n1953), .B1(
        afifo_fifomem_m0_mem[113]), .Y(n1885) );
  AOI22XL U2373 ( .A0(n1956), .A1(afifo_fifomem_m0_mem[81]), .B0(n1955), .B1(
        afifo_fifomem_m0_mem[1]), .Y(n1884) );
  NAND4XL U2374 ( .A(n1886), .B(n1885), .C(n1884), .D(n1957), .Y(n1887) );
  AOI211XL U2375 ( .A0(afifo_fifomem_m0_mem[17]), .A1(n1963), .B0(n1888), .C0(
        n1887), .Y(n1889) );
  AOI211XL U2376 ( .A0(n1891), .A1(n1890), .B0(n1889), .C0(n1964), .Y(N373) );
  AOI22XL U2377 ( .A0(n1956), .A1(afifo_fifomem_m0_mem[90]), .B0(n1963), .B1(
        afifo_fifomem_m0_mem[26]), .Y(n1902) );
  AOI22XL U2378 ( .A0(n1950), .A1(afifo_fifomem_m0_mem[58]), .B0(n1952), .B1(
        afifo_fifomem_m0_mem[74]), .Y(n1894) );
  AOI22XL U2379 ( .A0(n1951), .A1(afifo_fifomem_m0_mem[106]), .B0(n1955), .B1(
        afifo_fifomem_m0_mem[10]), .Y(n1893) );
  AOI22XL U2380 ( .A0(n1954), .A1(afifo_fifomem_m0_mem[42]), .B0(n1953), .B1(
        afifo_fifomem_m0_mem[122]), .Y(n1892) );
  AND2XL U2381 ( .A(n1950), .B(afifo_fifomem_m0_mem[50]), .Y(n1899) );
  AOI22XL U2382 ( .A0(n1952), .A1(afifo_fifomem_m0_mem[66]), .B0(n1951), .B1(
        afifo_fifomem_m0_mem[98]), .Y(n1897) );
  AOI22XL U2383 ( .A0(n1954), .A1(afifo_fifomem_m0_mem[34]), .B0(n1953), .B1(
        afifo_fifomem_m0_mem[114]), .Y(n1896) );
  AOI22XL U2384 ( .A0(n1956), .A1(afifo_fifomem_m0_mem[82]), .B0(n1955), .B1(
        afifo_fifomem_m0_mem[2]), .Y(n1895) );
  NAND4XL U2385 ( .A(n1897), .B(n1896), .C(n1895), .D(n1957), .Y(n1898) );
  AOI211XL U2386 ( .A0(afifo_fifomem_m0_mem[18]), .A1(n1963), .B0(n1899), .C0(
        n1898), .Y(n1900) );
  AOI211XL U2387 ( .A0(n1902), .A1(n1901), .B0(n1900), .C0(n1964), .Y(N374) );
  AOI22XL U2388 ( .A0(n1956), .A1(afifo_fifomem_m0_mem[91]), .B0(n1963), .B1(
        afifo_fifomem_m0_mem[27]), .Y(n1913) );
  AOI22XL U2389 ( .A0(n1950), .A1(afifo_fifomem_m0_mem[59]), .B0(n1952), .B1(
        afifo_fifomem_m0_mem[75]), .Y(n1905) );
  AOI22XL U2390 ( .A0(n1951), .A1(afifo_fifomem_m0_mem[107]), .B0(n1955), .B1(
        afifo_fifomem_m0_mem[11]), .Y(n1904) );
  AOI22XL U2391 ( .A0(n1954), .A1(afifo_fifomem_m0_mem[43]), .B0(n1953), .B1(
        afifo_fifomem_m0_mem[123]), .Y(n1903) );
  AND2XL U2392 ( .A(n1950), .B(afifo_fifomem_m0_mem[51]), .Y(n1910) );
  AOI22XL U2393 ( .A0(n1952), .A1(afifo_fifomem_m0_mem[67]), .B0(n1951), .B1(
        afifo_fifomem_m0_mem[99]), .Y(n1908) );
  AOI22XL U2394 ( .A0(n1954), .A1(afifo_fifomem_m0_mem[35]), .B0(n1953), .B1(
        afifo_fifomem_m0_mem[115]), .Y(n1907) );
  AOI22XL U2395 ( .A0(n1956), .A1(afifo_fifomem_m0_mem[83]), .B0(n1955), .B1(
        afifo_fifomem_m0_mem[3]), .Y(n1906) );
  NAND4XL U2396 ( .A(n1908), .B(n1907), .C(n1906), .D(n1957), .Y(n1909) );
  AOI211XL U2397 ( .A0(afifo_fifomem_m0_mem[19]), .A1(n1963), .B0(n1910), .C0(
        n1909), .Y(n1911) );
  AOI211XL U2398 ( .A0(n1913), .A1(n1912), .B0(n1911), .C0(n1964), .Y(N375) );
  AOI22XL U2399 ( .A0(n1956), .A1(afifo_fifomem_m0_mem[92]), .B0(n1963), .B1(
        afifo_fifomem_m0_mem[28]), .Y(n1924) );
  AOI22XL U2400 ( .A0(n1950), .A1(afifo_fifomem_m0_mem[60]), .B0(n1952), .B1(
        afifo_fifomem_m0_mem[76]), .Y(n1916) );
  AOI22XL U2401 ( .A0(n1951), .A1(afifo_fifomem_m0_mem[108]), .B0(n1955), .B1(
        afifo_fifomem_m0_mem[12]), .Y(n1915) );
  AOI22XL U2402 ( .A0(n1954), .A1(afifo_fifomem_m0_mem[44]), .B0(n1953), .B1(
        afifo_fifomem_m0_mem[124]), .Y(n1914) );
  AND2XL U2403 ( .A(n1950), .B(afifo_fifomem_m0_mem[52]), .Y(n1921) );
  AOI22XL U2404 ( .A0(n1952), .A1(afifo_fifomem_m0_mem[68]), .B0(n1951), .B1(
        afifo_fifomem_m0_mem[100]), .Y(n1919) );
  AOI22XL U2405 ( .A0(n1954), .A1(afifo_fifomem_m0_mem[36]), .B0(n1953), .B1(
        afifo_fifomem_m0_mem[116]), .Y(n1918) );
  AOI22XL U2406 ( .A0(n1956), .A1(afifo_fifomem_m0_mem[84]), .B0(n1955), .B1(
        afifo_fifomem_m0_mem[4]), .Y(n1917) );
  NAND4XL U2407 ( .A(n1919), .B(n1918), .C(n1917), .D(n1957), .Y(n1920) );
  AOI211XL U2408 ( .A0(afifo_fifomem_m0_mem[20]), .A1(n1963), .B0(n1921), .C0(
        n1920), .Y(n1922) );
  AOI211XL U2409 ( .A0(n1924), .A1(n1923), .B0(n1922), .C0(n1964), .Y(N376) );
  AOI22XL U2410 ( .A0(n1956), .A1(afifo_fifomem_m0_mem[93]), .B0(n1963), .B1(
        afifo_fifomem_m0_mem[29]), .Y(n1935) );
  AOI22XL U2411 ( .A0(n1950), .A1(afifo_fifomem_m0_mem[61]), .B0(n1952), .B1(
        afifo_fifomem_m0_mem[77]), .Y(n1927) );
  AOI22XL U2412 ( .A0(n1951), .A1(afifo_fifomem_m0_mem[109]), .B0(n1955), .B1(
        afifo_fifomem_m0_mem[13]), .Y(n1926) );
  AOI22XL U2413 ( .A0(n1954), .A1(afifo_fifomem_m0_mem[45]), .B0(n1953), .B1(
        afifo_fifomem_m0_mem[125]), .Y(n1925) );
  AND2XL U2414 ( .A(n1950), .B(afifo_fifomem_m0_mem[53]), .Y(n1932) );
  AOI22XL U2415 ( .A0(n1952), .A1(afifo_fifomem_m0_mem[69]), .B0(n1951), .B1(
        afifo_fifomem_m0_mem[101]), .Y(n1930) );
  AOI22XL U2416 ( .A0(n1954), .A1(afifo_fifomem_m0_mem[37]), .B0(n1953), .B1(
        afifo_fifomem_m0_mem[117]), .Y(n1929) );
  AOI22XL U2417 ( .A0(n1956), .A1(afifo_fifomem_m0_mem[85]), .B0(n1955), .B1(
        afifo_fifomem_m0_mem[5]), .Y(n1928) );
  NAND4XL U2418 ( .A(n1930), .B(n1929), .C(n1928), .D(n1957), .Y(n1931) );
  AOI211XL U2419 ( .A0(afifo_fifomem_m0_mem[21]), .A1(n1963), .B0(n1932), .C0(
        n1931), .Y(n1933) );
  AOI211XL U2420 ( .A0(n1935), .A1(n1934), .B0(n1933), .C0(n1964), .Y(N377) );
  AOI22XL U2421 ( .A0(n1956), .A1(afifo_fifomem_m0_mem[94]), .B0(n1963), .B1(
        afifo_fifomem_m0_mem[30]), .Y(n1946) );
  AOI22XL U2422 ( .A0(n1950), .A1(afifo_fifomem_m0_mem[62]), .B0(n1952), .B1(
        afifo_fifomem_m0_mem[78]), .Y(n1938) );
  AOI22XL U2423 ( .A0(n1951), .A1(afifo_fifomem_m0_mem[110]), .B0(n1955), .B1(
        afifo_fifomem_m0_mem[14]), .Y(n1937) );
  AOI22XL U2424 ( .A0(n1954), .A1(afifo_fifomem_m0_mem[46]), .B0(n1953), .B1(
        afifo_fifomem_m0_mem[126]), .Y(n1936) );
  AND2XL U2425 ( .A(n1950), .B(afifo_fifomem_m0_mem[54]), .Y(n1943) );
  AOI22XL U2426 ( .A0(n1952), .A1(afifo_fifomem_m0_mem[70]), .B0(n1951), .B1(
        afifo_fifomem_m0_mem[102]), .Y(n1941) );
  AOI22XL U2427 ( .A0(n1954), .A1(afifo_fifomem_m0_mem[38]), .B0(n1953), .B1(
        afifo_fifomem_m0_mem[118]), .Y(n1940) );
  AOI22XL U2428 ( .A0(n1956), .A1(afifo_fifomem_m0_mem[86]), .B0(n1955), .B1(
        afifo_fifomem_m0_mem[6]), .Y(n1939) );
  NAND4XL U2429 ( .A(n1941), .B(n1940), .C(n1939), .D(n1957), .Y(n1942) );
  AOI211XL U2430 ( .A0(afifo_fifomem_m0_mem[22]), .A1(n1963), .B0(n1943), .C0(
        n1942), .Y(n1944) );
  AOI211XL U2431 ( .A0(n1946), .A1(n1945), .B0(n1944), .C0(n1964), .Y(N378) );
  AOI22XL U2432 ( .A0(n1956), .A1(afifo_fifomem_m0_mem[95]), .B0(n1963), .B1(
        afifo_fifomem_m0_mem[31]), .Y(n1967) );
  AOI22XL U2433 ( .A0(n1950), .A1(afifo_fifomem_m0_mem[63]), .B0(n1952), .B1(
        afifo_fifomem_m0_mem[79]), .Y(n1949) );
  AOI22XL U2434 ( .A0(n1951), .A1(afifo_fifomem_m0_mem[111]), .B0(n1955), .B1(
        afifo_fifomem_m0_mem[15]), .Y(n1948) );
  AOI22XL U2435 ( .A0(n1954), .A1(afifo_fifomem_m0_mem[47]), .B0(n1953), .B1(
        afifo_fifomem_m0_mem[127]), .Y(n1947) );
  AND2XL U2436 ( .A(n1950), .B(afifo_fifomem_m0_mem[55]), .Y(n1962) );
  AOI22XL U2437 ( .A0(n1952), .A1(afifo_fifomem_m0_mem[71]), .B0(n1951), .B1(
        afifo_fifomem_m0_mem[103]), .Y(n1960) );
  AOI22XL U2438 ( .A0(n1954), .A1(afifo_fifomem_m0_mem[39]), .B0(n1953), .B1(
        afifo_fifomem_m0_mem[119]), .Y(n1959) );
  AOI22XL U2439 ( .A0(n1956), .A1(afifo_fifomem_m0_mem[87]), .B0(n1955), .B1(
        afifo_fifomem_m0_mem[7]), .Y(n1958) );
  NAND4XL U2440 ( .A(n1960), .B(n1959), .C(n1958), .D(n1957), .Y(n1961) );
  AOI211XL U2441 ( .A0(afifo_fifomem_m0_mem[23]), .A1(n1963), .B0(n1962), .C0(
        n1961), .Y(n1965) );
  AOI211XL U2442 ( .A0(n1967), .A1(n1966), .B0(n1965), .C0(n1964), .Y(N379) );
  NAND2XL U2443 ( .A(n1972), .B(n1971), .Y(N366) );
  OAI22XL U2444 ( .A0(n1975), .A1(afifo_wq2_rptr[1]), .B0(
        afifo_wptr_full_m0_wgraynext[3]), .B1(afifo_wq2_rptr[3]), .Y(n1974) );
  AOI221XL U2445 ( .A0(n1975), .A1(afifo_wq2_rptr[1]), .B0(afifo_wq2_rptr[3]), 
        .B1(afifo_wptr_full_m0_wgraynext[3]), .C0(n1974), .Y(n1979) );
  OAI22XL U2446 ( .A0(n1977), .A1(afifo_wq2_rptr[0]), .B0(
        afifo_wptr_full_m0_wbinnext[4]), .B1(afifo_wq2_rptr[4]), .Y(n1976) );
  AOI221XL U2447 ( .A0(n1977), .A1(afifo_wq2_rptr[0]), .B0(afifo_wq2_rptr[4]), 
        .B1(afifo_wptr_full_m0_wbinnext[4]), .C0(n1976), .Y(n1978) );
  INVXL U2448 ( .A(afifo_rptr_empty_m0_rgraynext[3]), .Y(n1991) );
  INVXL U2449 ( .A(afifo_rptr_empty_m0_rgraynext[2]), .Y(n1984) );
  INVXL U2450 ( .A(afifo_rptr_empty_m0_rgraynext[1]), .Y(n1983) );
  OAI22XL U2451 ( .A0(n1984), .A1(afifo_rq2_wptr[2]), .B0(n1983), .B1(
        afifo_rq2_wptr[1]), .Y(n1982) );
  AOI221XL U2452 ( .A0(n1984), .A1(afifo_rq2_wptr[2]), .B0(afifo_rq2_wptr[1]), 
        .B1(n1983), .C0(n1982), .Y(n1989) );
  INVXL U2453 ( .A(afifo_rptr_empty_m0_rgraynext[0]), .Y(n1986) );
  OAI22XL U2454 ( .A0(n1987), .A1(afifo_rq2_wptr[4]), .B0(n1986), .B1(
        afifo_rq2_wptr[0]), .Y(n1985) );
  AOI221XL U2455 ( .A0(n1987), .A1(afifo_rq2_wptr[4]), .B0(afifo_rq2_wptr[0]), 
        .B1(n1986), .C0(n1985), .Y(n1988) );
  OAI211XL U2456 ( .A0(n1991), .A1(afifo_rq2_wptr[3]), .B0(n1989), .C0(n1988), 
        .Y(n1990) );
  AOI21XL U2457 ( .A0(n1991), .A1(afifo_rq2_wptr[3]), .B0(n1990), .Y(
        afifo_rptr_empty_m0_rempty_val) );
endmodule


module sync_r2w ( rptr, wclk, rst_n, wq2_rptr );
  input [4:0] rptr;
  output [4:0] wq2_rptr;
  input wclk, rst_n;

  wire   [4:0] wq1_rptr;

  DFFRHQX1 wq2_rptr_reg_4_ ( .D(wq1_rptr[4]), .CK(wclk), .RN(rst_n), .Q(
        wq2_rptr[4]) );
  DFFRHQX1 wq2_rptr_reg_3_ ( .D(wq1_rptr[3]), .CK(wclk), .RN(rst_n), .Q(
        wq2_rptr[3]) );
  DFFRHQX1 wq2_rptr_reg_2_ ( .D(wq1_rptr[2]), .CK(wclk), .RN(rst_n), .Q(
        wq2_rptr[2]) );
  DFFRHQX1 wq2_rptr_reg_1_ ( .D(wq1_rptr[1]), .CK(wclk), .RN(rst_n), .Q(
        wq2_rptr[1]) );
  DFFRHQX1 wq2_rptr_reg_0_ ( .D(wq1_rptr[0]), .CK(wclk), .RN(rst_n), .Q(
        wq2_rptr[0]) );
  DFFRHQX1 wq1_rptr_reg_4_ ( .D(rptr[4]), .CK(wclk), .RN(rst_n), .Q(
        wq1_rptr[4]) );
  DFFRHQX1 wq1_rptr_reg_3_ ( .D(rptr[3]), .CK(wclk), .RN(rst_n), .Q(
        wq1_rptr[3]) );
  DFFRHQX1 wq1_rptr_reg_2_ ( .D(rptr[2]), .CK(wclk), .RN(rst_n), .Q(
        wq1_rptr[2]) );
  DFFRHQX1 wq1_rptr_reg_1_ ( .D(rptr[1]), .CK(wclk), .RN(rst_n), .Q(
        wq1_rptr[1]) );
  DFFRHQX1 wq1_rptr_reg_0_ ( .D(rptr[0]), .CK(wclk), .RN(rst_n), .Q(
        wq1_rptr[0]) );
endmodule


module sync_w2r ( wptr, rclk, rst_n, rq2_wptr );
  input [4:0] wptr;
  output [4:0] rq2_wptr;
  input rclk, rst_n;

  wire   [4:0] rq1_wptr;

  DFFRHQX1 rq2_wptr_reg_4_ ( .D(rq1_wptr[4]), .CK(rclk), .RN(rst_n), .Q(
        rq2_wptr[4]) );
  DFFRHQX1 rq2_wptr_reg_3_ ( .D(rq1_wptr[3]), .CK(rclk), .RN(rst_n), .Q(
        rq2_wptr[3]) );
  DFFRHQX1 rq2_wptr_reg_2_ ( .D(rq1_wptr[2]), .CK(rclk), .RN(rst_n), .Q(
        rq2_wptr[2]) );
  DFFRHQX1 rq2_wptr_reg_1_ ( .D(rq1_wptr[1]), .CK(rclk), .RN(rst_n), .Q(
        rq2_wptr[1]) );
  DFFRHQX1 rq2_wptr_reg_0_ ( .D(rq1_wptr[0]), .CK(rclk), .RN(rst_n), .Q(
        rq2_wptr[0]) );
  DFFRHQX1 rq1_wptr_reg_4_ ( .D(wptr[4]), .CK(rclk), .RN(rst_n), .Q(
        rq1_wptr[4]) );
  DFFRHQX1 rq1_wptr_reg_3_ ( .D(wptr[3]), .CK(rclk), .RN(rst_n), .Q(
        rq1_wptr[3]) );
  DFFRHQX1 rq1_wptr_reg_2_ ( .D(wptr[2]), .CK(rclk), .RN(rst_n), .Q(
        rq1_wptr[2]) );
  DFFRHQX1 rq1_wptr_reg_1_ ( .D(wptr[1]), .CK(rclk), .RN(rst_n), .Q(
        rq1_wptr[1]) );
  DFFRHQX1 rq1_wptr_reg_0_ ( .D(wptr[0]), .CK(rclk), .RN(rst_n), .Q(
        rq1_wptr[0]) );
endmodule

