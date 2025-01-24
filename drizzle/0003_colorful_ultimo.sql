CREATE TABLE "userSetting" (
	"id" varchar(64) PRIMARY KEY NOT NULL,
	"user_id" varchar(64) NOT NULL,
	"setting_key" varchar(128) NOT NULL,
	"setting_value" text NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
ALTER TABLE "userSetting" ADD CONSTRAINT "userSetting_user_id_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "idx_user_setting_user_id" ON "userSetting" USING btree ("user_id");--> statement-breakpoint
CREATE INDEX "idx_user_setting_key" ON "userSetting" USING btree ("setting_key");