-- Create database clinic
CREATE DATABASE clinic;

-- Create Patients table
CREATE TABLE patients  (
  id INT GENERATED BY DEFAULT AS IDENTITY,
  name VARCHAR(30),
  date_of_birth DATE,
  PRIMARY KEY(id)
);

-- Create Medical histories table
CREATE TABLE medical_histories (
  id INT GENERATED BY DEFAULT AS IDENTITY,
  admitted_at TIMESTAMP,
  patients_id INT,
  FOREIGN KEY(patients_id) REFERENCES patients(id),
  status VARCHAR(100),
  PRIMARY KEY(id)
);

-- Create table treatments
CREATE TABLE treatments (
  id INT GENERATED BY DEFAULT AS IDENTITY,
  type VARCHAR(100),
  name VARCHAR(100),
  PRIMARY KEY (id)
);