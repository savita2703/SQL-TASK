Task 3: Writing Basic SELECT Queries

## Overview

Ye MySQL script `Users` table banati hai aur sample user data insert karti hai. Script ka main purpose hai **data extract karna** using basic SQL queries with filtering (`WHERE`), sorting (`ORDER BY`), and multiple conditions (`AND`, `OR`, `BETWEEN`, `LIKE`).

## Features

* **Users Table**

  * `user_id` (Primary Key, Auto Increment)
  * `name` (VARCHAR)
  * `email` (VARCHAR, UNIQUE)
  * `phone` (VARCHAR, can be NULL)
  * `user_type` (ENUM: 'Student', 'Faculty')
  * `created_at` (TIMESTAMP, Defaults to current timestamp)

## Operations in the Script

1. Drop old `Users` table if it exists.
2. Create `Users` table with proper constraints.
3. Insert 5 sample user records.
4. Extract all columns with `SELECT *`.
5. Extract specific columns (`name`, `email`).
6. Filter rows using `WHERE` conditions.
7. Combine multiple conditions with `AND` / `OR`.
8. Use pattern matching with `LIKE`.
9. Filter ranges using `BETWEEN`.
10. Sort data ascending/descending with `ORDER BY`.

## Sample Data

| user_id | name  | email                                     | phone      | user_type | created_at          |
| ------- | ----- | ----------------------------------------- | ---------- | --------- | ------------------- |
| 1       | Amit  | [amit@gmail.com](mailto:amit@gmail.com)   | 9876543210 | Student   | 2025-09-25 19:13:10 |
| 2       | Riya  | [riya@yahoo.com](mailto:riya@yahoo.com)   | 1234567890 | Faculty   | 2025-09-25 19:13:10 |
| 3       | Arjun | [arjun@gmail.com](mailto:arjun@gmail.com) | 9999999999 | Student   | 2025-09-25 19:13:10 |
| 4       | Neha  | [neha@gmail.com](mailto:neha@gmail.com)   | 8888888888 | Faculty   | 2025-09-25 19:13:10 |
| 5       | Rahul | [rahul@gmail.com](mailto:rahul@gmail.com) | 7777777777 | Student   | 2025-09-25 19:13:10 |

## SQL Queries in the Script

* Select all columns:

```sql
SELECT * FROM Users;
```

* Select specific columns:

```sql
SELECT name, email FROM Users;
```

* Filter students only:

```sql
SELECT * FROM Users
WHERE user_type = 'Student';
```

* Filter students with phone numbers:

```sql
SELECT * FROM Users
WHERE user_type = 'Student' AND phone IS NOT NULL;
```

* Filter faculty or Gmail users:

```sql
SELECT * FROM Users
WHERE user_type = 'Faculty' OR email LIKE '%@gmail.com';
```

* Filter using BETWEEN (user_id 1 to 2):

```sql
SELECT * FROM Users
WHERE user_id BETWEEN 1 AND 2;
```

* Sort ascending by name:

```sql
SELECT * FROM Users
ORDER BY name ASC;
```

* Sort descending by user_id:

```sql
SELECT * FROM Users
ORDER BY user_id DESC;
```

## Notes

* `SELECT` → Retrieves data from the table.
* `WHERE` → Filters rows based on conditions.
* `AND / OR` → Combine multiple conditions.
* `LIKE` → Pattern matching in text columns.
* `BETWEEN` → Filter rows within numeric ranges.
* `ORDER BY` → Sorts the output ascending or descending.
* `LIMIT` is optional; not required in this task.

## Usage

1. Open **MySQL Workbench** or any MySQL client.
2. Run the script to create the database and insert data.
3. Execute the `SELECT` queries to view the results.
