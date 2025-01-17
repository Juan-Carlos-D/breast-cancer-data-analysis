USE breast_cancer;

# -- Basic SELECT
SELECT * FROM cancer_cases;
SELECT * FROM mean_attributes;
SELECT * FROM worst_attributes;


SELECT DISTINCT radius_mean
FROM mean_attributes
WHERE radius_mean > 15
ORDER BY radius_mean DESC;

# -- COUNT & MAX
SELECT COUNT(*), diagnosis 
FROM cancer_cases 
GROUP BY diagnosis;

SELECT MAX(case_id) AS last_case_id 
FROM cancer_cases;

# -- Insert Values
INSERT INTO cancer_cases (diagnosis)
VALUES (1), (0), (1);

INSERT INTO mean_attributes (
    case_id, radius_mean, texture_mean, perimeter_mean, area_mean, smoothness_mean, 
    compactness_mean, concavity_mean, concave_points_mean, symmetry_mean, fractal_dimension_mean
)
VALUES 
(570, 15.50, 22.20, 105.0, 800.0, 0.1100, 0.2200, 0.3000, 0.1200, 0.2500, 0.0800),
(571, 18.30, 25.10, 130.0, 1200.0, 0.1020, 0.1900, 0.2400, 0.0900, 0.2000, 0.0700),
(572, 14.00, 18.50, 90.0, 600.0, 0.1150, 0.2100, 0.2800, 0.1100, 0.2400, 0.0750);

SELECT * FROM mean_attributes WHERE case_id > 569;