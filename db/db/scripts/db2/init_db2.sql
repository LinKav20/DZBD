CREATE TABLE "Patient" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "disease" varchar,
  "doctor" int
);

CREATE TABLE "Doctor" (
  "pers_nr" int PRIMARY KEY,
  "area" varchar,
  "rank" varchar
);

CREATE TABLE "Caregiver" (
  "pers_nr" int PRIMARY KEY,
  "qualification" varchar
);

CREATE TABLE "Station" (
  "stat_nr" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "Room" (
  "room_nr" int PRIMARY KEY,
  "beds" int,
  "station" int
);

CREATE TABLE "StationPersonall" (
  "pers_nr" int PRIMARY KEY,
  "name" varchar,
  "station" int
);

CREATE TABLE "Admission" (
  "id" int PRIMARY KEY,
  "start" timestamp,
  "end" timestamp,
  "room" int,
  "patient" int
);

ALTER TABLE "Patient" ADD FOREIGN KEY ("doctor") REFERENCES "Doctor" ("pers_nr");

ALTER TABLE "Room" ADD FOREIGN KEY ("station") REFERENCES "Station" ("stat_nr");

ALTER TABLE "StationPersonall" ADD FOREIGN KEY ("station") REFERENCES "Station" ("stat_nr");

ALTER TABLE "Admission" ADD FOREIGN KEY ("room") REFERENCES "Room" ("room_nr");

ALTER TABLE "Admission" ADD FOREIGN KEY ("patient") REFERENCES "Patient" ("id");
