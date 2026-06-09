INSERT INTO role (role_name)
VALUES
    ('user'),
    ('admin'),
    ('support');


INSERT INTO city (name, province)
VALUES
    ('Tehran', 'Tehran'),
    ('Kashan', 'Esfahan'),
    ('Shiraz', 'Fars'),
    ('Ottawa', 'Ontario'),
    ('Berlin', 'Berlin');


INSERT INTO sport_type (name, description, rules)
VALUES
    (
        'Football',
        'Team sport played with 11 players',
        'FIFA official rules'
    ),
    (
        'Basketball',
        'Indoor team sport',
        'FIBA official rules'
    ),
    (
        'Volleyball',
        'Indoor volleyball competition',
        'FIVB official rules'
    ),
    (
        'Tennis',
        'Individual racket sport',
        'ATP official rules'
    );


INSERT INTO team (name, description, created_at)
VALUES
    (
        'Persepolis',
        'Iranian football club',
        NOW()
    ),
    (
        'Esteghlal',
        'Iranian football club',
        NOW()
    ),
    (
        'Lakers',
        'American basketball team',
        NOW()
    ),
    (
        'Warriors',
        'NBA basketball team',
        NOW()
    );


INSERT INTO refund_policy (name, description)
VALUES
    (
        'No Refund',
        'Ticket cannot be refunded after purchase'
    ),
    (
        '50 Percent Refund',
        '50 percent refund before the match'
    ),
    (
        'Full Refund',
        'Full refund available up to 7 days before match'
    );


INSERT INTO ticket_type (ticket_type)
VALUES
    ('VIP'),
    ('Normal'),
    ('Premium'),
    ('Economy');


INSERT INTO feature (name, description)
VALUES
    (
        'Parking',
        'Parking access for visitors'
    ),
    (
        'VIP Lounge',
        'Private VIP waiting lounge'
    ),
    (
        'Food Service',
        'Food and beverage service'
    ),
    (
        'Wheelchair Access',
        'Accessibility support for disabled users'
    );


INSERT INTO venue (name, address, city_id)
VALUES
    (
        'Azadi Complex',
        'Azadi Street',
        1
    ),
    (
        'Ottawa Sport Center',
        'Downtown Ottawa',
        4
    ),
    (
        'Berlin Arena',
        'Central Berlin',
        5
    );


INSERT INTO stadium (name, capacity, venue_id)
VALUES
    (
        'Azadi Stadium',
        78000,
        1
    ),
    (
        'Ottawa Main Stadium',
        25000,
        2
    ),
    (
        'Berlin Olympic Stadium',
        70000,
        3
    );


INSERT INTO section(name,capacity,remaining_capacity, description,price_multiplier)
VALUES
    (
        'VIP Section',
        100,
        100,
        'Closest seats to the field',
        2.5
    ),
    (
        'Normal Section',
        300,
        300,
        'Regular audience seats',
        1.0
    ),
    (
        'Premium Section',
        150,
        150,
        'Premium viewing experience',
        1.8
    );


INSERT INTO user(first_name,last_name,email,phone,password_hash,role_id,city_id,created_at)
VALUES
    (
        'Mahdie',
        'Davoudzade',
        'mahdie@example.com',
        '1111111111',
        'hashed_password_1',
        1,
        4,
        NOW()
    ),
    (
        'Zeinab',
        'Azorde',
        'zeinab@example.com',
        '2222222222',
        'hashed_password_2',
        1,
        4,
        NOW()
    ),
    (
        'Erfan',
        'Mamghanizade',
        'erfan@example.com',
        '3333333333',
        'hashed_password_3',
        1,
        4,
        NOW()
    ),
    (
        'Admin',
        'User',
        'admin@example.com',
        '9999999999',
        'hashed_password_admin',
        2,
        1,
        NOW()
    );


INSERT INTO `match`(home_team_id,away_team_id,sport_type_id,stadium_id,start_time,description)
VALUES
    (
        1,
        2,
        1,
        1,
        '2026-06-20 18:00:00',
        'Persepolis vs Esteghlal'
    ),
    (
        3,
        4,
        2,
        2,
        '2026-07-01 20:00:00',
        'Lakers vs Warriors'
    );


INSERT INTO seat(section_id,seat_number,status)
VALUES
    (
        1,
        'A1',
        'available'
    ),
    (
        1,
        'A2',
        'available'
    ),
    (
        2,
        'B1',
        'available'
    ),
    (
        2,
        'B2',
        'reserved'
    );


INSERT INTO ticket(match_id,seat_id,ticket_type_id,refund_policy_id,price,status)
VALUES
    (
        1,
        1,
        1,
        2,
        500,
        'available'
    ),
    (
        1,
        2,
        1,
        2,
        500,
        'reserved'
    ),
    (
        2,
        3,
        2,
        1,
        200,
        'available'
    );


INSERT INTO reserve(user_id,ticket_id,quantity,status,created_at,expire_at)
VALUES
    (
        1,
        2,
        1,
        'pending',
        NOW(),
        DATE_ADD(NOW(), INTERVAL 10 MINUTE)
    );


INSERT INTO payment( reservation_id,payment_status, amount,transaction_id,paid_at)
VALUES
    (
        1,
        'pending',
        500,
        'TXN123456',
        NOW()
    );


INSERT INTO report_about_ticket(ticket_id,reporter_id,responder_id,status,description,created_at)
VALUES
    (
        2,
        1,
        3,
        'pending',
        'Payment issue during reservation',
        NOW()
    );