PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO "schema_migrations" VALUES('20170109083645');
INSERT INTO "schema_migrations" VALUES('20170109084534');
INSERT INTO "schema_migrations" VALUES('20170109111622');
INSERT INTO "schema_migrations" VALUES('20170109210839');
INSERT INTO "schema_migrations" VALUES('20170109211329');
INSERT INTO "schema_migrations" VALUES('20170110091829');
INSERT INTO "schema_migrations" VALUES('20170110091948');
INSERT INTO "schema_migrations" VALUES('20170110095758');
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "ar_internal_metadata" VALUES('environment','development','2017-01-09 08:41:58.285668','2017-01-09 08:41:58.285668');
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "remember_created_at" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "username" varchar, "user_type" integer);
INSERT INTO "users" VALUES(1,'bob@gmail.com','$2a$11$rGloJptU5rAcA9zD7POpruLbboDsS9trM7m.ypxgmRy0bbJAkJS5q',NULL,'2017-01-09 10:10:41.760695','2017-01-10 10:43:17.497554','bob',2);
INSERT INTO "users" VALUES(2,'alice@gmail.com','$2a$11$mpReTQnn7J5EejPPIudZ1enpCe3jS21ygT7fr80ux26eTZqa63F9i',NULL,'2017-01-09 10:22:03.532060','2017-01-09 10:22:03.532060','alice',1);
INSERT INTO "users" VALUES(3,'admin@gmail.com','$2a$11$6gCGT1hSqumEmJCis0lXWOxdzkZHY9p2FcViGg1WGO.51nQyhexRK',NULL,'2017-01-09 10:24:56.737945','2017-01-09 10:27:38.751498','admin',0);
INSERT INTO "users" VALUES(4,'carl@gmail.com','$2a$11$gb7BYP5lrocd4GozsxOXj.AugIHv5bt3c1eMRLSXL8VOiJJ8vTEYm',NULL,'2017-01-10 17:15:07.195332','2017-01-10 17:15:07.195332','carl',1);
CREATE TABLE "chats" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "message_text" text, "username_from" varchar, "user_id_from" integer, "username_to" varchar, "user_id_to" integer, "is_deleted" boolean, "is_edited" boolean, "edited_by_username" varchar, "edited_time" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "messages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "session_id" integer, "author" varchar, "text" text, "status" integer DEFAULT 0, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "messages" VALUES(1,1,'bob','Hi, I''m currently 7kgs underweight and I need to gain some mass. Can you please suggest a proper diet plan for this?',0,'2017-01-10 09:44:07.085590','2017-01-10 09:44:07.085590');
INSERT INTO "messages" VALUES(9,1,'alice','Yes, sure. I''ll make a diet plan for you the next time you visit!',0,'2017-01-10 16:32:00.566447','2017-01-10 16:32:00.566447');
INSERT INTO "messages" VALUES(13,6,'bob','Hi, could anyone list some back exercises for me please?',0,'2017-01-10 17:14:35.913859','2017-01-10 17:14:35.913859');
INSERT INTO "messages" VALUES(14,6,'carl','Hi bob, back exercises are really varied in nature. Some examples are Barbell Deadlift, Seated Cable Row, Inverted Row and Straight-Arm Pulldown. I can explain these to you next time you come in.',0,'2017-01-10 17:17:02.032107','2017-01-10 17:17:02.032107');
INSERT INTO "messages" VALUES(15,7,'bob','Hi, is anyone coming to the gym tomorrow?',0,'2017-01-10 17:29:00.773682','2017-01-10 17:29:00.773682');
INSERT INTO "messages" VALUES(16,7,'carl','Yeah, I''ll be available tomorrow. How can I help you?',0,'2017-01-10 17:30:22.655139','2017-01-10 17:30:22.655139');
CREATE TABLE "sessions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_to_id" integer, "user_from_id" integer, "status" integer DEFAULT 0, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "sessions" VALUES(1,2,1,1,'2017-01-10 09:41:58.896929','2017-01-10 16:52:41.783670');
INSERT INTO "sessions" VALUES(6,4,1,1,'2017-01-10 17:14:35.906172','2017-01-10 17:17:20.022929');
INSERT INTO "sessions" VALUES(7,4,1,0,'2017-01-10 17:29:00.766888','2017-01-10 17:30:22.644554');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('users',4);
INSERT INTO "sqlite_sequence" VALUES('messages',16);
INSERT INTO "sqlite_sequence" VALUES('sessions',7);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_username" ON "users" ("username");
COMMIT;
