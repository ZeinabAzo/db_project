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