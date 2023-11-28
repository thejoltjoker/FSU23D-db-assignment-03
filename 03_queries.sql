-- class
CREATE TABLE IF NOT EXISTS class(
  class_id  INT AUTO_INCREMENT,
  name      VARCHAR(20) UNIQUE,
  PRIMARY KEY (class_id)
);

-- Create server
INSERT INTO server(
  name,
  ip_address
) 
VALUES(
  'europe-sweden-01',
  '123.456.789.1'
);

-- List all servers
SELECT * 
FROM server;

-- Create dungeon
INSERT INTO dungeon(
    name, 
    server_id
)
VALUES(
  'Castle Entrance',
  ( -- Find a server in Europe
    SELECT  server_id 
    FROM    server
    WHERE   server.name REGEXP 'europe'
  )
);

-- Create races
INSERT INTO race (
    name
) 
VALUES
  ('Human'),
  ('Elf'),
  ('Dwarf'),
  ('Spirit'),
  ('Dragon'),
  ('Ghost'),
  ('Giant'),
  ('Serpent');

-- Show all races
SELECT * FROM race;

-- Create Stats
INSERT INTO stats(
  level,
  attack,
  defense,
  accuracy,
  speed, 
  rage
)
VALUES
  (
    30,
    10000,
    40000,
    20500,
    50000,
    64000
  ),
  (
    100,
    25000,
    50000,
    3000,
    6700,
    1000
  ),
  (
    23,
    10000,
    8990,
    35500,
    5000,
    6000
  ),
  (
    80,
    20000,
    50000,
    10500,
    40000,
    44000
  ),
  (
    10,
    10000,
    5600,
    10500,
    30000,
    24000
  ),
  (
    54,
    10500,
    12700,
    2550,
    40000,
    10000
  );

-- Create monsters
INSERT INTO monster
    (name,
    race_id,
    stats_id,
    health_points)
VALUES
    ('Shadow Wraith',
    4,
    1,
    10000),
    
    ('Ember Drake',
    5,
    2,
    20000),

    ('Spectral Banshee',
    6,
    3,
    100),

   ('Frost Giant Yeti',
    7,
    4,
    5000),
    
    ('Chimera Serpent',
    8,
    5,
    666),
    
    ('Ronald McDonald',
    1,
    6,
    8000);

-- Create Items
INSERT INTO item (
    name,
    description
  )
VALUES(
  'Dirty Stone',
  'Stone that seems to have been lying in the dirt for quite some time'
),
(
  'Wooden Stick',
  'Primitive weapon most used for teasing monsters'
),
(
  'Burnt Apple',
  'Misjudged cooking of an apple has resulted in this poor non eatable fruit'
);


-- Update monster health points
UPDATE monster
SET health_points = 10001
WHERE name = 'Shadow Wraith'; 

-- Delete over powered monsters
-- TODO Fråga om safe updates av eller på?
-- DELETE FROM monster
-- WHERE stats_id IN (
--   SELECT stats_id 
--   FROM stats
--   WHERE stats.level > 50
--   AND attack >= 10000
-- );

DELETE FROM monster
WHERE race_id = (
  SELECT race_id
  FROM race
  WHERE name = 'Human'
);



--            _.------.                        .----.__
--           /         \_.       ._           /---.__  \
--          |  O    O   |\\___  //|          /       `\ |
--          |  O    O   |\\___  //|          /       `\ |
--          |  O    O   |\\___  //|          /       `\ |
--          |  .vvvvv.  | )   `(/ |         | o     o  \|
--          /  |     |  |/      \ |  /|   ./| .vvvvv.  |\
--         /   `^^^^^'  / _   _  `|_ ||  / /| |     |  | \
--       ./  /|         | O)  O   ) \|| //' | `^vvvv'  |/\\
--      /   / |         \        /  | | ~   \          |  \\
--      \  /  |        / \ Y   /'   | \     |          |   ~
--       `'   |  _     |  `._/' |   |  \     7        /
--         _.-'-' `-'-'|  |`-._/   /    \ _ /    .    |
--    __.-'            \  \   .   / \_.  \ -|_/\/ `--.|_
-- --'                  \  \ |   /    |  |              `-
--                       \uU \UU/     |  /   
--
---------------------------------------------------------------------------



-- Create user
INSERT INTO user ( 
  username, 
  first_name, 
  last_name,
  email
) 
VALUES(
  'hercules420',
  'John',
  'Doe',
  'johnny.digdug@hotmail.com'
);

-- Create Player with LAST_INSERT_ID() to get user id
INSERT INTO player (
    user_id,
    name,
    level,
    experience,
    health_points,
    magic_points     
)
VALUES (
    LAST_INSERT_ID(),
    'John Axmaster Doe',
    56,
    13,
    36,
    33
),
(
    LAST_INSERT_ID(),
    'Evil Donkey',
    84,
    25,
    48,
    55
),
(
    LAST_INSERT_ID(),
    'Duke Nukem',
    94,
    45,
    52,
    78
);
