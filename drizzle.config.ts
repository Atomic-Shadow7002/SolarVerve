import { defineConfig } from 'drizzle-kit';
import 'dotenv/config';

export default defineConfig({
  schema: './src/lib/server/db/schema.ts',
  dbCredentials: {
    url: `postgresql://${process.env.POSTGRES_USER}:${process.env.POSTGRES_PASSWORD}@${process.env.HOST}:${process.env.PORT}/${process.env.POSTGRES_DATABASE}`
  },
  verbose: true,
  strict: true,
  dialect: 'postgresql'
});
