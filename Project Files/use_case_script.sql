-- ============================================================
-- 1. Basic SELECT: List all parks in California
-- ============================================================
SELECT name, established_year, area_acres 
FROM Park;

-- ============================================================
-- 2. Filter + ORDER BY: Trails longer than 3 miles
-- ============================================================
SELECT name, length_miles 
FROM Trail
WHERE length_miles > 3
ORDER BY length_miles DESC;

-- ============================================================
-- 3. INNER JOIN: List all trails with the park they belong to
-- ============================================================
SELECT t.name AS trail, p.name AS park
FROM Trail t
JOIN Park p ON t.park_id = p.park_id;

-- ============================================================
-- 4. Aggregation: Number of trails per park
-- ============================================================
SELECT p.name AS park, COUNT(t.trail_id) AS trail_count
FROM Park p
LEFT JOIN Trail t ON p.park_id = t.park_id
GROUP BY p.name;

-- ============================================================
-- 5. Many-to-Many join: Wildlife found on each trail
-- ============================================================
SELECT tr.name AS trail, w.common_name AS wildlife
FROM trail_wildlife tw
JOIN Trail tr ON tw.trail_id = tr.trail_id
JOIN Wildlife w ON tw.species_id = w.species_id
ORDER BY tr.name;

-- ============================================================
-- 6. Subquery: Parks with more than 1 campground
-- ============================================================
SELECT name
FROM Park
WHERE park_id IN (
    SELECT park_id
    FROM Campground
    GROUP BY park_id
    HAVING COUNT(*) > 1
);

-- ============================================================
-- 7. LIKE: Find trails with 'Valley' in the name
-- ============================================================
SELECT name
FROM Trail
WHERE name LIKE '%Valley%';

-- ============================================================
-- 8. INSERT: Add a new ranger
-- ============================================================
INSERT INTO Ranger (ranger_id, name, rank, department)
VALUES (406, 'Jordan White', 'Ranger', 'Interpretation');

-- ============================================================
-- 9. INSERT: Add a new wildlife species
-- ============================================================
INSERT INTO Wildlife (species_id, common_name, scientific_name, conservation_status)
VALUES (507, 'Mountain Lion', 'Puma concolor', 'Least Concern');

-- ============================================================
-- 10. UPDATE: Change the conservation status of a species
-- ============================================================
UPDATE Wildlife
SET conservation_status = 'Endangered'
WHERE common_name = 'California Condor';

-- ============================================================
-- 11. UPDATE: Increase capacity of a campsite
-- ============================================================
UPDATE Campsite
SET capacity = capacity + 2
WHERE campsite_id = 301;

-- ============================================================
-- 12. DELETE: Remove a single campsite
-- ============================================================
DELETE FROM Campsite
WHERE campsite_id = 306;

-- ============================================================
-- 13. DELETE: Remove a ranger assignment (M:N)
-- ============================================================
DELETE FROM ranger_assignment
WHERE ranger_id = 401 AND park_id = 2;

-- ============================================================
-- 14. Aggregation + HAVING: Parks with > 500,000 acres
-- ============================================================
SELECT name, area_acres
FROM Park
WHERE area_acres > 500000;

-- ============================================================
-- 15. JOIN with WHERE filter: Wildlife found in Yosemite trails
-- ============================================================
SELECT DISTINCT w.common_name
FROM Wildlife w
JOIN trail_wildlife tw ON w.species_id = tw.species_id
JOIN Trail t ON tw.trail_id = t.trail_id
WHERE t.park_id = 1;

-- ============================================================
-- 16. COUNT + GROUP BY: Campsite count per campground
SELECT cg.name AS campground,
       COUNT(cs.campsite_id) AS campsite_count
FROM Campground cg
LEFT JOIN Campsite cs
    ON cg.campground_id = cs.campground_id
GROUP BY cg.name;

-- ============================================================
-- 17. MAX(): Longest trail in the database
-- ============================================================
SELECT name, length_miles
FROM Trail
WHERE length_miles = (SELECT MAX(length_miles) FROM Trail);

-- ============================================================
-- 18. INSERT: Add a new campground to Yosemite
-- ============================================================
INSERT INTO Campground (campground_id, park_id, name, season_open, season_close)
VALUES (207, 1, 'North Pines', 'April', 'October');

-- ============================================================
-- 19. JOIN: Rangers and the parks they work in (M:N)
-- ============================================================
SELECT r.name AS ranger, p.name AS park
FROM ranger_assignment ra
JOIN Ranger r ON ra.ranger_id = r.ranger_id
JOIN Park p ON ra.park_id = p.park_id
ORDER BY r.name;

-- ============================================================
-- 20. DELETE: Remove a wildlife species (must not be referenced in M:N table)
-- ============================================================
DELETE FROM Wildlife
WHERE species_id = 507;  -- Mountain Lion (if not linked to trail_wildlife)
