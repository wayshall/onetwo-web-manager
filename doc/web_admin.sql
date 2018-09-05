/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : localhost:3306
 Source Schema         : web_admin

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : 65001

 Date: 05/09/2018 19:42:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_application
-- ----------------------------
DROP TABLE IF EXISTS `admin_application`;
CREATE TABLE `admin_application`  (
  `CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '系统代码',
  `NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '系统名称',
  `BASE_URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '访问路径',
  `CREATE_AT` datetime(0) NULL DEFAULT NULL,
  `UPDATE_AT` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '系统模块表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_application
-- ----------------------------
INSERT INTO `admin_application` VALUES ('Apps', '系统权限', NULL, '2017-10-26 13:21:53', '2017-10-26 13:27:17');
INSERT INTO `admin_application` VALUES ('Products', '产品管理系统', NULL, '2017-01-09 02:09:50', '2017-03-27 18:15:43');
INSERT INTO `admin_application` VALUES ('Systems', '后台管理系统', NULL, '2017-01-09 02:09:07', '2017-01-16 02:01:13');

-- ----------------------------
-- Table structure for admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_login_log`;
CREATE TABLE `admin_login_log`  (
  `ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `USER_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名',
  `NICK_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '昵称',
  `NGID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'ngid',
  `OPERATION_TYE` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作类型',
  `OPERATION_TIME` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `IS_SUCCESS` bit(1) NULL DEFAULT NULL COMMENT '是否成功',
  `USER_IP` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户IP',
  `BROWSER` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '浏览器',
  `USER_AGENT` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'USER_AGENT',
  `SESSION_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '服务器会话id',
  `SECURITY_TOKEN` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '安全token',
  `ERROR_MSG` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '登录异常信息',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for admin_permission
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission`;
CREATE TABLE `admin_permission`  (
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '权限代码',
  `PTYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '权限类型',
  `DATA_FROM` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'SYNC:自动同步\r\n            MANUAL:手动添加',
  `URL` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '如果该权限是菜单，代表点击菜单时可以访问的目标地址',
  `METHOD` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '父菜单ID',
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SORT` int(11) NULL DEFAULT NULL,
  `HIDDEN` smallint(6) NULL DEFAULT NULL,
  `CHILDREN_SIZE` int(11) NULL DEFAULT NULL COMMENT '子节点数量',
  `APP_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RESOURCES_PATTERN` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '如果权限保护是通过某种模式匹配，比如web的url\r\n            则此字段代表了这权限需要保护的资源。\r\n            其他模式的权限不需要用到此字段。\r\n            如果是url，则按照下面的格式解释，多个模式之间用逗号分隔：\r\n            请求方法 | url地址，如：post | /user/create, /user/list\r\n            没有请求方法的默认为get\r\n            ',
  PRIMARY KEY (`CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_permission
-- ----------------------------
INSERT INTO `admin_permission` VALUES ('Apps', 'MENU', 'SYNC', '', NULL, NULL, '系统权限', 1, 0, 1, 'Apps', NULL);
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule', 'MENU', 'SYNC', '', NULL, 'Apps', '权限管理系统', 3497, 0, 5, 'Apps', NULL);
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_ApplicationMgr', 'MENU', 'SYNC', '/web-admin/application', 'GET', 'Apps_AdminModule', '应用系统管理', 3, 0, 3, 'Apps', 'GET|/web-admin/application*, GET|/web-admin/application/*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_ApplicationMgr_Create', 'FUNCTION', 'SYNC', NULL, NULL, 'Apps_AdminModule_ApplicationMgr', '新增', 3512, 0, 0, 'Apps', 'POST|/web-admin/application*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_ApplicationMgr_Delete', 'FUNCTION', 'SYNC', NULL, NULL, 'Apps_AdminModule_ApplicationMgr', '删除', 3510, 0, 0, 'Apps', 'DELETE|/web-admin/application*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_ApplicationMgr_Update', 'FUNCTION', 'SYNC', NULL, NULL, 'Apps_AdminModule_ApplicationMgr', '更新', 3511, 0, 0, 'Apps', 'PUT|/web-admin/application/*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_DictMgr', 'MENU', 'SYNC', '/web-admin/dictionary', 'GET', 'Apps_AdminModule', '字典配置管理', 3498, 0, 0, 'Apps', 'GET|/web-admin/dictionary*, GET|/web-admin/dictionary/*, PUT|/web-admin/dictionary/*, DELETE|/web-admin/dictionary/*, POST|/web-admin/dictionary*, GET|/web-admin/dictionary/children*, DELETE|/web-admin/dictionary*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_RoleMgr', 'MENU', 'SYNC', '/web-admin/role', 'GET', 'Apps_AdminModule', '角色管理', 5, 0, 4, 'Apps', 'GET|/web-admin/role*, GET|/web-admin/role/*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_RoleMgr_AssignPermission', 'FUNCTION', 'SYNC', NULL, NULL, 'Apps_AdminModule_RoleMgr', '分配权限', 3505, 0, 0, 'Apps', 'GET|/web-admin/application/bindPermission*, POST|/web-admin/rolePermission/*, GET|/web-admin/rolePermission/*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_RoleMgr_Create', 'FUNCTION', 'SYNC', NULL, NULL, 'Apps_AdminModule_RoleMgr', '新增', 3508, 0, 0, 'Apps', 'POST|/web-admin/role*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_RoleMgr_Delete', 'FUNCTION', 'SYNC', NULL, NULL, 'Apps_AdminModule_RoleMgr', '删除', 3506, 0, 0, 'Apps', 'DELETE|/web-admin/role*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_RoleMgr_Update', 'FUNCTION', 'SYNC', NULL, NULL, 'Apps_AdminModule_RoleMgr', '更新', 3507, 0, 0, 'Apps', 'PUT|/web-admin/role/*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_UserMgr', 'MENU', 'SYNC', '/web-admin/user', 'GET', 'Apps_AdminModule', '用户管理', 10, 0, 4, 'Apps', 'GET|/web-admin/user*, GET|/web-admin/user/*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_UserMgr_AssignRole', 'FUNCTION', 'SYNC', NULL, NULL, 'Apps_AdminModule_UserMgr', '分配角色', 3500, 0, 0, 'Apps', 'PUT|/web-admin/userRole/*, GET|/web-admin/userRole/*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_UserMgr_Create', 'FUNCTION', 'SYNC', NULL, NULL, 'Apps_AdminModule_UserMgr', '新增', 3503, 0, 0, 'Apps', 'POST|/web-admin/user*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_UserMgr_Delete', 'FUNCTION', 'SYNC', NULL, NULL, 'Apps_AdminModule_UserMgr', '删除', 3501, 0, 0, 'Apps', 'DELETE|/web-admin/user*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_UserMgr_Update', 'FUNCTION', 'SYNC', NULL, NULL, 'Apps_AdminModule_UserMgr', '更新', 3502, 0, 0, 'Apps', 'PUT|/web-admin/user/*');
INSERT INTO `admin_permission` VALUES ('Apps_AdminModule_UserProfile', 'MENU', 'SYNC', '/web-admin/userProfile', 'GET', 'Apps_AdminModule', '修改资料', 3513, 0, 0, 'Apps', 'PUT|/web-admin/userProfile*, GET|/web-admin/userProfile*');
INSERT INTO `admin_permission` VALUES ('Products', 'MENU', 'SYNC', '', NULL, NULL, '产品管理系统', 1, 0, 2, 'Products', NULL);
INSERT INTO `admin_permission` VALUES ('Products_AdminMgr', 'MENU', 'SYNC', '', NULL, 'Products', '用户角色权限管理', 339, 0, 4, 'Products', NULL);
INSERT INTO `admin_permission` VALUES ('Products_AdminMgr_ApplicationMgr', 'MENU', 'SYNC', '/web-admin/application', 'GET', 'Products_AdminMgr', '应用系统管理', 3, 0, 3, 'Products', 'GET|/web-admin/application*, GET|/web-admin/application/*');
INSERT INTO `admin_permission` VALUES ('Products_AdminMgr_ApplicationMgr_Create', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_AdminMgr_ApplicationMgr', '新增', 341, 0, 0, 'Products', 'POST|/web-admin/application*');
INSERT INTO `admin_permission` VALUES ('Products_AdminMgr_ApplicationMgr_Delete', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_AdminMgr_ApplicationMgr', '删除', 342, 0, 0, 'Products', 'DELETE|/web-admin/application*');
INSERT INTO `admin_permission` VALUES ('Products_AdminMgr_ApplicationMgr_Update', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_AdminMgr_ApplicationMgr', '更新', 343, 0, 0, 'Products', 'PUT|/web-admin/application/*');
INSERT INTO `admin_permission` VALUES ('Products_AdminMgr_DictMgr', 'MENU', 'SYNC', '/web-admin/dictionary', 'GET', 'Products_AdminMgr', '字典配置管理', 344, 0, 0, 'Products', 'GET|/web-admin/dictionary*, GET|/web-admin/dictionary/*, PUT|/web-admin/dictionary/*, DELETE|/web-admin/dictionary/*, POST|/web-admin/dictionary*, GET|/web-admin/dictionary/children*, DELETE|/web-admin/dictionary*');
INSERT INTO `admin_permission` VALUES ('Products_AdminMgr_RoleMgr', 'MENU', 'SYNC', '/web-admin/role', 'GET', 'Products_AdminMgr', '角色管理', 5, 0, 4, 'Products', 'GET|/web-admin/role*, GET|/web-admin/role/*');
INSERT INTO `admin_permission` VALUES ('Products_AdminMgr_RoleMgr_AssignPermission', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_AdminMgr_RoleMgr', '分配权限', 346, 0, 0, 'Products', 'GET|/web-admin/application/bindPermission*, POST|/web-admin/rolePermission/*, GET|/web-admin/rolePermission/*');
INSERT INTO `admin_permission` VALUES ('Products_AdminMgr_RoleMgr_Create', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_AdminMgr_RoleMgr', '新增', 347, 0, 0, 'Products', 'POST|/web-admin/role*');
INSERT INTO `admin_permission` VALUES ('Products_AdminMgr_RoleMgr_Delete', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_AdminMgr_RoleMgr', '删除', 348, 0, 0, 'Products', 'DELETE|/web-admin/role*');
INSERT INTO `admin_permission` VALUES ('Products_AdminMgr_RoleMgr_Update', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_AdminMgr_RoleMgr', '更新', 349, 0, 0, 'Products', 'PUT|/web-admin/role/*');
INSERT INTO `admin_permission` VALUES ('Products_AdminMgr_UserMgr', 'MENU', 'SYNC', '/web-admin/user', 'GET', 'Products_AdminMgr', '用户管理', 10, 0, 4, 'Products', 'GET|/web-admin/user*, GET|/web-admin/user/*');
INSERT INTO `admin_permission` VALUES ('Products_AdminMgr_UserMgr_AssignRole', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_AdminMgr_UserMgr', '分配角色', 351, 0, 0, 'Products', 'PUT|/web-admin/userRole/*, GET|/web-admin/userRole/*');
INSERT INTO `admin_permission` VALUES ('Products_AdminMgr_UserMgr_Create', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_AdminMgr_UserMgr', '新增', 352, 0, 0, 'Products', 'POST|/web-admin/user*');
INSERT INTO `admin_permission` VALUES ('Products_AdminMgr_UserMgr_Delete', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_AdminMgr_UserMgr', '删除', 353, 0, 0, 'Products', 'DELETE|/web-admin/user*');
INSERT INTO `admin_permission` VALUES ('Products_AdminMgr_UserMgr_Update', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_AdminMgr_UserMgr', '更新', 354, 0, 0, 'Products', 'PUT|/web-admin/user/*');
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr', 'MENU', 'SYNC', '', NULL, 'Products', '系统管理', 1, 0, 5, 'Products', NULL);
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_ActiveMgr', 'MENU', 'SYNC', '', 'GET', 'Products_SystemMgr', '激活管理', 356, 0, 6, 'Products', 'GET|/manager/productActive/*');
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_ActiveMgr_ActiveIncomeView', 'MENU', 'SYNC', '/manager/activeIncome/statis', 'GET', 'Products_SystemMgr_ActiveMgr', '激活收入查看', 357, 0, 0, 'Products', 'GET|/manager/activeIncome/statis*');
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_ActiveMgr_Create', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_SystemMgr_ActiveMgr', '新增', 358, 0, 0, 'Products', 'POST|/manager/productActive*');
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_ActiveMgr_Delete', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_SystemMgr_ActiveMgr', '删除', 359, 0, 0, 'Products', 'DELETE|/manager/productActive*');
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_ActiveMgr_List', 'MENU', 'SYNC', '/manager/productActive', 'GET', 'Products_SystemMgr_ActiveMgr', '激活列表', 360, 0, 0, 'Products', 'GET|/manager/productActive*');
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_ActiveMgr_Statis', 'MENU', 'SYNC', '/manager/productActive/statis', 'GET', 'Products_SystemMgr_ActiveMgr', '激活统计', 361, 0, 0, 'Products', 'GET|/manager/productActive/statis*');
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_ActiveMgr_Update', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_SystemMgr_ActiveMgr', '更新', 362, 0, 0, 'Products', 'PUT|/manager/productActive/*');
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_IncomeMgr', 'MENU', 'SYNC', '', 'GET', 'Products_SystemMgr', '收益管理', 363, 0, 5, 'Products', 'GET|/manager/productIncome/*');
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_IncomeMgr_Create', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_SystemMgr_IncomeMgr', '新增', 364, 0, 0, 'Products', 'POST|/manager/productIncome*');
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_IncomeMgr_Delete', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_SystemMgr_IncomeMgr', '删除', 365, 0, 0, 'Products', 'DELETE|/manager/productIncome*');
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_IncomeMgr_List', 'MENU', 'SYNC', '/manager/productIncome', 'GET', 'Products_SystemMgr_IncomeMgr', '收益列表', 366, 0, 0, 'Products', 'GET|/manager/productIncome*');
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_IncomeMgr_Statis', 'MENU', 'SYNC', '/manager/productIncome/statis', 'GET', 'Products_SystemMgr_IncomeMgr', '收支统计', 367, 0, 0, 'Products', 'GET|/manager/productIncome/statis*');
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_IncomeMgr_Update', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_SystemMgr_IncomeMgr', '更新', 368, 0, 0, 'Products', 'PUT|/manager/productIncome/*');
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_ProductMgr', 'MENU', 'SYNC', '/manager/product', 'GET', 'Products_SystemMgr', '产品管理', 369, 0, 3, 'Products', 'GET|/manager/product*, GET|/manager/product/*');
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_ProductMgr_Create', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_SystemMgr_ProductMgr', '新增', 370, 0, 0, 'Products', 'POST|/manager/product*');
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_ProductMgr_Delete', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_SystemMgr_ProductMgr', '删除', 371, 0, 0, 'Products', 'DELETE|/manager/product*');
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_ProductMgr_Update', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_SystemMgr_ProductMgr', '更新', 372, 0, 0, 'Products', 'PUT|/manager/product/*');
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_UserMgr', 'MENU', 'SYNC', '', NULL, 'Products_SystemMgr', '账号管理', 373, 0, 3, 'Products', NULL);
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_UserMgr_Create', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_SystemMgr_UserMgr', '新增', 374, 0, 0, 'Products', NULL);
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_UserMgr_Delete', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_SystemMgr_UserMgr', '删除', 375, 0, 0, 'Products', NULL);
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_UserMgr_Update', 'FUNCTION', 'SYNC', NULL, NULL, 'Products_SystemMgr_UserMgr', '更新', 376, 0, 0, 'Products', NULL);
INSERT INTO `admin_permission` VALUES ('Products_SystemMgr_UserProfile', 'MENU', 'SYNC', '/manager/userProfile', 'GET', 'Products_SystemMgr', '修改资料', 377, 0, 0, 'Products', 'PUT|/manager/userProfile*, GET|/manager/userProfile*');
INSERT INTO `admin_permission` VALUES ('Systems', 'MENU', 'SYNC', '', NULL, NULL, '后台管理系统', 1, 0, 1, 'Systems', NULL);
INSERT INTO `admin_permission` VALUES ('Systems_AdminModule', 'MENU', 'SYNC', '', NULL, 'Systems', '用户角色权限管理', 1584, 0, 4, 'Systems', NULL);
INSERT INTO `admin_permission` VALUES ('Systems_AdminModule_ApplicationMgr', 'MENU', 'SYNC', '/web-admin/application', 'GET', 'Systems_AdminModule', '应用系统管理', 3, 0, 3, 'Systems', 'GET|/web-admin/application*, GET|/web-admin/application/*');
INSERT INTO `admin_permission` VALUES ('Systems_AdminModule_ApplicationMgr_Create', 'FUNCTION', 'SYNC', NULL, NULL, 'Systems_AdminModule_ApplicationMgr', '新增', 1586, 0, 0, 'Systems', 'POST|/web-admin/application*');
INSERT INTO `admin_permission` VALUES ('Systems_AdminModule_ApplicationMgr_Delete', 'FUNCTION', 'SYNC', NULL, NULL, 'Systems_AdminModule_ApplicationMgr', '删除', 1587, 0, 0, 'Systems', 'DELETE|/web-admin/application*');
INSERT INTO `admin_permission` VALUES ('Systems_AdminModule_ApplicationMgr_Update', 'FUNCTION', 'SYNC', NULL, NULL, 'Systems_AdminModule_ApplicationMgr', '更新', 1588, 0, 0, 'Systems', 'PUT|/web-admin/application/*');
INSERT INTO `admin_permission` VALUES ('Systems_AdminModule_DictMgr', 'MENU', 'SYNC', '/web-admin/dictionary', 'GET', 'Systems_AdminModule', '字典配置管理', 1589, 0, 0, 'Systems', 'GET|/web-admin/dictionary*, GET|/web-admin/dictionary/*, PUT|/web-admin/dictionary/*, DELETE|/web-admin/dictionary/*, POST|/web-admin/dictionary*, GET|/web-admin/dictionary/children*, DELETE|/web-admin/dictionary*');
INSERT INTO `admin_permission` VALUES ('Systems_AdminModule_RoleMgr', 'MENU', 'SYNC', '/web-admin/role', 'GET', 'Systems_AdminModule', '角色管理', 5, 0, 4, 'Systems', 'GET|/web-admin/role*, GET|/web-admin/role/*');
INSERT INTO `admin_permission` VALUES ('Systems_AdminModule_RoleMgr_AssignPermission', 'FUNCTION', 'SYNC', NULL, NULL, 'Systems_AdminModule_RoleMgr', '分配权限', 1591, 0, 0, 'Systems', 'GET|/web-admin/application/bindPermission*, POST|/web-admin/rolePermission/*, GET|/web-admin/rolePermission/*');
INSERT INTO `admin_permission` VALUES ('Systems_AdminModule_RoleMgr_Create', 'FUNCTION', 'SYNC', NULL, NULL, 'Systems_AdminModule_RoleMgr', '新增', 1592, 0, 0, 'Systems', 'POST|/web-admin/role*');
INSERT INTO `admin_permission` VALUES ('Systems_AdminModule_RoleMgr_Delete', 'FUNCTION', 'SYNC', NULL, NULL, 'Systems_AdminModule_RoleMgr', '删除', 1593, 0, 0, 'Systems', 'DELETE|/web-admin/role*');
INSERT INTO `admin_permission` VALUES ('Systems_AdminModule_RoleMgr_Update', 'FUNCTION', 'SYNC', NULL, NULL, 'Systems_AdminModule_RoleMgr', '更新', 1594, 0, 0, 'Systems', 'PUT|/web-admin/role/*');
INSERT INTO `admin_permission` VALUES ('Systems_AdminModule_UserMgr', 'MENU', 'SYNC', '/web-admin/user', 'GET', 'Systems_AdminModule', '用户管理', 10, 0, 4, 'Systems', 'GET|/web-admin/user*, GET|/web-admin/user/*');
INSERT INTO `admin_permission` VALUES ('Systems_AdminModule_UserMgr_AssignRole', 'FUNCTION', 'SYNC', NULL, NULL, 'Systems_AdminModule_UserMgr', '分配角色', 1596, 0, 0, 'Systems', 'PUT|/web-admin/userRole/*, GET|/web-admin/userRole/*');
INSERT INTO `admin_permission` VALUES ('Systems_AdminModule_UserMgr_Create', 'FUNCTION', 'SYNC', NULL, NULL, 'Systems_AdminModule_UserMgr', '新增', 1597, 0, 0, 'Systems', 'POST|/web-admin/user*');
INSERT INTO `admin_permission` VALUES ('Systems_AdminModule_UserMgr_Delete', 'FUNCTION', 'SYNC', NULL, NULL, 'Systems_AdminModule_UserMgr', '删除', 1598, 0, 0, 'Systems', 'DELETE|/web-admin/user*');
INSERT INTO `admin_permission` VALUES ('Systems_AdminModule_UserMgr_Update', 'FUNCTION', 'SYNC', NULL, NULL, 'Systems_AdminModule_UserMgr', '更新', 1599, 0, 0, 'Systems', 'PUT|/web-admin/user/*');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色名',
  `STATUS` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'NORMAL' COMMENT '状态\r\n            NORMAL:正常\r\n            STOP:停用',
  `REMARK` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '角色描述',
  `CREATE_AT` datetime(0) NULL DEFAULT NULL,
  `UPDATE_AT` datetime(0) NULL DEFAULT NULL,
  `APP_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '系统代码',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1, '管理员', 'NORMAL', '', '2016-07-17 01:29:30', '2016-07-17 01:29:30', NULL);

-- ----------------------------
-- Table structure for admin_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permission`;
CREATE TABLE `admin_role_permission`  (
  `ROLE_ID` decimal(8, 0) NOT NULL,
  `PERMISSION_CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '权限代码',
  PRIMARY KEY (`ROLE_ID`, `PERMISSION_CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_role_permission
-- ----------------------------
INSERT INTO `admin_role_permission` VALUES (1, 'Apps_AdminModule_AdminUserMgr');
INSERT INTO `admin_role_permission` VALUES (1, 'Apps_AdminModule_AdminUserMgr_Create');
INSERT INTO `admin_role_permission` VALUES (1, 'Apps_AdminModule_AdminUserMgr_Delete');
INSERT INTO `admin_role_permission` VALUES (1, 'Apps_AdminModule_AdminUserMgr_Update');

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `NICK_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '昵称',
  `PASSWORD` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `EMAIL` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电子邮件',
  `BANK` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `QQ` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `MOBILE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机',
  `GENDER` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `STATUS` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '状态:\r\n            NORMAL-正常\r\n            STOP-停用\r\n            ',
  `BIRTHDAY` datetime(0) NULL DEFAULT NULL COMMENT '出生日期',
  `CREATE_AT` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_AT` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `APP_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `AVATAR` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (1, 'root', '终极管理员', '$2a$10$4ft6RTeIB2.FBkWUEWY10OI0YAfftSIlHa2cZmmc8OpcJEbUaMkji', NULL, NULL, NULL, NULL, NULL, 'NORMAL', '2016-07-18 00:46:32', NULL, '2016-07-17 00:46:37', NULL, NULL);
INSERT INTO `admin_user` VALUES (2, 'test', '测试用户', '$2a$10$37LQSTCGxXbK27NmNLC.XOEluiTE3OCVkbNQUw5qqnYxqXqmDGUEy', '', NULL, NULL, '', 'MALE', 'NORMAL', '2016-07-17 22:30:24', '2016-07-17 22:30:27', '2017-05-17 12:08:03', NULL, NULL);

-- ----------------------------
-- Table structure for admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role`;
CREATE TABLE `admin_user_role`  (
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色主键',
  `USER_ID` bigint(20) NOT NULL COMMENT '用户主键',
  PRIMARY KEY (`ROLE_ID`, `USER_ID`) USING BTREE,
  INDEX `FK_R_AD_ROLE_USER`(`USER_ID`) USING BTREE,
  CONSTRAINT `FK_R_AD_ROLE_USER` FOREIGN KEY (`USER_ID`) REFERENCES `admin_user` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_R_AD_USER_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `admin_role` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `data_dictionary`;
CREATE TABLE `data_dictionary`  (
  `CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '字典编码\r\n            同一类别的字典编码，以类别编码为前缀,全部为大写字母',
  `NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '显示名称',
  `VALUE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字典值',
  `PARENT_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '所属类别',
  `IS_VALID` tinyint(1) NULL DEFAULT NULL COMMENT '是否有效\r\n            0:无效\r\n            1:有效\r\n            默认有效\r\n            ',
  `IS_ENUM_VALUE` tinyint(1) NULL DEFAULT NULL COMMENT '是否枚举常量',
  `SORT` int(11) NULL DEFAULT NULL COMMENT '排序',
  `REMARK` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `CREATE_AT` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `UPDATE_AT` datetime(0) NULL DEFAULT NULL COMMENT '最后更新日期',
  PRIMARY KEY (`CODE`) USING BTREE,
  INDEX `AK_DICT_UNIQUE_CODE`(`CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '数据字典表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of data_dictionary
-- ----------------------------
INSERT INTO `data_dictionary` VALUES ('SEX', '性别', 'SEX', '', 1, NULL, NULL, '', NULL, '2016-07-17 23:52:52');
INSERT INTO `data_dictionary` VALUES ('SEX_FEMALE', '女', 'FEMALE', 'SEX', 1, NULL, NULL, '', NULL, '2016-07-18 00:03:18');
INSERT INTO `data_dictionary` VALUES ('SEX_MALE', '男', 'MALE', 'SEX', 1, NULL, NULL, '', NULL, '2016-07-18 00:03:08');

-- ----------------------------
-- Table structure for databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE `databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of databasechangelog
-- ----------------------------
INSERT INTO `databasechangelog` VALUES ('1', 'way', 'src/main/resources/liquibase/db.changelog.xml', '2016-09-27 11:45:03', 1, 'EXECUTED', '7:10349a8fb3a7208fb013dcd6ca68c593', 'createTable tableName=ADMIN_LOGIN_LOG', '', NULL, '3.5.0', NULL, NULL, '4947903828');

-- ----------------------------
-- Table structure for databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE `databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of databasechangeloglock
-- ----------------------------
INSERT INTO `databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token`  (
  `authentication_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `token_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `token` blob NULL,
  `user_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `client_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `authentication` blob NULL,
  `refresh_token` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`  (
  `client_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `additional_information` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('test', NULL, 'test', 'read, write', 'client_credentials,refresh_token', NULL, NULL, 3600, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oauth_client_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_token`;
CREATE TABLE `oauth_client_token`  (
  `authentication_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `token_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `token` blob NULL,
  `user_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `client_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for oauth_code
-- ----------------------------
DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code`  (
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `authentication` blob NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for oauth_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token`  (
  `token_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `token` blob NULL,
  `authentication` blob NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品名称',
  `PRICE` decimal(10, 2) NOT NULL COMMENT '产品单价',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '产品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (2, '测试产品', 222.00);
INSERT INTO `product` VALUES (3, '部落战争', 108.00);
INSERT INTO `product` VALUES (4, '测试', 1.10);

-- ----------------------------
-- Table structure for product_active
-- ----------------------------
DROP TABLE IF EXISTS `product_active`;
CREATE TABLE `product_active`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACTIVE_DATE` date NOT NULL COMMENT '时间',
  `ACTIVE_USER_ID` bigint(20) NOT NULL COMMENT '激活所属账户',
  `PRODUCT_ID` bigint(20) NOT NULL COMMENT '激活产品',
  `PRODUCT_PRICE` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '产品激活单价',
  `ACTIVE_AMOUNT` int(11) NOT NULL COMMENT '激活数量',
  `REMARK` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_Reference_1`(`PRODUCT_ID`) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '产品激活表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_active
-- ----------------------------
INSERT INTO `product_active` VALUES (1, '2016-07-19', 2, 2, 222.00, 23, '');
INSERT INTO `product_active` VALUES (2, '2016-07-19', 3, 2, 222.00, 22, '');
INSERT INTO `product_active` VALUES (3, '2016-07-23', 3, 3, 108.00, 33, '');
INSERT INTO `product_active` VALUES (4, '2016-07-23', 4, 3, 108.00, 33, '');

-- ----------------------------
-- Table structure for product_income
-- ----------------------------
DROP TABLE IF EXISTS `product_income`;
CREATE TABLE `product_income`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `INCOME_DATE` date NOT NULL COMMENT '时间',
  `PRODUCT_ID` bigint(20) NOT NULL COMMENT '产品',
  `INCOME` decimal(10, 2) NOT NULL COMMENT '收益（元）',
  `REMARK` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注说明',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_Reference_2`(`PRODUCT_ID`) USING BTREE,
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '产品收益表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_income
-- ----------------------------
INSERT INTO `product_income` VALUES (4, '2016-07-25', 2, 33.00, '');
INSERT INTO `product_income` VALUES (5, '2016-07-25', 3, 33.00, '');

SET FOREIGN_KEY_CHECKS = 1;
