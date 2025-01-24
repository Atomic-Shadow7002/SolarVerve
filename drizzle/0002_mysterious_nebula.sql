ALTER TABLE "chat_entry" DISABLE ROW LEVEL SECURITY;--> statement-breakpoint
ALTER TABLE "user_setting" DISABLE ROW LEVEL SECURITY;--> statement-breakpoint
DROP TABLE "chat_entry" CASCADE;--> statement-breakpoint
DROP TABLE "user_setting" CASCADE;--> statement-breakpoint
ALTER TABLE "history" RENAME COLUMN "updated_at" TO "data";--> statement-breakpoint
DROP INDEX "idx_history_user_id_created_at";--> statement-breakpoint
DROP INDEX "idx_title_search";--> statement-breakpoint
DROP TYPE "public"."role";