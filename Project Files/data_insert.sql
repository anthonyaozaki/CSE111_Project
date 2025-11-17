
INSERT INTO Park (park_id, name, location, established_year, area_acres) VALUES
(1, 'Yosemite National Park', 'California', 1890, 761747),
(2, 'Sequoia National Park', 'California', 1890, 404064),
(3, 'Kings Canyon National Park', 'California', 1940, 461901),
(4, 'Joshua Tree National Park', 'California', 1994, 795156),
(5, 'Redwood National Park', 'California', 1968, 138999),
(6, 'Lassen Volcanic National Park', 'California', 1916, 106452);

INSERT INTO Trail (trail_id, park_id, name, length_miles, difficulty, elevation_gain) VALUES
-- Yosemite
(101, 1, 'Mist Trail', 3.0, 'Moderate', 1000),
(102, 1, 'Half Dome Trail', 14.2, 'Strenuous', 4800),
(103, 1, 'Lower Yosemite Falls Trail', 1.2, 'Easy', 100),

-- Sequoia
(201, 2, 'Congress Trail', 2.7, 'Easy', 200),
(202, 2, 'Tokopah Falls Trail', 3.8, 'Moderate', 600),

-- Joshua Tree
(301, 4, 'Hidden Valley Nature Trail', 1.0, 'Easy', 100),
(302, 4, 'Barker Dam Trail', 1.3, 'Easy', 50),

-- Redwood
(401, 5, 'Lady Bird Johnson Grove Trail', 1.5, 'Easy', 150),

-- Lassen
(501, 6, 'Bumpass Hell Trail', 2.7, 'Moderate', 300),
(502, 6, 'Manzanita Lake Loop', 1.6, 'Easy', 50);

INSERT INTO Campground (campground_id, park_id, name, season_open, season_close) VALUES
(201, 1, 'Upper Pines', 'April', 'October'),
(202, 1, 'Camp 4', 'Year-Round', 'Year-Round'),
(203, 2, 'Lodgepole Campground', 'May', 'September'),
(204, 4, 'Hidden Valley Campground', 'Year-Round', 'Year-Round'),
(205, 5, 'Jedediah Smith Campground', 'May', 'September'),
(206, 6, 'Manzanita Lake Campground', 'June', 'September');

INSERT INTO Campsite (campsite_id, campground_id, site_number, capacity, type) VALUES
(301, 201, 'A01', 6, 'Tent'),
(302, 201, 'A02', 6, 'RV'),
(303, 202, 'C12', 4, 'Tent'),
(304, 203, 'B07', 6, 'Tent'),
(305, 204, 'H05', 6, 'Tent'),
(306, 206, 'M20', 6, 'RV');


INSERT INTO Ranger (ranger_id, name, rank, department) VALUES
(401, 'Alex Ramirez', 'Senior Ranger', 'Wilderness'),
(402, 'Jamie Lee', 'Ranger', 'Education'),
(403, 'Taylor Brooks', 'Ranger', 'Resource Management'),
(404, 'Samantha Chen', 'Supervisory Ranger', 'Law Enforcement'),
(405, 'Miguel Alvarez', 'Ranger', 'Fire & Aviation');


INSERT INTO Wildlife (species_id, common_name, scientific_name, conservation_status) VALUES
(501, 'Mule Deer', 'Odocoileus hemionus', 'Least Concern'),
(502, 'American Black Bear', 'Ursus americanus', 'Least Concern'),
(503, 'Sierra Nevada Bighorn Sheep', 'Ovis canadensis sierrae', 'Endangered'),
(504, 'California Condor', 'Gymnogyps californianus', 'Critically Endangered'),
(505, 'Desert Tortoise', 'Gopherus agassizii', 'Threatened'),
(506, 'Northern Spotted Owl', 'Strix occidentalis caurina', 'Threatened');


INSERT INTO ranger_assignment (ranger_id, park_id, assignment_date) VALUES
(401, 1, '2023-03-15'),
(401, 2, '2024-04-10'),
(402, 1, '2024-05-22'),
(403, 4, '2023-09-07'),
(404, 5, '2022-06-01'),
(405, 6, '2021-11-14');


INSERT INTO trail_wildlife (trail_id, species_id, sighting_frequency) VALUES
-- Yosemite
(101, 501, 15),
(101, 502, 3),
(102, 502, 4),
(103, 501, 10),

-- Sequoia
(201, 501, 5),
(202, 503, 2),

-- Joshua Tree
(301, 505, 12),
(302, 505, 8),

-- Redwood
(401, 506, 6),

-- Lassen
(501, 501, 7),
(502, 501, 4);
