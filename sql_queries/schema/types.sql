/* Custom Types */

/* Sex type */
CREATE TYPE sex_type AS ENUM (
	'Male', 'Female', 'Other', 'Unknown'
);

/* Postcode area domain 
	Values must contain either one or two uppercase letters, such as 'E', 'SE'
*/
CREATE DOMAIN postcode_area_type AS VARCHAR(2)
	CHECK (VALUE ~ '^[A-Z]{1,2}$');

/* Triage Name Type 
	Consistent w/ NHS
*/
CREATE TYPE triage_name_type AS ENUM (
	'Life Threatening Conditions',
	'Very Urgent',
	'Urgent',
	'Not Threatening to Life & Limb',
	'Not Urgent'
);
