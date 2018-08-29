DROP DATABASE IF EXISTS video;

CREATE DATABASE video
  DEFAULT CHARACTER SET utf8
  COLLATE utf8_general_ci;

USE video;

-- ----------------------------
--  Table structure for tb_user
-- ----------------------------
DROP TABLE
IF EXISTS tb_user;

CREATE TABLE tb_user
(
  user_id      BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '用户ID',
  mobile_no    VARCHAR(20)                           NOT NULL
  COMMENT '手机号',
  name         VARCHAR(32)                           NOT NULL                    DEFAULT ''
  COMMENT '姓名',
  is_deleted   TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '用户表';
CREATE UNIQUE INDEX mobile_no_UNIQUE
  ON tb_user (mobile_no);

-- ----------------------------
--  Table structure for tb_role
-- ----------------------------
DROP TABLE
IF EXISTS tb_role;

CREATE TABLE tb_role
(
  role_id      BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  role_code    VARCHAR(32)                           NOT NULL
  COMMENT '角色代码',
  role_name    VARCHAR(32)                           NOT NULL
  COMMENT '角色名称',
  is_deleted   TINYINT                               NOT NULL                DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time TIMESTAMP                             NOT NULL                DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time TIMESTAMP                             NOT NULL                DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '角色表';
CREATE UNIQUE INDEX role_code_UNIQUE
  ON tb_role (role_code);

-- ----------------------------
--  Table structure for tb_menu
-- ----------------------------
DROP TABLE
IF EXISTS tb_menu;

CREATE TABLE tb_menu
(
  menu_id      BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  menu_code    VARCHAR(32)                           NOT NULL
  COMMENT '菜单代码',
  menu_name    VARCHAR(32)                           NOT NULL
  COMMENT '菜单名称',
  parent_code  VARCHAR(32)                           NOT NULL                DEFAULT ''
  COMMENT '父菜单代码',
  url          VARCHAR(128)                          NOT NULL                DEFAULT ''
  COMMENT '菜单地址',
  sort         INT(11)                               NOT NULL                DEFAULT 0
  COMMENT '菜单排序(从0开始)',
  icon         VARCHAR(128)                          NOT NULL                DEFAULT ''
  COMMENT '菜单图标的样式',
  is_deleted   TINYINT                               NOT NULL                DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time TIMESTAMP                             NOT NULL                DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time TIMESTAMP                             NOT NULL                DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '菜单表';
CREATE INDEX sort_ix
  ON tb_menu (sort);
CREATE UNIQUE INDEX menu_code_UNIQUE
  ON tb_menu (menu_code);

-- ----------------------------
--  Table structure for tb_user_role
-- ----------------------------
DROP TABLE
IF EXISTS tb_user_role;

CREATE TABLE tb_user_role
(
  user_id BIGINT(20) NOT NULL
  COMMENT '用户ID',
  role_id BIGINT(20) NOT NULL
  COMMENT '角色ID',
  PRIMARY KEY (user_id, role_id)
)
  COMMENT '用户角色表';

-- ----------------------------
--  Table structure for rtb_ole_menu
-- ----------------------------
DROP TABLE
IF EXISTS tb_role_menu;

CREATE TABLE tb_role_menu
(
  role_id BIGINT(20) NOT NULL
  COMMENT '角色ID',
  menu_id BIGINT(20) NOT NULL
  COMMENT '菜单ID',
  PRIMARY KEY (role_id, menu_id)
)
  COMMENT '角色菜单表';

-- ----------------------------
--  Table structure for tb_dict
-- ----------------------------
DROP TABLE
IF EXISTS tb_dict;

CREATE TABLE tb_dict
(
  dict_id      BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '字典ID',
  dict_type    VARCHAR(20)                           NOT NULL
  COMMENT '字典类型',
  dict_code    VARCHAR(64)                           NOT NULL
  COMMENT '字典代码',
  value        VARCHAR(256)                          NOT NULL
  COMMENT '值',
  remark       VARCHAR(256)                          NOT NULL                    DEFAULT ''
  COMMENT '备注',
  sort         INT(11)                               NOT NULL                    DEFAULT 0
  COMMENT '排序（从0开始）',
  is_deleted   TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '字典表';
CREATE UNIQUE INDEX type_code_UNIQUE
  ON tb_dict (dict_type, dict_code);

-- ----------------------------
--  Table structure for tb_video
-- ----------------------------
DROP TABLE
IF EXISTS tb_video;

CREATE TABLE tb_video
(
  id           BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL
  COMMENT '主键, 自增',
  title        VARCHAR(64)                           NOT NULL                    DEFAULT ''
  COMMENT '标题',
  summary      VARCHAR(256)                          NOT NULL                    DEFAULT ''
  COMMENT '描述',
  user_id      BIGINT(20)                            NOT NULL
  COMMENT '作者',
  map_code     VARCHAR(64)                           NOT NULL                    DEFAULT ''
  COMMENT '地图',
  hits         INTEGER(11)                           NOT NULL                    DEFAULT 0
  COMMENT '播放次数',
  is_top       TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '是否推荐',
  cover        VARCHAR(128)                          NOT NULL                    DEFAULT ''
  COMMENT '视频封面',
  src          VARCHAR(128)                          NOT NULL                    DEFAULT ''
  COMMENT '视频路径',
  status       CHAR(1)                               NOT NULL                    DEFAULT 'N'
  COMMENT '审批状态:{N:待审批, R:已拒绝, Y:已审批}',
  reply_msg    VARCHAR(128)                          NOT NULL                    DEFAULT ''
  COMMENT '审批意见',
  is_deleted   TINYINT                               NOT NULL                    DEFAULT 0
  COMMENT '逻辑删除:{0:未删除, 1:已删除}',
  created_time TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  updated_time TIMESTAMP                             NOT NULL                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  COMMENT '更新时间'
)
  COMMENT '视频表';
CREATE INDEX ix_map_code
  ON tb_video (map_code);

-- ----------------------------
--  data for tb_dict
-- ----------------------------
INSERT INTO tb_dict
(dict_type, dict_code, value, sort)
VALUES
  ('VIDEO_TYPE', 'teach', '教学视频', 0),
  ('VIDEO_TYPE', 'limit', '极限视频', 1),
  ('VIDEO_TYPE', 'game', '比赛视频', 2),
  ('VIDEO_TYPE', 'bug', 'BUG视频', 3),
  ('VIDEO_TYPE', 'joke', '搞笑视频', 4),
  ('VIDEO_TYPE', 'other', '综合视频', 5);

