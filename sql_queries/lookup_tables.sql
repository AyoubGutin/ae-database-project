/* Tables */ 

/* Department Table 
	Lookup table for department information
*/
CREATE TABLE department (
	department_id SERIAL PRIMARY KEY,
	department_name VARCHAR(100) NOT NULL UNIQUE
);

/* Triage Category Table
	Lookup table for categorising triage levels
*/
CREATE TABLE triage_category (
	triage_id SERIAL PRIMARY KEY,
	triage_name triage_name_type NOT NULL UNIQUE,
	priority INTEGER NOT NULL CHECK (priority BETWEEN 1 AND 5) /* Priority is between 1 and 5, consistent w/ NHS */
);

/* Arrival Method Table 
	Lookup table for determining how the patient got to the A&E
*/
CREATE TABLE arrival_method (
	arrival_method_id SERIAL PRIMARY KEY,
	arrival_method_name VARCHAR(50) NOT NULL UNIQUE
);

/* Outcome Table
	Lookup table for describing the patient outcome 
*/
CREATE TABLE outcome (
	outcome_id SERIAL PRIMARY KEY,
	outcome_name VARCHAR(100) NOT NULL UNIQUE
);






