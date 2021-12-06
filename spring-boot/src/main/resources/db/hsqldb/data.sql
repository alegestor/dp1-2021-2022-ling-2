-- One admin user, named admin with password admin and authority admin
INSERT INTO users(username,password, email) VALUES ('admin','admin', 'admin@mail.com');
INSERT INTO authorities(id,username,authority) VALUES (1,'admin','admin');
INSERT INTO authorities(id,username,authority) VALUES (2,'admin','user');

INSERT INTO users(username,password,email) VALUES ('pablo','pablo', 'pablo@mail.com');
INSERT INTO authorities(id,username,authority) VALUES(4, 'pablo','admin');
INSERT INTO authorities(id,username,authority) VALUES(5, 'pablo','user');

INSERT INTO users(username,password,email) VALUES ('andres','andres','andres@mail.com');
INSERT INTO authorities(id,username,authority) VALUES (3,'andres','user');

INSERT INTO users(username,password,email) VALUES ('stockie','stockie', 'stockie@mail.com');
INSERT INTO authorities(id,username,authority) VALUES(6, 'stockie','user');

INSERT INTO users(username,password,email) VALUES ('alejandro','alejandro', 'alejandro@mail.com');
INSERT INTO authorities(id,username,authority) VALUES(7, 'alejandro','user');

INSERT INTO users(username,password,email) VALUES ('merlin','merlin', 'merlin@mail.com');
INSERT INTO authorities(id,username,authority) VALUES(8, 'merlin','user');

INSERT INTO users(username,password,email) VALUES ('legolas','legolas', 'legolas@mail.com');
INSERT INTO authorities(id,username,authority) VALUES(9, 'legolas','user');

INSERT INTO users(username,password,email) VALUES ('gandalf','gandalf', 'gandalf@mail.com');
INSERT INTO authorities(id,username,authority) VALUES(10, 'gandalf','user');

INSERT INTO users(username,password,email) VALUES ('frodo','frodo', 'frodo@mail.com');
INSERT INTO authorities(id,username,authority) VALUES(11, 'frodo','user');

INSERT INTO users(username,password,email) VALUES ('dalinar','dalinar', 'dalinar@mail.com');
INSERT INTO authorities(id,username,authority) VALUES(12, 'dalinar','user');

INSERT INTO users(username,password,email) VALUES ('aragorn','aragorn', 'aragorn@mail.com');
INSERT INTO authorities(id,username,authority) VALUES(13, 'aragorn','user');

INSERT INTO users(username,password,email) VALUES ('ezio','ezio', 'ezio@mail.com');
INSERT INTO authorities(id,username,authority) VALUES(14, 'ezio','user');

-- TODO users for JUnit tests should not be created in the database, but in the Junit tests and then deleted
-- Usuario para el JUnit de la H10
INSERT INTO users(username,password,email) VALUES ('alex','alex','alex@mail.com');
INSERT INTO authorities(id,username,authority) VALUES (80,'alex','user');


-- INSERT INTO lobbies(name, game, has_scenes, spectators_allowed, max_players, host)  VALUES('test lobby 2', 1, true, true, 4, 'gandalf');
-- INSERT INTO games(id, name, startTime, has scenes, players, leader) VALUES
-- INSERT INTO lobbies(name, has_started, has_scenes, spectators_allowed, max_players) VALUES ('test lobby 2', false, true, false, 3);
-- INSERT INTO lobbies(name, has_started, has_scenes, spectators_allowed, max_players) VALUES ('test lobby 3', false, true, true, 4);

INSERT INTO achievements(name, description, type) VALUES ('A new hand touches the beacon', 'Listen. Hear me and obey. A foul darkness has seeped into my temple. A darkness that you will destroy. Return my beacon to Mount Kilkreath. And I will make you the instrument of my cleansing light', 'CREATE_ACCOUNT');
INSERT INTO achievements(name, description, type) VALUES ('Newcomer', 'Play your first game', 'PLAY_1_GAME');
INSERT INTO achievements(name, description, type) VALUES ('Avid player', 'Win 5 games of No Time for Heroes', 'WIN_5_GAMES');

INSERT INTO characters(id, character_type_enum, character_gender_enum) VALUES (1, 'RANGER','MALE');
INSERT INTO characters(id, character_type_enum, character_gender_enum) VALUES (2, 'RANGER','FEMALE');
INSERT INTO characters(id, character_type_enum, character_gender_enum) VALUES (3, 'ROGUE','MALE');
INSERT INTO characters(id, character_type_enum, character_gender_enum) VALUES (4, 'ROGUE','FEMALE');
INSERT INTO characters(id, character_type_enum, character_gender_enum) VALUES (5, 'WARRIOR','MALE');
INSERT INTO characters(id, character_type_enum, character_gender_enum) VALUES (6, 'WARRIOR','FEMALE');
INSERT INTO characters(id, character_type_enum, character_gender_enum) VALUES (7, 'WIZARD','MALE');
INSERT INTO characters(id, character_type_enum, character_gender_enum) VALUES (8, 'WIZARD','FEMALE');

INSERT INTO horde_enemy_types(horde_enemy_type_enum, horde_enemy_modifier_type_enum, endurance) VALUES ('WARRIOR', null, 4);
INSERT INTO horde_enemy_types(horde_enemy_type_enum, horde_enemy_modifier_type_enum, endurance) VALUES ('SLINGER', null, 2);
INSERT INTO horde_enemy_types(horde_enemy_type_enum, horde_enemy_modifier_type_enum, endurance) VALUES ('BERSERKER', null, 6);
INSERT INTO horde_enemy_types(horde_enemy_type_enum, horde_enemy_modifier_type_enum, endurance) VALUES ('REGEN','HEALING_CAPABILITIES', 3);
INSERT INTO horde_enemy_types(horde_enemy_type_enum, horde_enemy_modifier_type_enum, endurance) VALUES ('MAGE','MAGIC_ATTACKER', 5);
INSERT INTO horde_enemy_types(horde_enemy_type_enum, horde_enemy_modifier_type_enum, endurance) VALUES ('SHAMAN','MAGIC_ATTACKER', 3);

INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (1, 'WARRIOR', 0, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (2, 'WARRIOR', 0, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (3, 'WARRIOR', 1, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (4, 'WARRIOR', 1, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (5, 'WARRIOR', 1, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (6, 'WARRIOR', 2, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (7, 'WARRIOR', 2, 1);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (8, 'WARRIOR', 2, 1);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (9, 'SLINGER', 0, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (10, 'SLINGER', 0, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (11, 'SLINGER', 0, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (12, 'SLINGER', 1, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (13, 'SLINGER', 1, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (14, 'BERSERKER', 0, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (15, 'BERSERKER', 1, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (16, 'BERSERKER', 1, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (17, 'REGEN', 0, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (18, 'REGEN', 0, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (19, 'REGEN', 0, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (20, 'REGEN', 1, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (21, 'REGEN', 1, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (22, 'MAGE', 0, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (23, 'MAGE', 2, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (24, 'MAGE', 2, 0);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (25, 'MAGE', 2, 1);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (26, 'SHAMAN', 1, 1);
INSERT INTO horde_enemies(id, horde_enemy_type_enum, gold, extra_glory) VALUES (27, 'SHAMAN', 2, 0);

-- Ejemplo de entidad hordeEnemyIngame:
-- INSERT INTO horde_enemies_ingame(id, game_id, horde_enemy_id, current_endurance, horde_enemy_location) VALUES (1, 1, 1, defaultEndurance, 'HORDE_PILE')

INSERT INTO warlords(id, warlord_type_enum, endurance) VALUES (1, 'GURDRUG', 8);
INSERT INTO warlords(id, warlord_type_enum, endurance) VALUES (2, 'ROGHKILLER', 9);
INSERT INTO warlords(id, warlord_type_enum, endurance) VALUES (3, 'SHRIEKKNIFER', 10);

-- Ejemplo de entidad warlord ingame:
-- INSERT INTO warlords_ingame(id, game_id, warlord_id, current_endurance, warlord_location) VALUES (1, 1, 1, 8, 'HORDE_PILE');

INSERT INTO scenes(id, scene_type_enum) VALUES (1, 'MERCADO_DE_LOTHARION'); 
INSERT INTO scenes(id, scene_type_enum) VALUES (2, 'CAMPO_DE_BATALLA');
INSERT INTO scenes(id, scene_type_enum) VALUES (3, 'LAGRIMAS_DE_ARADIEL');
INSERT INTO scenes(id, scene_type_enum) VALUES (4, 'LODAZAL_DE_KALERN');
INSERT INTO scenes(id, scene_type_enum) VALUES (5, 'MONTANAS_DE_UR');
INSERT INTO scenes(id, scene_type_enum) VALUES (6, 'PANTANO_UMBRIO');
INSERT INTO scenes(id, scene_type_enum) VALUES (7, 'PLANICIE_DE_SKAARG');
INSERT INTO scenes(id, scene_type_enum) VALUES (8, 'PORTAL_DE_ULTHAR');
INSERT INTO scenes(id, scene_type_enum) VALUES (9, 'PUERTO_DE_EQUE');
INSERT INTO scenes(id, scene_type_enum) VALUES (10, 'RUINAS_DE_BRUNMAR');
INSERT INTO scenes(id, scene_type_enum) VALUES (11, 'YACIMIENTOS_DE_JADE');
INSERT INTO scenes(id, scene_type_enum) VALUES (12, 'YERMO_DE_CEMENMAR');

--INSERT INTO playable_cards_ingame(id, game_id, ability_card_id, location) VALUES (1, 1, 1, 'HORDE_PILE');

-- MARKET no es una propiedad de las cartas. Es una propiedad de la instancia de la carta, cuando se encuentre ya dentro de un juego.
INSERT INTO market_cards(id, price, market_card_type_enum) VALUES (1, 3, 'DAGA_ELFICA');
INSERT INTO market_cards(id, price, market_card_type_enum) VALUES (2, 3, 'DAGA_ELFICA');
INSERT INTO market_cards(id, price, market_card_type_enum) VALUES (3, 8, 'POCION_CURATIVA');
INSERT INTO market_cards(id, price, market_card_type_enum) VALUES (4, 8, 'POCION_CURATIVA');
INSERT INTO market_cards(id, price, market_card_type_enum) VALUES (5, 8, 'POCION_CURATIVA');
INSERT INTO market_cards(id, price, market_card_type_enum) VALUES (6, 4, 'PIEDRA_DE_AMOLAR');
INSERT INTO market_cards(id, price, market_card_type_enum) VALUES (7, 5, 'VIAL_DE_CONJURACION');
INSERT INTO market_cards(id, price, market_card_type_enum) VALUES (8, 5, 'VIAL_DE_CONJURACION');
INSERT INTO market_cards(id, price, market_card_type_enum) VALUES (9, 3, 'ELIXIR_DE_CONCENTRACION');
INSERT INTO market_cards(id, price, market_card_type_enum) VALUES (10, 3, 'ELIXIR_DE_CONCENTRACION');
INSERT INTO market_cards(id, price, market_card_type_enum) VALUES (11, 3, 'CAPA_ELFICA');
INSERT INTO market_cards(id, price, market_card_type_enum) VALUES (12, 4, 'ARMADURA_DE_PLACAS');
INSERT INTO market_cards(id, price, market_card_type_enum) VALUES (13, 5, 'ALABARDA_ORCA');
INSERT INTO market_cards(id, price, market_card_type_enum) VALUES (14, 5, 'ARCO_COMPUESTO');

-- It looks like the @manytomany association table forces us to use (INTEGER, INTEGER) so we would have to consider
-- both male and female characters for each market card. Quite tedious but it is what it is.
-- The inserts bellow represent the classes that can use each card, and they are repeated twiced because the same class with different sex represents two classes

-- INSERT INTO market_cards(id, location, price, name, usable_by) VALUES (1, 'MARKET', 3, 'DAGA_ELFICA', 'Ranger, Rogue, Warrior, Wizard');
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (1, 1);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (1, 2);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (1, 3);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (1, 4);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (1, 5);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (1, 6);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (1, 7);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (1, 8);

-- INSERT INTO market_cards(id, location, price, name, usable_by) VALUES (2, 'MARKET', 3, 'DAGA_ELFICA', 'Ranger, Rogue, Warrior, Wizard');
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (2, 1);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (2, 2);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (2, 3);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (2, 4);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (2, 5);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (2, 6);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (2, 7);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (2, 8);

-- INSERT INTO market_cards(id, location, price, name, usable_by) VALUES (3, 'MARKET', 8, 'POCION_CURATIVA', 'Ranger, Rogue, Warrior');
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (3, 1);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (3, 2);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (3, 3);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (3, 4);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (3, 5);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (3, 6);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (3, 7);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (3, 8);

-- INSERT INTO market_cards(id, location, price, name, usable_by) VALUES (4, 'MARKET', 8, 'POCION_CURATIVA', 'Ranger, Rogue, Warrior, Wizard');
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (4, 1);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (4, 2);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (4, 3);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (4, 4);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (4, 5);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (4, 6);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (4, 7);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (4, 8);

-- INSERT INTO market_cards(id, location, price, name, usable_by) VALUES (5, 'MARKET', 8, 'POCION_CURATIVA', 'Ranger, Rogue, Warrior, Wizard');
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (5, 1);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (5, 2);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (5, 3);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (5, 4);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (5, 5);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (5, 6);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (5, 7);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (5, 8);

-- INSERT INTO market_cards(id, location, price, name, usable_by) VALUES (6, 'MARKET', 4, 'PIEDRA_DE_AMOLAR', 'Ranger, Rogue, Warrior, Wizard');
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (6, 1);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (6, 2);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (6, 3);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (6, 4);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (6, 5);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (6, 6);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (6, 7);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (6, 8);

-- INSERT INTO market_cards(id, location, price, name, usable_by) VALUES (7, 'MARKET', 5, 'VIAL_DE_CONJURACION', 'Ranger, Rogue, Warrior, Wizard');
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (7, 1);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (7, 2);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (7, 3);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (7, 4);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (7, 5);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (7, 6);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (7, 7);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (7, 8);

-- INSERT INTO market_cards(id, location, price, name, usable_by) VALUES (8, 'MARKET', 5, 'VIAL_DE_CONJURACION', 'Ranger, Rogue, Warrior, Wizard');
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (8, 1);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (8, 2);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (8, 3);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (8, 4);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (8, 5);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (8, 6);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (8, 7);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (8, 8);

-- INSERT INTO market_cards(id, location, price, name, usable_by) VALUES (9, 'MARKET', 3, 'ELIXIR_DE_CONCENTRACION', 'Ranger, Rogue, Warrior, Wizard');
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (9, 1);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (9, 2);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (9, 3);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (9, 4);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (9, 5);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (9, 6);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (9, 7);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (9, 8);

-- INSERT INTO market_cards(id, location, price, name, usable_by) VALUES (10, 'MARKET', 3, 'ELIXIR_DE_CONCENTRACION', 'Ranger, Rogue, Warrior, Wizard');
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (10, 1);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (10, 2);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (10, 3);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (10, 4);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (10, 5);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (10, 6);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (10, 7);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (10, 8);

-- INSERT INTO market_cards(id, location, price, name, usable_by) VALUES (11, 'MARKET', 3, 'CAPA_ELFICA', 'Ranger, Wizard');
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (11, 1);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (11, 2);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (11, 7);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (11, 8);

-- INSERT INTO market_cards(id, location, price, name, usable_by) VALUES (12, 'MARKET', 4, 'ARMADURA_DE_PLACAS', 'Warrior');
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (12, 5);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (12, 6);
-- INSERT INTO market_cards(id, location, price, name, usable_by) VALUES (13, 'MARKET', 5, 'ALABARDA_ORCA', 'Warrior');
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (13, 5);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (13, 6);
-- INSERT INTO market_cards(id, location, price, name, usable_by) VALUES (14, 'MARKET', 5, 'ARCO_COMPUESTO', 'Ranger');
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (14, 1);
INSERT INTO marketcards_characters(market_card_id, character_id) VALUES (14, 2);

-- Ejemplo de entidad warlord ingame:
-- INSERT INTO market_cards_ingame(id, game_id, market_card_id, market_card_location) VALUES (1, 1, 'ROGUE_HAND')
-- Eso será una tabla diferente que trackee el uso de la carta dentro de la partida (si la tiene alguien, su posición...

-- CREATE A GAME FROM A LOBBY WITH 2 PLAYERS
-- Create the initial lobby
INSERT INTO lobbies(id, name, game, has_scenes, spectators_allowed, max_players, host, leader) VALUES (1, 'andres with pablo', null, true, true, 2, 'andres', 'andres');
-- add the users to the lobby
UPDATE users SET lobby = 1 WHERE username = 'pablo';
UPDATE users SET lobby = 1 WHERE username = 'andres';
-- create the players instances and then a game
INSERT INTO players(id, glory, gold, kills, wounds, character_id, user_id) VALUES (1, 0, 0, 0, 0, 8, 'pablo');
INSERT INTO players(id, glory, gold, kills, wounds, character_id, user_id) VALUES (2, 0, 0, 0, 0, 1, 'andres');
INSERT INTO games(id, has_scenes, start_time, leader_id) VALUES (1, true, 1637867168863, 1);
-- Once the game is created, the lobby references the game
UPDATE lobbies SET game = 1 WHERE id = 1;
-- Add the players to the game
INSERT INTO games_players(game_id, players_id) VALUES (1, 1);
INSERT INTO games_players(game_id, players_id) VALUES (1, 2);
-- Also, set the game attribute in each user to reference the game they are in now
UPDATE users SET game = 1 WHERE username = 'pablo';
UPDATE users SET game = 1 WHERE username = 'andres';

-- CREATE A GAME FROM A LOBBY WITH 4 PLAYERS
-- Create the initial lobby
INSERT INTO lobbies (id, name, game, has_scenes, spectators_allowed, max_players, host) VALUES (2,'Lord of the rings', null, false, true, 4, 'gandalf');
-- add the users to the lobby
UPDATE users SET lobby = 2 WHERE username = 'gandalf';
UPDATE users SET lobby = 2 WHERE username = 'frodo';
UPDATE users SET lobby = 2 WHERE username = 'legolas';
UPDATE users SET lobby = 2 WHERE username = 'aragorn';
-- create the players instances and then a game
INSERT INTO players(id, glory, gold, kills, wounds, character_id, user_id) VALUES (3, 0, 0, 0, 0, 1, 'frodo');
INSERT INTO players(id, glory, gold, kills, wounds, character_id, user_id) VALUES (4, 0 ,0, 0, 0 ,3, 'gandalf');
INSERT INTO players(id, glory, gold, kills, wounds, character_id, user_id) VALUES (5, 0, 0, 0, 0, 5, 'legolas');
INSERT INTO players(id, glory, gold, kills, wounds, character_id, user_id) VALUES (6, 0 ,0, 0, 0 ,7, 'aragorn');
INSERT INTO games(id, has_scenes, start_time, leader_id) VALUES (2, true, 1637881111234, 3);
-- Once the game is created, the lobby references the game
UPDATE lobbies SET game = 2 WHERE id = 2;
-- Add the players to the game
INSERT INTO games_players(game_id, players_id) VALUES (2, 3);
INSERT INTO games_players(game_id, players_id) VALUES (2, 4);
INSERT INTO games_players(game_id, players_id) VALUES (2, 5);
INSERT INTO games_players(game_id, players_id) VALUES (2, 6);
-- Also, set the game attribute in each user to reference the game they are in now
UPDATE users SET game = 2 WHERE username = 'gandalf';
UPDATE users SET game = 2 WHERE username = 'frodo';
UPDATE users SET game = 2 WHERE username = 'legolas';
UPDATE users SET game = 2 WHERE username = 'aragorn';


-- CREATE A GAME HISTORY FROM A LOBBY WITH 3 PLAYERS
-- CREATE A GAME FROM A LOBBY WITH 4 PLAYERS
-- Create the initial lobby
INSERT INTO lobbies (id, name, game, has_scenes, spectators_allowed, max_players, host) VALUES (3,'LING 2', null, true, false, 3, 'stockie');
-- add the users to the lobby
UPDATE users SET lobby = 3 WHERE username = 'stockie';
UPDATE users SET lobby = 3 WHERE username = 'alejandro';
-- create the players instances and then a game
INSERT INTO players(id, glory, gold, kills, wounds, character_id, user_id) VALUES (7, 0, 0, 0, 0, 2, 'stockie');
INSERT INTO players(id, glory, gold, kills, wounds, character_id, user_id) VALUES (8, 0 ,0, 0, 0 ,4, 'alejandro');
INSERT INTO games(id, has_scenes, start_time, leader_id) VALUES (3, true, 1637881111234, 3);
-- Once the game is created, the lobby references the game
UPDATE lobbies SET game = 3 WHERE id = 3;
-- Add the players to the game
INSERT INTO games_players(game_id, players_id) VALUES (3, 7);
INSERT INTO games_players(game_id, players_id) VALUES (3, 8);
-- Also, set the game attribute in each user to reference the game they are in now
UPDATE users SET game = 3 WHERE username = 'stockie';
UPDATE users SET game = 3 WHERE username = 'alejandro';

INSERT INTO games_history(id, game_id, winner_id, finish_time) VALUES (1, 3, 7, 1637882596427);
-- Set that the users are not in a game anymore
UPDATE users set game = null WHERE username = 'stockie';
UPDATE users set game = null WHERE username = 'alejandro';
