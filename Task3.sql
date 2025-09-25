use demodb;
drop  table if exists users;
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    user_type ENUM('Student','Faculty'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Users (name, email, phone, user_type) VALUES
('Amit', 'amit@gmail.com', '9876543210', 'Student'),
('Riya', 'riya@yahoo.com', '1234567890', 'Faculty'),
('Arjun', 'arjun@gmail.com', '9999999999', 'Student'),
('Neha', 'neha@gmail.com', '8888888888', 'Faculty'),
('Rahul', 'rahul@gmail.com', '7777777777', 'Student');

select * from users;
SELECT name, email FROM Users;
SELECT * FROM Users
WHERE user_type = 'Student';
SELECT * FROM Users
WHERE user_type = 'Student' AND phone IS NOT NULL;
SELECT * FROM Users
WHERE user_type = 'Faculty' OR email LIKE '%@gmail.com';
SELECT * FROM Users
WHERE user_id BETWEEN 1 AND 2;
SELECT * FROM Users
ORDER BY name ASC;
SELECT * FROM Users
ORDER BY user_id DESC;

