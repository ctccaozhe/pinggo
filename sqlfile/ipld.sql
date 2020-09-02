/*
 Navicat Premium Data Transfer

 Source Server         : 10.10.10.157
 Source Server Type    : MySQL
 Source Server Version : 50648
 Source Host           : 10.10.10.157:3306
 Source Schema         : ipld

 Target Server Type    : MySQL
 Target Server Version : 50648
 File Encoding         : 65001

 Date: 02/09/2020 17:45:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for host
-- ----------------------------
DROP TABLE IF EXISTS `host`;
CREATE TABLE `host`  (
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ip地址',
  `mac` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'mac地址',
  `detection` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后检测时间',
  `survival` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存活状态1/0',
  `survivaltime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存活时间',
  `system` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统版本',
  `bz` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拥有者',
  `dietime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上一次离线时间',
  PRIMARY KEY (`ip`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of host
-- ----------------------------
INSERT INTO `host` VALUES ('10.10.10.14', '00:0c:29:cb:9c:68', '2020年09月02日 05:45:01pm', '1', '2020年09月01日 05:55:10pm', 'linux ubuntu', '用作搭建docker环境,放置docker虚拟化靶机', '曹喆', NULL);
INSERT INTO `host` VALUES ('10.10.10.145', '00:0c:29:d1:58:70', '2020年09月02日 05:45:01pm', '1', '2020年09月01日 05:55:10pm', 'windows10x64', '用于做为实验用靶机以及蜜罐系统', '曹喆', NULL);
INSERT INTO `host` VALUES ('10.10.10.157', '00:0c:29:c8:c9:8c', '2020年09月02日 05:45:01pm', '1', '2020年09月01日 05:55:10pm', 'linux centos7(64)', '用做搭建测试环境', '曹喆', NULL);
INSERT INTO `host` VALUES ('10.10.10.168', '00:0c:29:9d:2b:c6', '2020年09月02日 05:45:01pm', '1', '2020年09月01日 05:55:10pm', 'linux centos7(64)', '部署OSSEC入侵检测系统', '曹喆', NULL);
INSERT INTO `host` VALUES ('10.10.10.178', '00:0c:29:5c:3f:02', '2020年09月02日 05:45:02pm', '1', '2020年09月01日 05:55:10pm', 'linux centos7(64)', '用于研究云堡垒', '曹喆', NULL);
INSERT INTO `host` VALUES ('10.10.10.179', '00:0c:29:23:0a:59', '2020年09月02日 05:45:02pm', '1', '2020年09月01日 05:55:10pm', 'linux centos7(64)', '用于jumpserver开源堡垒机项目的研究', '曹喆', NULL);
INSERT INTO `host` VALUES ('10.10.100.122', 'fa:ae:56:38:dc:00', '2020年09月02日 05:45:02pm', '1', '2020年09月01日 05:55:10pm', 'linux', 'Kubernetes管理平台。\nadmin/Admin@123', 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.100.126', 'fa:3e:45:c5:61:00', '2020年09月02日 05:45:02pm', '1', '2020年09月01日 05:55:10pm', 'windows server 2003 r2 x64', 'MSSQLServer 2000', 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.100.132', 'fa:c4:e1:7c:d4:00', '2020年09月02日 05:45:03pm', '0', '2020年09月01日 05:55:10pm', 'linux CentOS 7.2', NULL, 'songjin', '2020年09月02日 10:34:19am');
INSERT INTO `host` VALUES ('10.10.100.134', 'FA:71:36:66:A8:00', '2020年09月02日 05:45:03pm', '1', '2020年09月01日 05:55:10pm', 'Linux', NULL, 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.100.149', 'FA:77:42:A3:5A:00', '2020年09月02日 05:45:03pm', '1', '2020年09月01日 05:55:10pm', 'WindowsVirtio', NULL, 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.100.151', 'FA:79:4E:6B:40:00', '2020年09月02日 05:45:03pm', '1', '2020年09月01日 05:55:10pm', 'Windows', NULL, 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.100.154', 'fa:06:84:3a:6b:00', '2020年09月02日 05:45:03pm', '1', '2020年09月02日 12:00:07am', '堡垒机010版本镜像', 'OS：Oracle Linux 5.11 \nroot/pldsec', 'admin', '2020年09月02日 12:00:02am');
INSERT INTO `host` VALUES ('10.10.100.155', 'FA:7A:C6:69:87:00', '2020年09月02日 05:45:03pm', '1', '2020年09月01日 05:55:10pm', 'Windows', NULL, 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.100.160', 'FA:87:2B:CC:3D:00', '2020年09月02日 05:45:03pm', '1', '2020年09月01日 05:55:10pm', 'Windows', '管理员用户：\nlee/pld123Q@\ntest/Admin@123', 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.100.166', 'FA:8D:50:77:33:00', '2020年09月02日 05:45:03pm', '1', '2020年09月01日 05:55:10pm', 'Linux', NULL, 'songjin', NULL);
INSERT INTO `host` VALUES ('10.10.100.168', 'fa:7a:4b:57:f8:00', '2020年09月02日 05:45:03pm', '1', '2020年09月01日 05:55:10pm', 'linux ubuntu 16.04', NULL, 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.100.170', 'fa:ad:3a:93:81:00', '2020年09月02日 05:45:03pm', '1', '2020年09月01日 05:55:10pm', 'windows sever 2012 r2', NULL, 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.100.171', NULL, '2020年09月02日 05:45:04pm', '0', NULL, 'Linux', NULL, 'zhuliang', '2020年09月01日 05:55:11pm');
INSERT INTO `host` VALUES ('10.10.100.173', 'fa:7a:c6:69:87:00', '2020年09月02日 05:45:04pm', '1', '2020年09月01日 05:55:11pm', 'Linux', NULL, 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.100.174', 'fa:53:f2:8d:52:00', '2020年09月02日 05:45:04pm', '1', '2020年09月01日 05:55:11pm', 'windows sever 2012 r2', NULL, 'fanzhenlong', NULL);
INSERT INTO `host` VALUES ('10.10.100.175', 'fa:0f:d5:a1:ce:00', '2020年09月02日 05:45:04pm', '1', '2020年09月01日 05:55:11pm', 'linux CentOS 7', 'oracle11g数据库', 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.100.176', 'FA:B7:3B:55:1A:00', '2020年09月02日 05:45:04pm', '1', '2020年09月01日 05:55:11pm', 'Linux', NULL, 'fanzhenlong', NULL);
INSERT INTO `host` VALUES ('10.10.100.186', 'FA:C4:E1:7C:D4:00', '2020年09月02日 05:45:04pm', '1', '2020年09月01日 05:55:11pm', 'Linux', NULL, 'zhuliang', NULL);
INSERT INTO `host` VALUES ('10.10.100.2', 'FA:4B:A6:D3:D0:00', '2020年09月02日 05:45:04pm', '1', '2020年09月01日 05:55:11pm', 'Linux', '数据库勒索病毒培训 宝塔', 'sushichang', NULL);
INSERT INTO `host` VALUES ('10.10.100.223', NULL, '2020年09月02日 05:45:05pm', '0', NULL, 'Windows server 2012 r2', '测试机', 'zhuliang', '2020年09月01日 05:55:12pm');
INSERT INTO `host` VALUES ('10.10.100.228', 'FA:C7:1D:DE:A0:00', '2020年09月02日 05:45:06pm', '0', '2020年09月01日 05:55:12pm', 'WindowsVirtio', NULL, 'songjin', '2020年09月02日 10:34:22am');
INSERT INTO `host` VALUES ('10.10.100.230', 'fa:d3:64:56:72:00', '2020年09月02日 05:45:06pm', '1', '2020年09月01日 05:55:12pm', 'Linux', '三石安全云堡垒机\ntelnet登入', 'zhuliang', NULL);
INSERT INTO `host` VALUES ('10.10.100.237', 'fa:1a:f9:b4:aa:00', '2020年09月02日 05:45:07pm', '0', '2020年09月01日 05:55:12pm', 'linux CentOS 7.2', NULL, 'songjin', '2020年09月02日 10:34:23am');
INSERT INTO `host` VALUES ('10.10.100.242', 'FA:D1:E4:6B:7E:00', '2020年09月02日 05:45:08pm', '0', '2020年09月01日 05:55:12pm', 'WindowsVirtio', 'db2环境，数据库名：sample\n账号/密码：db2admin/Admin@123', 'admin', '2020年09月02日 11:27:32am');
INSERT INTO `host` VALUES ('10.10.100.243', 'fa:e6:32:42:14:00', '2020年09月02日 05:45:08pm', '1', '2020年09月01日 05:55:12pm', 'Windows', 'appbox', 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.100.247', 'fa:e6:32:42:14:00', '2020年09月02日 05:45:08pm', '1', '2020年09月01日 05:55:12pm', 'Linux', NULL, 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.100.3', '', '2020年09月02日 05:45:08pm', '1', '2020年09月01日 05:55:12pm', 'linux centos7', 'ssh root/su@pldsec 新装的centos7', '苏世昌', NULL);
INSERT INTO `host` VALUES ('10.10.100.34', 'fa:6d:3a:dd:c5:00', '2020年09月02日 05:45:08pm', '1', '2020年09月01日 05:55:12pm', 'ubuntu-16.04.5-server-amd64', NULL, 'fanzhenlong', NULL);
INSERT INTO `host` VALUES ('10.10.100.40', 'FA:50:7B:2D:F1:00', '2020年09月02日 05:45:08pm', '1', '2020年09月01日 05:55:12pm', 'Linux', NULL, '苏世昌', NULL);
INSERT INTO `host` VALUES ('10.10.100.5', 'FA:4D:13:05:3D:00', '2020年09月02日 05:45:08pm', '1', '2020年09月01日 05:55:12pm', 'Linux', 'OS：suse11 sp3\nroot/Admin@123', 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.100.66', 'fa:d4:95:7e:86:00', '2020年09月02日 05:45:08pm', '1', '2020年09月02日 12:36:48am', 'linux CentOS 7', 'ftp\nradius协议\nvnc', 'admin', '2020年09月02日 12:36:45am');
INSERT INTO `host` VALUES ('10.10.100.73', 'FA:56:A9:3F:94:00', '2020年09月02日 05:45:08pm', '1', '2020年09月01日 05:55:12pm', 'WindowsVirtio', NULL, 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.100.8', 'FA:4D:24:9F:6F:00', '2020年09月02日 05:45:08pm', '1', '2020年09月01日 05:55:12pm', 'Linux', NULL, '苏世昌', NULL);
INSERT INTO `host` VALUES ('10.10.200.131', '00:50:56:9A:C6:B2', '2020年09月02日 05:45:08pm', '1', '2020年09月01日 05:55:12pm', 'SUSE openSUSE (64 位)', '三石', '朱懿', NULL);
INSERT INTO `host` VALUES ('10.10.200.132', '00:50:56:9A:00:C8', '2020年09月02日 05:45:08pm', '1', '2020年09月01日 05:55:12pm', 'SUSE openSUSE (64 位)', '三石', '朱懿', NULL);
INSERT INTO `host` VALUES ('10.10.200.134', '00:50:56:9A:47:96', '2020年09月02日 05:45:08pm', '1', '2020年09月01日 05:55:12pm', 'SUSE openSUSE (64 位)', '三石', '朱懿', NULL);
INSERT INTO `host` VALUES ('10.10.200.135', '00:50:56:9A:A7:90', '2020年09月02日 05:45:08pm', '1', '2020年09月01日 05:55:12pm', 'SUSE openSUSE (64 位)', '三石', '朱懿', NULL);
INSERT INTO `host` VALUES ('10.10.200.166', '00:0c:29:ea:4a:61', '2020年09月02日 05:45:08pm', '1', '2020年09月01日 05:55:12pm', '其他 Linux (64 位)', 'webvpn', '刘向', NULL);
INSERT INTO `host` VALUES ('10.10.50.115', 'fa:a1:47:a4:19:01', '2020年09月02日 05:45:08pm', '1', '2020年09月01日 05:55:12pm', 'Linux', NULL, 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.50.121', 'fa:d1:c6:d8:54:00', '2020年09月02日 05:45:08pm', '1', '2020年09月01日 05:55:12pm', 'Linux', '控制台登入', 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.50.126', 'fa:c8:a5:5a:c2:00', '2020年09月02日 05:43:40pm', '0', NULL, 'Linux', '控制台登入', 'admin', '2020年09月01日 05:55:13pm');
INSERT INTO `host` VALUES ('10.10.50.129', 'fa:87:2b:cc:3d:00', '2020年09月02日 05:43:40pm', '1', '2020年09月02日 05:25:05pm', 'Linux', NULL, 'liuxiang', '2020年09月02日 02:48:48pm');
INSERT INTO `host` VALUES ('10.10.50.138', 'fa:25:50:af:4a:00', '2020年09月02日 05:43:40pm', '1', '2020年09月02日 11:27:33am', 'Windows', NULL, 'liuxiang', '2020年09月02日 10:34:25am');
INSERT INTO `host` VALUES ('10.10.50.165', 'fa:4d:30:53:dd:00', '2020年09月02日 05:43:40pm', '1', '2020年09月01日 05:55:15pm', 'Windows', 'appbox', 'liuxiang', NULL);
INSERT INTO `host` VALUES ('10.10.50.170', 'FA:17:42:10:D1:00', '2020年09月02日 05:43:40pm', '1', '2020年09月01日 05:55:15pm', 'Linux', NULL, 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.50.186', 'fa:13:14:3a:98:00', '2020年09月02日 05:43:40pm', '1', '2020年09月01日 05:55:15pm', 'Linux', '测试机', 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.50.187', 'fa:60:51:06:24:00', '2020年09月02日 05:43:41pm', '0', NULL, 'Linux', '控制台登入', 'fanzhenlong', '2020年09月01日 05:55:16pm');
INSERT INTO `host` VALUES ('10.10.50.2', 'fa:4d:24:9f:6f:00', '2020年09月02日 05:43:41pm', '1', '2020年09月02日 09:00:18am', 'Linux', NULL, 'sushichang', '2020年09月02日 09:00:07am');
INSERT INTO `host` VALUES ('10.10.50.231', 'fa:e9:9a:5f:91:00', '2020年09月02日 05:43:41pm', '1', '2020年09月01日 05:55:17pm', 'Linux', NULL, 'duqinkai', NULL);
INSERT INTO `host` VALUES ('10.10.50.236', 'fa:4d:13:05:3d:00', '2020年09月02日 05:43:41pm', '1', '2020年09月02日 11:27:34am', 'Linux', '测试用堡垒机', 'liuxiang', '2020年09月01日 05:55:18pm');
INSERT INTO `host` VALUES ('10.10.50.237', 'fa:1b:5e:05:d5:00', '2020年09月02日 05:43:41pm', '1', '2020年09月01日 05:55:18pm', 'Linux', '王峰-蓝鲸云-测试\n控制台登入', 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.50.238', 'fa:03:2f:88:ce:00', '2020年09月02日 05:43:42pm', '0', NULL, 'Linux', '控制台登入', 'admin', '2020年09月01日 05:55:19pm');
INSERT INTO `host` VALUES ('10.10.50.244', 'fa:c7:1d:de:a0:00', '2020年09月02日 05:43:42pm', '1', '2020年09月01日 05:55:19pm', 'Windows', 'hawoo ftp服务器\nadministrator/admin@123', 'duqinkai', NULL);
INSERT INTO `host` VALUES ('10.10.50.246', 'fa:39:25:45:0b:00', '2020年09月02日 05:43:42pm', '1', '2020年09月02日 11:27:35am', 'Linux', '测试用堡垒机', 'liuxiang', '2020年09月01日 10:45:08pm');
INSERT INTO `host` VALUES ('10.10.50.28', 'fa:50:7b:2d:f1:00', '2020年09月02日 05:43:42pm', '1', '2020年09月01日 05:55:19pm', 'Linux', '控制台登入', 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.50.3', 'fa:02:62:89:f9:00', '2020年09月02日 05:43:42pm', '1', '2020年09月01日 05:55:19pm', 'Linux', NULL, '苏世昌', NULL);
INSERT INTO `host` VALUES ('10.10.50.4', 'fa:77:42:a3:5a:00', '2020年09月02日 05:43:42pm', '1', '2020年09月01日 05:55:19pm', 'Linux', NULL, '苏世昌', NULL);
INSERT INTO `host` VALUES ('10.10.50.6', 'fa:56:a9:3f:94:00', '2020年09月02日 05:43:42pm', '1', '2020年09月02日 03:19:44am', 'Windows', '安装的oa系统，勿删除。', '苏世昌', '2020年09月02日 03:17:31am');
INSERT INTO `host` VALUES ('10.10.50.60', 'fa:2d:77:2b:ae:00', '2020年09月02日 05:43:42pm', '1', '2020年09月01日 05:55:19pm', 'Linux', '控制台登入', 'lidazhuang', NULL);
INSERT INTO `host` VALUES ('10.10.50.85', 'fa:d1:e4:6b:7e:00', '2020年09月02日 05:43:42pm', '1', '2020年09月01日 05:55:19pm', 'Linux', NULL, 'lidazhuang', NULL);
INSERT INTO `host` VALUES ('10.10.50.86', '00:50:56:9A:A7:90', '2020年09月02日 05:43:42pm', '1', '2020年09月01日 05:55:19pm', 'Linux', '控制台登入', 'lidazhuang', NULL);
INSERT INTO `host` VALUES ('10.10.50.99', 'fa:cd:b8:3a:ea:00', '2020年09月02日 05:43:42pm', '1', '2020年09月01日 05:55:19pm', 'Linux', '控制台登入', 'admin', NULL);
INSERT INTO `host` VALUES ('10.10.60.133', '00:50:56:9a:7b:50', '2020年09月02日 05:43:43pm', '0', '2020年09月01日 07:51:09pm', 'CentOS 6 (64 位)', 'waf', '李豪', '2020年09月01日 07:51:10pm');
INSERT INTO `host` VALUES ('10.10.60.156', '00:0c:29:fa:d7:4a', '2020年09月02日 05:43:44pm', '0', NULL, 'Microsoft Windows Server 2016 (64 位)', 'appbox', '刘向', '2020年09月01日 05:55:21pm');
INSERT INTO `host` VALUES ('10.10.60.160', '00:0c:29:85:39:ce', '2020年09月02日 05:43:44pm', '1', '2020年09月01日 05:55:21pm', 'Red Hat Enterprise Linux 8 (64 位)', NULL, '李豪', NULL);
INSERT INTO `host` VALUES ('10.10.60.181', '00:0c:29:99:3a9d', '2020年09月02日 05:43:44pm', '1', '2020年09月02日 02:58:00pm', '其他 Linux (64 位)', 'suse', '卢', '2020年09月02日 02:57:17pm');
INSERT INTO `host` VALUES ('10.10.60.236', '00:0c:29:0b:19:70', '2020年09月02日 05:43:45pm', '0', NULL, 'Microsoft Windows 10 (64 位)', '开发机', '李豪', '2020年09月01日 05:55:22pm');

SET FOREIGN_KEY_CHECKS = 1;
