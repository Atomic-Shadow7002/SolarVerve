CREATE TYPE "public"."role" AS ENUM('user', 'miruhane');--> statement-breakpoint
CREATE TABLE "chat_entry" (
	"id" varchar(64) PRIMARY KEY NOT NULL,
	"history_id" varchar(64) NOT NULL,
	"content" text NOT NULL,
	"role" "role" NOT NULL,
	"created_at" timestamp with time zone NOT NULL,
	"updated_at" timestamp with time zone NOT NULL
);
--> statement-breakpoint
CREATE TABLE "history" (
	"id" varchar(64) PRIMARY KEY NOT NULL,
	"user_id" varchar(64) NOT NULL,
	"title" varchar(256) NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "user_setting" (
	"id" varchar(64) PRIMARY KEY NOT NULL,
	"user_id" varchar(64) NOT NULL,
	"key" varchar(64) NOT NULL,
	"value" varchar(255) NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
ALTER TABLE "user" RENAME COLUMN "age" TO "email";--> statement-breakpoint
ALTER TABLE "user" DROP CONSTRAINT "user_username_unique";--> statement-breakpoint
ALTER TABLE "session" DROP CONSTRAINT "session_user_id_user_id_fk";
--> statement-breakpoint
ALTER TABLE "session" ALTER COLUMN "id" SET DATA TYPE varchar(64);--> statement-breakpoint
ALTER TABLE "session" ALTER COLUMN "user_id" SET DATA TYPE varchar(64);--> statement-breakpoint
ALTER TABLE "user" ALTER COLUMN "id" SET DATA TYPE varchar(64);--> statement-breakpoint
ALTER TABLE "user" ALTER COLUMN "username" SET DATA TYPE varchar(32);--> statement-breakpoint
ALTER TABLE "user" ALTER COLUMN "password_hash" SET DATA TYPE varchar(98);--> statement-breakpoint
ALTER TABLE "session" ADD COLUMN "created_at" timestamp with time zone DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "user" ADD COLUMN "created_at" timestamp with time zone DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "chat_entry" ADD CONSTRAINT "chat_entry_history_id_history_id_fk" FOREIGN KEY ("history_id") REFERENCES "public"."history"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "history" ADD CONSTRAINT "history_user_id_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "user_setting" ADD CONSTRAINT "user_setting_user_id_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "idx_chat_role" ON "chat_entry" USING btree ("role");--> statement-breakpoint
CREATE INDEX "idx_chat_history_id" ON "chat_entry" USING btree ("history_id");--> statement-breakpoint
CREATE INDEX "idx_chat_created_at" ON "chat_entry" USING btree ("created_at");--> statement-breakpoint
CREATE INDEX "idx_chat_role_history_id" ON "chat_entry" USING btree ("role","history_id");--> statement-breakpoint
CREATE INDEX "idx_chat_history_id_created_at" ON "chat_entry" USING btree ("history_id","created_at");--> statement-breakpoint
CREATE INDEX "idx_content_search" ON "chat_entry" USING gin (to_tsvector('english', "content"));--> statement-breakpoint
CREATE INDEX "idx_history_user_id" ON "history" USING btree ("user_id");--> statement-breakpoint
CREATE INDEX "idx_history_created_at" ON "history" USING btree ("created_at");--> statement-breakpoint
CREATE INDEX "idx_history_user_id_created_at" ON "history" USING btree ("user_id","created_at");--> statement-breakpoint
CREATE INDEX "idx_title_search" ON "history" USING gin (to_tsvector('english', "title"));--> statement-breakpoint
CREATE INDEX "idx_user_setting_user_id" ON "user_setting" USING btree ("user_id");--> statement-breakpoint
ALTER TABLE "session" ADD CONSTRAINT "session_user_id_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "idx_session_user_id" ON "session" USING btree ("user_id");--> statement-breakpoint
CREATE UNIQUE INDEX "idx_user_email" ON "user" USING btree ("email");