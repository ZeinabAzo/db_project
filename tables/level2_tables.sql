CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(50) UNIQUE, -- either this or email is entered.
    passwowrd_hash VARCHAR(255) NOT NULL,
    profile_image VARCHAR(255),
    `status` ENUM('active', 'inactive', 'banned') DEFAULT 'active',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    role_id INT,
    city_id INT,
    FOREIGN KEY (role_id) REFERENCES role(role_id) ON DELETE SET NULL,
    FOREIGN KEY (city_id) REFERENCES city(city_id) ON DELETE SET NULL
);

CREATE TABLE venue (
    venue_id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    address TEXT,
    `desc` TEXT,
    creates_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES city(city_id) ON DELETE CASCADE
);

CREATE TABLE seat (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,
    `row_number` VARCHAR(50),
    seat_number VARCHAR(50) NOT NULL,
    seat_type VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE,
    section_id INT,
    FOREIGN KEY (section_id) REFERENCES section(section_id) ON DELETE CASCADE
);
