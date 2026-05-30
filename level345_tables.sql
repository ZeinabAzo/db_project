-- ==========================================
-- LEVEL 3: Tables depending on Level 2
-- ==========================================

CREATE TABLE stadium (
    staduim_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    capacity INT,
    `desc` TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    venue_id INT,
    FOREIGN KEY (venue_id) REFERENCES venue(venue_id) ON DELETE CASCADE
);

-- ==========================================
-- LEVEL 4: Tables depending on Level 3
-- ==========================================

CREATE TABLE `match` (
    match_id INT AUTO_INCREMENT PRIMARY KEY,
    match_data TEXT,
    start_time DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    `status` VARCHAR(100),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `desc` TEXT,
    sport_type_id INT,
    home_team_id INT,
    away_team_id INT,
    staduim_id INT,
    FOREIGN KEY (sport_type_id) REFERENCES sport_type(sport_type_id) ON DELETE SET NULL,
    FOREIGN KEY (home_team_id) REFERENCES team(team_id) ON DELETE CASCADE,
    FOREIGN KEY (away_team_id) REFERENCES team(team_id) ON DELETE CASCADE,
    FOREIGN KEY (staduim_id) REFERENCES stadium(staduim_id) ON DELETE SET NULL
);

-- ==========================================
-- LEVEL 5: Tables depending on Level 4
-- ==========================================

CREATE TABLE ticket (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    price DECIMAL(10,2) NOT NULL,
    `status` ENUM('available', 'sold_out', 'cancelled') DEFAULT 'available',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    match_id INT,
    seat_id INT,
    ticket_type_id INT,
    refund_policy_id INT,
    FOREIGN KEY (match_id) REFERENCES `match`(match_id) ON DELETE CASCADE,
    FOREIGN KEY (seat_id) REFERENCES seat(seat_id) ON DELETE SET NULL,
    FOREIGN KEY (ticket_type_id) REFERENCES ticket_type(ticket_type_id) ON DELETE SET NULL,
    FOREIGN KEY (refund_policy_id) REFERENCES refund_policy(refund_policy_id) ON DELETE SET NULL
);
