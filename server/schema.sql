BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Startup" (
	"ID"	INTEGER,
	"Name"	TEXT NOT NULL,
	"MissionStatement"	TEXT NOT NULL,
	"Offering"	TEXT NOT NULL,
	"Description"	TEXT NOT NULL,
	"Picture"	INTEGER NOT NULL,
	"Banner"	INTEGER NOT NULL,
	"CreatedAt"	INTEGER NOT NULL,
	PRIMARY KEY("ID" AUTOINCREMENT),
	FOREIGN KEY("Picture") REFERENCES "File"("ID"),
	FOREIGN KEY("Banner") REFERENCES "File"("ID")
);
CREATE TABLE IF NOT EXISTS "User" (
	"ID"	INTEGER,
	"Email"	TEXT NOT NULL UNIQUE,
	"Password"	TEXT NOT NULL,
	"Link"	TEXT NOT NULL,
	"Bio"	TEXT NOT NULL,
	"Picture"	INTEGER NOT NULL,
	"Experience"	TEXT NOT NULL,
	"CreatedAt"	INTEGER NOT NULL,
	PRIMARY KEY("ID" AUTOINCREMENT),
	FOREIGN KEY("Picture") REFERENCES "File"("ID")
);
CREATE TABLE IF NOT EXISTS "Founder" (
	"ID"	INTEGER,
	"User"	INTEGER NOT NULL,
	"Startup"	INTEGER NOT NULL,
	"CreatedAt"	INTEGER NOT NULL,
	FOREIGN KEY("Startup") REFERENCES "Startup"("ID"),
	FOREIGN KEY("User") REFERENCES "User"("ID"),
	PRIMARY KEY("ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "File" (
	"ID"	INTEGER,
	"Path"	TEXT,
	"Uploader"	INTEGER NOT NULL,
	"CreatedAt"	INTEGER NOT NULL,
	PRIMARY KEY("ID" AUTOINCREMENT),
	FOREIGN KEY("Uploader") REFERENCES "User"("ID")
);
CREATE TABLE IF NOT EXISTS "Blog" (
	"ID"	INTEGER,
	"Title"	TEXT NOT NULL,
	"Content"	TEXT NOT NULL,
	"Author"	INTEGER NOT NULL,
	"CreatedAt"	INTEGER NOT NULL,
	PRIMARY KEY("ID" AUTOINCREMENT),
	FOREIGN KEY("Author") REFERENCES "User"("ID")
);
CREATE TABLE IF NOT EXISTS "FollowStartup" (
	"ID"	INTEGER,
	"Following"	INTEGER NOT NULL,
	"Follower"	INTEGER NOT NULL,
	"CreatedAt"	INTEGER NOT NULL,
	PRIMARY KEY("ID" AUTOINCREMENT),
	FOREIGN KEY("Follower") REFERENCES "User"("ID"),
	FOREIGN KEY("Following") REFERENCES "Startup"("ID")
);
CREATE TABLE IF NOT EXISTS "FollowUser" (
	"ID"	INTEGER,
	"Following"	INTEGER NOT NULL,
	"Follower"	INTEGER NOT NULL,
	"CreatedAt"	INTEGER NOT NULL,
	FOREIGN KEY("Follower") REFERENCES "User"("ID"),
	PRIMARY KEY("ID" AUTOINCREMENT),
	FOREIGN KEY("Following") REFERENCES "User"("ID")
);
COMMIT;
