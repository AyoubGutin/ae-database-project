/* Core Tables */

/* Patient Table
	Core table for storing patient information.
*/
CREATE TABLE patient (
	patient_id SERIAL PRIMARY KEY,
	date_of_birth DATE NOT NULL,
	sex sex_type NOT NULL,
	postcode_area postcode_area_type
);

/* Visit Table
	Core table capturing each A&E attendance.
	This table links the patient, triage category, arrival method,
	clinician, department, and outcome together with key timestamps.
*/
CREATE TABLE visit (
	visit_id SERIAL PRIMARY KEY,
	patient_id INTEGER NOT NULL,
	triage_id INTEGER NOT NULL,
	arrival_method_id INTEGER NOT NULL,
	clinician_id INTEGER NOT NULL,
	department_id INTEGER NOT NULL,
	outcome_id INTEGER NOT NULL,
	arrival_time TIMESTAMP NOT NULL,
	first_assessment_time TIMESTAMP,
	treatment_start TIMESTAMP,
	discharge_time TIMESTAMP,
	/* Foreign key constraints */
	CONSTRAINT fk_visit_patient
		FOREIGN KEY (patient_id)
		REFERENCES patient(patient_id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,

	CONSTRAINT fk_visit_triage
		FOREIGN KEY (triage_id)
		REFERENCES triage_category(triage_id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,

	CONSTRAINT fk_visit_arrival_method
		FOREIGN KEY (arrival_method_id)
		REFERENCES arrival_method(arrival_method_id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,

	CONSTRAINT fk_visit_department
		FOREIGN KEY (department_id)
		REFERENCES department(department_id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,

	CONSTRAINT fk_visit_outcome
		FOREIGN KEY (outcome_id)
		REFERENCES outcome(outcome_id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	/* Check constraints */
	CONSTRAINT chk_assessment_after_arrival
		CHECK (
			first_assessment_time IS NULL
			OR first_assessment_time >= arrival_time
		),

	CONSTRAINT chk_treatment_after_assessment
		CHECK (
			treatment_start IS NULL
			OR first_assessment_time IS NULL
			OR treatment_start >= first_assessment_time
		),

	CONSTRAINT chk_discharge_after_arrival
		CHECK (
			discharge_time IS NULL
			OR discharge_time >= arrival_time
		)
);