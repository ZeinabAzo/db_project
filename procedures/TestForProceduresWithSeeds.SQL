-- =========================================================
-- Test For Procedures With Seeds
-- =========================================================

-- =========================================================
-- RESET DATABASE
-- فقط روی دیتابیس تستی اجرا شود
-- =========================================================

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE refund;
TRUNCATE TABLE payment;
TRUNCATE TABLE report_about_reserve;
TRUNCATE TABLE report_about_ticket;
TRUNCATE TABLE reserve;
TRUNCATE TABLE ticket_feature;
TRUNCATE TABLE ticket;
TRUNCATE TABLE seat;
TRUNCATE TABLE section;
TRUNCATE TABLE `match`;
TRUNCATE TABLE stadium;
TRUNCATE TABLE venue;
TRUNCATE TABLE users;
TRUNCATE TABLE team;
TRUNCATE TABLE sport_type;
TRUNCATE TABLE ticket_type;
TRUNCATE TABLE refund_policy;
TRUNCATE TABLE feature;
TRUNCATE TABLE city;
TRUNCATE TABLE `role`;

SET FOREIGN_KEY_CHECKS = 1;


-- =========================================================
-- 1. ROLES
-- =========================================================

INSERT INTO `role`
    (role_id, role_name, `desc`)
VALUES
    (1, 'customer', 'Regular customer'),
    (2, 'supporter', 'Support staff'),
    (3, 'admin', 'System administrator');


-- =========================================================
-- 2. CITIES
-- =========================================================

INSERT INTO city
    (city_id, name, province)
VALUES
    (1, 'Tehran', 'Tehran'),
    (2, 'Shiraz', 'Fars'),
    (3, 'Tabriz', 'East Azerbaijan'),
    (4, 'Mashhad', 'Razavi Khorasan');


-- =========================================================
-- 3. SPORT TYPES
-- =========================================================

INSERT INTO sport_type
    (sport_type_id, name, `desc`, rules)
VALUES
    (1, 'Football', 'Football matches', 'Standard football rules'),
    (2, 'Basketball', 'Basketball matches', 'Standard basketball rules'),
    (3, 'Volleyball', 'Volleyball matches', 'Standard volleyball rules');


-- =========================================================
-- 4. TEAMS
-- =========================================================

INSERT INTO team
    (team_id, name, `desc`, status)
VALUES
    (1, 'Esteghlal', 'Tehran football club', 'active'),
    (2, 'Persepolis', 'Tehran football club', 'active'),
    (3, 'Tractor', 'Tabriz football club', 'active'),
    (4, 'Sepahan', 'Isfahan football club', 'active'),
    (5, 'Tehran Basketball', 'Basketball team', 'active'),
    (6, 'Shiraz Volleyball', 'Volleyball team', 'active');


-- =========================================================
-- 5. TICKET TYPES
-- =========================================================

INSERT INTO ticket_type
    (ticket_type_id, ticket_type, `desc`)
VALUES
    (1, 'VIP', 'VIP ticket'),
    (2, 'Regular', 'Regular ticket'),
    (3, 'Economy', 'Economy ticket');


-- =========================================================
-- 6. REFUND POLICIES
-- =========================================================

INSERT INTO refund_policy
    (refund_policy_id, name, `desc`)
VALUES
    (1, 'Full Refund', '100 percent refund'),
    (2, 'Partial Refund', '50 percent refund'),
    (3, 'No Refund', 'No refund available');


-- =========================================================
-- 7. FEATURES
-- =========================================================

INSERT INTO feature
    (feature_id, name, `desc`)
VALUES
    (1, 'Free Parking', 'Free parking'),
    (2, 'VIP Lounge', 'Access to VIP lounge'),
    (3, 'Free Drink', 'Free drink');


-- =========================================================
-- 8. USERS
-- =========================================================

INSERT INTO users
    (user_id, first_name, last_name,
     email, phone, password_hash,
     role_id, city_id, `status`)
VALUES

-- Tehran customers
(1, 'Ali', 'Ahmadi',
 'ali@gmail.com', '09120000001',
 'hash1', 1, 1, 'active'),

(2, 'Reza', 'Karimi',
 'reza@gmail.com', '09120000002',
 'hash2', 1, 1, 'active'),

(3, 'Sara', 'Mohammadi',
 'sara@gmail.com', '09120000003',
 'hash3', 1, 1, 'active'),

(4, 'Hassan', 'Rahimi',
 'hassan@gmail.com', '09120000004',
 'hash4', 1, 1, 'active'),

-- Shiraz customer
(5, 'Mina', 'Shirazi',
 'mina@gmail.com', '09170000001',
 'hash5', 1, 2, 'active'),

-- Tabriz customer
(6, 'Amir', 'Ahmadi',
 'amir@gmail.com', '09140000001',
 'hash6', 1, 3, 'active'),

-- Supporters
(7, 'Supporter', 'One',
 'support1@gmail.com', '09120000007',
 'hash7', 2, 1, 'active'),

(8, 'Supporter', 'Two',
 'support2@gmail.com', '09120000008',
 'hash8', 2, 1, 'active');


-- =========================================================
-- 9. VENUES
-- =========================================================

INSERT INTO venue
    (venue_id, name, address, `desc`, city_id)
VALUES
(1, 'Azadi Sports Complex',
 'Azadi Street, Tehran',
 'Main Tehran sports complex',
 1),

(2, 'Shiraz Sports Center',
 'Shiraz Main Street',
 'Sports center in Shiraz',
 2),

(3, 'Tabriz Sports Complex',
 'Tabriz Main Street',
 'Sports complex in Tabriz',
 3);


-- =========================================================
-- 10. STADIUMS
-- =========================================================

INSERT INTO stadium
    (stadium_id, name, capacity, `desc`, venue_id)
VALUES
(1, 'Azadi Stadium',
 80000,
 'Main football stadium',
 1),

(2, 'Shiraz Stadium',
 30000,
 'Shiraz stadium',
 2),

(3, 'Tabriz Stadium',
 40000,
 'Tabriz stadium',
 3);


-- =========================================================
-- 11. SECTIONS
-- =========================================================

INSERT INTO section
    (section_id, name, capacity, `desc`,
     price_multiplier, stadium_id)
VALUES
(1, 'VIP Section',
 1000,
 'VIP area',
 2.00,
 1),

(2, 'Regular Section',
 5000,
 'Regular area',
 1.00,
 1),

(3, 'Economy Section',
 10000,
 'Economy area',
 0.70,
 1),

(4, 'Main Section',
 5000,
 'Main section',
 1.00,
 2),

(5, 'Main Section',
 5000,
 'Main section',
 1.00,
 3);


-- =========================================================
-- 12. SEATS
-- =========================================================

INSERT INTO seat
    (seat_id, `row_number`, seat_number,
     seat_type, is_active, section_id)
VALUES
(1, 'A', '1', 'VIP', TRUE, 1),
(2, 'A', '2', 'VIP', TRUE, 1),
(3, 'A', '3', 'VIP', TRUE, 1),

(4, 'B', '1', 'Regular', TRUE, 2),
(5, 'B', '2', 'Regular', TRUE, 2),
(6, 'B', '3', 'Regular', TRUE, 2),

(7, 'C', '1', 'Economy', TRUE, 3),
(8, 'C', '2', 'Economy', TRUE, 3),
(9, 'C', '3', 'Economy', TRUE, 3),

(10, 'A', '1', 'Regular', TRUE, 4),
(11, 'A', '2', 'Regular', TRUE, 4),
(12, 'A', '3', 'Regular', TRUE, 4),

(13, 'A', '1', 'Regular', TRUE, 5),
(14, 'A', '2', 'Regular', TRUE, 5),
(15, 'A', '3', 'Regular', TRUE, 5);


-- =========================================================
-- 13. MATCHES
-- =========================================================

INSERT INTO `match`
    (match_id, match_data, start_time,
     status, sport_type_id,
     home_team_id, away_team_id, stadium_id)
VALUES

(1,
 'Esteghlal vs Persepolis',
 '2026-07-10 18:00:00',
 'finished',
 1,
 1,
 2,
 1),

(2,
 'Esteghlal vs Tractor',
 '2026-07-15 20:00:00',
 'finished',
 1,
 1,
 3,
 1),

(3,
 'Persepolis vs Sepahan',
 '2026-07-20 19:00:00',
 'finished',
 1,
 2,
 4,
 1),

(4,
 'Tehran Basketball vs Esteghlal',
 '2026-07-18 17:00:00',
 'finished',
 2,
 5,
 1,
 1),

(5,
 'Shiraz Volleyball vs Tractor',
 '2026-07-12 16:00:00',
 'finished',
 3,
 6,
 3,
 2),

(6,
 'Tractor vs Persepolis',
 '2026-07-22 18:00:00',
 'finished',
 1,
 3,
 2,
 3);


-- =========================================================
-- 14. TICKETS
-- =========================================================
-- نکته:
-- ticket 13 قبلاً هم خرید موفق داشت و هم رزرو کنسل‌شده.
-- اینجا ticket 15 برای رزرو کنسل‌شده ساخته شده.
-- چون رزرو کنسل شده، ticket.status = 'available' است.

INSERT INTO ticket
    (ticket_id, price, status,
     match_id, seat_id,
     ticket_type_id, refund_policy_id)
VALUES

-- Match 1
(1, 100, 'sold', 1, 1, 1, 1),
(2, 100, 'sold', 1, 2, 1, 1),
(3, 80,  'sold', 1, 4, 2, 2),
(4, 80,  'available', 1, 5, 2, 2),

-- Match 2
(5, 120, 'sold', 2, 3, 1, 1),
(6, 90,  'sold', 2, 6, 2, 2),
(7, 70, 'available', 2, 7, 3, 3),

-- Match 3
(8, 110, 'sold', 3, 8, 2, 1),
(9, 110, 'sold', 3, 9, 2, 1),

-- Match 4
(10, 60, 'sold', 4, 10, 2, 2),
(11, 60, 'available', 4, 11, 2, 2),

-- Match 5
(12, 50, 'sold', 5, 12, 2, 2),

-- Match 6
(13, 95, 'sold', 6, 13, 2, 2),
(14, 95, 'sold', 6, 14, 2, 2),
(15, 95, 'available', 6, 15, 2, 2);


-- =========================================================
-- 15. TICKET FEATURES
-- =========================================================

INSERT INTO ticket_feature
    (feature_id, ticket_id)
VALUES
(1, 1),
(2, 1),
(3, 1),
(2, 2),
(1, 5);


-- =========================================================
-- 16. RESERVATIONS
-- =========================================================
-- منطق:
-- confirmed -> payment completed
-- cancelled -> ticket available
--
-- هر ticket فقط یک reserve دارد.

INSERT INTO reserve
    (reserve_id,
     expire_at,
     created_at,
     confirmed_at,
     total_price,
     status,
     user_id,
     ticket_id)
VALUES

-- =========================================
-- Ali
-- 3 successful purchases
-- =========================================

(1,
 '2026-07-10 20:00:00',
 '2026-07-01 10:00:00',
 '2026-07-01 10:05:00',
 100,
 'confirmed',
 1,
 1),

(2,
 '2026-07-15 22:00:00',
 '2026-07-05 12:00:00',
 '2026-07-05 12:05:00',
 120,
 'confirmed',
 1,
 5),

(3,
 '2026-07-20 21:00:00',
 '2026-07-06 14:00:00',
 '2026-07-06 14:05:00',
 110,
 'confirmed',
 1,
 8),


-- =========================================
-- Reza
-- 2 successful purchases
-- =========================================

(4,
 '2026-07-10 20:00:00',
 '2026-07-02 11:00:00',
 '2026-07-02 11:05:00',
 100,
 'confirmed',
 2,
 2),

(5,
 '2026-07-18 19:00:00',
 '2026-07-07 11:00:00',
 '2026-07-07 11:05:00',
 60,
 'confirmed',
 2,
 10),


-- =========================================
-- Sara
-- 2 successful purchases
-- =========================================

(6,
 '2026-07-10 20:00:00',
 '2026-07-03 09:00:00',
 '2026-07-03 09:05:00',
 80,
 'confirmed',
 3,
 3),

(7,
 '2026-07-20 21:00:00',
 '2026-07-08 15:00:00',
 '2026-07-08 15:05:00',
 110,
 'confirmed',
 3,
 9),


-- =========================================
-- Hassan
-- 2 successful purchases
-- =========================================

(8,
 '2026-07-22 20:00:00',
 '2026-07-09 16:00:00',
 '2026-07-09 16:05:00',
 95,
 'confirmed',
 4,
 13),

(9,
 '2026-07-22 20:00:00',
 '2026-07-10 17:00:00',
 '2026-07-10 17:05:00',
 95,
 'confirmed',
 4,
 14),


-- =========================================
-- Mina
-- Cancelled reservation
-- Ticket 12 becomes available
-- =========================================

(10,
 '2026-07-12 18:00:00',
 '2026-07-04 10:00:00',
 NULL,
 50,
 'cancelled',
 5,
 12),


-- =========================================
-- Amir
-- Cancelled Football reservation
-- Ticket 15 is available again
-- =========================================

(11,
 '2026-07-22 20:00:00',
 '2026-07-10 10:00:00',
 NULL,
 95,
 'cancelled',
 6,
 15);


-- =========================================================
-- 17. PAYMENTS
-- =========================================================
-- فقط confirmed reservations دارای completed payment هستند.

INSERT INTO payment
    (payment_id,
     amount,
     payment_status,
     payment_method,
     transaction_id,
     paid_at,
     reservation_id)
VALUES

(1,
 100,
 'completed',
 'credit_card',
 'TXN001',
 '2026-07-01 10:04:00',
 1),

(2,
 120,
 'completed',
 'credit_card',
 'TXN002',
 '2026-07-05 12:04:00',
 2),

(3,
 110,
 'completed',
 'paypal',
 'TXN003',
 '2026-07-06 14:04:00',
 3),

(4,
 100,
 'completed',
 'bank_transfer',
 'TXN004',
 '2026-07-02 11:04:00',
 4),

(5,
 60,
 'completed',
 'credit_card',
 'TXN005',
 '2026-07-07 11:04:00',
 5),

(6,
 80,
 'completed',
 'credit_card',
 'TXN006',
 '2026-07-03 09:04:00',
 6),

(7,
 110,
 'completed',
 'paypal',
 'TXN007',
 '2026-07-08 15:04:00',
 7),

(8,
 95,
 'completed',
 'credit_card',
 'TXN008',
 '2026-07-09 16:04:00',
 8),

(9,
 95,
 'completed',
 'credit_card',
 'TXN009',
 '2026-07-10 17:04:00',
 9);


-- =========================================================
-- 18. REPORT ABOUT RESERVE
-- =========================================================

INSERT INTO report_about_reserve
    (report_id,
     description,
     status,
     respond,
     responder_id,
     reserve_id,
     reporter_id)
VALUES

-- Supporter One reviews Mina's cancelled reservation
(1,
 'Payment problem and suspicious reservation',
 'resolved',
 'Reservation cancelled after investigation',
 7,
 10,
 7),

-- Supporter One reviews Amir's cancelled reservation
(2,
 'Payment problem with reservation',
 'resolved',
 'Reservation cancelled',
 7,
 11,
 8),

-- Supporter Two reviews another report
(3,
 'Payment failed during reservation',
 'resolved',
 'Checked payment information',
 8,
 10,
 7);


-- =========================================================
-- 19. REPORT ABOUT TICKET
-- =========================================================

INSERT INTO report_about_ticket
    (report_id,
     description,
     status,
     respond,
     responder_id,
     ticket_id,
     reporter_id)
VALUES

(1,
 'Payment problem with ticket',
 'resolved',
 'Ticket issue reviewed',
 7,
 1,
 1),

(2,
 'Ticket information is incorrect',
 'resolved',
 'Ticket information updated',
 8,
 2,
 2),

(3,
 'Payment failed for ticket purchase',
 'resolved',
 'Payment checked',
 7,
 3,
 3),

(4,
 'Ticket price problem',
 'resolved',
 'Price reviewed',
 8,
 5,
 4);


-- =========================================================
-- 20. FINAL CHECKS
-- =========================================================

SELECT
    'Users' AS table_name,
    COUNT(*) AS row_count
FROM users

UNION ALL

SELECT
    'Cities',
    COUNT(*)
FROM city

UNION ALL

SELECT
    'Matches',
    COUNT(*)
FROM `match`

UNION ALL

SELECT
    'Tickets',
    COUNT(*)
FROM ticket

UNION ALL

SELECT
    'Reservations',
    COUNT(*)
FROM reserve

UNION ALL

SELECT
    'Payments',
    COUNT(*)
FROM payment

UNION ALL

SELECT
    'Ticket Reports',
    COUNT(*)
FROM report_about_ticket

UNION ALL

SELECT
    'Reserve Reports',
    COUNT(*)
FROM report_about_reserve;


-- =========================================================
-- Procedure tests
-- =========================================================

-- 1
CALL GetPurchasedTicketsByContact(
    'ali@gmail.com',
    NULL
);

-- 2
CALL GetUsersWithCancelledReservationsBySupporter(
    'support1@gmail.com',
    NULL
);

-- 3
CALL GetPurchasedTicketsByCity(
    'Tehran'
);

-- 4
CALL SearchTickets('Ali');
CALL SearchTickets('Esteghlal');
CALL SearchTickets('Azadi');
CALL SearchTickets('VIP');
CALL SearchTickets('Sports Complex');

-- 5
CALL GetUsersFromSameCity(
    'ali@gmail.com',
    NULL
);

-- 6
CALL GetTopNBuyersAfterDate(
    '2026-07-01 00:00:00',
    3
);

-- 7
CALL GetCancelledTicketsBySport(
    'Football'
);

-- 8
CALL GetUsersWithMostReportsByDescription(
    'payment'
);