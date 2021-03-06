DROP TABLE IF EXISTS `ts_area`, `ts_attach`, `ts_feed`, `ts_group`, `ts_group_cates`, `ts_group_options`, `ts_group_topics`, `ts_group_topics_add`, `ts_group_topics_collects`, `ts_group_topics_comments`, `ts_group_topics_type`, `ts_group_users`, `ts_home_info`, `ts_mail_options`, `ts_message`, `ts_photo`, `ts_photo_album`, `ts_photo_comment`, `ts_photo_options`, `ts_session`, `ts_system_options`, `ts_tag`, `ts_tag_article_index`, `ts_tag_group_index`, `ts_tag_photo_index`, `ts_tag_topic_index`, `ts_tag_user_index`, `ts_user`, `ts_user_follow`, `ts_user_gb`, `ts_user_info`, `ts_user_invites`, `ts_user_options`, `ts_user_role`, `ts_user_scores`;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- 数据库: `thinksaas2`
--

-- --------------------------------------------------------

--
-- 表的结构 `ts_area`
--

CREATE TABLE IF NOT EXISTS `ts_area` (
  `areaid` int(11) NOT NULL AUTO_INCREMENT,
  `areaname` varchar(32) NOT NULL DEFAULT '',
  `zm` char(1) NOT NULL DEFAULT '' COMMENT '首字母',
  `referid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`areaid`),
  KEY `referid` (`referid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='本地化' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_area`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_attach`
--

CREATE TABLE IF NOT EXISTS `ts_attach` (
  `attachid` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `attachname` char(64) NOT NULL COMMENT '附件名字',
  `attachtype` char(32) NOT NULL DEFAULT '' COMMENT '附件类型',
  `attachurl` char(64) NOT NULL DEFAULT '' COMMENT '附件url',
  `attachsize` char(32) NOT NULL DEFAULT '' COMMENT '附件大小',
  `isshow` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`attachid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_attach`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_feed`
--

CREATE TABLE IF NOT EXISTS `ts_feed` (
  `feedid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `template` varchar(1024) NOT NULL DEFAULT '' COMMENT '动态模板',
  `data` varchar(1024) NOT NULL DEFAULT '' COMMENT '动态数据',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`feedid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='全站动态' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_feed`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_group`
--

CREATE TABLE IF NOT EXISTS `ts_group` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT COMMENT '小组ID',
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `cateid` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `groupname` char(32) NOT NULL DEFAULT '' COMMENT '群组名字',
  `groupname_en` char(32) NOT NULL DEFAULT '' COMMENT '小组英文名称',
  `groupdesc` text NOT NULL COMMENT '小组介绍',
  `path` char(32) NOT NULL DEFAULT '' COMMENT '图标路径',
  `groupicon` char(32) NOT NULL DEFAULT '' COMMENT '小组图标',
  `count_topic` int(11) NOT NULL DEFAULT '0' COMMENT '帖子统计',
  `count_topic_today` int(11) NOT NULL DEFAULT '0' COMMENT '统计今天发帖',
  `count_user` int(11) NOT NULL DEFAULT '0' COMMENT '小组成员数',
  `joinway` tinyint(1) NOT NULL DEFAULT '0' COMMENT '加入方式',
  `role_leader` char(32) NOT NULL DEFAULT '组长' COMMENT '组长角色名称',
  `role_admin` char(32) NOT NULL DEFAULT '管理员' COMMENT '管理员角色名称',
  `role_user` char(32) NOT NULL DEFAULT '成员' COMMENT '成员角色名称',
  `addtime` int(11) DEFAULT '0' COMMENT '创建时间',
  `isrecommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `isopen` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否公开或者私密',
  `isaudit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  `ispost` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许会员发帖',
  `isshow` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`groupid`),
  KEY `userid` (`userid`),
  KEY `isshow` (`isshow`),
  KEY `groupname` (`groupname`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微群组' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_group`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_group_cates`
--

CREATE TABLE IF NOT EXISTS `ts_group_cates` (
  `cateid` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `catename` char(32) NOT NULL DEFAULT '' COMMENT '分类名字',
  `count_group` int(11) NOT NULL DEFAULT '0' COMMENT '群组个数',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_group_cates`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_group_options`
--

CREATE TABLE IF NOT EXISTS `ts_group_options` (
  `optionname` char(12) NOT NULL DEFAULT '' COMMENT '选项名字',
  `optionvalue` char(255) NOT NULL DEFAULT '' COMMENT '选项内容',
  UNIQUE KEY `optionname` (`optionname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='配置';

--
-- 转存表中的数据 `ts_group_options`
--

INSERT INTO `ts_group_options` (`optionname`, `optionvalue`) VALUES
('appname', '小组'),
('appdesc', 'ThinkSAAS小组'),
('iscreate', '1'),
('isaudit', '0'),
('joinnum', '20');

-- --------------------------------------------------------

--
-- 表的结构 `ts_group_topics`
--

CREATE TABLE IF NOT EXISTS `ts_group_topics` (
  `topicid` int(11) NOT NULL AUTO_INCREMENT COMMENT '话题ID',
  `typeid` int(11) NOT NULL DEFAULT '0' COMMENT '帖子分类ID',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '小组ID',
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(64) NOT NULL DEFAULT '' COMMENT '帖子标题',
  `content` text NOT NULL COMMENT '帖子内容',
  `thread_type` char(16) NOT NULL DEFAULT '' COMMENT '帖子类型',
  `path` char(32) NOT NULL DEFAULT '' COMMENT '图片或者附件存储目录',
  `photo` char(32) NOT NULL DEFAULT '' COMMENT '图片地址',
  `photoshow` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否回复显示1回复',
  `attach` char(32) NOT NULL DEFAULT '' COMMENT '附件地址',
  `attachname` char(64) NOT NULL DEFAULT '' COMMENT '附件名字',
  `attachshow` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否回复显示1回复',
  `attachscore` int(11) NOT NULL DEFAULT '0' COMMENT '下载积分',
  `music` varchar(512) NOT NULL DEFAULT '' COMMENT '音乐',
  `video` varchar(512) NOT NULL DEFAULT '' COMMENT '视频',
  `count_comment` int(11) NOT NULL DEFAULT '0' COMMENT '回复统计',
  `count_view` int(11) NOT NULL DEFAULT '0' COMMENT '帖子展示数',
  `count_love` int(11) NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `isshow` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `isclose` int(4) NOT NULL DEFAULT '0' COMMENT '是否关闭帖子',
  `color` int(4) NOT NULL DEFAULT '0' COMMENT '帖子高亮颜色ID',
  `iscomment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许评论',
  `isposts` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否精华帖子',
  `addtime` int(11) DEFAULT '0' COMMENT '创建时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`topicid`),
  KEY `groupid` (`groupid`),
  KEY `userid` (`userid`),
  KEY `title` (`title`),
  KEY `groupid_2` (`groupid`,`isshow`),
  KEY `typeid` (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='小组话题' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_group_topics`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_group_topics_add`
--

CREATE TABLE IF NOT EXISTS `ts_group_topics_add` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '补贴ID',
  `topicid` int(11) NOT NULL COMMENT '话题ID',
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(64) NOT NULL DEFAULT '' COMMENT '帖子标题',
  `content` text NOT NULL COMMENT '帖子内容',
  `path` char(32) NOT NULL DEFAULT '' COMMENT '图片或者附件存储目录',
  `photo` char(32) NOT NULL DEFAULT '' COMMENT '图片地址',
  `attach` char(32) NOT NULL DEFAULT '' COMMENT '附件地址',
  `attachname` char(64) NOT NULL DEFAULT '' COMMENT '附件名字',
  `orderid` int(11) NOT NULL DEFAULT '0' COMMENT '排序ID',
  `addtime` int(11) DEFAULT '0' COMMENT '创建时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `title` (`title`),
  KEY `topicid` (`topicid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='小组话题' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_group_topics_add`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_group_topics_collects`
--

CREATE TABLE IF NOT EXISTS `ts_group_topics_collects` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `username` char(64) NOT NULL DEFAULT '' COMMENT '用户名',
  `topicid` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '收藏时间',
  UNIQUE KEY `userid_2` (`userid`,`topicid`),
  KEY `userid` (`userid`),
  KEY `topicid` (`topicid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='帖子收藏';

--
-- 转存表中的数据 `ts_group_topics_collects`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_group_topics_comments`
--

CREATE TABLE IF NOT EXISTS `ts_group_topics_comments` (
  `commentid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `referid` int(11) NOT NULL DEFAULT '0',
  `topicid` int(11) NOT NULL DEFAULT '0' COMMENT '话题ID',
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `content` text NOT NULL COMMENT '回复内容',
  `path` char(32) NOT NULL DEFAULT '' COMMENT '图片或者附件存储目录',
  `photo` char(32) NOT NULL DEFAULT '' COMMENT '图片地址',
  `attach` char(32) NOT NULL DEFAULT '' COMMENT '附件地址',
  `attachname` char(64) NOT NULL DEFAULT '' COMMENT '附件名字',
  `addtime` int(11) DEFAULT '0' COMMENT '回复时间',
  PRIMARY KEY (`commentid`),
  KEY `topicid` (`topicid`),
  KEY `userid` (`userid`),
  KEY `referid` (`referid`,`topicid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='话题回复/评论' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_group_topics_comments`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_group_topics_type`
--

CREATE TABLE IF NOT EXISTS `ts_group_topics_type` (
  `typeid` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子分类ID',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '小组ID',
  `typename` char(32) NOT NULL DEFAULT '' COMMENT '帖子分类名称',
  `count_topic` int(11) NOT NULL DEFAULT '0' COMMENT '统计帖子',
  PRIMARY KEY (`typeid`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='帖子分类' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_group_topics_type`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_group_users`
--

CREATE TABLE IF NOT EXISTS `ts_group_users` (
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '群组ID',
  `orderid` int(11) NOT NULL DEFAULT '0' COMMENT '排序ID',
  `isadmin` int(11) NOT NULL DEFAULT '0' COMMENT '是否管理员',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '加入时间',
  UNIQUE KEY `userid_2` (`userid`,`groupid`),
  KEY `userid` (`userid`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='群组和用户对应关系';

--
-- 转存表中的数据 `ts_group_users`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_home_info`
--

CREATE TABLE IF NOT EXISTS `ts_home_info` (
  `infoid` int(11) NOT NULL AUTO_INCREMENT,
  `infokey` char(32) NOT NULL DEFAULT '',
  `infocontent` text NOT NULL,
  PRIMARY KEY (`infoid`),
  UNIQUE KEY `infokey` (`infokey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_home_info`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_mail_options`
--

CREATE TABLE IF NOT EXISTS `ts_mail_options` (
  `optionid` int(11) NOT NULL AUTO_INCREMENT COMMENT '选项ID',
  `optionname` char(12) NOT NULL DEFAULT '' COMMENT '选项名字',
  `optionvalue` char(255) NOT NULL DEFAULT '' COMMENT '选项内容',
  PRIMARY KEY (`optionid`),
  UNIQUE KEY `optionname` (`optionname`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='配置' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `ts_mail_options`
--

INSERT INTO `ts_mail_options` (`optionid`, `optionname`, `optionvalue`) VALUES
(1, 'appname', '邮件'),
(2, 'appdesc', 'ThinkSAAS邮件'),
(3, 'isenable', '0'),
(4, 'mailhost', 'smtp.exmail.qq.com'),
(5, 'mailport', '25'),
(6, 'mailuser', 'postmaster@thinksaas.cn'),
(7, 'mailpwd', '1231qa2342ws');

-- --------------------------------------------------------

--
-- 表的结构 `ts_message`
--

CREATE TABLE IF NOT EXISTS `ts_message` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '发送用户ID',
  `touserid` int(11) NOT NULL DEFAULT '0' COMMENT '接收消息的用户ID',
  `content` text NOT NULL COMMENT '内容',
  `isread` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`messageid`),
  KEY `touserid` (`touserid`,`isread`),
  KEY `userid` (`userid`,`touserid`,`isread`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='短消息表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_message`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_photo`
--

CREATE TABLE IF NOT EXISTS `ts_photo` (
  `photoid` int(11) NOT NULL AUTO_INCREMENT,
  `albumid` int(11) NOT NULL DEFAULT '0' COMMENT '相册ID',
  `userid` int(11) NOT NULL DEFAULT '0',
  `photoname` char(64) NOT NULL DEFAULT '',
  `phototype` char(32) NOT NULL DEFAULT '',
  `path` char(32) NOT NULL DEFAULT '' COMMENT '图片路径',
  `photourl` char(120) NOT NULL DEFAULT '',
  `photosize` char(32) NOT NULL DEFAULT '',
  `photodesc` char(120) NOT NULL DEFAULT '',
  `count_view` int(11) NOT NULL DEFAULT '0',
  `isrecommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不推荐1推荐',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`photoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_photo`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_photo_album`
--

CREATE TABLE IF NOT EXISTS `ts_photo_album` (
  `albumid` int(11) NOT NULL AUTO_INCREMENT COMMENT '相册ID',
  `userid` int(11) NOT NULL DEFAULT '0',
  `path` char(32) NOT NULL DEFAULT '' COMMENT '相册路径',
  `albumface` char(64) NOT NULL DEFAULT '' COMMENT '相册封面',
  `albumname` char(64) NOT NULL DEFAULT '',
  `albumdesc` varchar(400) NOT NULL DEFAULT '' COMMENT '相册介绍',
  `count_photo` int(11) NOT NULL DEFAULT '0',
  `count_view` int(11) NOT NULL DEFAULT '0',
  `isrecommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`albumid`),
  KEY `userid` (`userid`),
  KEY `isrecommend` (`isrecommend`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='相册' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_photo_album`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_photo_comment`
--

CREATE TABLE IF NOT EXISTS `ts_photo_comment` (
  `commentid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `referid` int(11) NOT NULL DEFAULT '0',
  `photoid` int(11) NOT NULL DEFAULT '0' COMMENT '相册ID',
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `content` char(255) NOT NULL DEFAULT '' COMMENT '回复内容',
  `addtime` int(11) DEFAULT '0' COMMENT '回复时间',
  PRIMARY KEY (`commentid`),
  KEY `userid` (`userid`),
  KEY `referid` (`referid`,`photoid`),
  KEY `photoid` (`photoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图片回复/评论' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_photo_comment`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_photo_options`
--

CREATE TABLE IF NOT EXISTS `ts_photo_options` (
  `optionid` int(11) NOT NULL AUTO_INCREMENT COMMENT '选项ID',
  `optionname` char(16) NOT NULL DEFAULT '' COMMENT '选项名字',
  `optionvalue` char(255) NOT NULL DEFAULT '' COMMENT '选项内容',
  PRIMARY KEY (`optionid`),
  UNIQUE KEY `optionname` (`optionname`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='配置' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ts_photo_options`
--

INSERT INTO `ts_photo_options` (`optionid`, `optionname`, `optionvalue`) VALUES
(1, 'appname', '相册'),
(2, 'appdesc', '相册APP');

-- --------------------------------------------------------

--
-- 表的结构 `ts_session`
--

CREATE TABLE IF NOT EXISTS `ts_session` (
  `session` char(64) NOT NULL DEFAULT '' COMMENT 'SESSIONID',
  `session_expires` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '时间',
  `ip` char(32) NOT NULL DEFAULT '' COMMENT 'IP',
  `session_data` varchar(255) NOT NULL DEFAULT '' COMMENT 'SESSION数据',
  PRIMARY KEY (`session`),
  KEY `session_expires` (`session_expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SESSION';

--
-- 转存表中的数据 `ts_session`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_system_options`
--

CREATE TABLE IF NOT EXISTS `ts_system_options` (
  `optionname` char(32) NOT NULL DEFAULT '' COMMENT '选项名字',
  `optionvalue` char(255) NOT NULL DEFAULT '' COMMENT '选项内容',
  UNIQUE KEY `optionname` (`optionname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统管理配置';

--
-- 转存表中的数据 `ts_system_options`
--

INSERT INTO `ts_system_options` (`optionname`, `optionvalue`) VALUES
('site_title', 'ThinkSAAS'),
('site_subtitle', '又一个ThinkSAAS社区'),
('site_url', 'http://localhost/thinksaas2/'),
('site_email', 'admin@admin.com'),
('site_icp', '京ICP备09050100号'),
('isface', '0'),
('site_key', 'thinksaas'),
('site_desc', '又一个ThinkSAAS社区'),
('site_theme', 'black'),
('site_urltype', '1'),
('isgzip', '0'),
('timezone', 'Asia/Hong_Kong'),
('isinvite', '0'),
('isverify', '0');

-- --------------------------------------------------------

--
-- 表的结构 `ts_tag`
--

CREATE TABLE IF NOT EXISTS `ts_tag` (
  `tagid` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` char(16) NOT NULL DEFAULT '',
  `count_user` int(11) NOT NULL DEFAULT '0',
  `count_group` int(11) NOT NULL DEFAULT '0',
  `count_topic` int(11) NOT NULL DEFAULT '0',
  `count_bang` int(11) NOT NULL DEFAULT '0',
  `count_article` int(11) NOT NULL DEFAULT '0',
  `isenable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可用',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`tagid`),
  UNIQUE KEY `tagname` (`tagname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_tag`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_tag_article_index`
--

CREATE TABLE IF NOT EXISTS `ts_tag_article_index` (
  `articleid` int(11) NOT NULL DEFAULT '0' COMMENT '帖子ID',
  `tagid` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `articleid_2` (`articleid`,`tagid`),
  KEY `articleid` (`articleid`),
  KEY `tagid` (`tagid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ts_tag_article_index`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_tag_group_index`
--

CREATE TABLE IF NOT EXISTS `ts_tag_group_index` (
  `groupid` int(11) NOT NULL DEFAULT '0',
  `tagid` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `groupid_2` (`groupid`,`tagid`),
  KEY `groupid` (`groupid`),
  KEY `tagid` (`tagid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ts_tag_group_index`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_tag_photo_index`
--

CREATE TABLE IF NOT EXISTS `ts_tag_photo_index` (
  `photoid` int(11) NOT NULL DEFAULT '0' COMMENT '图片ID',
  `tagid` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `photoid_2` (`photoid`,`tagid`),
  KEY `tagid` (`tagid`),
  KEY `photoid` (`photoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ts_tag_photo_index`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_tag_topic_index`
--

CREATE TABLE IF NOT EXISTS `ts_tag_topic_index` (
  `topicid` int(11) NOT NULL DEFAULT '0' COMMENT '帖子ID',
  `tagid` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `topicid_2` (`topicid`,`tagid`),
  KEY `topicid` (`topicid`),
  KEY `tagid` (`tagid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ts_tag_topic_index`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_tag_user_index`
--

CREATE TABLE IF NOT EXISTS `ts_tag_user_index` (
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `tagid` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `userid_2` (`userid`,`tagid`),
  KEY `userid` (`userid`),
  KEY `tagid` (`tagid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ts_tag_user_index`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_user`
--

CREATE TABLE IF NOT EXISTS `ts_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `pwd` char(32) NOT NULL DEFAULT '' COMMENT '用户密码',
  `salt` char(32) NOT NULL DEFAULT '' COMMENT '加点盐',
  `email` char(32) NOT NULL DEFAULT '' COMMENT '用户email',
  `resetpwd` char(32) NOT NULL DEFAULT '' COMMENT '重设密码',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `pwd` (`pwd`,`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_user`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_user_follow`
--

CREATE TABLE IF NOT EXISTS `ts_user_follow` (
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `userid_follow` int(11) NOT NULL DEFAULT '0' COMMENT '被关注的用户ID',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  UNIQUE KEY `userid_2` (`userid`,`userid_follow`),
  KEY `userid` (`userid`),
  KEY `userid_follow` (`userid_follow`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户关注跟随';

--
-- 转存表中的数据 `ts_user_follow`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_user_gb`
--

CREATE TABLE IF NOT EXISTS `ts_user_gb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reid` int(11) NOT NULL DEFAULT '0' COMMENT '回复ID',
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '留言用户ID',
  `touserid` int(11) NOT NULL DEFAULT '0' COMMENT '被留言用户ID',
  `content` varchar(2000) NOT NULL DEFAULT '' COMMENT '内容',
  `addtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `touserid` (`touserid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_user_gb`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_user_info`
--

CREATE TABLE IF NOT EXISTS `ts_user_info` (
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `ucid` int(11) NOT NULL DEFAULT '0' COMMENT 'Ucenter通信ID',
  `fuserid` int(11) NOT NULL DEFAULT '0' COMMENT '来自邀请用户',
  `username` char(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `email` char(32) NOT NULL DEFAULT '',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别',
  `phone` char(16) NOT NULL DEFAULT '' COMMENT '电话号码',
  `roleid` int(11) NOT NULL DEFAULT '1' COMMENT '角色ID',
  `areaid` int(11) NOT NULL DEFAULT '0' COMMENT '区县ID',
  `path` char(32) NOT NULL DEFAULT '' COMMENT '头像路径',
  `face` char(64) NOT NULL DEFAULT '' COMMENT '会员头像',
  `signed` char(64) NOT NULL DEFAULT '' COMMENT '签名',
  `blog` char(32) NOT NULL DEFAULT '' COMMENT '博客',
  `about` char(255) NOT NULL DEFAULT '' COMMENT '关于我',
  `ip` varchar(16) NOT NULL DEFAULT '' COMMENT '登陆IP',
  `address` char(64) NOT NULL DEFAULT '',
  `qq_openid` char(32) NOT NULL DEFAULT '',
  `qq_access_token` char(32) NOT NULL DEFAULT '' COMMENT 'access_token',
  `count_score` int(11) NOT NULL DEFAULT '0' COMMENT '统计积分',
  `count_follow` int(11) NOT NULL DEFAULT '0' COMMENT '统计用户跟随的',
  `count_followed` int(11) NOT NULL DEFAULT '0' COMMENT '统计用户被跟随的',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是管理员',
  `isenable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用：0启用1禁用',
  `isverify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未验证1验证',
  `verifycode` char(11) NOT NULL DEFAULT '' COMMENT '验证码',
  `thems_other` tinyint(1) NOT NULL DEFAULT '0' COMMENT '阅读方式',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `uptime` int(11) DEFAULT '0' COMMENT '登陆时间',
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `userid` (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `qq_openid` (`qq_openid`),
  KEY `fuserid` (`fuserid`),
  KEY `ucid` (`ucid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户';

--
-- 转存表中的数据 `ts_user_info`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_user_invites`
--

CREATE TABLE IF NOT EXISTS `ts_user_invites` (
  `inviteid` int(11) NOT NULL AUTO_INCREMENT,
  `invitecode` char(32) NOT NULL DEFAULT '' COMMENT '邀请码',
  `isused` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否使用',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`inviteid`),
  KEY `isused` (`isused`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户邀请码' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_user_invites`
--


-- --------------------------------------------------------

--
-- 表的结构 `ts_user_options`
--

CREATE TABLE IF NOT EXISTS `ts_user_options` (
  `optionname` char(12) NOT NULL DEFAULT '' COMMENT '选项名字',
  `optionvalue` char(255) NOT NULL DEFAULT '' COMMENT '选项内容',
  UNIQUE KEY `optionname` (`optionname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='配置';

--
-- 转存表中的数据 `ts_user_options`
--

INSERT INTO `ts_user_options` (`optionname`, `optionvalue`) VALUES
('appname', '用户'),
('appdesc', '用户中心'),
('isenable', '0'),
('isvalidate', '0'),
('isrewrite', '0'),
('isauthcode', '0'),
('isgroup', '');

-- --------------------------------------------------------

--
-- 表的结构 `ts_user_role`
--

CREATE TABLE IF NOT EXISTS `ts_user_role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `rolename` char(32) NOT NULL DEFAULT '' COMMENT '角色名称',
  `score_start` int(11) NOT NULL DEFAULT '0' COMMENT '积分开始',
  `score_end` int(11) NOT NULL DEFAULT '0' COMMENT '积分结束',
  PRIMARY KEY (`roleid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='角色' AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `ts_user_role`
--

INSERT INTO `ts_user_role` (`roleid`, `rolename`, `score_start`, `score_end`) VALUES
(1, '列兵', 0, 5000),
(2, '下士', 5000, 20000),
(3, '中士', 20000, 40000),
(4, '上士', 40000, 80000),
(5, '三级准尉', 80000, 160000),
(6, '二级准尉', 160000, 320000),
(7, '一级准尉', 320000, 640000),
(8, '少尉', 640000, 1280000),
(9, '中尉', 1280000, 2560000),
(10, '上尉', 2560000, 5120000),
(11, '少校', 5120000, 10240000),
(12, '中校', 10240000, 20480000),
(13, '上校', 20480000, 40960000),
(14, '准将', 40960000, 81920000),
(15, '少将', 81920000, 123840000),
(16, '中将', 123840000, 327680000),
(17, '上将', 327680000, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ts_user_scores`
--

CREATE TABLE IF NOT EXISTS `ts_user_scores` (
  `scoreid` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分ID',
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `scorename` char(64) NOT NULL DEFAULT '' COMMENT '积分说明',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '得分',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '积分时间',
  PRIMARY KEY (`scoreid`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户积分' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `ts_user_scores`
--

