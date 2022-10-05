CREATE TABLE "Book" (
  "ISBN" int PRIMARY KEY,
  "year" int,
  "name" varchar,
  "author" varchar,
  "pages" int,
  "publisher" varchar
);

CREATE TABLE "Copy" (
  "copyid" int PRIMARY KEY,
  "position" varchar,
  "ISBN" int
);

CREATE TABLE "Category" (
  "name" varchar PRIMARY KEY
);

CREATE TABLE "CategoryHierarhy" (
  "id" SERIAL PRIMARY KEY,
  "parentName" varchar,
  "childName" varchar
);

CREATE TABLE "BookCategory" (
  "id" SERIAL PRIMARY KEY,
  "ISBN" int,
  "category" varchar
);

CREATE TABLE "Publisher" (
  "name" varchar PRIMARY KEY,
  "adress" varchar
);

CREATE TABLE "Reader" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "surname" varchar,
  "adress" varchar,
  "hbday" varchar
);

CREATE TABLE "Borrow" (
  "id" SERIAL PRIMARY KEY,
  "readerid" int,
  "copyid" int,
  "returndate" timestamp
);

ALTER TABLE "Book" ADD FOREIGN KEY ("publisher") REFERENCES "Publisher" ("name");

ALTER TABLE "Copy" ADD FOREIGN KEY ("ISBN") REFERENCES "Book" ("ISBN");

ALTER TABLE "CategoryHierarhy" ADD FOREIGN KEY ("parentName") REFERENCES "Category" ("name");

ALTER TABLE "CategoryHierarhy" ADD FOREIGN KEY ("childName") REFERENCES "Category" ("name");

ALTER TABLE "BookCategory" ADD FOREIGN KEY ("ISBN") REFERENCES "Book" ("ISBN");

ALTER TABLE "BookCategory" ADD FOREIGN KEY ("category") REFERENCES "Category" ("name");

ALTER TABLE "Borrow" ADD FOREIGN KEY ("readerid") REFERENCES "Reader" ("id");

ALTER TABLE "Borrow" ADD FOREIGN KEY ("copyid") REFERENCES "Copy" ("copyid");
