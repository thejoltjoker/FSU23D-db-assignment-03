
-- Create database
CREATE DATABASE IF NOT EXISTS mmorpg;

USE mmorpg;

-- Create tables

-- server
CREATE TABLE server(
  server_id   INT AUTO_INCREMENT,
  name        VARCHAR(20) UNIQUE,
  ip_address  VARCHAR(20) UNIQUE,
  PRIMARY KEY (server_id)
);

-- user
CREATE TABLE user(
  user_id     INT AUTO_INCREMENT,
  username    VARCHAR(30) UNIQUE,
  first_name  VARCHAR(20) NOT NULL,
  last_name   VARCHAR(20) NOT NULL,
  email       VARCHAR(50) UNIQUE,
  PRIMARY KEY (user_id)
);

-- stats
CREATE TABLE stats(
  stats_id  INT AUTO_INCREMENT,
  level     TINYINT   UNSIGNED,
  attack    SMALLINT  UNSIGNED,
  defense   SMALLINT  UNSIGNED,
  accuracy  SMALLINT  UNSIGNED,
  speed     SMALLINT  UNSIGNED,
  rage      SMALLINT  UNSIGNED,
  PRIMARY KEY (stats_id)
);

-- class
CREATE TABLE class(
  class_id  INT AUTO_INCREMENT,
  name      VARCHAR(20) UNIQUE,
  PRIMARY KEY (class_id)
);

-- race
CREATE TABLE race(
  race_id INT AUTO_INCREMENT,
  name    VARCHAR(20) UNIQUE,
  PRIMARY KEY (race_id)
);

-- item
CREATE TABLE item(
  item_id     INT AUTO_INCREMENT,
  name        VARCHAR(30),
  description VARCHAR(200),
  PRIMARY KEY (item_id)
);

-- dungeon
CREATE TABLE dungeon(
  dungeon_id  INT AUTO_INCREMENT,
  name        VARCHAR(20),
  server_id   INT,
  FOREIGN KEY (server_id) REFERENCES server(server_id),
  PRIMARY KEY (dungeon_id)
);

-- monster
CREATE TABLE monster(
  monster_id    INT AUTO_INCREMENT,
  name          VARCHAR(30) UNIQUE,
  race_id       INT,
  stats_id      INT,
  health_points SMALLINT  UNSIGNED,
  FOREIGN KEY (race_id)   REFERENCES race(race_id),
  FOREIGN KEY (stats_id)  REFERENCES stats(stats_id),
  PRIMARY KEY (monster_id)
);

-- dungeon_item
CREATE TABLE dungeon_item(
  dungeon_item_id INT AUTO_INCREMENT,
  dungeon_id      INT,
  item_id         INT,
  FOREIGN KEY (dungeon_id)  REFERENCES dungeon(dungeon_id),
  FOREIGN KEY (item_id)     REFERENCES item(item_id),
  PRIMARY KEY (dungeon_item_id)
);


-- player
CREATE TABLE player(
  player_id     INT AUTO_INCREMENT,
  race_id       INT,
  class_id      INT,
  name          VARCHAR(30) NOT NULL,
  level         TINYINT     UNSIGNED,
  experience    SMALLINT    UNSIGNED,
  health_points SMALLINT    UNSIGNED, 
  magic_points  SMALLINT    UNSIGNED,
  stats_id      INT,
  user_id       INT,
  dungeon_id    INT,
  FOREIGN KEY (race_id)     REFERENCES race(race_id),
  FOREIGN KEY (class_id)    REFERENCES class(class_id),
  FOREIGN KEY (stats_id)    REFERENCES stats(stats_id),
  FOREIGN KEY (user_id)     REFERENCES user(user_id),
  FOREIGN KEY (dungeon_id)  REFERENCES dungeon(dungeon_id),
  PRIMARY KEY (player_id)
);

-- player_item
CREATE TABLE player_item(
  player_item_id  INT AUTO_INCREMENT,
  item_id         INT,
  player_id       INT,
  FOREIGN KEY (item_id)   REFERENCES item(item_id),
  FOREIGN KEY (player_id) REFERENCES player(player_id),
  PRIMARY KEY (player_item_id)
);

