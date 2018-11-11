drop table if exists tb_article;

drop table if exists tb_comment;

drop table if exists tb_order;

drop table if exists tb_role;

drop table if exists tb_role_user;

drop table if exists tb_slide;

drop table if exists tb_user;

/*==============================================================*/
/* Table: tb_article                                            */
/*==============================================================*/
create table tb_article
(
   article_id           integer not null auto_increment,
   user_id              integer comment '提交该文章的人---用户的id',
   submit_time          TIMESTAMP comment '文章提交时间',
   content              text comment '文章的详细内容，存放的是html格式，直接拿出来放页面上即可',
   title                varchar(150) comment '文章标题',
   state                integer comment '文章状态，0：未审核，1：已审核，3：已删除',
   reading              integer comment '文章阅读量',
   parise               integer comment '文章点赞数量',
   publish_time         TIMESTAMP comment '文章发布的时间',
   type                 int comment '文章的类型：0：活动通知类，1：教程类',
   primary key (article_id)
);

alter table tb_article comment '前台文章表';

/*==============================================================*/
/* Table: tb_comment                                            */
/*==============================================================*/
create table tb_comment
(
   comment_id           integer not null auto_increment comment '这条评论的id',
   article_id           integer comment '这条评论属于哪篇文章---文章的id',
   user_id              integer comment '这条评论是谁发的---用户的id',
   submit_time          TIMESTAMP comment '评论提交时间',
   addres               VARCHAR(400) comment '轮播图在阿里云oss中的url地址：“http:\\......”',
   state                integer comment '评论状态：0：未审核，1：已审核，3：已删除',
   content              text comment '评论的内容，存放的是html格式，直接拿出来放页面上即可',
   primary key (comment_id)
);

alter table tb_comment comment '文章评论表';

/*==============================================================*/
/* Table: tb_order                                              */
/*==============================================================*/
create table tb_order
(
   order_id             integer not null auto_increment,
   user_id              integer,
   accept_id            integer comment '接受该订单的人---用户的id',
   name                 VARCHAR(40) comment '填写报修单时输入的姓名',
   addres               VARCHAR(100) comment '宿舍号，维修地址',
   phone_num            VARCHAR(100) comment '维修联系方式',
   remark               VARCHAR(600),
   state                integer comment '状态：0刚提交,1已接单正在维修，2维修完成',
   submit_time          TIMESTAMP comment '订单提交的时间',
   accept_time          TIMESTAMP comment '订单被维修人员接受的时间',
   success_time         TIMESTAMP comment '订单维修完成的时间',
   gender               VARCHAR(10),
   primary key (order_id)
);

alter table tb_order comment '报修订单表';

/*==============================================================*/
/* Table: tb_role                                               */
/*==============================================================*/
create table tb_role
(
   role_id              integer not null auto_increment,
   role_name            VARCHAR(30) comment '角色名称',
   remark               VARCHAR(200) comment '角色说明',
   primary key (role_id)
);

alter table tb_role comment '角色表，每个角色拥有不同的权限';

/*==============================================================*/
/* Table: tb_role_user                                          */
/*==============================================================*/
create table tb_role_user
(
   role_id              integer,
   user_id              integer
);

alter table tb_role_user comment '角色表和用户表的中间表，让两个表建立关系关联起来';

/*==============================================================*/
/* Table: tb_slide                                              */
/*==============================================================*/
create table tb_slide
(
   slide_id             integer not null auto_increment,
   user_id              integer comment '提交该轮播图的人---用户的id',
   submit_time          TIMESTAMP comment '轮播图提交时间',
   article_id           integer comment '要跳转到哪个文章的，根据文章id',
   addres               VARCHAR(400) comment '轮播图在阿里云oss中的url地址：“http:\\......”',
   state                integer comment '轮播图状态：0：未审核，1：已审核，3：已删除',
   bucket_name          varchar(20) comment '在阿里云oss的哪个bucket中存放',
   bucket_disk_name     varchar(20) comment '存放在阿里云oss的bucket中的哪个文件夹中',
   fileName             varchar(50) comment '阿里云oss中bucket的哪个文件夹下的哪个文件名称',
   primary key (slide_id)
);

alter table tb_slide comment '首页轮播图表';

/*==============================================================*/
/* Table: tb_user                                               */
/*==============================================================*/
create table tb_user
(
   user_id              integer not null auto_increment,
   user_name            VARCHAR(50) comment '不能重复,可为中文',
   eamil                VARCHAR(100) comment '邮箱',
   password             VARCHAR(64) comment 'shiro MD5密码32位',
   stu_num              VARCHAR(10) comment '通过学号可以确定该用户是否是汕职院学生',
   phone_num            varchar(11),
   gender               varchar(10),
   primary key (user_id)
);

alter table tb_user comment '用户基本信息表
';

alter table tb_article add constraint FK_Reference_5 foreign key (user_id)
      references tb_user (user_id) on delete restrict on update restrict;

alter table tb_comment add constraint FK_Reference_6 foreign key (article_id)
      references tb_article (article_id) on delete restrict on update restrict;

alter table tb_order add constraint FK_Reference_3 foreign key (user_id)
      references tb_user (user_id) on delete restrict on update restrict;

alter table tb_role_user add constraint FK_Reference_1 foreign key (user_id)
      references tb_user (user_id) on delete restrict on update restrict;

alter table tb_role_user add constraint FK_Reference_2 foreign key (role_id)
      references tb_role (role_id) on delete restrict on update restrict;

alter table tb_slide add constraint FK_Reference_4 foreign key (user_id)
      references tb_user (user_id) on delete restrict on update restrict;
