# Project Setup Instructions

Follow the steps below to set up the project on your local machine:

## 1. Clone the Repository

First, clone the repository to your local machine:

```bash
git clone <repository-url>
cd <project-folder>
```

## 2. Create the .env File

After cloning, create a .env file in the root directory by referring to the .env.example file. Set the necessary environment variables as shown below:

```bash
POSTGRES_USER=...
POSTGRES_PASSWORD=...
HOST=...
PORT=...
POSTGRES_DATABASE=...
```

## 3. Install Dependencies

To install all required dependencies, run:

```bash
pnpm install
```

## 4. Set Up the Database

### Stop Any Running Containers

Run the following command to stop any running containers:

```bash
pnpm db:down
```

### Start the Containers

Start the containers in detached mode:

```bash
pnpm db:up
```

### Generate Database Migrations

Generate the database migrations using Drizzle Kit:

```bash
pnpm db:gen
```

### Push the Migrations to the Database

Push the migrations to your PostgreSQL database:

```bash
pnpm db:push
```

## 5. Start the Development Server

To start the development server, run:

```bash
pnpm dev
```

Your development environment is now set up and ready to go!
