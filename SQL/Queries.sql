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

# -- Inner Join 
SELECT cc.diagnosis, 
	AVG(mean_attributes.radius_mean) AS avg_radius, 
	AVG(mean_attributes.texture_mean) AS avg_texture
FROM cancer_cases cc
INNER JOIN mean_attributes ON cc.case_id = mean_attributes.case_id
GROUP BY cc.diagnosis;

# -- Left Join
SELECT cancer_cases.case_id, cancer_cases.diagnosis, worst_attributes.texture_worst, worst_attributes.perimeter_worst
FROM cancer_cases
LEFT JOIN worst_attributes ON cancer_cases.case_id = worst_attributes.case_id;

# -- Inner Join
SELECT cancer_cases.case_id, cancer_cases.diagnosis, mean_attributes.radius_mean, worst_attributes.texture_worst
FROM cancer_cases
INNER JOIN mean_attributes ON cancer_cases.case_id = mean_attributes.case_id
INNER JOIN worst_attributes ON cancer_cases.case_id = worst_attributes.case_id;

# -- Inner Join w. Multiple Conditions
SELECT cancer_cases.case_id, cancer_cases.diagnosis, mean_attributes.radius_mean, worst_attributes.texture_worst
FROM cancer_cases
INNER JOIN mean_attributes ON cancer_cases.case_id = mean_attributes.case_id
INNER JOIN worst_attributes ON cancer_cases.case_id = worst_attributes.case_id
WHERE mean_attributes.radius_mean > 15 AND worst_attributes.texture_worst < 25;

# -- Self Inner Join
SELECT a.case_id AS case_id_1, b.case_id AS case_id_2, a.radius_mean, b.radius_mean
FROM mean_attributes a
INNER JOIN mean_attributes b ON a.radius_mean > b.radius_mean;