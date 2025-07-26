/*
 Navicat Premium Data Transfer

 Source Server         : myself
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : circre_db

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 27/07/2025 04:55:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `community_id` int(0) NOT NULL COMMENT '组织社区ID',
  `material_id` int(0) NULL DEFAULT NULL COMMENT '使用材料',
  `recruitment_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '招募人员类型',
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主题',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '介绍',
  `status` tinyint(0) UNSIGNED NULL DEFAULT 0 COMMENT '活动状态(0:未开始,1:进行中,2:已结束)',
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `material_id`(`material_id`) USING BTREE,
  INDEX `community_id`(`community_id`) USING BTREE,
  CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `activity_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '活动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES (1, 1, 74, '时尚/服装设计师,非遗工艺研究者,视觉艺术家', '“编织新岸线”岛屿纤维实验计划', '融合岛屿渔织文化与当代表达，发掘从帆布、渔网到生活织物的再生路径。驻地将设立简易纺织与染色工坊，参与者将围绕“生活即文化”打造系列织物作品，可转化为生活物件、服装或社区旗帜系统。', 0, '2025-07-25 22:16:56', '2025-07-25 22:16:56');
INSERT INTO `activity` VALUES (2, 1, 75, '海洋环保研究者,材料设计师,产品/交互设计师', '“再海塑生”材料重塑驻地计划', '以理想岛上丰富的渔业文化为背景，围绕海洋垃圾回收与再生材料的可视化转化展开试验性设计与展示。探索如何将渔网、塑料瓶、废旧浮球等海洋废弃物，结合可持续材料工艺，转化为具有文化身份认同的岛屿产品、装置或场景微更新系统。', 1, '2025-07-25 22:16:56', '2025-07-25 22:16:56');
INSERT INTO `activity` VALUES (3, 1, 66, '乡建从业者,空间改造者,社区组织者,木工艺人', '“村构再生”微单元共建实验', '围绕岛上废弃民房与荒置空间，以低成本、生态可持续的结构性材料为基础，探索乡村空间的低介入式改造方法。参与者将共同以模块化、可拼装理念构建室外家具、共享休憩点或微型展示单元，激活空间的社区功能。', 0, '2025-07-25 22:16:56', '2025-07-25 22:16:56');
INSERT INTO `activity` VALUES (4, 1, 84, '材料研发者,生态艺术家,教育工作者,影像纪录者', '“微岛之书”材料档案重构计划', '以记录与教育为核心目标，参与者将在岛上建立\"材料故事小站\"，以展览、装置、文本和影像的方式，记录每种可持续材料的来源、制作、使用场景和可能性，最终汇编成\"理想岛·可持续材料应用档案册\"。', 1, '2025-07-25 22:16:56', '2025-07-25 22:16:56');
INSERT INTO `activity` VALUES (5, 4, 91, '手工艺设计师,材料研究者,可持续生活方式推广者', '《归土：回归乡土材料的生活实验室》', '以碧山传统村落的土坯建筑、竹编工艺与天然染料为基础，探讨在现代语境下这些\"低技术\"材料如何进入可持续生活实践。驻地成员将以工作坊、共建装置和社区讲习为形式，与村民共建低碳、可再生的生活微场域。', 0, '2025-07-25 22:16:56', '2025-07-25 22:16:56');
INSERT INTO `activity` VALUES (6, 8, 57, '材料研发者,社区组织者', '海岸线上的救赎', '以江门海岸线上的碉楼建筑，探寻岁月与建筑之间的故事', 0, '2025-07-26 20:44:56', '2025-07-26 20:46:05');

-- ----------------------------
-- Table structure for community
-- ----------------------------
DROP TABLE IF EXISTS `community`;
CREATE TABLE `community`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '社区名字',
  `topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '社区议题',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地理位置',
  `background` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '背景介绍',
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '社区表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of community
-- ----------------------------
INSERT INTO `community` VALUES (1, '理想岛', '岛屿老龄化与人口空心化,渔村文化的保护与当代表达,公共空间与社区关系的重建,可持续生活方式的探索,艺术与日常生活的融合', '浙江省舟山市嵊泗县黄龙乡黄龙岛', '黄龙岛位于浙江舟山嵊泗列岛东部，是一个由二十余座岛屿组成的海岛渔村，大黄龙岛为唯一常住岛，常住人口不足三千，老龄化严重。岛上石屋密布、渔文化浓厚，被称为\"东海石村\"，保留着摩崖石刻、石阶巷道与典型的岛屿地貌。随着渔业式微与人口流失，黄龙岛逐渐进入沉寂，但也因此保留了大量原生态的生活肌理。自2024年起，\"理想群岛共建计划\"在此发起，吸引艺术家、设计师与青年创作者入驻，以在地营造、共创机制和可持续实验为起点，探索岛屿社区的再生可能。', '2025-07-25 22:04:13', '2025-07-25 22:04:13');
INSERT INTO `community` VALUES (2, '大南坡', '原煤矿衰退引发的\"空心村\"化与经济困境,如何在乡村空间中重构文化认同与社区记忆,老旧公共建筑的修复和功能再造,社区共建机制与村民参与,文化生产与日常生活融合', '河南省焦作市修武县西村乡大南坡村', '大南坡村位于云台山风景区附近，是曾因煤矿繁荣而建设有大队部、大礼堂等公共建筑的中原山村。随着矿业衰退，村庄逐渐衰落，被评为深度贫困村。自2019年底起，在焦作县政府推动下启动\"大南坡计划\"，由左靖团队牵头，面向村落建筑、村民文化与地方物产开展大规模共建实验。通过田野调研、文化唤醒、公共空间活化（如艺术中心、乡村书店、怀梆戏剧场）、乡村美育课程、节庆活动\"南坡秋兴\"等一系列实践，复兴了村庄公共生活与地方美学表达，推动村庄从\"空心\"逐步重生，目前已成为中原乡村社区营造的知名案例。', '2025-07-25 22:04:13', '2025-07-25 22:04:13');
INSERT INTO `community` VALUES (3, '青山村', '水资源污染恢复与生态环境保护,农村空心化与新乡人吸纳机制,生态+艺术乡建融合,社区治理与数字共治机制', '浙江省杭州市余杭区黄湖镇青山村', '青山村位于杭州余杭黄湖镇，四周被稻田与竹林环绕，是浙江省首批\"未来乡村实验区\"之一。村庄曾因毛竹种植使用化肥带来严重水源污染，在2015–16年通过大自然保护协会与\"善水基金\"实现生态修复，水质从Ⅲ、Ⅳ类提升至国家Ⅰ类标准，此后村庄开启生态与文化共建的探索。自2020年起，黄湖镇引入建筑师、艺术家及设计师，以青山学堂、文化礼堂、访客中心等公共空间为节点开展\"生态+艺术乡建\"项目，吸引近百名新乡人参与。\"三乡人共建\"与\"共商议事\"治理机制逐步建立，建立村落治理与运营的数字积分平台，激活了社区参与和生态共治。青山民艺社、艺启共富坊等文创实体项目带动村集体经济和乡村文化活力，成为全国艺术乡建与生态共富发展的典范。', '2025-07-25 22:04:13', '2025-07-25 22:04:13');
INSERT INTO `community` VALUES (4, '碧山村', '徽州古村落保护与传统古民居的再利用,农村空心化与外出青年就业替代模式缺失,艺术入村与村民认同之间的边界与实践困境,公共空间活化与文化服务落地,艺术叙事如何转化为村庄\"造血\"经济与可持续产业', '安徽省黄山市黟县碧阳镇碧山村', '碧山村位于安徽省黄山市黟县碧阳镇下辖，是2008年由碧东与碧西合并形成的行政村，总人口约 2,900 人，村中汪姓聚族而居，是徽州传统古村聚落之一。村里保留了百余座明清古民居与祠堂，于2013年被列入中国传统村落名录。2011年，策展人欧宁与左靖发起\"碧山计划\"，以\"碧山共同体\"和\"丰年祭\"为起点，尝试通过艺术、调研、社区活动与公共空间活化（如碧山书局、理农馆、供销社改造等）推动乡村文化再生。该实践虽于2016年逐渐停滞，但其所引发的文化公共生活探索、乡建实验与乡村美学叙事，至今仍在地方记忆中延续，并对艺术乡建实践提供了重要启示。', '2025-07-25 22:04:13', '2025-07-25 22:04:13');
INSERT INTO `community` VALUES (5, '铁牛村', '\"回得去的乡村\"生活模式探索与乡村生态日常组织实验,村庄基础设施与闲置资产活化,乡村治理与共建机制,绿色农业与乡村经济创新', '四川省成都市蒲江县西来镇铁牛村', '铁牛村位于成都西来镇，是距离成都市主城区约80分钟车程的典型\"未来乡村公园社区\"。约七年前，海归建筑师施国平率其团队落地铁牛村，发起\"回得去的乡村\"生活实验，吸引来自全国各地的城市青年成为\"新村民\"落地生活。如今村中有60+位常驻新村民及300+位候鸟型参与者，与3,000多位本地村民共同构建乡村日常。社区通过改造闲置集体资产（如丑美生活馆、新青年驿站、共享公寓），搭建青年双创与共建平台。村内整治风貌住宅、建设生态公园、发展生态橘园、设立认养计划与乡土品牌，把农业、生态、文化、创意融为一体。治理机制包括新老村民共议平台、青年中心、人才公寓免租支持等，已成为城市青年乡村振兴与社区共创融合的示范样本。', '2025-07-25 22:04:13', '2025-07-25 22:04:13');
INSERT INTO `community` VALUES (6, '青浜岛', '岛上生态环境保护与垃圾治理,峡湾地貌与岛屿自然景观对社区生活方式的影响,海岛交通受限与社区物资运输成本治理,生态旅游开发与岛居民日常生活的平衡', '浙江省舟山市东极镇管辖的青浜岛', '青浜岛隶属舟山市东极镇，是舟山渔场与普陀中街山列岛国家级海洋特别保护区的重要组成部分。全岛常住人口约600人，岛上居民与驻岛工作人员共同生活。地理风貌以海滩众多、海流交汇、生态敏感为特点，被列入\"零废弃青浜岛\"建设项目试点。岛上面临海洋垃圾潮汐带入、生态垃圾积累以及交通闭塞等难题，但也因此成为生态修复与社区可持续实践的重要试验场。近年来，通过地方治理与社会组织合作，青浜岛逐步探索垃圾治理、社区自组织与生态生活方式，致力于打造一个低碳可持续、文化共生、岛屿修复型的理想社区样板。', '2025-07-25 22:04:13', '2025-07-25 22:04:13');
INSERT INTO `community` VALUES (7, '新华社区', '实施\"15分钟社区生活圈\"构建与治理创新,营建\"人人参与\"共治机制与居民提案平台,推动社区营造中心的多主体共创实践与社群经济发展,共建中心中的\"社造共学\"与微项目孵化机制,赋能友好商户与行动者，形成街区共商共营共好平台', '上海市长宁区新华路街道', '新华街道作为上海首批\"15分钟社区生活圈\"试点区域之一，自 2021 年起成为城市空间艺术季重点样本，通过长期社区更新与居民参与实践探索\"人民城市\"愿景。位于新华路345弄的新华·社区营造中心（约840㎡）由政府授权、社会组织运营，是社区营造行动的核心枢纽，承担居民提案孵化、共创工作坊、青年创新场景、社区节庆与市集等功能。社区内部的\"一平米行动\"\"美好社区节\"\"人人街区计划\"等项目，激活邻里互动与公共空间活力，同时推动社群经济与可持续社区治理，成为上海社区营造与公共参与的标杆实践之一。', '2025-07-25 22:04:13', '2025-07-25 22:04:13');
INSERT INTO `community` VALUES (8, '塘口社区', '聚焦乡村空心化与人口流失，吸引青年返乡创业与参与社区复兴,文旅融合与世界文化遗产保护,闲置历史空间更新与公共活化,社群共治机制与\"IE公社\"计划,产业驱动与公共活动策划', '广东省江门市开平市塘口镇', '塘口镇是开平市著名的华侨文化与碉楼集中区，隶属强亚村委会下辖的塘口墟社群。全镇拥有600余座碉楼，自力村碉楼群与村落已列为世界文化遗产。过去，塘口社区因人口外迁几近\"沉寂\"，仅余少量村民留守近年来，通过启动\"IE公社\"数字乡建计划，大力激活文创与乡建项目，吸引超过 2000 名\"新塘口人\"返乡参与创业与社区建设。与此同时，以\"塘口空间\"\"粮仓书店\"等场域作为共创节点，并结合大规模文化节庆、人文市集与非遗展演，逐步重现村落公共活力。村内托管修复了自力村碉楼与旧建筑，并以侨乡文化为桥梁，将乡村与世界链接，是探索侨乡社区再生与文化共生的代表场域之一。', '2025-07-25 22:04:13', '2025-07-25 22:04:13');
INSERT INTO `community` VALUES (9, '龙潭村社区', '空心村复兴,老宅保护与活化利用文化生产与乡土情境结合,自然教育体系建设,本地治理机制创新', '福建省宁德市屏南县熙岭乡龙潭村', '龙潭村是一座位于福建屏南县深山中的600多年历史古村，曾因耕地不足而出现人口外流、村落\"半空心化\"现象，常住人口一度不足200人，百余栋明清老宅年久失修 。自2017年起，依托屏南县\"三引三创\"政策，引进艺术家和文创团队，以\"老屋认租\"\"当地匠人修复\"\"文创激活\"的方式复兴古村，吸引全国各地\"新村民\"驻村并带动文化活动、书店、咖啡馆等业态兴起，使龙潭村逐步成长为一个融合乡建、教育和艺术的生态社区实验场。', '2025-07-25 22:04:13', '2025-07-25 22:04:13');
INSERT INTO `community` VALUES (10, '梦界·方村社区', '白茶非遗技艺的传承与现代创新融合,传统景观与公共艺术空间融合开发,文创场域与游客体验融合,本地人才与外来创意力量联合推动乡村产业升级,生态旅游与社区生活的平衡运营', '江苏省常州市溧阳市天目湖镇桂林村方所文化村内', '梦界方村坐落于溧阳市天目湖镇桂林村方所文化村内，原为闲置茶文化园，后改造为融合茶文化体验与艺术展演的公共文化空间。这里以廊桥、观景书塔、水岸绿植等江南风貌为载体，引入书店、画廊、主题酒店、亲子空间与茶集等业态，成为网红与创意游客的打卡地。此外，天目湖白茶制作工艺为地方非遗项目，镇区通过扶持本地茶企、创意设计机构与高校合作，将茶产业与艺术设计、生态旅游深度融合，不断增强社区活力和文化影响力。', '2025-07-25 22:04:13', '2025-07-25 22:04:13');

-- ----------------------------
-- Table structure for designer
-- ----------------------------
DROP TABLE IF EXISTS `designer`;
CREATE TABLE `designer`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名字',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像URL',
  `region` tinyint(0) NULL DEFAULT NULL COMMENT '地区(1:东 2:西 3:南 4:北 5:中)',
  `contact` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系方式',
  `industry` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '行业',
  `specialization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '领域方向',
  `identity_tag_id` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '身份标签ID',
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `identity_tag_id`(`identity_tag_id`) USING BTREE,
  CONSTRAINT `designer_ibfk_1` FOREIGN KEY (`identity_tag_id`) REFERENCES `identity_tag` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '设计师表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of designer
-- ----------------------------
INSERT INTO `designer` VALUES (1, '多罗西', 'https://example.com/avatars/dorothy.jpg', 1, 'duoluoxi0001@gmail.com', '空间设计', '零废弃空间与产品设计', 3, '2025-07-25 22:09:02', '2025-07-25 22:09:02');
INSERT INTO `designer` VALUES (2, '张三', 'https://example.com/avatar.jpg', 1, 'zhangsan@example.com', '室内设计', '现代简约风格', 1, '2025-07-26 16:45:13', '2025-07-26 16:45:13');
INSERT INTO `designer` VALUES (3, '张四', 'https://example.com/avatar.jpg', 1, 'zhangsi@example.com', '室内设计', '现代简约风格', 1, '2025-07-26 17:10:14', '2025-07-26 17:10:14');
INSERT INTO `designer` VALUES (7, '王设计师', 'https://example.com/avatars/designer.jpg', 3, 'designer.wang@example.com', '建筑装饰', '欧式古典风格', 1, '2025-07-26 23:13:31', '2025-07-26 23:13:31');

-- ----------------------------
-- Table structure for designer_pwd
-- ----------------------------
DROP TABLE IF EXISTS `designer_pwd`;
CREATE TABLE `designer_pwd`  (
  `designer_id` int(0) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`designer_id`) USING BTREE,
  CONSTRAINT `designer_pwd_ibfk_1` FOREIGN KEY (`designer_id`) REFERENCES `designer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of designer_pwd
-- ----------------------------
INSERT INTO `designer_pwd` VALUES (1, '123456');
INSERT INTO `designer_pwd` VALUES (2, '123456');
INSERT INTO `designer_pwd` VALUES (3, '123456');
INSERT INTO `designer_pwd` VALUES (7, 'Designer@1234');

-- ----------------------------
-- Table structure for identity_tag
-- ----------------------------
DROP TABLE IF EXISTS `identity_tag`;
CREATE TABLE `identity_tag`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名称',
  `expertise_direction` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '擅长方向',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '标签说明',
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '身份标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of identity_tag
-- ----------------------------
INSERT INTO `identity_tag` VALUES (1, 'Material Dreamer', '新材料研发与创新', '专注于探索和开发新型可持续材料的设计师，推动材料科学的边界', '2025-07-25 21:15:33', '2025-07-25 21:15:33');
INSERT INTO `identity_tag` VALUES (2, 'Craft Integrator', '传统工艺与现代技术融合', '擅长将传统手工技艺与现代设计方法相结合，创造独特的可持续解决方案', '2025-07-25 21:15:33', '2025-07-25 21:15:33');
INSERT INTO `identity_tag` VALUES (3, 'Spatial Weaver', '空间设计与材料应用', '专注于通过材料选择和组织创造有意义的空间体验', '2025-07-25 21:15:33', '2025-07-25 21:15:33');
INSERT INTO `identity_tag` VALUES (4, 'Low-impact Builder', '低碳建造技术', '致力于开发和使用环境影响最小的建筑方法和材料', '2025-07-25 21:15:33', '2025-07-25 21:15:33');
INSERT INTO `identity_tag` VALUES (5, 'Circular Stylist', '循环时尚设计', '专注于创造可循环、可升级和可修复的时尚产品', '2025-07-25 21:15:33', '2025-07-25 21:15:33');
INSERT INTO `identity_tag` VALUES (6, 'Narrative Catalyst', '材料故事与品牌传播', '通过材料选择和设计讲述产品背后的可持续故事', '2025-07-25 21:15:33', '2025-07-25 21:15:33');
INSERT INTO `identity_tag` VALUES (7, 'Micro System Designer', '小型生态系统设计', '设计自给自足的小型材料和产品循环系统', '2025-07-25 21:15:33', '2025-07-25 21:15:33');
INSERT INTO `identity_tag` VALUES (8, 'Local Resource Strategist', '区域资源开发利用', '擅长识别和利用本地资源，开发具有地域特色的材料解决方案', '2025-07-25 21:15:33', '2025-07-25 21:15:33');
INSERT INTO `identity_tag` VALUES (9, 'Hybrid Maker', '跨学科材料实验', '融合不同领域知识创造突破性的材料组合和应用方式', '2025-07-25 21:15:33', '2025-07-25 21:15:33');
INSERT INTO `identity_tag` VALUES (10, 'Future Matter Explorer', '前瞻性材料研究', '探索具有未来潜力的材料概念和应用场景', '2025-07-25 21:15:33', '2025-07-25 21:15:33');

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '材料名',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '材料类别',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '材料介绍',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片路径',
  `texture` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '材料纹理',
  `formula` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '配方',
  `physical_structure` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '物理结构',
  `sustainability_score` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '可持续性评分（1-5星）',
  `main_attribute` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主要属性（最显著的属性）',
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '材料表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES (53, '3d_printing_materials', '生物基材料', '可生物降解的3D打印材料，通常由PLA或其他生物聚合物制成', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\3d_printing_materials.png', '光滑/层状', 'PLA(聚乳酸)70-100%，添加剂0-30%', '半结晶/无定形聚合物结构', 4, '可生物降解', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (54, 'bacterial_brick', '生物基材料', '利用细菌矿化作用生产的生物砖，减少传统烧制过程的碳排放', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\bacterial_brick.png', '粗糙/多孔', '沙粒基质80-90%，巴氏芽孢杆菌培养液10-20%', '微生物诱导碳酸钙沉淀形成的多孔结构', 5, '低碳生产', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (55, 'bio-based_asphalt', '生物基材料', '使用植物油或其他生物基原料替代石油沥青的道路材料', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\bio-based_asphalt.png', '粗糙', '植物油衍生物40-60%，矿物骨料40-60%', '连续相生物粘合剂包裹骨料的复合结构', 3, '可再生原料', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (56, 'biobased_coatings', '生物基材料', '以植物或生物基树脂为原料的环保涂料', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\biobased_coatings.png', '光滑', '大豆油树脂30-50%，植物蜡20-30%，天然颜料10-20%', '交联聚合物网络结构', 4, '低VOC排放', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (57, 'cactus_leather', '生物基材料', '由仙人掌纤维制成的植物基皮革替代品', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\cactus_leather.png', '纹理/柔软', '仙人掌纤维70-80%，天然胶乳20-30%', '三维纤维网状结构', 5, '动物友好', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (58, 'fruit_leather', '生物基材料', '利用水果副产品制作的皮革替代材料', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\fruit_leather.png', '柔软/有弹性', '水果废料纤维50-70%，植物基粘合剂30-50%', '层压纤维薄片结构', 4, '废物利用', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (59, 'hemp_concrete', '生物基材料', '大麻纤维与石灰混合的轻质建筑材料', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\hemp_concrete.png', '粗糙/多孔', '大麻屑60-70%，石灰粘合剂30-40%', '植物纤维与矿物基质的复合材料', 4, '碳封存', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (60, 'hemp_fiberboard', '生物基材料', '大麻纤维制成的板材，用于家具和建筑', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\hemp_fiberboard.png', '纤维状', '大麻纤维80-90%，植物基树脂10-20%', '定向纤维层压结构', 4, '可再生', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (61, 'microalgae', '生物基材料', '利用微藻生物质开发的各种材料应用', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\microalgae.png', '多样', '微藻生物质100%', '微藻细胞聚集形成的多孔结构', 5, '碳捕获', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (62, 'modern_rammed_earth', '生物基材料', '现代夯土技术，使用本地土壤和天然添加剂', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\modern_rammed_earth.png', '土质/纹理', '本地土壤90-95%，稳定剂5-10%', '密实层状矿物结构', 5, '零运输排放', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (63, 'mycelium', '生物基材料', '真菌菌丝体生长的生物材料，可替代泡沫塑料', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\mycelium.png', '海绵状', '真菌菌丝体100%', '三维生物纤维网络', 5, '完全可降解', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (64, 'pla', '生物基材料', '聚乳酸，源自玉米淀粉的可生物降解塑料', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\pla.png', '光滑', '玉米淀粉衍生的乳酸聚合物100%', '半结晶热塑性结构', 3, '可堆肥', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (65, 'soy_adhesive', '生物基材料', '大豆蛋白制成的无甲醛胶粘剂', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\soy_adhesive.png', '粘稠', '大豆蛋白50-60%，水30-40%，交联剂10%', '蛋白质交联网络', 4, '无毒', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (66, 'straw_board', '生物基材料', '农作物秸秆压制而成的建筑板材', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\straw_board.png', '纤维状', '农作物秸秆85-95%，MDI胶5-15%', '定向刨花板结构', 4, '农业副产品利用', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (67, 'construction_waste_recycled_stone', '回收再利用材料', '建筑废料再加工制成的人造石材', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\construction_waste_recycled_stone.png', '石质', '建筑废料骨料80-90%，水泥基粘合剂10-20%', '再生骨料复合材料', 4, '废物再利用', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (68, 'denim_board', '回收再利用材料', '废旧牛仔布料压制而成的板材', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\denim_board.png', '纤维状', '废旧牛仔布纤维100%', '致密纤维板', 4, '纺织品回收', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (69, 'industrial_solid_waste_recycled_stone', '回收再利用材料', '工业固体废物制成的人造石材', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\industrial_solid_waste_recycled_stone.png', '石质', '工业废渣85-95%，粘结剂5-15%', '烧结或压制复合结构', 3, '工业废料利用', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (70, 'recycled_board_from_tetra_pak_packaging', '回收再利用材料', '利乐包装回收制成的板材', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\recycled_board_from_tetra_pak_packaging.png', '层压', '利乐包装纸塑铝复合材料100%', '层压板结构', 4, '包装回收', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (71, 'recycled_ceramictiles', '回收再利用材料', '废旧陶瓷再加工制成的地砖或墙砖', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\recycled_ceramictiles.png', '陶瓷', '废旧陶瓷粉70-80%，新陶瓷原料20-30%', '烧结陶瓷结构', 4, '高耐用性', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (72, 'recycled_ceramic_bricks', '回收再利用材料', '废旧陶瓷制成的建筑砖块', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\recycled_ceramic_bricks.png', '粗糙', '废陶瓷颗粒60-70%，粘土30-40%', '烧结复合结构', 4, '高热质量', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (73, 'recycled_glass', '回收再利用材料', '废玻璃再加工制成的各种建筑材料', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\recycled_glass.png', '玻璃', '废玻璃碎片100%', '非晶态固体', 4, '无限可回收', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (74, 'recycled_nylon_yarn', '回收再利用材料', '废旧尼龙制品再生制成的纱线', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\recycled_nylon_yarn.png', '纤维', '废旧尼龙制品100%', '熔融纺丝纤维结构', 3, '减少石油使用', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (75, 'recycled_plastic_bricks', '回收再利用材料', '废旧塑料压制而成的建筑砖块', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\recycled_plastic_bricks.png', '塑料', '废旧塑料80-90%，填充料10-20%', '熔融压制块体', 3, '塑料废物利用', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (76, 'recycled_rubber', '回收再利用材料', '废旧轮胎等橡胶制品回收再利用', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\recycled_rubber.png', '弹性', '废旧橡胶制品100%', '交联弹性体网络', 3, '减少橡胶污染', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (77, 'recycled_rubberconcrete', '回收再利用材料', '掺入橡胶颗粒的混凝土', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\recycled_rubberconcrete.png', '粗糙', '橡胶颗粒15-20%，混凝土基质80-85%', '弹性颗粒分散相复合材料', 3, '减震性能', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (78, 'recycled_steel', '回收再利用材料', '废钢铁回收再加工的钢材', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\recycled_steel.png', '金属', '废钢铁100%', '铁基合金晶体结构', 5, '无限可回收', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (79, 'waste_textile_acoustic_cotton', '回收再利用材料', '废旧纺织品制成的吸音棉', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\waste_textile_acoustic_cotton.png', '纤维状', '废旧纺织品纤维100%', '多孔纤维毡', 4, '优良吸音', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (80, 'waste_textile_flooring', '回收再利用材料', '废旧纺织品制成的地板材料', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\waste_textile_flooring.png', '纹理', '废旧纺织品80-90%，粘合剂10-20%', '层压纤维结构', 4, '柔软舒适', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (81, 'aerogel_thermal_insulation_material', '高性能复合材料', '超轻气凝胶隔热材料，具有极低导热系数', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\aerogel_thermal_insulation_material.png', '多孔/轻质', '二氧化硅前驱体95-98%，表面改性剂2-5%', '纳米多孔网络(孔隙率>90%)', 3, '超强隔热', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (82, 'basalt_reinforced_composite_material', '高性能复合材料', '玄武岩纤维增强的复合材料', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\basalt_reinforced_composite_material.png', '纤维增强', '玄武岩纤维30-50%，聚合物基质50-70%', '纤维增强复合材料', 4, '高强度', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (83, 'carbon_fiber_composite_material', '高性能复合材料', '碳纤维增强的高性能复合材料', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\carbon_fiber_composite_material.png', '纤维状', '碳纤维40-60%，环氧树脂40-60%', '高强度纤维增强结构', 2, '超高强度', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (84, 'carbon_fixed_concrete', '高性能复合材料', '能够吸收并固定二氧化碳的混凝土', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\carbon_fixed_concrete.png', '石质', '水泥30-40%，CO2吸收添加剂5-10%，骨料50-65%', '碳酸钙矿化水泥基复合材料', 4, '碳封存', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (85, 'carbon_fixed_foam_material', '高性能复合材料', '具有碳固定功能的泡沫材料', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\carbon_fixed_foam_material.png', '多孔', '聚合物基质60-70%，CO2发泡剂30-40%', '闭孔泡沫结构', 4, '轻质隔热', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (86, 'charred_cork', '高性能复合材料', '炭化处理的软木材料，具有特殊性能', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\charred_cork.png', '多孔', '软木100%', '炭化多孔蜂窝结构', 4, '防火', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (87, 'composite_materials', '高性能复合材料', '多种材料复合而成的多功能材料', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\composite_materials.png', '多样', '根据具体复合体系变化', '多相异质结构', 3, '性能可设计', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (88, 'editable_cement', '高性能复合材料', '可再加工和重塑的水泥基材料', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\editable_cement.png', '可塑', '硫铝酸盐水泥60-70%，可逆反应添加剂30-40%', '可重构晶体结构', 3, '可重复使用', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (89, 'flexible_concrete', '高性能复合材料', '具有弹性变形能力的混凝土', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\flexible_concrete.png', '弹性', '水泥30-40%，弹性聚合物20-30%，骨料30-50%', '弹性复合材料', 3, '抗震', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (90, 'fly_ash_glass', '高性能复合材料', '粉煤灰制成的玻璃材料', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\fly_ash_glass.png', '玻璃', '粉煤灰70-80%，助熔剂20-30%', '非晶态硅酸盐结构', 4, '工业废料利用', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (91, 'geopolymer_brick', '高性能复合材料', '地质聚合物技术生产的砖块', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\geopolymer_brick.png', '石质', '粉煤灰/矿渣60-70%，碱性激活剂30-40%', '三维铝硅酸盐网络', 4, '低碳生产', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (92, 'geopolymer_cement', '高性能复合材料', '传统水泥的低碳替代品', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\geopolymer_cement.png', '粉末', '工业废渣70-80%，碱激发剂20-30%', '无定形地质聚合物凝胶', 4, '低碳', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (93, 'graphene_reinforced_concrete', '高性能复合材料', '石墨烯增强的高性能混凝土', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\graphene_reinforced_concrete.png', '致密', '石墨烯0.5-1%，水泥30-40%，骨料60-70%', '纳米增强复合材料', 3, '超高强度', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (94, 'high-strength_steel', '高性能复合材料', '超高强度钢材', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\high-strength_steel.png', '金属', '铁基合金(含碳0.2-0.5%，合金元素1-5%)', '马氏体/贝氏体晶体结构', 2, '结构强度', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (95, 'ultra-high-performance-concrete', '高性能复合材料', '超高性能混凝土(UHPC)', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\ultra-high-performance-concrete.png', '致密', '水泥20-30%，硅灰10-15%，石英粉15-20%，钢纤维5-10%', '致密颗粒堆积结构', 3, '超强耐久', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (96, 'aerogel_thermal_insulation_material', '高性能复合材料', '世界上最轻的固体材料，具有极低导热系数和超高孔隙率', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\aerogel_thermal_insulation_material.png', '超轻/多孔', '二氧化硅前驱体95-98%，表面改性剂2-5%', '纳米多孔网络(孔隙率>90%)', 3, '超强隔热（导热系数0.015W/m·K）', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (97, 'inorganic_electrochromic_glass', '智能响应材料', '无机电致变色智能玻璃', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\inorganic_electrochromic_glass.png', '玻璃', 'WO3/TiO2纳米薄膜50%，透明导电层50%', '多层薄膜结构', 4, '光热调节', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (98, 'phase_change_materials', '智能响应材料', '相变储能材料，用于温度调节', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\phase_change_materials.png', '多样', '石蜡/脂肪酸60-80%，封装材料20-40%', '微胶囊化相变体系', 4, '热能储存', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (99, 'reversible_adhesive', '智能响应材料', '可逆粘合的特殊粘合剂', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\reversible_adhesive.png', '粘性', 'Diels-Alder聚合物100%', '可逆交联网络', 4, '可重复粘合', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (100, 'self-cleaning_coating', '智能响应材料', '具有自清洁功能的表面涂层', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\self-cleaning_coating.png', '光滑', 'TiO2纳米颗粒20-30%，硅基树脂70-80%', '超疏水纳米结构表面', 4, '减少维护', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (101, 'self-healing_concrete', '智能响应材料', '能够自动修复裂缝的混凝土', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\self-healing_concrete.png', '石质', '水泥基质95-98%，微生物胶囊2-5%', '微胶囊分散体系', 4, '自修复', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (102, 'shape_memory_alloy', '智能响应材料', '形状记忆合金，具有温度响应性', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\shape_memory_alloy.png', '金属', '镍钛合金(NiTi)100%', '马氏体相变晶体', 2, '形态记忆', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (103, 'structural_color', '智能响应材料', '通过微结构而非色素产生的结构色', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\structural_color.png', '多样', '光子晶体结构100%', '周期性纳米结构', 4, '永不褪色', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (104, 'thermochromic_materials', '智能响应材料', '热致变色材料，随温度改变颜色', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\thermochromic_materials.png', '多样', '液晶化合物/热致变色染料50%，载体材料50%', '分子有序-无序转变体系', 4, '温度响应', '2025-07-25 21:32:09', '2025-07-25 21:39:51');
INSERT INTO `material` VALUES (105, 'transparent_wood', '智能响应材料', '经过特殊处理的透明木材', 'C:\\Users\\HP\\Desktop\\AdventureX\\image\\transparent_wood.png', '木质', '脱木质素木材70-80%，聚合物渗透20-30%', '各向异性多孔结构', 4, '透光隔热', '2025-07-25 21:32:09', '2025-07-25 21:39:51');

-- ----------------------------
-- Table structure for material_supplier
-- ----------------------------
DROP TABLE IF EXISTS `material_supplier`;
CREATE TABLE `material_supplier`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `material_id` int(0) NOT NULL COMMENT '材料ID',
  `supplier_id` int(0) NOT NULL COMMENT '供应商ID',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格(￥)',
  `delivery_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '配送范围(华中西南北东)',
  `delivery_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '配送方式(海陆空)',
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `material_id`(`material_id`, `supplier_id`) USING BTREE,
  INDEX `supplier_id`(`supplier_id`) USING BTREE,
  CONSTRAINT `material_supplier_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `material_supplier_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '材料供应商关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of material_supplier
-- ----------------------------
INSERT INTO `material_supplier` VALUES (3, 53, 2, 285.00, '华东、华北、华南', '空运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (4, 54, 7, 1200.50, '华东、华北', '海运+陆运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (5, 55, 1, 45.80, '华东、华中', '陆运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (6, 56, 6, 320.00, '华西、华中', '铁路运输', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (7, 57, 5, 680.00, '华东、华南', '海运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (8, 58, 2, 2500.00, '全国', '空运+海运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (9, 75, 10, 85.50, '华中、华北', '陆运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (10, 87, 3, 28.00, '华南、华中', '海运+陆运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (11, 96, 4, 420.00, '华北、华东', '陆运+空运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (12, 105, 9, 950.00, '华东', '陆运+海运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (13, 60, 9, 185.00, '华东', '陆运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (14, 61, 5, 320.00, '华东、华南', '海运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (15, 62, 4, 680.00, '华北、华东', '铁路+公路', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (16, 63, 7, 240.00, '华东、华北', '海运+陆运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (17, 64, 10, 55.00, '华中、华北', '陆运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (18, 65, 3, 120.00, '华南、华中', '海运+公路', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (19, 66, 2, 880.00, '全国', '空运+陆运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (20, 67, 6, 450.00, '华西、华中', '铁路', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (21, 68, 1, 95.00, '华东、华中', '内河航运+公路', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (22, 69, 5, 280.00, '华东、华南', '海运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (23, 70, 10, 65.00, '华中、华北', '公路', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (24, 71, 2, 3200.00, '全国', '空运+特快陆运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (25, 72, 9, 180.00, '华东', '公路运输', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (26, 73, 4, 4200.00, '华北、华东', '铁路专列', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (27, 74, 6, 60.00, '华西、华中', '铁路+公路', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (28, 76, 7, 1850.00, '华东、华北', '海运+空运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (29, 77, 1, 750.00, '华东、华中', '冷链运输', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (30, 78, 10, 85.00, '华中、华北', '公路', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (31, 79, 3, 380.00, '华南、华中', '恒温陆运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');
INSERT INTO `material_supplier` VALUES (32, 80, 2, 920.00, '全国', '空运+冷链陆运', '2025-07-25 22:14:40', '2025-07-25 22:14:40');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '厂商名称',
  `contact` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系方式',
  `region` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地区',
  `order_cycle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订购周期',
  `delivery_scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '配送范围(华中西南北东)',
  `delivery_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '配送方式(海陆空)',
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '供应商表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, '绿筑新材料', '138****5678', '江苏苏州市吴中区', '月结', '华东、华中', '陆运', '2025-07-25 21:55:06', '2025-07-25 21:55:06');
INSERT INTO `supplier` VALUES (2, '于树科技材料', '0512-****321', '上海浦东新区', '季度协议', '华东、华北、华南', '海运+空运', '2025-07-25 21:55:06', '2025-07-25 21:55:06');
INSERT INTO `supplier` VALUES (3, '环生再生科技', '400-****-999', '广东深圳市龙岗区', '周订', '华南、华中', '海运+陆运', '2025-07-25 21:55:06', '2025-07-25 21:55:06');
INSERT INTO `supplier` VALUES (4, '北新基建材', '010-****8888', '北京海淀区', '年度协议', '华北、华中、华东', '陆运+空运', '2025-07-25 21:55:06', '2025-07-25 21:55:06');
INSERT INTO `supplier` VALUES (5, '南固环保建材', '159****2345', '福建厦门市湖里区', '半月结', '华东、华南', '海运', '2025-07-25 21:55:06', '2025-07-25 21:55:06');
INSERT INTO `supplier` VALUES (6, '西创矿物材料', '028-****6666', '四川成都市青羊区', '月结', '华西、华中', '陆运', '2025-07-25 21:55:06', '2025-07-25 21:55:06');
INSERT INTO `supplier` VALUES (7, '东海生物材料', '0574-****7777', '浙江宁波市鄞州区', '季度协议', '华东、华北', '海运+陆运+空运', '2025-07-25 21:55:06', '2025-07-25 21:55:06');
INSERT INTO `supplier` VALUES (8, '中科再生资源', '136****8910', '湖北武汉市洪山区', '年度框架', '华中、华东、华南', '陆运+空运', '2025-07-25 21:55:06', '2025-07-25 21:55:06');
INSERT INTO `supplier` VALUES (9, '长三合新材料', '021-****5555', '江苏南京市鼓楼区', '月度招标', '华东', '陆运+海运', '2025-07-25 21:55:06', '2025-07-25 21:55:06');
INSERT INTO `supplier` VALUES (10, '中原生态建材', '0371-****2222', '河南郑州市金水区', '半月结', '华中、华北', '陆运', '2025-07-25 21:55:06', '2025-07-25 21:55:06');

-- ----------------------------
-- Table structure for user_selections
-- ----------------------------
DROP TABLE IF EXISTS `user_selections`;
CREATE TABLE `user_selections`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '用户标识',
  `session_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '会话标识',
  `selected_ids` json NULL COMMENT '用户选择的ID列表(JSON数组格式)',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '选择时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_session_id`(`session_id`) USING BTREE,
  INDEX `idx_created_at`(`created_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户选择记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_selections
-- ----------------------------
INSERT INTO `user_selections` VALUES (1, 123, 'abc123', NULL, '2025-07-27 04:12:21');
INSERT INTO `user_selections` VALUES (2, 1, '1', NULL, '2025-07-27 04:47:48');

SET FOREIGN_KEY_CHECKS = 1;
