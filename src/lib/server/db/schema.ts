import { sql, relations } from "drizzle-orm";
import { pgTable, varchar, timestamp, uniqueIndex, index, text, integer } from "drizzle-orm/pg-core";

export const user = pgTable(
  "user",
  {
    id: varchar("id", { length: 64 }).primaryKey(),
    username: varchar("username", { length: 32 }).notNull(),
    email: varchar("email", { length: 254 }).notNull(),
    passwordHash: varchar("password_hash", { length: 98 }).notNull(),
    createdAt: timestamp("created_at", { withTimezone: true, mode: "date" }).notNull().defaultNow(),
  },
  (table) => ({
    idxUserEmail: uniqueIndex("idx_user_email").on(table.email),
  })
);

export const userRelations = relations(user, ({ many }) => ({
  sessions: many(session),
  histories: many(history),
}));

export const session = pgTable(
  "session",
  {
    id: varchar("id", { length: 64 }).primaryKey(),
    userId: varchar("user_id", { length: 64 })
      .notNull()
      .references(() => user.id, { onDelete: "cascade" }),
    createdAt: timestamp("created_at", { withTimezone: true, mode: "date" }).notNull().defaultNow(),
    expiresAt: timestamp("expires_at", { withTimezone: true, mode: "date" }).notNull(),
  },
  (table) => ({
    idxSessionUserId: index("idx_session_user_id").on(table.userId),
  })
);

export const sessionRelations = relations(session, ({ one }) => ({
  user: one(user, { fields: [session.userId], references: [user.id] }),
}));

export const history = pgTable(
  "history",
  {
    id: varchar("id", { length: 64 }).primaryKey(),
    userId: varchar("user_id", { length: 64 })
      .notNull()
      .references(() => user.id, { onDelete: "cascade" }),
    title: varchar("title", { length: 256 }).notNull(),
    data: text("data").notNull(),
    createdAt: timestamp("created_at", { withTimezone: true, mode: "date" }).notNull().defaultNow(),
  },
  (table) => ({
    idxHistoryUserId: index("idx_history_user_id").on(table.userId),
    idxHistoryCreatedAt: index("idx_history_created_at").on(table.createdAt),
  })
);

export const historyRelations = relations(history, ({ one }) => ({
  user: one(user, { fields: [history.userId], references: [user.id] }),
}));
