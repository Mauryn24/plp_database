# Database Folder

This folder contains databases and related documentation for various projects.

## Introduction

Databases are organized collections of data, typically stored and accessed electronically from a computer system. They are an essential component of most modern applications, providing a structured and efficient way to store, retrieve, and manage data.

## Types of Databases

### Relational Databases

Relational databases organize data into tables with rows and columns. They use a structured query language (SQL) for querying and managing data. Examples include MySQL, PostgreSQL, and SQLite.

### NoSQL Databases

NoSQL databases are non-relational databases that store data in a flexible, schema-less format. They are often used for handling large volumes of unstructured or semi-structured data. Examples include MongoDB, Cassandra, and Redis.

### NewSQL Databases

NewSQL databases combine the scalability and flexibility of NoSQL databases with the ACID transaction properties of traditional relational databases. They aim to provide the best of both worlds for modern applications. Examples include CockroachDB, Google Spanner, and NuoDB.

## Database Management Systems (DBMS)

A database management system (DBMS) is software that provides an interface for managing databases. It handles tasks such as data storage, retrieval, security, and concurrency control. Examples include MySQL, PostgreSQL, Oracle Database, and Microsoft SQL Server.

## Data Definition Language (DDL) Commands
### CREATE TABLE:
- Creates a new table in the database.

CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    ...
);

### ALTER TABLE:
- Modifies an existing table structure.
  
ALTER TABLE table_name
ADD column_name datatype;

ALTER TABLE table_name
DROP COLUMN column_name;

### DROP TABLE: 
- Deletes an existing table from the database.

DROP TABLE table_name;

## Data Manipulation Language (DML) Commands
### INSERT INTO:
- Inserts new records into a table.

INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);

### SELECT:
- Retrieves data from one or more tables.

SELECT column1, column2, ...
FROM table_name
WHERE condition;

### UPDATE:
- Modifies existing records in a table.

UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

### DELETE:
- Deletes records from a table.

DELETE FROM table_name
WHERE condition;

## Data Control Language (DCL) Commands:
### GRANT:
- Provides privileges to users or roles.

GRANT privilege_name
ON object_name
TO user_or_role;

### REVOKE:
- Removes privileges from users or roles.

REVOKE privilege_name
ON object_name
FROM user_or_role;

## Transaction Control Commands:
### COMMIT:
- Saves changes made during the current transaction.

COMMIT;

### ROLLBACK:
- Undoes changes made during the current transaction.

ROLLBACK;

## Miscellaneous Commands:
### SHOW:
- Displays information about databases, tables, or other database objects.

SHOW DATABASES;
SHOW TABLES;

### DESCRIBE / DESC:
- Provides information about the structure of a table.

DESCRIBE table_name;

### USE:
- Specifies the database to be used for subsequent operations.

USE database_name;
