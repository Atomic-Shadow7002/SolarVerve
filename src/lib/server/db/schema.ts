import { relations } from 'drizzle-orm';
import { pgTable, varchar, timestamp, uniqueIndex, index, text } from 'drizzle-orm/pg-core';

// User table with necessary fields for sign-up and sign-in
export const user = pgTable(
	'user',
	{
		id: varchar('id', { length: 64 }).primaryKey(),
		username: varchar('username', { length: 32 }).notNull(),
		email: varchar('email', { length: 254 }).notNull(),
		passwordHash: varchar('password_hash', { length: 98 }).notNull(),
		createdAt: timestamp('created_at', { withTimezone: true, mode: 'date' }).notNull().defaultNow()
	},
	(table) => ({
		idxUserEmail: uniqueIndex('idx_user_email').on(table.email)
	})
);

// Relations for user
export const userRelations = relations(user, ({ many }) => ({
	sessions: many(session),
	histories: many(history),
	userSettings: many(userSetting) // Added relation for userSettings
}));

// Session table for managing user sessions (sign-in)
export const session = pgTable(
	'session',
	{
		id: varchar('id', { length: 64 }).primaryKey(),
		userId: varchar('user_id', { length: 64 })
			.notNull()
			.references(() => user.id, { onDelete: 'cascade' }),
		createdAt: timestamp('created_at', { withTimezone: true, mode: 'date' }).notNull().defaultNow(),
		expiresAt: timestamp('expires_at', { withTimezone: true, mode: 'date' }).notNull()
	},
	(table) => ({
		idxSessionUserId: index('idx_session_user_id').on(table.userId)
	})
);

// Session relations
export const sessionRelations = relations(session, ({ one }) => ({
	user: one(user, { fields: [session.userId], references: [user.id] })
}));

// History table for user-related history data
export const history = pgTable(
	'history',
	{
		id: varchar('id', { length: 64 }).primaryKey(),
		userId: varchar('user_id', { length: 64 })
			.notNull()
			.references(() => user.id, { onDelete: 'cascade' }),
		title: varchar('title', { length: 256 }).notNull(),
		data: text('data').notNull(),
		createdAt: timestamp('created_at', { withTimezone: true, mode: 'date' }).notNull().defaultNow()
	},
	(table) => ({
		idxHistoryUserId: index('idx_history_user_id').on(table.userId),
		idxHistoryCreatedAt: index('idx_history_created_at').on(table.createdAt)
	})
);

// History relations
export const historyRelations = relations(history, ({ one }) => ({
	user: one(user, { fields: [history.userId], references: [user.id] })
}));

// UserSetting table to store user-specific settings
export const userSetting = pgTable(
	'userSetting',
	{
		id: varchar('id', { length: 64 }).primaryKey(),
		userId: varchar('user_id', { length: 64 })
			.notNull()
			.references(() => user.id, { onDelete: 'cascade' }), // Links to the user table
		settingKey: varchar('setting_key', { length: 128 }).notNull(),
		settingValue: text('setting_value').notNull(),
		createdAt: timestamp('created_at', { withTimezone: true, mode: 'date' }).notNull().defaultNow()
	},
	(table) => ({
		idxUserSettingUserId: index('idx_user_setting_user_id').on(table.userId),
		idxUserSettingKey: index('idx_user_setting_key').on(table.settingKey)
	})
);

// Relations for userSetting
export const userSettingRelations = relations(userSetting, ({ one }) => ({
	user: one(user, { fields: [userSetting.userId], references: [user.id] })
}));
