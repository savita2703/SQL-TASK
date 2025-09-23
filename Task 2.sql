
USE librarydb;

DROP TABLE IF EXISTS BorrowRecords;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(15),
  user_type ENUM('Student','Faculty'),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Users (name, email, phone, user_type) VALUES
('Aryan', 'aryan123@gmail.com', '7897163590', 'Student'),
('Harshita', 'harshita234@gmail.com', NULL, 'Faculty'),
('Pranjul','pranjul768@gmail.com','6789761354','Student');

SET SQL_SAFE_UPDATES = 0;
UPDATE Users
SET phone = '9876543210'
WHERE phone IS NULL AND TRIM(name) = 'Harshita';
SET SQL_SAFE_UPDATES = 1;

CREATE TABLE Authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  country VARCHAR(50)
);

INSERT INTO Authors (name, country) VALUES 
('J.K. Rowling', 'UK'),
('Chetan Bhagat', 'India'),
('Unknown', 'NUL');

CREATE TABLE Categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(100) UNIQUE
);

INSERT INTO Categories (category_name) VALUES 
('Fiction'),
('Non-fiction'),
('Technology');

CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT NOT NULL,
    category_id INT NOT NULL,
    isbn VARCHAR(50),
    published_year YEAR,
    available_copies INT DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

INSERT INTO Books (title, author_id, category_id, isbn, published_year, available_copies) VALUES  
('Harry Potter', 1, 1, 'HP123', 2001, 10),  
('Half Girlfriend', 2, 1, 'HG456', 2014, 5),  
('Advanced SQL', 3, 3, NULL, 2020, 3);

CREATE TABLE BorrowRecords (
  record_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  book_id INT,
  borrow_date DATE,
  return_date DATE,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO BorrowRecords (user_id, book_id, borrow_date, return_date) VALUES
(1, 1, '2025-09-15', NULL),
(2, 2, '2025-09-16', '2025-09-22'),
(3, 3, '2025-09-19', '2025-09-23');


SELECT DATABASE();
SHOW TABLES;

SELECT * FROM Users;
SELECT * FROM Authors;
SELECT * FROM Categories;
SELECT * FROM Books;
SELECT * FROM BorrowRecords;

SET SQL_SAFE_UPDATES = 0;

UPDATE Books
SET available_copies = available_copies - 1
WHERE TRIM(title) = 'Harry Potter';

SET SQL_SAFE_UPDATES = 1; 


DELETE FROM Categories
WHERE category_name = 'Non-fiction';


DELETE FROM BorrowRecords
WHERE record_id = 2;

START TRANSACTION;
DELETE FROM BorrowRecords WHERE record_id = 1;
ROLLBACK;  
