-- ==========================================
-- LEVEL 1: Independent Tables
-- ==========================================

-- Role
INSERT INTO `role` (role_name, `desc`) VALUES 
('Admin', 'System Administrator with full access'),
('Customer', 'Regular user who buys tickets'),
('Support', 'Customer support representative');

-- City
INSERT INTO city (name, province) VALUES 
('Tehran', 'Tehran'),
('Isfahan', 'Isfahan'),
('Tabriz', 'East Azerbaijan');

-- Sport Type
INSERT INTO sport_type (name, `desc`, rules) VALUES 
('Football', '11 players per team, 90 minutes', 'Standard FIFA Rules'),
('Basketball', '5 players per team, 4 quarters', 'Standard FIBA Rules'),
('Volleyball', '6 players per team, Best of 5 sets', 'Standard FIVB Rules');

-- Team
INSERT INTO team (name, `desc`) VALUES 
('Persepolis', 'Tehran based football club'),
('Esteghlal', 'Tehran based football club'),
('Sepahan', 'Isfahan based football club'),
('Tractor', 'Tabriz based football club');

-- Refund Policy
INSERT INTO refund_policy (name, `desc`) VALUES 
('Full Refund', '100% refund if cancelled 48h before the event'),
('Partial Refund', '50% refund if cancelled 24h before the event'),
('No Refund', 'Tickets are non-refundable');

-- Section
INSERT INTO section (name, capacity, remaining_capacity, `desc`, price_multiplier) VALUES 
('VIP', 100, 100, 'VIP seating with best view', 3.50),
('Category 1', 500, 500, 'Main stand seating', 1.50),
('Category 2', 1000, 1000, 'Behind the goal', 1.00);

-- Ticket Type
INSERT INTO ticket_type (ticket_type, `desc`) VALUES 
('Adult', 'Standard adult ticket'),
('Child', 'Discounted ticket for children under 12'),
('Student', 'Discounted ticket for students with ID');

-- Feature
INSERT INTO feature (name, `desc`) VALUES 
('Free Parking', 'Includes one parking spot'),
('VIP Lounge', 'Access to VIP lounge with catering'),
('Meet & Greet', 'Meet players after the match');

-- ==========================================
-- LEVEL 2: Tables depending on Level 1
-- ==========================================

-- User (role_id, city_id)
INSERT INTO User (first_name, last_name, email, phone, passwowrd_hash, `status`, role_id, city_id) VALUES 
('Ali', 'Ahmadi', 'admin@example.com', '09120000001', 'hashed_pass_1', 'active', 1, 1),
('Sara', 'Rezaei', 'sara.r@example.com', '09120000002', 'hashed_pass_2', 'active', 2, 2),
('Reza', 'Karimi', 'reza.k@example.com', '09120000003', 'hashed_pass_3', 'active', 2, 1),
('Mina', 'Naderi', 'mina.n@example.com', '09120000004', 'hashed_pass_4', 'inactive', 3, 3);

-- Venue (city_id)
INSERT INTO venue (`name`, address, `desc`, city_id) VALUES 
('Azadi Sports Complex', 'Western Tehran, District 22', 'Largest sports complex in Iran', 1),
('Naghsh-e-Jahan Complex', 'Northern Isfahan', 'Major sports center in Isfahan', 2);

-- Seat (section_id)
INSERT INTO seat (`row_number`, seat_number, seat_type, is_active, section_id) VALUES 
('A', '1', 'Comfort', TRUE, 1),
('A', '2', 'Comfort', TRUE, 1),
('B', '15', 'Standard', TRUE, 2),
('C', '45', 'Standard', TRUE, 3);

-- ==========================================
-- LEVEL 3: Tables depending on Level 2
-- ==========================================

-- Stadium (venue_id)
INSERT INTO stadium (name, capacity, `desc`, venue_id) VALUES 
('Azadi Stadium', 78116, 'National football stadium', 1),
('Azadi Basketball Hall', 3000, 'Indoor basketball arena', 1),
('Naghsh-e-Jahan Stadium', 75000, 'Home of Sepahan', 2);

-- ==========================================
-- LEVEL 4: Tables depending on Level 3
-- ==========================================

-- Match (sport_type_id, home_team_id, away_team_id, staduim_id)
INSERT INTO `match` (match_data, start_time, `status`, `desc`, sport_type_id, home_team_id, away_team_id, staduim_id) VALUES 
('Derby Match', '2026-08-15 18:00:00', 'Scheduled', 'Tehran Derby', 1, 1, 2, 1),
('League Match', '2026-08-20 19:30:00', 'Scheduled', 'Week 5 match', 1, 3, 4, 3);

-- ==========================================
-- LEVEL 5: Tables depending on Level 4
-- ==========================================

-- Ticket (match_id, seat_id, ticket_type_id, refund_policy_id)
INSERT INTO ticket (price, `status`, match_id, seat_id, ticket_type_id, refund_policy_id) VALUES 
(500.00, 'available', 1, 1, 1, 1),
(500.00, 'available', 1, 2, 1, 1),
(150.00, 'sold_out', 1, 3, 1, 2),
(100.00, 'available', 2, 4, 3, 3);

-- ==========================================
-- LEVEL 6: Tables depending on Level 5
-- ==========================================

-- Ticket Feature (feature_id, ticket_id)
INSERT INTO ticket_feature (feature_id, ticket_id, key_value) VALUES 
(1, 1, 'Parking Spot A-12'),
(2, 1, 'VIP Wristband Included'),
(1, 2, 'Parking Spot A-13');

-- Reserve (user_id, ticket_id)
INSERT INTO reserve (expire_at, quntaty, reserve_at, total_price, status, user_id, ticket_id) VALUES 
('2026-08-10 12:00:00', 1, '2026-08-09 10:00:00', 150.00, 'confirmed', 2, 3),
('2026-08-12 15:00:00', 1, '2026-08-12 14:00:00', 500.00, 'pending', 3, 1);

-- Report About Ticket (respoder_id, ticket_id, reporter_id)
INSERT INTO report_about_ticket (description, status, respond, respoder_id, ticket_id, reporter_id) VALUES 
('Is this ticket wheelchair accessible?', 'Resolved', 'Yes, row A is accessible.', 1, 1, 2);

-- ==========================================
-- LEVEL 7: Tables depending on Level 6
-- ==========================================

-- Report About Reserve (responder_id, reserv_id, reporter_id)
INSERT INTO report_about_reserve (description, status, respond, responder_id, reserv_id, reporter_id) VALUES 
('I reserved but did not get confirmation email', 'Pending', NULL, NULL, 1, 2);

-- Payment (reservation_id)
INSERT INTO payment (amount, payment_status, payment_metod, transection_id, paied_at, reservation_id) VALUES 
(150.00, 'completed', 'credit_card', 'TRX-9988776655', '2026-08-09 10:05:00', 1),
(500.00, 'pending', 'bank_transfer', NULL, NULL, 2);

-- ==========================================
-- LEVEL 8: Tables depending on Level 7
-- ==========================================

-- Refund (payment_id)
INSERT INTO refund (amount, status, reson, refunded_at, payment_id) VALUES 
(150.00, 'requested', 'Customer tested positive for COVID', NULL, 1);