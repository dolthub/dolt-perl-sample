CREATE TABLE Camels (
    CamelID CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Species ENUM('Dromedary', 'Bactrian', 'Wild Bactrian') NOT NULL,
    FavoriteFood VARCHAR(50),
    Trivia VARCHAR(255)
);

CREATE TABLE Foods (
    FoodID CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    FoodName VARCHAR(50) NOT NULL,
    FoodType ENUM('Vegetation', 'Fruits', 'Grains') NOT NULL,
    CamelPreference ENUM('Liked', 'Disliked', 'Neutral') NOT NULL
);

CALL dolt_commit('-Am', 'Initial camel schema');


INSERT INTO Foods (FoodID, FoodName, FoodType, CamelPreference) VALUES
(DEFAULT, 'Dates', 'Fruits', 'Liked'),
(DEFAULT, 'Carrots', 'Vegetation', 'Liked'),
(DEFAULT, 'Cactus', 'Vegetation', 'Neutral'),
(DEFAULT, 'Alfalfa', 'Grains', 'Liked'),
(DEFAULT, 'Barley', 'Grains', 'Liked'),
(DEFAULT, 'Apples', 'Fruits', 'Disliked'),
(DEFAULT, 'Spinach', 'Vegetation', 'Neutral');

INSERT INTO Camels (CamelID, Name, Age, Species, FavoriteFood, Trivia) VALUES
(DEFAULT, 'Casper', 12, 'Dromedary', 'Dates', 'Dromedary camels have one hump.'),
(DEFAULT, 'Bianca', 8, 'Bactrian', 'Carrots', 'Bactrian camels have two humps.'),
(DEFAULT, 'Sandy', 5, 'Wild Bactrian', 'Cactus', 'Wild Bactrian camels are critically endangered.'),
(DEFAULT, 'Blitzen', 60, 'Wild Bactrian', 'Alfalfa', 'Camels have long eyelashes to protect them from sand.'),
(DEFAULT, 'Rajah', 7, 'Dromedary', 'Spinach', 'Camels have a third eyelid to protect against sand.'),
(DEFAULT, 'Luna', 14, 'Bactrian', 'Apples', 'Camels have been domesticated for over 3,000 years.');

CALL dolt_commit('-am', 'First batch of camels');


DELETE FROM Camels where Name='Blitzen';
CALL dolt_commit('-am', 'Removing a reindeer that tried to sneak in with the camels');


INSERT INTO Camels (CamelID, Name, Age, Species, FavoriteFood, Trivia) VALUES
(DEFAULT, 'Humphrey', 15, 'Dromedary', 'Alfalfa', 'Camels can close their nostrils during sandstorms.'),
(DEFAULT, 'Mona', 10, 'Bactrian', 'Barley', 'Camels can drink up to 40 gallons of water in one go.');

CALL dolt_commit('-am', 'Two more camels');


INSERT INTO Foods (FoodID, FoodName, FoodType, CamelPreference) VALUES
(DEFAULT, 'Cabbage', 'Vegetation', 'Liked'),
(DEFAULT, 'Grass', 'Vegetation', 'Neutral');

INSERT INTO Camels (CamelID, Name, Age, Species, FavoriteFood, Trivia) VALUES
(DEFAULT, 'Dusty', 9, 'Wild Bactrian', 'Grass', 'Wild Bactrian camels can survive in extreme desert conditions.'),
(DEFAULT, 'Chewy', 4, 'Dromedary', 'Cabbage', 'Camels can walk up to 100 miles without water.');

CALL dolt_commit('-am', 'More camels!');

