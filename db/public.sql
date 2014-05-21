/*
 Navicat Premium Data Transfer

 Source Server         : SoccerBet Lom
 Source Server Type    : PostgreSQL
 Source Server Version : 90303
 Source Host           : ec2-54-243-49-82.compute-1.amazonaws.com
 Source Database       : d4nap9f5m04qs
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90303
 File Encoding         : utf-8

 Date: 05/15/2014 19:22:09 PM
*/

-- ----------------------------
--  Sequence structure for "public"."games_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."games_id_seq";
CREATE SEQUENCE "public"."games_id_seq" INCREMENT 1 START 50 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."games_id_seq" OWNER TO "donqxqlxkbmnvd";

-- ----------------------------
--  Sequence structure for "public"."pools_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."pools_id_seq";
CREATE SEQUENCE "public"."pools_id_seq" INCREMENT 1 START 3 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."pools_id_seq" OWNER TO "donqxqlxkbmnvd";

-- ----------------------------
--  Sequence structure for "public"."team_groups_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."team_groups_id_seq";
CREATE SEQUENCE "public"."team_groups_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."team_groups_id_seq" OWNER TO "donqxqlxkbmnvd";

-- ----------------------------
--  Sequence structure for "public"."teams_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."teams_id_seq";
CREATE SEQUENCE "public"."teams_id_seq" INCREMENT 1 START 33 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."teams_id_seq" OWNER TO "donqxqlxkbmnvd";

-- ----------------------------
--  Sequence structure for "public"."users_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
CREATE SEQUENCE "public"."users_id_seq" INCREMENT 1 START 5 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."users_id_seq" OWNER TO "donqxqlxkbmnvd";

-- ----------------------------
--  Table structure for "public"."schema_migrations"
-- ----------------------------
DROP TABLE IF EXISTS "public"."schema_migrations";
CREATE TABLE "public"."schema_migrations" (
	"version" varchar(255) NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."schema_migrations" OWNER TO "donqxqlxkbmnvd";

-- ----------------------------
--  Records of "public"."schema_migrations"
-- ----------------------------
BEGIN;
INSERT INTO "public"."schema_migrations" VALUES ('20140512045425');
INSERT INTO "public"."schema_migrations" VALUES ('20140512045446');
INSERT INTO "public"."schema_migrations" VALUES ('20140512045524');
INSERT INTO "public"."schema_migrations" VALUES ('20140512045651');
INSERT INTO "public"."schema_migrations" VALUES ('20140513014609');
COMMIT;

-- ----------------------------
--  Table structure for "public"."pools"
-- ----------------------------
DROP TABLE IF EXISTS "public"."pools";
CREATE TABLE "public"."pools" (
	"id" int4 NOT NULL DEFAULT nextval('pools_id_seq'::regclass),
	"name" varchar(255),
	"active" bool,
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."pools" OWNER TO "donqxqlxkbmnvd";

-- ----------------------------
--  Records of "public"."pools"
-- ----------------------------
BEGIN;
INSERT INTO "public"."pools" VALUES ('1', 'RONDA 1', 't', '2014-05-13 19:57:26.932842', '2014-05-13 22:47:57.576262');
INSERT INTO "public"."pools" VALUES ('2', 'RONDA 2', 'f', '2014-05-14 22:29:30.647098', '2014-05-14 22:29:30.647098');
INSERT INTO "public"."pools" VALUES ('3', 'RONDA 3', 'f', '2014-05-14 22:58:33.516989', '2014-05-14 22:58:33.516989');
COMMIT;

-- ----------------------------
--  Table structure for "public"."teams"
-- ----------------------------
DROP TABLE IF EXISTS "public"."teams";
CREATE TABLE "public"."teams" (
	"id" int4 NOT NULL DEFAULT nextval('teams_id_seq'::regclass),
	"name" varchar(255),
	"image" varchar(255),
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."teams" OWNER TO "donqxqlxkbmnvd";

-- ----------------------------
--  Records of "public"."teams"
-- ----------------------------
BEGIN;
INSERT INTO "public"."teams" VALUES ('1', 'BRASIL', 'bra.png', '2014-05-13 19:56:51.983982', '2014-05-13 19:56:51.983982');
INSERT INTO "public"."teams" VALUES ('2', 'CROACIA', 'cro.png', '2014-05-13 21:32:44.462741', '2014-05-13 21:32:44.462741');
INSERT INTO "public"."teams" VALUES ('3', 'MEXICO', 'mex.png', '2014-05-13 21:32:59.245714', '2014-05-13 21:32:59.245714');
INSERT INTO "public"."teams" VALUES ('4', 'CAMERUN', 'cam.png', '2014-05-13 21:33:52.133297', '2014-05-13 21:33:52.133297');
INSERT INTO "public"."teams" VALUES ('5', 'ESPAÑA', 'spa.png', '2014-05-13 21:34:31.910682', '2014-05-13 21:34:31.910682');
INSERT INTO "public"."teams" VALUES ('6', 'HOLANDA', 'ned.png', '2014-05-13 21:37:01.146496', '2014-05-13 21:37:01.146496');
INSERT INTO "public"."teams" VALUES ('7', 'CHILE', 'chi.png', '2014-05-13 21:37:32.041274', '2014-05-13 21:37:32.041274');
INSERT INTO "public"."teams" VALUES ('8', 'AUSTRALIA', 'aus.png', '2014-05-13 21:37:43.893167', '2014-05-13 21:37:43.893167');
INSERT INTO "public"."teams" VALUES ('9', 'COLOMBIA', 'col.png', '2014-05-13 21:38:06.170442', '2014-05-13 21:38:06.170442');
INSERT INTO "public"."teams" VALUES ('10', 'GRECIA', 'gre.png', '2014-05-13 21:41:01.86309', '2014-05-13 21:41:01.86309');
INSERT INTO "public"."teams" VALUES ('11', 'COSTA DE MARFIL', 'cot.png', '2014-05-13 21:42:06.3028', '2014-05-13 21:42:06.3028');
INSERT INTO "public"."teams" VALUES ('12', 'JAPON', 'jap.png', '2014-05-13 21:42:22.099319', '2014-05-13 21:42:22.099319');
INSERT INTO "public"."teams" VALUES ('13', 'URUGUAY', 'uru.png', '2014-05-13 21:43:02.014854', '2014-05-13 21:43:02.014854');
INSERT INTO "public"."teams" VALUES ('14', 'COSTA RICA', 'cos.png', '2014-05-13 21:43:20.512457', '2014-05-13 21:43:20.512457');
INSERT INTO "public"."teams" VALUES ('15', 'INGLATERRA', 'eng.png', '2014-05-13 21:43:34.820819', '2014-05-13 21:43:34.820819');
INSERT INTO "public"."teams" VALUES ('16', 'ITALIA', 'ita.png', '2014-05-13 21:43:50.859082', '2014-05-13 21:43:50.859082');
INSERT INTO "public"."teams" VALUES ('17', 'SUIZA', 'swi.png', '2014-05-13 21:44:12.695418', '2014-05-13 21:44:12.695418');
INSERT INTO "public"."teams" VALUES ('18', 'ECUADOR', 'ecu.png', '2014-05-13 21:44:26.847827', '2014-05-13 21:44:26.847827');
INSERT INTO "public"."teams" VALUES ('19', 'FRANCIA', 'fra.png', '2014-05-13 21:46:50.665902', '2014-05-13 21:46:50.665902');
INSERT INTO "public"."teams" VALUES ('20', 'HONDURAS', 'hon.png', '2014-05-13 21:47:13.181569', '2014-05-13 21:47:13.181569');
INSERT INTO "public"."teams" VALUES ('21', 'ARGENTINA', 'arg.png', '2014-05-13 21:47:31.688903', '2014-05-13 21:47:31.688903');
INSERT INTO "public"."teams" VALUES ('22', 'BOSNIA-HERZEGOVINA', 'bos.png', '2014-05-13 21:48:31.084274', '2014-05-13 21:48:31.084274');
INSERT INTO "public"."teams" VALUES ('23', 'IRAN', 'ira.png', '2014-05-13 21:48:56.80429', '2014-05-13 21:48:56.80429');
INSERT INTO "public"."teams" VALUES ('24', 'NIGERIA', 'nig.png', '2014-05-13 21:49:10.249768', '2014-05-13 21:49:10.249768');
INSERT INTO "public"."teams" VALUES ('25', 'ALEMANIA', 'ger.png', '2014-05-13 21:49:26.686379', '2014-05-13 21:49:26.686379');
INSERT INTO "public"."teams" VALUES ('26', 'PORTUGAL', 'por.png', '2014-05-13 21:49:41.637561', '2014-05-13 21:49:41.637561');
INSERT INTO "public"."teams" VALUES ('27', 'GHANA', 'gha.png', '2014-05-13 21:49:55.666147', '2014-05-13 21:49:55.666147');
INSERT INTO "public"."teams" VALUES ('28', 'ESTADOS UNIDOS', 'usa.png', '2014-05-13 21:50:21.190522', '2014-05-13 21:50:21.190522');
INSERT INTO "public"."teams" VALUES ('30', 'BELGICA', 'bel.png', '2014-05-13 21:50:39.079846', '2014-05-13 21:50:39.079846');
INSERT INTO "public"."teams" VALUES ('31', 'ARGELIA', 'alg.png', '2014-05-13 21:50:52.706495', '2014-05-13 21:50:52.706495');
INSERT INTO "public"."teams" VALUES ('32', 'RUSIA', 'rus.png', '2014-05-13 21:51:05.340724', '2014-05-13 21:51:05.340724');
INSERT INTO "public"."teams" VALUES ('33', 'COREA', 'skr.png', '2014-05-13 21:51:18.926181', '2014-05-13 21:51:18.926181');
COMMIT;

-- ----------------------------
--  Table structure for "public"."team_groups"
-- ----------------------------
DROP TABLE IF EXISTS "public"."team_groups";
CREATE TABLE "public"."team_groups" (
	"id" int4 NOT NULL DEFAULT nextval('team_groups_id_seq'::regclass),
	"name" varchar(255),
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."team_groups" OWNER TO "donqxqlxkbmnvd";

-- ----------------------------
--  Table structure for "public"."games"
-- ----------------------------
DROP TABLE IF EXISTS "public"."games";
CREATE TABLE "public"."games" (
	"id" int4 NOT NULL DEFAULT nextval('games_id_seq'::regclass),
	"home_team_id" int4,
	"visitor_team_id" int4,
	"play_at" timestamp(6) NULL,
	"pool_id" int4,
	"team_group_id" int4,
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."games" OWNER TO "donqxqlxkbmnvd";

-- ----------------------------
--  Records of "public"."games"
-- ----------------------------
BEGIN;
INSERT INTO "public"."games" VALUES ('2', '1', '2', '2014-06-12 20:00:00', '1', null, '2014-05-13 21:56:37.996641', '2014-05-13 22:35:52.912256');
INSERT INTO "public"."games" VALUES ('3', '3', '4', '2014-06-13 16:00:00', '1', null, '2014-05-13 21:57:37.192543', '2014-05-13 22:36:21.485502');
INSERT INTO "public"."games" VALUES ('5', '5', '6', '2014-06-13 19:00:00', '1', null, '2014-05-13 21:58:42.773604', '2014-05-13 22:36:49.977834');
INSERT INTO "public"."games" VALUES ('7', '9', '10', '2014-06-14 16:00:00', '1', null, '2014-05-13 22:01:13.311658', '2014-05-13 22:39:50.132087');
INSERT INTO "public"."games" VALUES ('9', '13', '14', '2014-06-14 19:00:00', '1', null, '2014-05-13 22:03:04.28079', '2014-05-13 22:40:45.761587');
INSERT INTO "public"."games" VALUES ('12', '19', '20', '2014-06-15 19:00:00', '1', null, '2014-05-13 22:06:29.495182', '2014-05-13 22:42:35.048478');
INSERT INTO "public"."games" VALUES ('11', '17', '18', '2014-06-15 16:00:00', '1', null, '2014-05-13 22:05:39.094575', '2014-05-13 22:43:30.100852');
INSERT INTO "public"."games" VALUES ('13', '21', '22', '2014-06-15 22:00:00', '1', null, '2014-05-13 22:07:25.369005', '2014-05-13 22:44:14.284917');
INSERT INTO "public"."games" VALUES ('14', '23', '24', '2014-06-16 19:00:00', '1', null, '2014-05-13 22:08:10.2511', '2014-05-13 22:44:45.71608');
INSERT INTO "public"."games" VALUES ('15', '25', '26', '2014-06-16 16:00:00', '1', null, '2014-05-13 22:09:29.668688', '2014-05-13 22:47:18.979596');
INSERT INTO "public"."games" VALUES ('16', '27', '28', '2014-06-16 22:00:00', '1', null, '2014-05-13 22:12:05.935055', '2014-05-13 22:51:33.759525');
INSERT INTO "public"."games" VALUES ('8', '11', '12', '2014-06-15 01:00:00', '1', null, '2014-05-13 22:02:17.633672', '2014-05-13 23:18:15.253225');
INSERT INTO "public"."games" VALUES ('17', '30', '31', '2014-06-17 16:00:00', '1', null, '2014-05-13 22:13:35.108633', '2014-05-13 23:20:11.69176');
INSERT INTO "public"."games" VALUES ('6', '7', '8', '2014-06-13 22:00:00', '1', null, '2014-05-13 22:00:11.283191', '2014-05-13 23:40:10.507111');
INSERT INTO "public"."games" VALUES ('10', '15', '16', '2014-06-14 22:00:00', '1', null, '2014-05-13 22:04:54.29397', '2014-05-13 23:40:37.970801');
INSERT INTO "public"."games" VALUES ('18', '32', '33', '2014-06-17 22:00:00', '1', null, '2014-05-13 22:14:24.720506', '2014-05-13 23:41:40.120529');
INSERT INTO "public"."games" VALUES ('19', '1', '3', '2014-06-17 19:00:00', '2', null, '2014-05-14 22:30:36.139289', '2014-05-14 22:30:36.139289');
INSERT INTO "public"."games" VALUES ('20', '8', '6', '2014-06-18 16:00:00', '2', null, '2014-05-14 22:31:54.046618', '2014-05-14 22:31:54.046618');
INSERT INTO "public"."games" VALUES ('21', '5', '7', '2014-06-18 19:00:00', '2', null, '2014-05-14 22:32:50.536856', '2014-05-14 22:32:50.536856');
INSERT INTO "public"."games" VALUES ('22', '4', '2', '2014-06-18 22:00:00', '2', null, '2014-05-14 22:33:50.082', '2014-05-14 22:33:50.082');
INSERT INTO "public"."games" VALUES ('23', '9', '11', '2014-06-19 16:00:00', '2', null, '2014-05-14 22:34:46.65252', '2014-05-14 22:34:46.65252');
INSERT INTO "public"."games" VALUES ('24', '13', '15', '2014-06-19 19:00:00', '2', null, '2014-05-14 22:35:40.23347', '2014-05-14 22:35:40.23347');
INSERT INTO "public"."games" VALUES ('25', '12', '10', '2014-06-19 22:00:00', '2', null, '2014-05-14 22:36:34.296571', '2014-05-14 22:36:34.296571');
INSERT INTO "public"."games" VALUES ('26', '16', '14', '2014-06-20 16:00:00', '2', null, '2014-05-14 22:37:53.700785', '2014-05-14 22:37:53.700785');
INSERT INTO "public"."games" VALUES ('27', '17', '19', '2014-06-20 19:00:00', '2', null, '2014-05-14 22:39:13.013308', '2014-05-14 22:39:42.976077');
INSERT INTO "public"."games" VALUES ('28', '20', '18', '2014-06-20 22:00:00', '2', null, '2014-05-14 22:41:29.073733', '2014-05-14 22:41:29.073733');
INSERT INTO "public"."games" VALUES ('29', '21', '23', '2014-06-21 16:00:00', '2', null, '2014-05-14 22:42:58.559819', '2014-05-14 22:42:58.559819');
INSERT INTO "public"."games" VALUES ('30', '25', '27', '2014-06-21 19:00:00', '2', null, '2014-05-14 22:43:54.528269', '2014-05-14 22:43:54.528269');
INSERT INTO "public"."games" VALUES ('31', '24', '22', '2014-06-21 22:00:00', '2', null, '2014-05-14 22:45:46.747632', '2014-05-14 22:45:46.747632');
INSERT INTO "public"."games" VALUES ('32', '30', '32', '2014-06-22 16:00:00', '2', null, '2014-05-14 22:47:18.807008', '2014-05-14 22:47:18.807008');
INSERT INTO "public"."games" VALUES ('33', '33', '31', '2014-06-22 19:00:00', '2', null, '2014-05-14 22:48:40.86223', '2014-05-14 22:48:40.86223');
INSERT INTO "public"."games" VALUES ('34', '28', '26', '2014-06-22 22:00:00', '2', null, '2014-05-14 22:49:39.462655', '2014-05-14 22:49:39.462655');
INSERT INTO "public"."games" VALUES ('35', '6', '7', '2014-06-23 16:00:00', '3', null, '2014-05-14 22:59:31.78107', '2014-05-14 22:59:31.78107');
INSERT INTO "public"."games" VALUES ('36', '8', '5', '2014-06-23 16:00:00', '3', null, '2014-05-14 23:00:30.242591', '2014-05-14 23:00:30.242591');
INSERT INTO "public"."games" VALUES ('37', '4', '1', '2014-06-23 20:00:00', '3', null, '2014-05-14 23:01:35.139216', '2014-05-14 23:01:35.139216');
INSERT INTO "public"."games" VALUES ('38', '2', '3', '2014-06-23 20:00:00', '3', null, '2014-05-14 23:02:18.251196', '2014-05-14 23:02:18.251196');
INSERT INTO "public"."games" VALUES ('39', '16', '13', '2014-06-24 16:00:00', '3', null, '2014-05-14 23:03:20.264305', '2014-05-14 23:03:20.264305');
INSERT INTO "public"."games" VALUES ('40', '14', '15', '2014-06-24 16:00:00', '3', null, '2014-05-14 23:04:05.002946', '2014-05-14 23:04:05.002946');
INSERT INTO "public"."games" VALUES ('41', '12', '9', '2014-06-24 20:00:00', '3', null, '2014-05-14 23:05:03.763563', '2014-05-14 23:05:03.763563');
INSERT INTO "public"."games" VALUES ('42', '10', '11', '2014-06-24 20:00:00', '3', null, '2014-05-14 23:05:57.880063', '2014-05-14 23:05:57.880063');
INSERT INTO "public"."games" VALUES ('43', '24', '21', '2014-06-25 16:00:00', '3', null, '2014-05-14 23:08:12.732488', '2014-05-14 23:08:12.732488');
INSERT INTO "public"."games" VALUES ('44', '22', '23', '2014-06-25 16:00:00', '3', null, '2014-05-14 23:09:13.187517', '2014-05-14 23:09:13.187517');
INSERT INTO "public"."games" VALUES ('45', '20', '17', '2014-06-25 20:00:00', '3', null, '2014-05-14 23:10:15.336039', '2014-05-14 23:10:15.336039');
INSERT INTO "public"."games" VALUES ('46', '18', '19', '2014-06-25 20:00:00', '3', null, '2014-05-14 23:11:12.968512', '2014-05-14 23:11:12.968512');
INSERT INTO "public"."games" VALUES ('47', '26', '27', '2014-06-26 16:00:00', '3', null, '2014-05-14 23:12:01.248165', '2014-05-14 23:12:01.248165');
INSERT INTO "public"."games" VALUES ('48', '28', '25', '2014-06-26 16:00:00', '3', null, '2014-05-14 23:13:11.21753', '2014-05-14 23:13:11.21753');
INSERT INTO "public"."games" VALUES ('49', '33', '30', '2014-06-26 20:00:00', '3', null, '2014-05-14 23:14:11.046155', '2014-05-14 23:14:11.046155');
INSERT INTO "public"."games" VALUES ('50', '31', '32', '2014-06-26 20:00:00', '3', null, '2014-05-14 23:15:07.62934', '2014-05-14 23:15:07.62934');
COMMIT;

-- ----------------------------
--  Table structure for "public"."users"
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
	"id" int4 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
	"provider" varchar(255),
	"uid" varchar(255),
	"name" varchar(255),
	"email" varchar(255),
	"image" varchar(255),
	"paid" bool DEFAULT true,
	"oauth_token" varchar(255),
	"oauth_expires_at" timestamp(6) NULL,
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."users" OWNER TO "donqxqlxkbmnvd";

-- ----------------------------
--  Records of "public"."users"
-- ----------------------------
BEGIN;
INSERT INTO "public"."users" VALUES ('4', 'facebook', '245528592314388', 'Marco Antonio Lomelí Aragón', 'malom05@yahoo.com.mx', 'http://graph.facebook.com/245528592314388/picture', 't', 'CAAVV0q3yQ0EBAAyaaI6Dqm3iUfeYzd05LbxgHb2ZCLF4HKrbf4Y8pf3GtwPCCO5KJ68Oi7nZBomBxj1iHkYuRASUwG2RK1zArZBekkg5bhTxerJIDGmxYNCVrOiHEQAJo9jCtkiw0Bj71IJvTw0FpUE85EXMcQUdZCfuLHilirSX4Hy0CNnifN5KIsvpYTEZD', '2014-07-13 22:28:56', '2014-05-13 21:31:41.656943', '2014-05-14 23:19:56.656621');
INSERT INTO "public"."users" VALUES ('5', 'facebook', '10152442913772363', 'Eduardo Lomelí', 'elomelis99@hotmail.com', 'http://graph.facebook.com/10152442913772363/picture', 't', 'CAAVV0q3yQ0EBAFcWzz8MqKcM06qra4sTnfpcuaAIqg6Rh0zwOch5HxyGMnQdMcIDzU94YyYyBsuZAx5wx0EAEZBtjUuKihUQnjsHpGRwQggQOVfvPikDrCy5aq3HGr7GtZCwpLFmpiEdawtZBLX5NFaJmH8uFrjyGYcwaWVcBSbeAM5kBVJQ', '2014-07-14 17:54:47', '2014-05-13 22:37:53.14861', '2014-05-15 17:54:48.124089');
COMMIT;


-- ----------------------------
--  Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."games_id_seq" OWNED BY "games"."id";
ALTER SEQUENCE "public"."pools_id_seq" OWNED BY "pools"."id";
ALTER SEQUENCE "public"."team_groups_id_seq" OWNED BY "team_groups"."id";
ALTER SEQUENCE "public"."teams_id_seq" OWNED BY "teams"."id";
ALTER SEQUENCE "public"."users_id_seq" OWNED BY "users"."id";
-- ----------------------------
--  Indexes structure for table "public"."schema_migrations"
-- ----------------------------
CREATE UNIQUE INDEX "unique_schema_migrations" ON "public"."schema_migrations" USING btree("version" ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table "public"."pools"
-- ----------------------------
ALTER TABLE "public"."pools" ADD CONSTRAINT "pools_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table "public"."teams"
-- ----------------------------
ALTER TABLE "public"."teams" ADD CONSTRAINT "teams_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table "public"."team_groups"
-- ----------------------------
ALTER TABLE "public"."team_groups" ADD CONSTRAINT "team_groups_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table "public"."games"
-- ----------------------------
ALTER TABLE "public"."games" ADD CONSTRAINT "games_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table "public"."games"
-- ----------------------------
CREATE INDEX "index_games_on_home_team_id" ON "public"."games" USING btree(home_team_id ASC NULLS LAST);
CREATE INDEX "index_games_on_pool_id" ON "public"."games" USING btree(pool_id ASC NULLS LAST);
CREATE INDEX "index_games_on_team_group_id" ON "public"."games" USING btree(team_group_id ASC NULLS LAST);
CREATE INDEX "index_games_on_visitor_team_id" ON "public"."games" USING btree(visitor_team_id ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table "public"."users"
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

