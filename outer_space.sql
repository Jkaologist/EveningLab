-- Creating DB for outer space --

CREATE TABLE star (
    star TEXT PRIMARY KEY,
    star_temp_in_Kelvin TEXT
);

CREATE TABLE planets (
    planet TEXT PRIMARY KEY,
    orbital_period_in_years FLOAT,
    -- reference to star table
    star_name TEXT NOT NULL REFERENCES star
);

CREATE TABLE moons (
    moon TEXT PRIMARY KEY,
    planet_name TEXT NOT NULL REFERENCES planets
);

-- Filling the tables

INSERT INTO star (star, star_temp_in_Kelvin)
    values
        ('The Sun', '5800°K'),
        ('Proxima Centauri', '3042°K'),
        ('Gliese 876', '3192°K');

INSERT INTO planets (planet, orbital_period_in_years, star_name)
    values
        ('Earth', 1.00, 'The Sun'),
        ('Mars', 1.882, 'The Sun'),
        ('Venus', 0.62, 'The Sun'),
        ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
        ('Gliese 876 b', 0.236, 'Gliese 876');

INSERT INTO moons (moon, planet_name)
    values
        ('The Moon', 'Earth'),
        ('Phobos', 'Mars'),
        ('Deimos', 'Mars');

-- Query for Data --
SELECT planet, star, COUNT(moons) as moon_count
    FROM planets
        JOIN star
        ON star_name = star
        LEFT OUTER JOIN moons
        ON planet_name = planet
    GROUP BY planet, star
;