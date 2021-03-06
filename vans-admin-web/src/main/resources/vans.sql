/*
Navicat MySQL Data Transfer

Source Server         : 192.168.240.20_DEV
Source Server Version : 50627
Source Host           : 192.168.240.20:3306
Source Database       : vans

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2018-01-22 16:39:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_dict_entry`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_entry`;
CREATE TABLE `sys_dict_entry` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `dicttype_id` varchar(50) NOT NULL COMMENT '业务字典子选项',
  `dict_id` varchar(100) NOT NULL,
  `dict_name` varchar(400) DEFAULT NULL,
  `status` int(2) DEFAULT NULL COMMENT '状态（1使用中/0已废弃）',
  `sort` int(4) DEFAULT NULL COMMENT '排序编码',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记\n1：删除\n0：未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_dict_entry
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `dicttype_id` varchar(100) NOT NULL COMMENT '业务字典编码',
  `dicttype_name` varchar(100) DEFAULT NULL COMMENT '业务字典名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记\n1：删除\n0：未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `log_name` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `user_id` int(65) DEFAULT NULL COMMENT '管理员id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否执行成功',
  `message` text COMMENT '具体消息',
  `ip` varchar(255) DEFAULT NULL COMMENT '登录ip',
  `del_falg` varchar(32) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录记录';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` int(8) DEFAULT NULL COMMENT '父ID',
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '树ID',
  `text` varchar(100) NOT NULL COMMENT '菜单名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `url` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target_type` varchar(32) DEFAULT NULL COMMENT '页面打开方式',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) DEFAULT '1' COMMENT '是否显示\n1：显示\n0：隐藏',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记\n1：删除\n0：未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_operation_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `log_type` varchar(56) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '日志类型',
  `log_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '日志名称',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类名称',
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '方法名称',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `succeed` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否成功',
  `message` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `code` varchar(36) NOT NULL COMMENT '角色代码',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enabled` char(1) DEFAULT '1' COMMENT '是否可用\n1：可用\n0：停用',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记\n1：删除\n0：未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(8) NOT NULL COMMENT '角色ID',
  `menu_id` int(8) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_schedule_job`
-- ----------------------------
DROP TABLE IF EXISTS `sys_schedule_job`;
CREATE TABLE `sys_schedule_job` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `job_name` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(50) DEFAULT NULL COMMENT '任务分组',
  `job_status` varchar(10) DEFAULT NULL COMMENT '任务状态（是否启动任务）',
  `cron_expression` varchar(30) DEFAULT NULL COMMENT 'cron表达式',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `bean_class` varchar(100) DEFAULT NULL COMMENT '任务调用的 包名+类名',
  `is_concurrent` varchar(15) DEFAULT NULL COMMENT '任务是否有状态',
  `spring_id` varchar(50) DEFAULT NULL COMMENT 'spring bean',
  `method_name` varchar(30) DEFAULT NULL COMMENT '任务调用的方法',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(10) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='spring quartz定时任务记录';

-- ----------------------------
-- Records of sys_schedule_job
-- ----------------------------
INSERT INTO `sys_schedule_job` VALUES ('1', 'test', 'vans', '1', '0/10 * * * * ?', 'test', 'cn.com.guoqing.vans.admin.timer.quartz.TestQuartz', '1', '', 'test', '2018-01-19 13:47:44', '2018-01-19 13:47:47', '0');

-- ----------------------------
-- Table structure for `sys_schedule_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_schedule_log`;
CREATE TABLE `sys_schedule_log` (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `job_id` int(9) DEFAULT NULL COMMENT '当前作业ID',
  `job_name` varchar(100) DEFAULT NULL COMMENT '作业名称',
  `job_group` varchar(50) DEFAULT NULL COMMENT '所属分组',
  `bean_class` varchar(80) DEFAULT NULL,
  `method_name` varchar(50) DEFAULT NULL COMMENT '方法名',
  `bean_id` varchar(50) DEFAULT NULL COMMENT '所属bean',
  `para_value` varchar(150) DEFAULT NULL COMMENT '当前运行方法参数值',
  `start_time` datetime DEFAULT NULL COMMENT '定时器运行开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '方法运行结束时间',
  `run_time` varchar(50) DEFAULT NULL COMMENT '运行时长',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(10) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8 COMMENT='定时器运行时日志表';

-- ----------------------------
-- Records of sys_schedule_log
-- ----------------------------
INSERT INTO `sys_schedule_log` VALUES ('1', '1', 'test', 'vans', 'cn.com.guoqing.vans.admin.timer.quartz.TestQuartz', 'test', '', '[]', '2018-01-22 14:16:10', '2018-01-22 14:16:10', '23', '2018-01-22 14:16:10', '2018-01-22 14:16:10', '0');
INSERT INTO `sys_schedule_log` VALUES ('2', '1', 'test', 'vans', 'cn.com.guoqing.vans.admin.timer.quartz.TestQuartz', 'test', '', '[]', '2018-01-22 14:16:20', '2018-01-22 14:16:20', '23', '2018-01-22 14:16:20', '2018-01-22 14:16:20', '0');

-- ----------------------------
-- Table structure for `sys_schedule_para`
-- ----------------------------
DROP TABLE IF EXISTS `sys_schedule_para`;
CREATE TABLE `sys_schedule_para` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_id` int(9) DEFAULT NULL COMMENT '关联定时作业的ID',
  `param_value` varchar(200) DEFAULT NULL COMMENT '定时器作业参数值',
  `sortno` int(3) DEFAULT NULL COMMENT '定时器作业参数的顺序',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(10) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时器作业的参数表';

-- ----------------------------
-- Records of sys_schedule_para
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `name` varchar(36) NOT NULL COMMENT '姓名',
  `email` varchar(50) DEFAULT NULL COMMENT '邮件',
  `phone` varchar(36) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(36) DEFAULT NULL COMMENT '手机',
  `enabled` char(1) DEFAULT '1' COMMENT '是否可用\n1：可用\n0：停用',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记\n1：删除\n0：未删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name_UNIQUE` (`login_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_user
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(8) NOT NULL COMMENT '用户ID',
  `role_id` int(8) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
