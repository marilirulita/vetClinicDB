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

CREATE TABLE treatments(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    type varchar, 
    name varchar);

CREATE TABLE invoices(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int,
    CONSTRAINT invoice_medical_fk 
    FOREIGN KEY(medical_history_id) 
    REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    unit_price decimal,
    quantity INT,
    total_price decimal,
    invoice_id int,
    treatments_id int,
    CONSTRAINT invoice_id_FK 
    FOREIGN KEY(invoice_id) 
    REFERENCES invoices(id),
    CONSTRAINT treatments_id_FK 
    FOREIGN KEY(treatments_id) 
    REFERENCES treatments(id)
);

