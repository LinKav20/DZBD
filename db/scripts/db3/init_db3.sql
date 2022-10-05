CREATE TABLE "City" (
  "region" varchar,
  "name" varchar,
  PRIMARY KEY ("region", "name")
);

CREATE TABLE "Station" (
  "name" varchar PRIMARY KEY,
  "tracks" int,
  "regioncity" varchar,
  "namecity" varchar
);

CREATE TABLE "Train" (
  "id" int PRIMARY KEY,
  "length" int,
  "startstation" varchar,
  "endstation" varchar
);

CREATE TABLE "Connection" (
  "id" SERIAL PRIMARY KEY,
  "departure" timestamp,
  "departurestation" varchar,
  "arrival" timestamp,
  "arrivalstation" varchar,
  "trainid" int
);

ALTER TABLE "Station" ADD FOREIGN KEY ("regioncity", "namecity") REFERENCES "City" ("region", "name");

ALTER TABLE "Train" ADD FOREIGN KEY ("startstation") REFERENCES "Station" ("name");

ALTER TABLE "Train" ADD FOREIGN KEY ("endstation") REFERENCES "Station" ("name");

ALTER TABLE "Connection" ADD FOREIGN KEY ("departurestation") REFERENCES "Station" ("name");

ALTER TABLE "Connection" ADD FOREIGN KEY ("arrivalstation") REFERENCES "Station" ("name");

ALTER TABLE "Connection" ADD FOREIGN KEY ("trainid") REFERENCES "Train" ("id");
