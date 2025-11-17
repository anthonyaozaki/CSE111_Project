PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS trail_wildlife;
DROP TABLE IF EXISTS ranger_assignment;
DROP TABLE IF EXISTS Campsite;
DROP TABLE IF EXISTS Campground;
DROP TABLE IF EXISTS Wildlife;
DROP TABLE IF EXISTS Ranger;
DROP TABLE IF EXISTS Trail;
DROP TABLE IF EXISTS Park;

PRAGMA foreign_keys = ON;


CREATE TABLE Park (
    park_id         INT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    location        VARCHAR(100),
    established_year INT,
    area_acres      INT
);


CREATE TABLE Trail (
    trail_id        INT PRIMARY KEY,
    park_id         INT NOT NULL,
    name            VARCHAR(100) NOT NULL,
    length_miles    DECIMAL(5,2),
    difficulty      VARCHAR(20),
    elevation_gain  INT,

    FOREIGN KEY (park_id) REFERENCES Park(park_id)
);


CREATE TABLE Campground (
    campground_id   INT PRIMARY KEY,
    park_id         INT NOT NULL,
    name            VARCHAR(100) NOT NULL,
    season_open     VARCHAR(20),
    season_close    VARCHAR(20),

    FOREIGN KEY (park_id) REFERENCES Park(park_id)
);


CREATE TABLE Campsite (
    campsite_id     INT PRIMARY KEY,
    campground_id   INT NOT NULL,
    site_number     VARCHAR(10) NOT NULL,
    capacity        INT,
    type            VARCHAR(20),

    FOREIGN KEY (campground_id) REFERENCES Campground(campground_id)
);


CREATE TABLE Ranger (
    ranger_id       INT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    rank            VARCHAR(50),
    department      VARCHAR(50)
);


CREATE TABLE Wildlife (
    species_id          INT PRIMARY KEY,
    common_name         VARCHAR(100) NOT NULL,
    scientific_name     VARCHAR(150),
    conservation_status VARCHAR(50)
);


-- MANY TO MANY TABLES

-- RANGER <-> PARK
CREATE TABLE ranger_assignment (
    ranger_id       INT NOT NULL,
    park_id         INT NOT NULL,
    assignment_date DATE,

    PRIMARY KEY (ranger_id, park_id),

    FOREIGN KEY (ranger_id) REFERENCES Ranger(ranger_id),
    FOREIGN KEY (park_id) REFERENCES Park(park_id)
);

--TRAIL <-> WILDLIFE
CREATE TABLE trail_wildlife (
    trail_id        INT NOT NULL,
    species_id      INT NOT NULL,
    sighting_frequency INT,

    PRIMARY KEY (trail_id, species_id),

    FOREIGN KEY (trail_id) REFERENCES Trail(trail_id),
    FOREIGN KEY (species_id) REFERENCES Wildlife(species_id)
);


