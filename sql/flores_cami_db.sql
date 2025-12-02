DROP DATABASE IF EXISTS flores_cami_db;
CREATE DATABASE flores_cami_db;
\c flores_cami_db;

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC(10,2) NOT NULL,
    stock INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE ventas (
    id SERIAL PRIMARY KEY,
    producto_id INTEGER NOT NULL REFERENCES productos(id),
    cantidad INTEGER NOT NULL,
    total NUMERIC(10,2) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuarios (nombre, email, password)
VALUES (
    'Administrador',
    'admin@flores.com',
    crypt('admin123', gen_salt('bf'))
);
