
-- ==========================================
-- LEVEL 6: Tables depending on Level 5
-- ==========================================

CREATE TABLE ticket_feature (
    feature_id INT,
    ticket_id INT,
    key_value VARCHAR(255),
    PRIMARY KEY (feature_id, ticket_id),
    FOREIGN KEY (feature_id) REFERENCES feature(feature_id) ON DELETE CASCADE,
    FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id) ON DELETE CASCADE
);

CREATE TABLE reserve (
    reserve_id INT AUTO_INCREMENT PRIMARY KEY,
    expire_at DATETIME,
    quntaty INT DEFAULT 1,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    reserve_at DATETIME,
    total_price DECIMAL(10,2),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status ENUM('pending', 'confirmed', 'cancelled') DEFAULT 'pending',
    user_id INT,
    ticket_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id) ON DELETE CASCADE
);

CREATE TABLE report_about_ticket (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT,
    status VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    respond TEXT,
    respoder_id INT,
    ticket_id INT,
    reporter_id INT,
    FOREIGN KEY (respoder_id) REFERENCES User(user_id) ON DELETE SET NULL,
    FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_id) ON DELETE CASCADE,
    FOREIGN KEY (reporter_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- ==========================================
-- LEVEL 7: Tables depending on Level 6
-- ==========================================

CREATE TABLE report_about_reserve (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT,
    status VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    respond TEXT,
    responder_id INT,
    reserv_id INT,
    reporter_id INT,
    FOREIGN KEY (responder_id) REFERENCES User(user_id) ON DELETE SET NULL,
    FOREIGN KEY (reserv_id) REFERENCES reserve(reserve_id) ON DELETE CASCADE,
    FOREIGN KEY (reporter_id) REFERENCES User(user_id) ON DELETE CASCADE
);

CREATE TABLE payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10,2) NOT NULL,
    payment_status ENUM('pending', 'completed', 'failed') DEFAULT 'pending',
    payment_metod ENUM('credit_card', 'paypal', 'bank_transfer') NOT NULL,
    transection_id VARCHAR(255),
    paied_at DATETIME,
    reservation_id INT,
    FOREIGN KEY (reservation_id) REFERENCES reserve(reserve_id) ON DELETE CASCADE
);

-- ==========================================
-- LEVEL 8: Tables depending on Level 7
-- ==========================================

CREATE TABLE refund (
    refund_id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10,2) NOT NULL,
    status ENUM('requested', 'processed', 'declined') DEFAULT 'requested',
    reson TEXT,
    refunded_at DATETIME,
    payment_id INT,
    FOREIGN KEY (payment_id) REFERENCES payment(payment_id) ON DELETE CASCADE
);
