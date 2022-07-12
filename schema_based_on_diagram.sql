CREATE TABLE patients (
    id integer GENERATED ALWAYS AS IDENTITY,
    name varchar NOT NULL,
    date_of_birth date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
    id integer GENERATED ALWAYS AS IDENTITY,
    admitted_at timestamp,
    patient_id integer,
    status varchar,
    CONSTRAINT "fk_patient" FOREIGN KEY (patient_id) REFERENCES patients (id) ON DELETE SET NULL,
    PRIMARY KEY (id)
);