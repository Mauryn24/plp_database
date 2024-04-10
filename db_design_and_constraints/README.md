# DATABASE DESIGN AND CONSTRAINTS

## 1. NOT NULL
In SQL, the NOT NULL constraint is a crucial feature used to ensure data integrity by specifying that a column must contain a value, and it cannot be left empty or filled with a null value. This constraint is typically used when you want to enforce the presence of data in a specific column, preventing the insertion of records with missing or undefined values. 

### ALTER TABLE with NOT NULL Statement

To add or remove the NOT NULL constraint from an existing table, you can use the ALTER TABLE statement. This statement allows you to make structural changes to an existing table, including modifying the constraints applied to its columns. Here's how you can use the ALTER TABLE statement to set a column as NOT NULL or to remove the constraint:

ALTER TABLE table_name MODIFY column_name data_type NOT NULL;

Examples
- ALTER TABLE courses MODIFY credits INT NOT NULL;
- ALTER TABLE courses MODIFY instructor VARCHAR(50) NOT NULL;

### Removing the NOT NULL Constraint:

To remove the NOT NULL constraint from a column, use a similar ALTER TABLE statement:

ALTER TABLE table_name MODIFY column_name data_type;

Examples
- ALTER TABLE courses MODIFY credits INT;
- ALTER TABLE courses MODIFY instructor VARCHAR(50);

## 2. Primary Key

In SQL, a primary key is a fundamental concept used to define a unique identifier for each record in a database table. It enforces data integrity and ensures that each row in the table has a distinct value in the primary key column.

The primary key constraint serves two primary purposes:
a. Uniqueness: It ensures that each value in the primary key column(s) is unique, meaning no two rows can have the same value in that column.

b. Non-Null: It enforces that the values in the primary key column(s) cannot be NULL, as a primary key is intended to uniquely identify each record.

### Creating a Table with a Primary Key

CREATE TABLE table_name (
    column1 datatype PRIMARY KEY,
    column2 datatype,
    ...
);

Example
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT
);

### Adding a Primary Key with the 'ALTER TABLE` Statement

You can also add a primary key to an existing table using the `ALTER
TABLE statement. 

Here's the syntax:

ALTER TABLE table_name
ADD PRIMARY KEY (column1);

Example

ALTER TABLE students
ADD PRIMARY KEY (student_id);

### Removing a Primary Key Constraint

To remove a primary key constraint from a column, you can use the `ALTER TABLE` statement as well.

Here's the syntax:

ALTER TABLE table_name
DROP PRIMARY KEY;

Example

ALTER TABLE students
DROP PRIMARY KEY;

## 3. SQL Foreign Key Constraint

In SQL, a foreign key constraint is a database feature used to establish a relationship between two tables by enforcing referential integrity. This constraint ensures that the values in a specific column or set of columns in one table correspond to values in another table's primary key. By doing so, it maintains the consistency and accuracy of data within a database.

creating a foreign key constraint


ALTER TABLE Orders
ADD CONSTRAINT FK_CustomerID
FOREIGN KEY (CustomerID)
REFERENCES Customers (CustomerID);


- `ALTER TABLE Orders`: Specifies the table (`Orders`) to which you want to add a constraint.
- `ADD CONSTRAINT FK_CustomerID`: Assigns a name (`FK_CustomerID`) to the foreign key constraint.
- `FOREIGN KEY (CustomerID)`: Identifies the column (`CustomerID`) in the `Orders` table that will serve as the foreign key.
- `REFERENCES Customers (CustomerID)`: Specifies the referenced table (`Customers`) and the column (`CustomerID`) in that table. This indicates that the values in the `CustomerID` column of the `Orders` table must match values in the `CustomerID` column of the `Customers` table.

This foreign key constraint ensures referential integrity between the `Orders` and `Customers` tables, enforcing that every value in the `CustomerID` column of the `Orders` table must exist in the `CustomerID` column of the `Customers` table. This establishes a relationship between orders and customers, ensuring that each order is associated with an existing customer.

### Adding a Foreign Key Constraint to Existing Tables



To add a foreign key constraint to an existing table, you can use the ALTER TABLE statement. Here's the syntax:

ALTER TABLE table_name
ADD CONSTRAINT constraint_name
FOREIGN KEY (column1)
REFERENCES referenced_table(referenced_column);

Example


Suppose we have two tables: `Employees` and `Departments`. We want to add a foreign key constraint to the `Employees` table, where the `DepartmentID` column in the `Employees` table references the `DepartmentID` column in the `Departments` table.


ALTER TABLE Employees
ADD CONSTRAINT FK_DepartmentID
FOREIGN KEY (DepartmentID)
REFERENCES Departments(DepartmentID);


In this example:

- `ALTER TABLE Employees`: Specifies the table we want to modify, which is `Employees`.
- `ADD CONSTRAINT FK_DepartmentID`: Defines the name of the foreign key constraint as `FK_DepartmentID`.
- `FOREIGN KEY (DepartmentID)`: Specifies that the `DepartmentID` column in the `Employees` table is the foreign key.
- `REFERENCES Departments(DepartmentID)`: Specifies the referenced table `Departments` and its `DepartmentID` column, indicating that the values in the `DepartmentID` column of the `Employees` table must exist in the `DepartmentID` column of the `Departments` table.

### Removing a Foreign Key Constraint

To remove a foreign key constraint from a table, you can use the ALTER TABLE statement with the DROP CONSTRAINT clause. Here's the syntax:

ALTER TABLE table_name
DROP CONSTRAINT constraint_name;

Example

ALTER TABLE Employees
DROP CONSTRAINT FK_DepartmentID;

## 4. SQL Unique Constraint

In SQL, a unique constraint is a database feature that ensures that the values in a specific column or set of columns are unique among all the rows in a table.

It guarantees that no duplicate values are allowed in the designated column(s), which is vital for maintaining data integrity.

### Unique vs. Primary Key Constraint

While both unique and primary key constraints serve to enforce data integrity and uniqueness, they have distinct characteristics:

#### Unique Constraint:
Allows one unique value in the column(s).
Allows NULL values, meaning a unique constraint can have multiple NULL values.
Can be applied to multiple columns.
Often used when you want to ensure the uniqueness of data, but not necessarily as an identifier for records.

#### Primary Key Constraint:
Implies a unique constraint, but with the added condition that the column(s) cannot contain NULL values.
Serves as a unique identifier for each record in a table.
Usually applied to a single column (though composite primary keys, using multiple columns, are also possible).

syntax

```sql
CREATE TABLE table_name (
    column1 data_type UNIQUE,
    column2 data_type,
    ...
);
```

- `table_name`: The name of the table you're creating.
- `column1`: Specify the name of the column you want to have a unique constraint.
- `data_type`: Define the data type of the column.

For example:

```sql
CREATE TABLE students (
    student_id INT UNIQUE,
    student_name VARCHAR(50),
    ...
);
```

This creates a table named `students` with a unique constraint on the `student_id` column. The `student_id` column ensures that each value in the column is unique across all rows in the table.

### Adding a Unique Constraint to an Existing Table

To add a unique constraint to an existing table, you can use the `ALTER TABLE` statement.

Here's the syntax:

<!-- Syntax for adding a unique constraint with the ALTER TABLE  -->

ALTER TABLE table_name
ADD CONSTRAINT constraint_name UNIQUE (column1);

`table_name`: The name of the table you want to modify.
`constraint_name`: Give the unique constraint a meaningful name.
`column1`: The column in the current table that you want to designate as unique.

Example

```sql
ALTER TABLE employees
ADD CONSTRAINT uq_email UNIQUE (email);
```

### Removing a Unique Constraint

Here's the syntax for removing a unique constraint from a column using the `ALTER TABLE` statement:

```sql
ALTER TABLE table_name
DROP CONSTRAINT constraint_name;
```

Let's break it down:

- `table_name`: The name of the table containing the unique constraint that you want to remove.
- `constraint_name`: The name of the unique constraint that you want to remove.

For example, if we have a unique constraint named `uq_email` on the `email` column of the `employees` table and we want to remove it:

```sql
ALTER TABLE employees
DROP CONSTRAINT uq_email;
```

Executing this statement will remove the unique constraint named `uq_email` from the `employees` table. Afterward, the `email` column in the `employees` table will no longer have a unique constraint.

## 5. CHECK Constraint

### To assign a CHECK constraint a name, you use the following syntax:

CONSTRAINT constraint_name CHECK(Boolean_expression)

- It is important to note that the CHECK constraint is satisfied when the Boolean expression returns true or the NULL value. Most Boolean expressions evaluate to NULL if one of the operands is NULL, they will not prevent null values in the constrained column. To make sure that the column does not contain the NULL values, you use the NOT NULL constraint.

### SQL CHECK constraint examples

Let's take some examples of creating CHECK constraints.

To create the products table with the value in the selling price column positive, you use the following CREATE TABLE statement:

CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(255) NOT NULL,
selling price NUMERIC(10,2) CHECK (selling price > 0)
);

- The CHECK constraint comes after the data type of the column. If you insert or update the selling price with a negative value, the expression selling price >= 0 returns false and the RDMBS returns an error.

- You can assign the CHECK constraint a separate name. The constraint name helps you clarify the error message returned by the RDBMS and know exactly which constraint the value has been violating.
- To assign a name to a constraint, you use the keyword CONSTRAINT followed by the constraint's name.
For example, the following statement assigns positive_selling_price as the name of CHECK constraint on the selling price column.