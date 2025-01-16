USE breast_cancer;

CREATE TABLE cancer_cases (
    case_id INT AUTO_INCREMENT PRIMARY KEY,
    diagnosis INT
);

CREATE TABLE mean_attributes (
    case_id INT,
    radius_mean FLOAT,
    texture_mean FLOAT,
    perimeter_mean FLOAT,
    area_mean FLOAT,
    smoothness_mean FLOAT,
    compactness_mean FLOAT,
    concavity_mean FLOAT,
    concave_points_mean FLOAT,
    symmetry_mean FLOAT,
    fractal_dimension_mean FLOAT,
    FOREIGN KEY (case_id) REFERENCES cancer_cases(case_id)
);

CREATE TABLE worst_attributes (
    case_id INT,
    texture_worst FLOAT,
    perimeter_worst FLOAT,
    area_worst FLOAT,
    smoothness_worst FLOAT,
    compactness_worst FLOAT,
    concavity_worst FLOAT,
    concave_points_worst FLOAT,
    symmetry_worst FLOAT,
    fractal_dimension_worst FLOAT,
    FOREIGN KEY (case_id) REFERENCES cancer_cases(case_id)
);