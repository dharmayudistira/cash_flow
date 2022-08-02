PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE android_metadata (locale TEXT);
INSERT INTO android_metadata VALUES('en_US');
CREATE TABLE table_users (
  _id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT NOT NULL,
  password TEXT NOT NULL,
  name TEXT NOT NULL
);
INSERT INTO table_users VALUES(1,'user','user','Dharma Yudistira Eka Putra');
CREATE TABLE table_transactions (
  _id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  amount INTEGER NOT NULL,
  is_income BOOLEAN NOT NULL,
  note TEXT NOT NULL,
  created_time TEXT NOT NULL
);
INSERT INTO table_transactions VALUES(1,1,50000,1,'Jual buku','2022-08-09T00:00:00.000');
INSERT INTO table_transactions VALUES(2,1,30000,0,'Beli buku','2022-08-09T00:00:00.000');
INSERT INTO table_transactions VALUES(3,1,40000,1,'Jual baju','2022-08-10T00:00:00.000');
INSERT INTO table_transactions VALUES(4,1,40000,0,'Beli baju','2022-08-10T00:00:00.000');
INSERT INTO table_transactions VALUES(5,1,30000,1,'Jual tas','2022-08-11T00:00:00.000');
INSERT INTO table_transactions VALUES(6,1,50000,0,'Beli tas','2022-08-11T00:00:00.000');
INSERT INTO table_transactions VALUES(7,1,50000,1,'Jual makanan','2022-08-12T00:00:00.000');
INSERT INTO table_transactions VALUES(8,1,30000,0,'Beli makanan','2022-08-12T00:00:00.000');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('table_users',1);
INSERT INTO sqlite_sequence VALUES('table_transactions',8);
COMMIT;