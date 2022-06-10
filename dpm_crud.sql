/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : dpm_crud

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 22/04/2022 09:14:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for applicant
-- ----------------------------
DROP TABLE IF EXISTS `applicant`;
CREATE TABLE `applicant`  (
  `ac_id` int NOT NULL AUTO_INCREMENT,
  `ac_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ac_birthday` datetime NOT NULL,
  `ac_sex` int NOT NULL,
  `workingLife` int NOT NULL,
  PRIMARY KEY (`ac_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of applicant
-- ----------------------------
INSERT INTO `applicant` VALUES (1, '张三', '1998-10-01 10:00:00', 1, 4);
INSERT INTO `applicant` VALUES (2, '李四', '2000-10-01 10:00:00', 0, 1);
INSERT INTO `applicant` VALUES (3, '小兰', '2001-01-01 10:00:00', 1, 2);
INSERT INTO `applicant` VALUES (4, '小紫', '2000-01-01 10:00:00', 0, 2);
INSERT INTO `applicant` VALUES (5, '小红', '1999-11-01 10:00:00', 1, 3);
INSERT INTO `applicant` VALUES (6, '小青', '1998-11-01 10:00:00', 1, 4);

-- ----------------------------
-- Table structure for projectinfo
-- ----------------------------
DROP TABLE IF EXISTS `projectinfo`;
CREATE TABLE `projectinfo`  (
  `pi_id` int NOT NULL AUTO_INCREMENT,
  `pi_projectName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pi_startDate` datetime NOT NULL,
  `pi_endDate` datetime NOT NULL,
  `pi_status` int NOT NULL,
  `acId` int NOT NULL,
  PRIMARY KEY (`pi_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of projectinfo
-- ----------------------------
INSERT INTO `projectinfo` VALUES (1, '蚂蚁森林守护国家土地', '2005-11-01 10:00:00', '2025-11-01 10:00:00', 2, 2);
INSERT INTO `projectinfo` VALUES (2, 'f5e2b保护计划0', '1900-02-01 09:00:00', '1910-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (3, '57402保护计划1', '1901-02-01 09:00:00', '1911-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (4, 'b72cc保护计划2', '1902-02-01 09:00:00', '1912-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (5, '9b4cb保护计划3', '1903-02-01 09:00:00', '1913-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (6, '9e169保护计划4', '1904-02-01 09:00:00', '1914-02-01 09:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (7, '82d22保护计划5', '1905-02-01 09:00:00', '1915-02-01 09:00:00', 2, 6);
INSERT INTO `projectinfo` VALUES (8, '8ab5a保护计划6', '1906-02-01 09:00:00', '1916-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (9, '87a32保护计划7', '1907-02-01 09:00:00', '1917-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (10, '447dc保护计划8', '1908-02-01 09:00:00', '1918-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (11, '7c32b保护计划9', '1909-02-01 09:00:00', '1919-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (12, '1db29保护计划0', '2000-02-01 09:00:00', '2010-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (13, '19f0d保护计划1', '2001-02-01 09:00:00', '2011-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (14, '249c8保护计划2', '2002-02-01 09:00:00', '2012-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (15, 'cf2a7保护计划3', '2003-02-01 09:00:00', '2013-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (16, '7d9c5保护计划4', '2004-02-01 09:00:00', '2014-02-01 09:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (17, '36adf保护计划5', '2005-02-01 09:00:00', '2015-02-01 09:00:00', 2, 6);
INSERT INTO `projectinfo` VALUES (18, '32c95保护计划6', '2006-02-01 09:00:00', '2016-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (19, '44d6f保护计划7', '2007-02-01 09:00:00', '2017-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (20, 'a8669保护计划8', '2008-02-01 09:00:00', '2018-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (21, '0539e保护计划9', '2009-02-01 09:00:00', '2019-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (22, '41546保护计划0', '2005-02-01 09:00:00', '2020-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (23, '5b7db保护计划1', '2006-02-01 09:00:00', '2021-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (24, 'b33c3保护计划2', '2007-02-01 09:00:00', '2022-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (25, '1724e保护计划3', '2008-02-01 09:00:00', '2023-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (26, '634dc保护计划4', '2009-02-01 09:00:00', '2024-02-01 09:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (27, '38f46保护计划5', '2010-02-01 09:00:00', '2025-02-01 09:00:00', 2, 6);
INSERT INTO `projectinfo` VALUES (28, '5a0d4保护计划6', '2011-02-01 09:00:00', '2026-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (29, '079e3保护计划7', '2012-02-01 09:00:00', '2027-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (30, '85a6e保护计划8', '2013-02-01 09:00:00', '2028-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (31, '87ea3保护计划9', '2014-02-01 09:00:00', '2029-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (32, '2dfaf保护计划10', '2015-02-01 09:00:00', '2030-02-01 09:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (33, '64226保护计划11', '2016-02-01 09:00:00', '2031-02-01 09:00:00', 2, 6);
INSERT INTO `projectinfo` VALUES (34, '2853d保护计划12', '2017-02-01 09:00:00', '2032-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (35, 'b7b36保护计划13', '2018-02-01 09:00:00', '2033-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (36, 'e3c27保护计划14', '2019-02-01 09:00:00', '2034-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (37, '06fc2保护计划15', '2020-02-01 09:00:00', '2035-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (38, '7b404保护计划16', '2021-02-01 09:00:00', '2036-02-01 09:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (39, 'eb9b8保护计划17', '2022-02-01 09:00:00', '2037-02-01 09:00:00', 2, 6);
INSERT INTO `projectinfo` VALUES (40, 'd19cd保护计划18', '2023-02-01 09:00:00', '2038-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (41, 'c939b保护计划19', '2024-02-01 09:00:00', '2039-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (42, '56f36保护计划20', '2025-02-01 09:00:00', '2040-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (43, '4d00d保护计划21', '2026-02-01 09:00:00', '2041-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (44, '3cf63保护计划22', '2027-02-01 09:00:00', '2042-02-01 09:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (45, 'f0563保护计划23', '2028-02-01 09:00:00', '2043-02-01 09:00:00', 2, 6);
INSERT INTO `projectinfo` VALUES (46, '90ffc保护计划24', '2029-02-01 09:00:00', '2044-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (47, 'f0302保护计划25', '2030-02-01 09:00:00', '2045-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (48, 'b510e保护计划26', '2031-02-01 09:00:00', '2046-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (49, '6a97f保护计划27', '2032-02-01 09:00:00', '2047-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (50, 'f67ea保护计划28', '2033-02-01 09:00:00', '2048-02-01 09:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (51, '809f7保护计划29', '2034-02-01 09:00:00', '2049-02-01 09:00:00', 2, 6);
INSERT INTO `projectinfo` VALUES (52, '277cd保护计划30', '2035-02-01 09:00:00', '2050-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (53, 'bc2b6保护计划31', '2036-02-01 09:00:00', '2051-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (54, '942d6保护计划32', '2037-02-01 09:00:00', '2052-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (55, '23683保护计划33', '2038-02-01 09:00:00', '2053-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (56, 'c5cb4保护计划34', '2039-02-01 09:00:00', '2054-02-01 09:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (57, '96043保护计划35', '2040-02-01 09:00:00', '2055-02-01 09:00:00', 2, 6);
INSERT INTO `projectinfo` VALUES (58, '667cd保护计划36', '2041-02-01 09:00:00', '2056-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (59, 'dc8d2保护计划37', '2042-02-01 09:00:00', '2057-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (60, 'adbb7保护计划38', '2043-02-01 09:00:00', '2058-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (61, '581c2保护计划39', '2044-02-01 09:00:00', '2059-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (62, '59644保护计划40', '2045-02-01 09:00:00', '2060-02-01 09:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (63, '96ad0保护计划41', '2046-02-01 09:00:00', '2061-02-01 09:00:00', 2, 6);
INSERT INTO `projectinfo` VALUES (64, '3e0ab保护计划42', '2047-02-01 09:00:00', '2062-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (65, '22ec2保护计划43', '2048-02-01 09:00:00', '2063-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (66, 'cd3fe保护计划44', '2049-02-01 09:00:00', '2064-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (67, 'e6e69保护计划45', '2050-02-01 09:00:00', '2065-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (68, 'ce8c5保护计划46', '2051-02-01 09:00:00', '2066-02-01 09:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (69, '64fd2保护计划47', '2052-02-01 09:00:00', '2067-02-01 09:00:00', 2, 6);
INSERT INTO `projectinfo` VALUES (70, 'd024f保护计划48', '2053-02-01 09:00:00', '2068-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (71, '557d8保护计划49', '2054-02-01 09:00:00', '2069-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (72, 'ae077绿色计划0', '2018-02-01 09:00:00', '2038-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (73, '1a9a6绿色计划1', '2019-02-01 09:00:00', '2039-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (74, 'f75ad绿色计划2', '2020-02-01 09:00:00', '2040-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (75, '289d8绿色计划3', '2021-02-01 09:00:00', '2041-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (76, 'ce975绿色计划4', '2022-02-01 09:00:00', '2042-02-01 09:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (77, '84d28绿色计划5', '2023-02-01 09:00:00', '2043-02-01 09:00:00', 2, 6);
INSERT INTO `projectinfo` VALUES (78, '176e4绿色计划6', '2024-02-01 09:00:00', '2044-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (79, '509ed绿色计划7', '2025-02-01 09:00:00', '2045-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (80, 'ae0fd绿色计划8', '2026-02-01 09:00:00', '2046-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (81, 'cbbf9绿色计划9', '2027-02-01 09:00:00', '2047-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (82, '38b2e绿色计划10', '2028-02-01 09:00:00', '2048-02-01 09:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (83, '26bb3绿色计划11', '2029-02-01 09:00:00', '2049-02-01 09:00:00', 2, 6);
INSERT INTO `projectinfo` VALUES (84, 'c851d绿色计划12', '2030-02-01 09:00:00', '2050-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (85, 'bf6d4绿色计划13', '2031-02-01 09:00:00', '2051-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (86, 'f7ac8绿色计划14', '2032-02-01 09:00:00', '2052-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (87, '6038d绿色计划15', '2033-02-01 09:00:00', '2053-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (88, 'b5a64绿色计划16', '2034-02-01 09:00:00', '2054-02-01 09:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (89, '31f87绿色计划17', '2035-02-01 09:00:00', '2055-02-01 09:00:00', 2, 6);
INSERT INTO `projectinfo` VALUES (90, '17a4e绿色计划18', '2036-02-01 09:00:00', '2056-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (91, 'eed9b绿色计划19', '2037-02-01 09:00:00', '2057-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (92, 'b1384绿色计划20', '2038-02-01 09:00:00', '2058-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (93, '30c47绿色计划21', '2039-02-01 09:00:00', '2059-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (94, 'e955d绿色计划22', '2040-02-01 09:00:00', '2060-02-01 09:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (95, 'add00绿色计划23', '2041-02-01 09:00:00', '2061-02-01 09:00:00', 2, 6);
INSERT INTO `projectinfo` VALUES (96, '74fdb绿色计划24', '2042-02-01 09:00:00', '2062-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (97, 'a026a绿色计划25', '2043-02-01 09:00:00', '2063-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (98, 'd7d28绿色计划26', '2044-02-01 09:00:00', '2064-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (99, '915fd绿色计划27', '2045-02-01 09:00:00', '2065-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (100, 'be1b7绿色计划28', '2046-02-01 09:00:00', '2066-02-01 09:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (101, '90898绿色计划29', '2047-02-01 09:00:00', '2067-02-01 09:00:00', 2, 6);
INSERT INTO `projectinfo` VALUES (102, '0cbe5绿色计划30', '2048-02-01 09:00:00', '2068-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (103, '37cca绿色计划31', '2049-02-01 09:00:00', '2069-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (104, '7aca6绿色计划32', '2050-02-01 09:00:00', '2070-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (105, 'e5a3e绿色计划33', '2051-02-01 09:00:00', '2071-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (106, '34bb3绿色计划34', '2052-02-01 09:00:00', '2072-02-01 09:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (107, '2aa55绿色计划35', '2053-02-01 09:00:00', '2073-02-01 09:00:00', 2, 6);
INSERT INTO `projectinfo` VALUES (108, 'ab840绿色计划36', '2054-02-01 09:00:00', '2074-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (109, '90774绿色计划37', '2055-02-01 09:00:00', '2075-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (110, 'eea8e绿色计划38', '2056-02-01 09:00:00', '2076-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (111, 'a2252绿色计划39', '2057-02-01 09:00:00', '2077-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (112, '975af绿色计划40', '2058-02-01 09:00:00', '2078-02-01 09:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (113, 'a694d绿色计划41', '2059-02-01 09:00:00', '2079-02-01 09:00:00', 2, 6);
INSERT INTO `projectinfo` VALUES (114, '82bbb绿色计划42', '2060-02-01 09:00:00', '2080-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (115, '0b493绿色计划43', '2061-02-01 09:00:00', '2081-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (116, 'd5604绿色计划44', '2062-02-01 09:00:00', '2082-02-01 09:00:00', 2, 3);
INSERT INTO `projectinfo` VALUES (117, '46979绿色计划45', '2063-02-01 09:00:00', '2083-02-01 09:00:00', 0, 4);
INSERT INTO `projectinfo` VALUES (118, 'b5db2绿色计划46', '2064-02-01 09:00:00', '2084-02-01 09:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (119, '8c209绿色计划47', '2065-02-01 09:00:00', '2085-02-01 09:00:00', 2, 6);
INSERT INTO `projectinfo` VALUES (120, '74f87绿色计划48', '2066-02-01 09:00:00', '2086-02-01 09:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (121, '4e8c5绿色计划49', '2067-02-01 09:00:00', '2087-02-01 09:00:00', 1, 2);
INSERT INTO `projectinfo` VALUES (122, '123123', '2018-10-02 00:00:00', '2018-10-24 00:00:00', 1, 4);
INSERT INTO `projectinfo` VALUES (123, 'test1111', '2018-10-02 00:00:00', '2018-10-31 00:00:00', 0, 5);
INSERT INTO `projectinfo` VALUES (124, 'test1111222', '2018-10-09 00:00:00', '2018-10-23 00:00:00', 1, 5);
INSERT INTO `projectinfo` VALUES (125, 'test1111333', '2018-10-07 00:00:00', '2018-10-31 00:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (126, 'test1111444', '2018-10-01 00:00:00', '2018-10-22 00:00:00', 1, 6);
INSERT INTO `projectinfo` VALUES (127, 'test1111555', '2018-10-01 00:00:00', '2018-10-31 00:00:00', 1, 3);
INSERT INTO `projectinfo` VALUES (128, 'test111122', '2018-11-15 00:00:00', '2018-11-28 00:00:00', 0, 1);
INSERT INTO `projectinfo` VALUES (129, 'asdasd', '2018-11-16 00:00:00', '2018-11-21 00:00:00', 2, 5);
INSERT INTO `projectinfo` VALUES (130, 'test123', '2021-08-13 00:00:00', '2021-08-28 00:00:00', 2, 5);

SET FOREIGN_KEY_CHECKS = 1;
