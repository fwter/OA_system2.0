/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/1/2 15:53:22                            */
/*==============================================================*/


drop table if exists dept_power;

drop table if exists emp_bian;

drop table if exists emp_paiban;

drop table if exists oa_attendance;

drop table if exists oa_balance;

drop table if exists oa_card;

drop table if exists oa_cardborrow;

drop table if exists oa_contract;

drop table if exists oa_dept;

drop table if exists oa_dismission;

drop table if exists oa_emp;

drop table if exists oa_examproject;

drop table if exists oa_examtask;

drop table if exists oa_flow;

drop table if exists oa_formal;

drop table if exists oa_job;

drop table if exists oa_leave;

drop table if exists oa_menu;

drop table if exists oa_move;

drop table if exists oa_overtimecode;

drop table if exists oa_overtimetype;

drop table if exists oa_password;

drop table if exists oa_paystandard;

drop table if exists oa_paytable;

drop table if exists oa_paytemplate;

drop table if exists oa_personalbook;

drop table if exists oa_pertemp;

drop table if exists oa_rap;

drop table if exists oa_schedule;

drop table if exists oa_schedulecontent;

drop table if exists oa_scheduletype;

drop table if exists oa_score;

drop table if exists oa_scoredetail;

drop table if exists oa_systemlog;

drop table if exists oa_telgroup;

drop table if exists oa_trainplan;

drop table if exists oa_traintec;

drop table if exists oa_turn;

drop table if exists oa_vacation;

drop table if exists oa_whereabouts;

drop table if exists trainstu;

/*==============================================================*/
/* Table: dept_power                                            */
/*==============================================================*/
create table dept_power
(
   menu_id              int not null comment '辨识每个菜单的唯一编号',
   dept_id              varchar(20) not null,
   primary key (menu_id, dept_id)
);

/*==============================================================*/
/* Table: emp_bian                                              */
/*==============================================================*/
create table emp_bian
(
   pay_standardid       varchar(10) not null,
   emp_id               varchar(20) not null,
   primary key (pay_standardid, emp_id)
);

/*==============================================================*/
/* Table: emp_paiban                                            */
/*==============================================================*/
create table emp_paiban
(
   emp_id               varchar(20) not null,
   sht_id               varchar(20) not null,
   primary key (emp_id, sht_id)
);

/*==============================================================*/
/* Table: oa_attendance                                         */
/*==============================================================*/
create table oa_attendance
(
   att_id               varchar(20) not null,
   emp_id               varchar(20),
   att_date             date,
   att_signin           datetime,
   att_signout          datetime,
   att_state            int,
   primary key (att_id)
);

/*==============================================================*/
/* Table: oa_balance                                            */
/*==============================================================*/
create table oa_balance
(
   bal_id               varchar(20) not null,
   baler_id             varchar(20),
   caozuo_id            varchar(20),
   bal_number           int,
   bal_year             date,
   bal_reason           varchar(100),
   bal_date             date,
   primary key (bal_id)
);

/*==============================================================*/
/* Table: oa_card                                               */
/*==============================================================*/
create table oa_card
(
   card_id              varchar(20) not null,
   emp_id               varchar(20),
   card_org             varchar(20),
   card_takedate        date,
   card_workdate        date,
   card_overdate        date,
   card_rewark          varchar(100),
   card_enc             varchar(50),
   primary key (card_id)
);

/*==============================================================*/
/* Table: oa_cardborrow                                         */
/*==============================================================*/
create table oa_cardborrow
(
   cb_id                varchar(20) not null,
   card_id              varchar(20),
   emp_id               varchar(20),
   cb_bdate             date,
   cb_rdate             date,
   cb_reason            varchar(100),
   primary key (cb_id)
);

/*==============================================================*/
/* Table: oa_contract                                           */
/*==============================================================*/
create table oa_contract
(
   con_id               varchar(20) not null,
   emp_id               varchar(20),
   con_term             int,
   con_signtime         int,
   con_signdate         date,
   con_begindate        date,
   con_tryend           date,
   con_enddate          date,
   con_stopdate         date,
   con_state            int,
   con_remark           varchar(100),
   con_enc              varchar(50),
   primary key (con_id)
);

/*==============================================================*/
/* Table: oa_dept                                               */
/*==============================================================*/
create table oa_dept
(
   dept_id              varchar(20) not null,
   dept_name            varchar(20),
   primary key (dept_id)
);

/*==============================================================*/
/* Table: oa_dismission                                         */
/*==============================================================*/
create table oa_dismission
(
   dis_id               varchar(20) not null,
   emp_id               varchar(20),
   dis_applydate        date,
   dis_inworkdate       date,
   dis_date             date,
   dis_type             int,
   dis_reason           varchar(100),
   dis_remark           varchar(100),
   dis_enc              varchar(50),
   dis_leaderch         int,
   dis_emch             int,
   dis_state            int,
   primary key (dis_id)
);

/*==============================================================*/
/* Table: oa_emp                                                */
/*==============================================================*/
create table oa_emp
(
   emp_id               varchar(20) not null,
   job_id               varchar(20),
   dept_id              varchar(20),
   rap_aname            varchar(20),
   emp_logintype        varchar(20),
   emp_mgr              varchar(20),
   emp_sex              int,
   emp_birth            date,
   emp_phone            varchar(20),
   emp_tel              varchar(20),
   emp_email            varchar(20),
   emp_qq               varchar(20),
   emp_address          varchar(20),
   emp_photo            varchar(50),
   emp_fileid           varchar(20),
   emp_workstate        int,
   emp_type             int,
   emp_cardid           varchar(20),
   emp_native           varchar(20),
   emp_nation           varchar(20),
   emp_oldname          varchar(20),
   emp_nationality      varchar(20),
   emp_entrydate        date,
   emp_formaldate       date,
   emp_dismission       date,
   emp_station          varchar(20),
   emp_maxdegree        varchar(20),
   emp_maxeducation     varchar(20),
   emp_school           varchar(50),
   emp_major            varchar(20),
   emp_graduation       date,
   emp_like             varchar(50),
   emp_healthy          varchar(50),
   emp_high             varchar(20),
   emp_weight           varchar(20),
   emp_bank             varchar(50),
   emp_bankid           varchar(20),
   emp_eme              varchar(20),
   emp_emetel           varchar(20),
   emp_remark           varchar(100),
   primary key (emp_id)
);

/*==============================================================*/
/* Table: oa_examproject                                        */
/*==============================================================*/
create table oa_examproject
(
   ep_id                varchar(20) not null,
   pt_id                varchar(20),
   ep_name              varchar(20),
   ep_maxscore          int,
   ep_minscore          int,
   ep_stand             int,
   ep_scorerule         varchar(100),
   ep_remark            varchar(100),
   ep_state             int,
   primary key (ep_id)
);

/*==============================================================*/
/* Table: oa_examtask                                           */
/*==============================================================*/
create table oa_examtask
(
   et_id                varchar(20) not null,
   pt_id                varchar(20),
   et_name              varchar(20),
   et_year              int,
   et_issue             int,
   et_remark            varchar(100),
   et_startdate         date,
   et_enddate           date,
   primary key (et_id)
);

/*==============================================================*/
/* Table: oa_flow                                               */
/*==============================================================*/
create table oa_flow
(
   flow_id              varchar(20) not null,
   emp_id               varchar(20),
   flow_name            varchar(20),
   flow_title           varchar(50),
   flow_date            date,
   flow_state           int,
   flow_step            varchar(20),
   flow_startdate       date,
   flow_enddate         date,
   primary key (flow_id)
);

/*==============================================================*/
/* Table: oa_formal                                             */
/*==============================================================*/
create table oa_formal
(
   for_id               varchar(20) not null,
   emp_id               varchar(20),
   for_applydate        date,
   for_inworkdate       date,
   for_tryend           date,
   for_date             date,
   for_leaderch         int,
   for_emch             int,
   for_state            int,
   for_remark           varchar(100),
   primary key (for_id)
);

/*==============================================================*/
/* Table: oa_job                                                */
/*==============================================================*/
create table oa_job
(
   job_id               varchar(20) not null,
   job_name             varchar(20),
   job_superior         varchar(20),
   job_level            varchar(20),
   job_duty             varchar(20),
   job_require          varchar(20),
   job_dec              varchar(50),
   job_state            int,
   primary key (job_id)
);

/*==============================================================*/
/* Table: oa_leave                                              */
/*==============================================================*/
create table oa_leave
(
   lea_id               varchar(20) not null,
   vac_id               varchar(20),
   emp_id               varchar(20),
   lea_name             varchar(20),
   lea_applydate        date,
   lea_startdate        date,
   lea_enddate          date,
   lea_day              int,
   lea_content          varchar(100),
   lea_deptch           int,
   lea_managech         int,
   lea_emch             int,
   lea_state            int,
   primary key (lea_id)
);

/*==============================================================*/
/* Table: oa_menu                                               */
/*==============================================================*/
create table oa_menu
(
   menu_id              int not null comment '辨识每个菜单的唯一编号',
   meu_name             varchar(10) comment '菜单名称，每个菜单名称应是唯一，如有重名，名称后用编号区别',
   menu_father          int comment '表示父级菜单，通过父级菜单关联子级菜单，生成树形数据结构',
   menu_link            varchar(30) comment '菜单连接，每个菜单点击访问的路径',
   menu_img             varchar(50) comment '菜单前的图片路径',
   menu_isvisible       int comment '是否将菜单隐藏，0：可见，1：不可见',
   primary key (menu_id)
);

alter table oa_menu comment '系统的所有菜单，每个菜单对应一个权限';

/*==============================================================*/
/* Table: oa_move                                               */
/*==============================================================*/
create table oa_move
(
   move_id              varchar(20) not null,
   job_id               varchar(20),
   dept_id              varchar(20),
   emp_id               varchar(20),
   move_type            int,
   move_date            date,
   move_effdate         date,
   move_remark          varchar(100),
   move_enc             varchar(50),
   move_oldch           int,
   move_newch           int,
   move_emch            int,
   primary key (move_id)
);

/*==============================================================*/
/* Table: oa_overtimecode                                       */
/*==============================================================*/
create table oa_overtimecode
(
   code_id              int not null,
   type_id              varchar(20),
   emp_id               varchar(20),
   code_long            int,
   code_date            date,
   primary key (code_id)
);

/*==============================================================*/
/* Table: oa_overtimetype                                       */
/*==============================================================*/
create table oa_overtimetype
(
   type_id              varchar(20) not null,
   type_name            varchar(20),
   type_price           int,
   primary key (type_id)
);

/*==============================================================*/
/* Table: oa_password                                           */
/*==============================================================*/
create table oa_password
(
   pa_id                varchar(20) not null,
   emp_id               varchar(20),
   pa_pass              varchar(20),
   primary key (pa_id)
);

/*==============================================================*/
/* Table: oa_paystandard                                        */
/*==============================================================*/
create table oa_paystandard
(
   pay_standardid       varchar(10) not null,
   pay_standardtype     varchar(10),
   primary key (pay_standardid)
);

/*==============================================================*/
/* Table: oa_paytable                                           */
/*==============================================================*/
create table oa_paytable
(
   pay_id               varchar(20) not null,
   emp_id               varchar(20),
   pay_money            decimal(20,2),
   pay_senddate         date,
   pay_remark           varchar(100),
   primary key (pay_id)
);

/*==============================================================*/
/* Table: oa_paytemplate                                        */
/*==============================================================*/
create table oa_paytemplate
(
   pay_templateid       varchar(20) not null,
   emp_id               varchar(20),
   oa__emp_id           varchar(20),
   oa__emp_id2          varchar(20),
   pay_templatedate     date,
   primary key (pay_templateid)
);

/*==============================================================*/
/* Table: oa_personalbook                                       */
/*==============================================================*/
create table oa_personalbook
(
   per_id               varchar(20) not null,
   emp_id               varchar(20),
   per_name             varchar(20),
   per_job              varchar(20),
   per_tel              varchar(20),
   per_phone            varchar(20),
   per_residencetel     varchar(20),
   per_fax              varchar(20),
   per_emial            varchar(20),
   per_company          varchar(50),
   primary key (per_id)
);

/*==============================================================*/
/* Table: oa_pertemp                                            */
/*==============================================================*/
create table oa_pertemp
(
   pt_id                varchar(20) not null,
   le_id                varchar(20),
   job_id               varchar(20),
   emp_id               varchar(20),
   pt_name              varchar(20),
   pt_type              int,
   pt_score             int,
   pt_remark            varchar(100),
   pt_creater           varchar(20),
   pt_crdate            date,
   pt_state             int,
   primary key (pt_id)
);

/*==============================================================*/
/* Table: oa_rap                                                */
/*==============================================================*/
create table oa_rap
(
   rap_id               varchar(20) not null,
   apply_id             varchar(20),
   raper_id             varchar(20),
   rap_type             int,
   rap_pro              varchar(20),
   rap_date             date,
   rap_money            int,
   rap_content          varchar(100),
   rap_dept             int,
   rap_manage           int,
   rap_emch             int,
   rap_state            int,
   primary key (rap_id)
);

/*==============================================================*/
/* Table: oa_schedule                                           */
/*==============================================================*/
create table oa_schedule
(
   sch_id               varchar(20) not null,
   emp_id               varchar(20),
   sch_date             date,
   sch_timeslot         int,
   primary key (sch_id)
);

/*==============================================================*/
/* Table: oa_schedulecontent                                    */
/*==============================================================*/
create table oa_schedulecontent
(
   con_cid              varchar(20) not null,
   sch_id               varchar(20),
   con_type             int,
   con_content          varchar(100),
   con_starttime        datetime,
   con_endtime          datetime,
   con_remindtime       datetime,
   con_reminding        int,
   primary key (con_cid)
);

/*==============================================================*/
/* Table: oa_scheduletype                                       */
/*==============================================================*/
create table oa_scheduletype
(
   sht_id               varchar(20) not null,
   sht_name             varchar(20),
   sht_w1               int,
   sht_w2               int,
   sht_w3               int,
   sht_w4               int,
   sht_w5               int,
   sht_w6               int,
   sht_w7               int,
   sht_remark           varchar(100),
   sht_status           int,
   primary key (sht_id)
);

/*==============================================================*/
/* Table: oa_score                                              */
/*==============================================================*/
create table oa_score
(
   score_id             varchar(20) not null,
   et_id                varchar(20),
   emp_id               varchar(20),
   score_content        varchar(100),
   score_state          int,
   primary key (score_id)
);

/*==============================================================*/
/* Table: oa_scoredetail                                        */
/*==============================================================*/
create table oa_scoredetail
(
   sd_id                varchar(20) not null,
   ep_id                varchar(20),
   score_id             varchar(20),
   sd_summary           varchar(100),
   sd_leadcon           varchar(100),
   primary key (sd_id)
);

/*==============================================================*/
/* Table: oa_systemlog                                          */
/*==============================================================*/
create table oa_systemlog
(
   log_id               int not null comment '辨识日志每条记录的唯一标识',
   emp_id               varchar(20),
   log_sysTime          date comment '记录每次危险操作的时间',
   log_IP               varchar(20) comment '记录每次危险操作的IP地址',
   log_option           varchar(100) comment '记录每次危险操作的内容',
   primary key (log_id)
);

alter table oa_systemlog comment '该实体主要负责记录系统的所有的危险操作，例如权限的修改';

/*==============================================================*/
/* Table: oa_telgroup                                           */
/*==============================================================*/
create table oa_telgroup
(
   group_id             varchar(20) not null,
   group_name           varchar(50),
   primary key (group_id)
);

/*==============================================================*/
/* Table: oa_trainplan                                          */
/*==============================================================*/
create table oa_trainplan
(
   rp_id                varchar(20) not null,
   emp_id               varchar(20),
   tec_id               varchar(20),
   rp_name              varchar(20),
   rp_host              varchar(50),
   rp_place             varchar(50),
   rp_day               int,
   rp_money             int,
   rp_begin             date,
   rp_end               date,
   rp_content           varchar(100),
   rp_remark            varchar(100),
   rp_others            int,
   rp_state             int,
   rp_stunum            int,
   rp_assess            varchar(100),
   primary key (rp_id)
);

/*==============================================================*/
/* Table: oa_traintec                                           */
/*==============================================================*/
create table oa_traintec
(
   tec_id               varchar(20) not null,
   tec_name             varchar(20),
   tec_type             int,
   tec_phone            varchar(20),
   tec_email            varchar(20),
   tec_post             varchar(20),
   tec_address          varchar(50),
   tec_inner            varchar(20),
   tec_out              varchar(20),
   tec_innerdate        date,
   tec_outdate          date,
   tec_remark           varchar(100),
   tec_state            int,
   tec_enc              varchar(50),
   primary key (tec_id)
);

/*==============================================================*/
/* Table: oa_turn                                               */
/*==============================================================*/
create table oa_turn
(
   turn_id              varchar(20) not null,
   flow_id              varchar(20),
   turn_state           int,
   primary key (turn_id)
);

/*==============================================================*/
/* Table: oa_vacation                                           */
/*==============================================================*/
create table oa_vacation
(
   vac_id               varchar(20) not null,
   vac_name             varchar(20),
   vac_number           int,
   vac_check            int,
   primary key (vac_id)
);

/*==============================================================*/
/* Table: oa_whereabouts                                        */
/*==============================================================*/
create table oa_whereabouts
(
   whe_id               varchar(20) not null,
   emp_id               varchar(20),
   whe_start            date,
   whe_end              date,
   whe_about            varchar(100),
   whe_state            int,
   primary key (whe_id)
);

/*==============================================================*/
/* Table: trainstu                                              */
/*==============================================================*/
create table trainstu
(
   rp_id                varchar(20) not null,
   emp_id               varchar(20) not null,
   primary key (rp_id, emp_id)
);

alter table dept_power add constraint FK_dept_power foreign key (menu_id)
      references oa_menu (menu_id) on delete restrict on update restrict;

alter table dept_power add constraint FK_dept_power2 foreign key (dept_id)
      references oa_dept (dept_id) on delete restrict on update restrict;

alter table emp_bian add constraint FK_emp_bian foreign key (pay_standardid)
      references oa_paystandard (pay_standardid) on delete restrict on update restrict;

alter table emp_bian add constraint FK_emp_bian2 foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table emp_paiban add constraint FK_emp_paiban foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table emp_paiban add constraint FK_emp_paiban2 foreign key (sht_id)
      references oa_scheduletype (sht_id) on delete restrict on update restrict;

alter table oa_attendance add constraint FK_atten_emp foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_balance add constraint FK_caozuo foreign key (caozuo_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_balance add constraint FK_emper foreign key (baler_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_card add constraint FK_emp_card foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_cardborrow add constraint FK_bo_emp foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_cardborrow add constraint FK_card_bo foreign key (card_id)
      references oa_card (card_id) on delete restrict on update restrict;

alter table oa_contract add constraint FK_emp_contract foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_dismission add constraint FK_emp_leave foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_emp add constraint FK_dept_emp foreign key (dept_id)
      references oa_dept (dept_id) on delete restrict on update restrict;

alter table oa_emp add constraint FK_emp_job foreign key (job_id)
      references oa_job (job_id) on delete restrict on update restrict;

alter table oa_examproject add constraint FK_temp_pro foreign key (pt_id)
      references oa_pertemp (pt_id) on delete restrict on update restrict;

alter table oa_examtask add constraint FK_temp_task foreign key (pt_id)
      references oa_pertemp (pt_id) on delete restrict on update restrict;

alter table oa_flow add constraint FK_emp_flow foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_formal add constraint FK_emp_formal foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_leave add constraint FK_emp_levac foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_leave add constraint FK_vac_type foreign key (vac_id)
      references oa_vacation (vac_id) on delete restrict on update restrict;

alter table oa_move add constraint FK_emp_move foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_move add constraint FK_move_dept foreign key (dept_id)
      references oa_dept (dept_id) on delete restrict on update restrict;

alter table oa_move add constraint FK_move_job foreign key (job_id)
      references oa_job (job_id) on delete restrict on update restrict;

alter table oa_overtimecode add constraint FK_emp_jia foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_overtimecode add constraint FK_type_add foreign key (type_id)
      references oa_overtimetype (type_id) on delete restrict on update restrict;

alter table oa_password add constraint FK_pass_emp foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_paytable add constraint FK_emp_send foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_paytemplate add constraint FK_creater foreign key (oa__emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_paytemplate add constraint FK_examer foreign key (oa__emp_id2)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_paytemplate add constraint FK_sender foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_personalbook add constraint FK_per_emp foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_pertemp add constraint FK_emp_temp foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_pertemp add constraint FK_job_temp foreign key (job_id)
      references oa_job (job_id) on delete restrict on update restrict;

alter table oa_rap add constraint FK_apply foreign key (raper_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_rap add constraint FK_emp_rap foreign key (apply_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_schedule add constraint FK_emp_sch foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_schedulecontent add constraint FK_content_sch foreign key (sch_id)
      references oa_schedule (sch_id) on delete restrict on update restrict;

alter table oa_score add constraint FK_emp_score foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_score add constraint FK_task_score foreign key (et_id)
      references oa_examtask (et_id) on delete restrict on update restrict;

alter table oa_scoredetail add constraint FK_pro_detail foreign key (ep_id)
      references oa_examproject (ep_id) on delete restrict on update restrict;

alter table oa_scoredetail add constraint FK_score_detail foreign key (score_id)
      references oa_score (score_id) on delete restrict on update restrict;

alter table oa_systemlog add constraint FK_emp_log foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_trainplan add constraint FK_fuze foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table oa_trainplan add constraint FK_tec_plan foreign key (tec_id)
      references oa_traintec (tec_id) on delete restrict on update restrict;

alter table oa_turn add constraint FK_flow_turn foreign key (flow_id)
      references oa_flow (flow_id) on delete restrict on update restrict;

alter table oa_whereabouts add constraint FK_emp_wh foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

alter table trainstu add constraint FK_trainstu foreign key (rp_id)
      references oa_trainplan (rp_id) on delete restrict on update restrict;

alter table trainstu add constraint FK_trainstu2 foreign key (emp_id)
      references oa_emp (emp_id) on delete restrict on update restrict;

