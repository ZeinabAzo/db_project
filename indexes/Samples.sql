-- ====================================================================
-- LEVEL 1: Base Tables (No Dependencies)
-- ====================================================================

-- TABLE: role
-- Why: Test both user types (regular spectators and system support)
-- Edge Cases: Different permission levels
INSERT INTO `role` (role_id, role_name, `desc`) VALUES
(1, 'spectator', 'Regular user who can buy and reserve tickets'),  -- Standard user role
(2, 'support_staff', 'Website support staff who manages disputes and system'),  -- Admin role
(3, 'venue_manager', 'Manager of specific venue/stadium for event organization'),  -- Additional role for scalability
(4, 'organizer', 'Event organizer who manages matches and tickets'),  -- Event planning role
(5, 'premium_member', 'Premium member with special discounts and benefits'),  -- VIP tier testing
(6, 'disabled_user', 'User with special accessibility needs'),  -- Edge case: accessibility requirements
(7, 'student', 'Student with special discount eligibility'),  -- Age-based role testing
(8, 'corporate_client', 'Corporate bulk ticket buyer'),  -- B2B testing
(9, 'banned_user', 'Previously active user who was banned'),  -- Status testing
(10, 'guest', 'Temporary guest user with limited access');  -- Guest checkout testing

-- TABLE: city
-- Why: Geographic distribution across Iran with proper province mapping
-- Edge Cases: Multiple cities in same province, Tehran, and border regions
INSERT INTO `city` (city_id, name, province) VALUES
(1, 'Tehran', 'Tehran'),  -- Capital city - highest traffic expected
(2, 'Karaj', 'Alborz'),  -- Suburban area - commuters
(3, 'Shiraz', 'Fars'),  -- Southern city - diverse demographics
(4, 'Isfahan', 'Isfahan'),  -- Central Iran - mid-tier traffic
(5, 'Tabriz', 'East Azerba ijan'),  -- Northern border - fewer events expected
(6, 'Mashhad', 'Razavi Khorasan'),  -- Religious city - special event considerations
(7, 'Ahvaz', 'Khuzestan'),  -- Hot climate - venue considerations
(8, 'Qom', 'Qom'),  -- Religious site - limited venues
(9, 'Rasht', 'Gilan'),  -- Rainy region - weather impacts
(10, 'Qazvin', 'Qazvin');  -- Small city - edge case for low traffic scenarios

-- TABLE: sport_type
-- Why: Cover all mentioned sports plus edge cases for future sports
-- Edge Cases: Different field types, spectator capacities, and rule sets
INSERT INTO `sport_type` (sport_type_id, name, `desc`, rules) VALUES
(1, 'Football', 'Professional football/soccer matches', '11 vs 11 players, 90 minutes'),  -- Primary sport
(2, 'Volleyball', 'Professional volleyball tournaments', '6 vs 6 players, 5 sets maximum'),  -- Indoor sport (capacity differs)
(3, 'Basketball', 'Professional basketball games', '5 vs 5 players, 4 quarters'),  -- Fast-paced sport
(4, 'Handball', 'Professional handball matches', '7 vs 7 players, 2 halves'),  -- Less common - edge case
(5, 'Badminton', 'Badminton championship events', '1v1 or 2v2 players, best of matches'),  -- Small audience
(6, 'Cycling', 'Professional cycling tours and events', 'Individual or team races'),  -- Outdoor event with route
(7, 'Swimming', 'Olympic-style swimming competitions', 'Individual events in pool'),  -- Unique venue type
(8, 'Athletics', 'Track and field championships', 'Sprint, jump, and throw events'),  -- Stadium events
(9, 'Tennis', 'Professional tennis tournaments', 'Single or double matches, best of sets'),  -- Court-based
(10, 'Esports', 'Professional esports tournaments', 'Video game competitions, LAN tournaments');  -- Modern sport - edge case

-- TABLE: team
-- Why: Create realistic team scenarios with different creation dates
-- Edge Cases: Teams created at different times, long-standing vs new teams
INSERT INTO `team` (team_id, name, `desc`, created_at) VALUES
(1, 'Persepolis F.C.', 'Iran''s most successful football club with 8 Asian titles', '2010-01-15 09:00:00'),  -- Established team
(2, 'Esteghlal F.C.', 'Historic Iranian football powerhouse', '2010-02-20 10:30:00'),  -- Major rival
(3, 'Sepahan F.C.', 'Isfahan-based professional football club', '2012-05-10 14:00:00'),  -- Regional team
(4, 'Foolad F.C.', 'Khuzestan province football club', '2011-03-25 08:00:00'),  -- Western team
(5, 'Saba Battery V.C.', 'Elite Iranian volleyball team', '2015-06-18 11:00:00'),  -- Different sport
(6, 'Iran National Basketball Team', 'National basketball team for international events', '2008-11-30 15:45:00'),  -- National team
(7, 'Shahr Arak Team', 'Up-and-coming football club', '2022-09-01 07:30:00'),  -- Newly created - recent date
(8, 'Persepolis Youth Academy', 'Youth team for development', '2018-04-12 09:15:00'),  -- Youth team
(9, 'Female Volleyball Team Iran', 'Women''s national volleyball team', '2010-08-22 16:00:00'),  -- Gender diversity
(10, 'Mixed Doubles Tennis Team', 'National tennis doubles team', '2020-12-05 13:20:00');  -- Unique composition

-- TABLE: refund_policy
-- Why: Different refund scenarios based on timing and event type
-- Edge Cases: No refund, partial refund, full refund at different cutoff times
INSERT INTO `refund_policy` (refund_policy_id, name, `desc`) VALUES
(1, 'Full Refund', 'Full refund available if cancelled 7 days before event'),  -- Generous policy
(2, 'Partial Refund 50%', '50% refund if cancelled 3-7 days before event'),  -- Mid-range refund
(3, 'Partial Refund 25%', '25% refund if cancelled 1-3 days before event'),  -- Minimal refund
(4, 'No Refund', 'No refund available after purchase, only exchange allowed'),  -- Non-refundable tickets
(5, 'Full Refund Until 24h', 'Full refund available until 24 hours before event'),  -- Flexible policy
(6, 'Conditional Full Refund', 'Full refund only if event is cancelled by organizer'),  -- Event-dependent
(7, 'Premium Exchange Only', 'Premium tickets can be exchanged for same tier only'),  -- Premium tier policy
(8, 'Weather Dependent Refund', '100% refund if event cancelled due to weather'),  -- Weather clause
(9, 'Senior Citizen Refund', 'Full refund up to 3 days before for seniors and disabled'),  -- Accessibility policy
(10, 'Group Booking Refund', 'Special refund policy for groups of 10+ tickets');  -- B2B policy

-- TABLE: section
-- Why: Various stadium sections with different capacities and price multipliers
-- Edge Cases: VIP vs regular, different capacity levels, price variations
INSERT INTO `section` (section_id, name, capacity, remaining_capacity, `desc`, price_multiplier) VALUES
(1, 'North Stand', 5000, 4200, 'North terrace, regular seating', 1.00),  -- Standard section
(2, 'South VIP', 800, 150, 'VIP section with premium seating and catering', 2.50),  -- Premium multiplier
(3, 'East Wheelchair', 120, 45, 'Accessible seating for disabled spectators', 1.00),  -- Accessibility section
(4, 'West Premium', 1200, 800, 'Premium section with better views', 1.75),  -- Above-average
(5, 'Corner Family', 600, 500, 'Family-friendly section with special amenities', 1.20),  -- Family tier
(6, 'Upper Deck', 3000, 1500, 'Budget section with distant views', 0.75),  -- Discount section - edge case
(7, 'VIP Lounge', 200, 0, 'Exclusive lounge with full catering service', 4.00),  -- Nearly full - critical
(8, 'Press Box', 50, 40, 'Reserved for media and broadcasters', 0.00),  -- Free section
(9, 'Stadium Suite', 100, 30, 'Private suite with bar and restaurant access', 3.50),  -- Executive level
(10, 'General Admission', 4000, 2100, 'Standing room only, general admission', 0.50);  -- Budget option

-- TABLE: ticket_type
-- Why: Different ticket tiers for various customer segments
-- Edge Cases: Physical vs digital, student vs full price, different delivery methods
INSERT INTO `ticket_type` (ticket_type_id, ticket_type, `desc`) VALUES
(1, 'Standard Adult', 'Full price ticket for adults'),  -- Standard tier
(2, 'Student Discount', 'Discounted ticket for students with valid ID'),  -- Student category
(3, 'Child Half Price', 'Half price ticket for children under 12'),  -- Age-based discount
(4, 'Senior Citizen', 'Discounted ticket for seniors over 65'),  -- Age-based discount (other direction)
(5, 'Disabled Accessible', 'Special ticket for disabled persons and one companion'),  -- Accessibility
(6, 'VIP Premium', 'Premium ticket with extra benefits and guaranteed seat'),  -- Premium tier
(7, 'Group Discount 10+', 'Discounted rate for groups of 10 or more tickets'),  -- Volume discount
(8, 'Early Bird', 'Discounted ticket for purchases made more than 30 days in advance'),  -- Time-based discount
(9, 'Last Minute', 'Discounted ticket for purchases within 24 hours of event'),  -- Urgency discount
(10, 'Standing Room Only', 'No assigned seat, standing area ticket');  -- Space-filling option

-- TABLE: feature
-- Why: Amenities and features available for different ticket types/sections
-- Edge Cases: Multiple features per ticket, accessibility, premium amenities
INSERT INTO `feature` (feature_id, name, `desc`) VALUES
(1, 'WiFi Access', 'Free high-speed WiFi throughout venue'),  -- Connectivity
(2, 'Covered Seating', 'Protected from weather elements'),  -- Weather protection
(3, 'Food Service', 'Food and beverage vendors available in section'),  -- Catering
(4, 'VIP Lounge Access', 'Access to exclusive VIP lounge with premium drinks'),  -- Premium amenity
(5, 'Parking Included', 'Free parking permit in venue parking lot'),  -- Parking convenience
(6, 'Wheelchair Accessible', 'Full wheelchair accessibility and companion seating'),  -- Accessibility
(7, 'Premium Restrooms', 'Access to upscale restroom facilities'),  -- Comfort amenity
(8, 'Parking Reserved', 'Reserved parking spot near entrance'),  -- Premium parking
(9, 'Early Entry', 'Entry to venue 30 minutes before general admission'),  -- Early access
(10, 'Post-Game Access', 'Access to post-game autograph and photo sessions');  -- Exclusive access

-- ====================================================================
-- LEVEL 2: Tables Depending on Level 1
-- ====================================================================

-- TABLE: User
-- Why: Diverse user base with different roles, cities, and statuses
-- Edge Cases: Active, inactive, banned users; different contact methods; new vs old users
INSERT INTO `User` (user_id, first_name, last_name, email, phone, passwowrd_hash, profile_image, `status`, created_at, updated_at, role_id, city_id) VALUES
(1, 'Mohammad', 'Rezaei', 'rezaei.m@email.com', '09121234567', SHA2('Password123!', 256), '/images/user1.jpg', 'active', '2020-01-15 08:00:00', '2024-06-17 10:30:00', 1, 1),  -- Active spectator in Tehran, long history
(2, 'Fatima', 'Hosseini', 'fatima.h@email.com', '09389876543', SHA2('SecurePass456!', 256), '/images/user2.jpg', 'active', '2019-06-20 14:30:00', '2024-06-16 15:45:00', 1, 1),  -- Active, frequent buyer
(3, 'Ali', 'Ahmadi', NULL, '09157891011', SHA2('MyPassword789!', 256), NULL, 'active', '2023-11-10 09:15:00', '2024-06-15 20:00:00', 1, 3),  -- Phone-only user in Shiraz, no email
(4, 'Sara', 'Javadi', 'sara.javadi@email.com', NULL, SHA2('Sara2024Pass!', 256), '/images/user4.jpg', 'active', '2024-01-05 11:00:00', '2024-06-10 12:30:00', 1, 2),  -- Email-only, new user
(5, 'Hassan', 'Karimi', 'hassan.k@email.com', '09167776666', SHA2('HasanSecure22!', 256), NULL, 'inactive', '2021-09-12 16:45:00', '2023-02-14 10:00:00', 1, 4),  -- Inactive user (no recent activity)
(6, 'Maryam', 'Behzadi', 'maryam.admin@email.com', '09191919191', SHA2('AdminPass2024!', 256), '/images/admin1.jpg', 'active', '2015-03-08 08:00:00', '2024-06-17 09:00:00', 2, 1),  -- Support staff, oldest user
(7, 'Reza', 'Sadegh', 'reza.s@email.com', '09123456789', SHA2('RezaPass!', 256), '/images/user7.jpg', 'banned', '2022-05-20 13:30:00', '2023-10-01 14:30:00', 1, 5),  -- Banned user (for testing restrictions)
(8, 'Leila', 'Moradi', 'leila.m@email.com', '09112233445', SHA2('LeilaSecure!', 256), '/images/user8.jpg', 'active', '2023-08-15 10:00:00', '2024-06-17 08:00:00', 5, 1),  -- Premium member in Tehran
(9, 'Keyvan', 'Faroghi', 'keyvan@corporate.com', '09998765432', SHA2('CorporatePass!', 256), '/images/user9.jpg', 'active', '2023-03-10 09:00:00', '2024-06-16 17:00:00', 8, 1),  -- Corporate client
(10, 'Nasrin', 'Ebrahimi', 'nasrin.student@email.com', '09134567890', SHA2('StudentPass24!', 256), '/images/user10.jpg', 'active', '2024-04-02 14:00:00', '2024-06-17 16:30:00', 7, 6);  -- Student user in Mashhad

-- TABLE: venue
-- Why: Different venue types and capacities across various cities
-- Edge Cases: Large stadiums, small venues, newly built, indoor vs outdoor
INSERT INTO `venue` (venue_id, `name`, address, `desc`, creates_at, city_id) VALUES
(1, 'Azadi Stadium', 'Azadi Square, Tehran', 'National football stadium, capacity 100,000+, hosts international matches', '1975-06-10 00:00:00', 1),  -- Historic venue
(2, 'Shahid Bakeri Sports Complex', 'Northern Tehran', 'Modern multi-sport facility with volleyball and basketball courts', '2005-03-15 00:00:00', 1),  -- Multi-purpose
(3, 'Habibi Indoor Hall', 'Tabriz Center', 'Indoor volleyball and basketball venue, capacity 6,000', '2010-09-20 00:00:00', 5),  -- Regional venue
(4, 'Imam Square Arena', 'Naqsh-e Jahan Square, Isfahan', 'Outdoor sports complex with historical significance', '2000-05-18 00:00:00', 4),  -- Historic location
(5, 'Ghadir Swimming Pool Complex', 'South Shiraz', 'Olympic-size swimming pool with diving facilities', '2008-11-25 00:00:00', 3),  -- Specialized venue
(6, 'Kasgargar Stadium', 'Karaj Downtown', 'Football stadium with 25,000 capacity, newly renovated', '2022-08-10 00:00:00', 2),  -- New venue
(7, 'Kish Indoor Sports Hall', 'Kish Island', 'Island-based sports venue with unique location, 8,000 capacity', '2018-01-30 00:00:00', 1),  -- Island location (edge case)
(8, 'Amir Kabir Gymnasium', 'Qom University Campus', 'University-based venue, primarily for local events', '2012-10-05 00:00:00', 8),  -- University venue (limited access)
(9, 'Ekbatan Outdoor Grounds', 'West Tehran', 'Large open-air ground for multiple sports', '1995-02-14 00:00:00', 1),  -- Outdoor, multiple sports
(10, 'Rasht Volleyball Hall', 'Gilan Province Center', 'Regional volleyball hub with 4,500 capacity', '2015-07-22 00:00:00', 9);  -- Regional facility

-- TABLE: seat
-- Why: Various seating configurations with different types and statuses
-- Edge Cases: Regular seats, accessible seats, blocked seats, premium seating
INSERT INTO `seat` (seat_id, `row_number`, seat_number, seat_type, is_active, section_id) VALUES
(1, 'A', '01', 'regular', 1, 1),  -- Standard seat in North Stand
(2, 'A', '02', 'regular', 1, 1),  -- Adjacent seat (for group bookings)
(3, 'B', '01', 'regular', 1, 1),  -- Next row
(4, 'A', '01', 'wheelchair', 1, 3),  -- Accessible seat in wheelchair section
(5, 'A', '02', 'companion', 1, 3),  -- Companion seat next to wheelchair
(6, 'VIP', '01', 'premium', 1, 2),  -- Premium seat in VIP section
(7, 'VIP', '02', 'premium', 1, 2),  -- Adjacent premium seat
(8, 'P', '50', 'premium', 0, 4),  -- Inactive/blocked seat (maintenance or defect)
(9, 'C', '15', 'regular', 1, 5),  -- Family section seat
(10, 'STANDING', '001', 'standing', 1, 10);  -- Standing room only ticket

-- ====================================================================
-- LEVEL 3-5: Dependent Tables
-- ====================================================================

-- TABLE: stadium (Level 3)
-- Why: Different stadiums with various capacities for different sports
-- Edge Cases: Old vs new, large vs small, specialized vs general
INSERT INTO `stadium` (staduim_id, name, capacity, `desc`, created_at, venue_id) VALUES
(1, 'Azadi Football Stadium', 100000, 'Main football stadium section of Azadi complex, international standard', '1975-06-10 00:00:00', 1),  -- Large, historic
(2, 'Azadi Secondary Field', 20000, 'Secondary pitch in Azadi for practice and smaller matches', '1975-06-10 00:00:00', 1),  -- Secondary facility
(3, 'Shahid Bakeri Volleyball Court', 6000, 'Olympic-size volleyball court with modern facilities', '2005-03-15 00:00:00', 2),  -- Specialized court
(4, 'Shahid Bakeri Basketball Arena', 4500, 'FIBA-standard basketball court with professional setup', '2005-03-15 00:00:00', 2),  -- FIBA compliant
(5, 'Ghadir Olympic Pool', 2500, 'Olympic swimming pool with spectator seating', '2008-11-25 00:00:00', 5),  -- Water sports (unique capacity)
(6, 'Habibi Indoor Hall', 6000, 'Multi-sport indoor facility in Tabriz', '2010-09-20 00:00:00', 3),  -- Regional
(7, 'Kasgargar Main Field', 25000, 'Recently renovated main football field, state-of-the-art', '2022-08-10 00:00:00', 6),  -- New, premium
(8, 'Imam Square Open Ground', 30000, 'Large outdoor space for various sports events', '2000-05-18 00:00:00', 4),  -- Outdoor
(9, 'Kish Island Sports Hall', 8000, 'Island venue with unique logistics challenges', '2018-01-30 00:00:00', 7),  -- Island (special case)
(10, 'Rasht Regional Volleyball', 4500, 'Regional hub for volleyball in northern Iran', '2015-07-22 00:00:00', 10);  -- Regional

-- TABLE: match (Level 4)
-- Why: Various match scenarios covering different sports and statuses
-- Edge Cases: Past matches, upcoming matches, cancelled, in-progress, different times
INSERT INTO `match` (match_id, match_data, start_time, created_at, `status`, updated_at, `desc`, sport_type_id, home_team_id, away_team_id, staduim_id) VALUES
(1, 'Persepolis vs Esteghlal - Derby Match', '2024-07-15 19:00:00', '2024-06-01 10:00:00', 'scheduled', '2024-06-15 14:30:00', 'Historic Tehran Derby, heavily anticipated', 1, 1, 2, 1),  -- High-profile match
(2, 'Sepahan vs Foolad', '2024-06-18 17:30:00', '2024-06-01 10:00:00', 'completed', '2024-06-18 20:45:00', 'Regional match completed', 1, 3, 4, 8),  -- Past match
(3, 'Iran National Basketball vs Asian Opponent', '2024-08-20 18:00:00', '2024-05-15 09:00:00', 'scheduled', '2024-06-16 11:00:00', 'International basketball championship qualifier', 3, 6, NULL, 2),  -- International match (away team TBD for single-team match)
(4, 'Saba Battery vs Iranian Women Volleyball', '2024-07-22 15:00:00', '2024-06-01 10:00:00', 'cancelled', '2024-06-10 12:00:00', 'Cancelled due to injury of key player', 2, 5, 9, 3),  -- Cancelled event
(5, 'Persepolis Youth vs Esteghlal Youth Academy', '2024-06-20 16:00:00', '2024-06-15 10:00:00', 'scheduled', '2024-06-15 10:00:00', 'Youth league match', 1, 8, NULL, 1),  -- Youth match
(6, 'Mixed Doubles Tennis Championship - Semifinal', '2024-07-05 14:00:00', '2024-05-20 09:00:00', 'completed', '2024-07-05 16:30:00', 'National tennis championship semifinal', 9, 10, NULL, 5),  -- Completed tennis match
(7, 'Cycling Tour Stage 3', '2024-08-10 08:00:00', '2024-07-01 10:00:00', 'scheduled', '2024-06-16 15:00:00', 'Multi-day cycling tour stage', 6, NULL, NULL, 9),  -- Outdoor event with no team (cycling)
(8, 'Esports Championship Final - CS:GO', '2024-07-30 20:00:00', '2024-06-01 10:00:00', 'scheduled', '2024-06-17 09:00:00', 'Professional esports championship final', 10, NULL, NULL, 2),  -- Esports (modern edge case)
(9, 'Sepahan vs Esteghlal', '2024-06-25 19:30:00', '2024-06-10 10:00:00', 'postponed', '2024-06-15 14:00:00', 'Match postponed due to weather forecast', 1, 3, 2, 4),  -- Postponed status
(10, 'Tabriz Club vs Local Regional Team', '2024-09-05 17:00:00', '2024-06-15 10:00:00', 'scheduled', '2024-06-17 08:00:00', 'Early season match with new team', 1, NULL, NULL, 6);  -- Future match with flexible teams

-- TABLE: ticket (Level 5)
-- Why: Tickets in various states and price points
-- Edge Cases: Available, sold out, cancelled, different prices, different statuses
INSERT INTO `ticket` (ticket_id, price, `status`, created_at, updated_at, match_id, seat_id, ticket_type_id, refund_policy_id) VALUES
(1, 450000.00, 'available', '2024-06-01 10:00:00', '2024-06-17 08:00:00', 1, 1, 1, 1),  -- Available regular ticket
(2, 350000.00, 'available', '2024-06-01 10:00:00', '2024-06-17 08:00:00', 1, 2, 10, 1),  -- Standing room available
(3, 1200000.00, 'available', '2024-06-01 10:00:00', '2024-06-17 08:00:00', 1, 6, 6, 1),  -- VIP premium ticket
(4, 225000.00, 'sold_out', '2024-06-01 10:00:00', '2024-06-17 08:00:00', 1, 3, 2, 1),  -- Already sold
(5, 350000.00, 'cancelled', '2024-06-02 10:00:00', '2024-06-10 14:30:00', 2, 4, 5, 4),  -- Cancelled ticket
(6, 1800000.00, 'available', '2024-05-20 10:00:00', '2024-06-17 08:00:00', 3, 7, 6, 5),  -- Premium international match
(7, 0.00, 'available', '2024-06-01 10:00:00', '2024-06-17 08:00:00', 3, NULL, 1, 6),  -- Press/media ticket (free)
(8, 180000.00, 'available', '2024-06-01 10:00:00', '2024-06-17 08:00:00', 4, 5, 3, 3),  -- Child ticket (half price) in cancelled match
(9, 600000.00, 'available', '2024-06-01 10:00:00', '2024-06-17 08:00:00', 5, NULL, 1, 1),  -- Youth league ticket
(10, 280000.00, 'available', '2024-06-15 10:00:00', '2024-06-17 08:00:00', 10, 10, 9, 2);  -- Last-minute discount ticket

-- ====================================================================
-- LEVEL 6: More Complex Tables
-- ====================================================================

-- TABLE: ticket_feature (Level 6)
-- Why: Different combinations of features with tickets
-- Edge Cases: Multiple features per ticket, premium vs standard
INSERT INTO `ticket_feature` (feature_id, ticket_id, key_value) VALUES
(2, 1, 'covered_north_stand'),  -- Regular ticket with weather coverage
(3, 2, 'food_vendors'),  -- Standing room with catering access
(4, 3, 'vip_lounge'),  -- VIP ticket with lounge access
(4, 3, 'parking_reserved'),  -- VIP also includes parking
(6, 5, 'wheelchair_accessible'),  -- Accessible ticket
(1, 6, 'wifi_international_match'),  -- International match has WiFi
(8, 6, 'vip_parking'),  -- Premium parking for international
(7, 3, 'premium_restrooms'),  -- VIP restroom access
(5, 7, 'parking_included'),  -- Media ticket includes parking
(9, 9, 'early_entry');  -- Youth match early entry feature

-- TABLE: reserve (Level 6)
-- Why: Reservations in various states with different timing
-- Edge Cases: Pending, confirmed, cancelled, about to expire, expired
INSERT INTO `reserve` (reserve_id, expire_at, quntaty, created_at, reserve_at, total_price, updated_at, `status`, user_id, ticket_id) VALUES
(1, '2024-06-17 11:00:00', 1, '2024-06-17 10:00:00', '2024-06-17 10:05:00', 450000.00, '2024-06-17 10:05:00', 'pending', 1, 1),  -- Active pending reservation
(2, '2024-06-17 10:30:00', 2, '2024-06-17 09:00:00', '2024-06-17 09:10:00', 700000.00, '2024-06-17 09:10:00', 'pending', 2, 2),  -- About to expire (CRITICAL)
(3, '2024-06-15 15:00:00', 1, '2024-06-15 14:00:00', '2024-06-15 14:15:00', 1200000.00, '2024-06-15 18:00:00', 'confirmed', 8, 3),  -- Confirmed reservation
(4, '2024-06-10 18:00:00', 1, '2024-06-10 17:00:00', '2024-06-10 17:20:00', 180000.00, '2024-06-10 19:00:00', 'cancelled', 3, 8),  -- Cancelled (already expired)
(5, '2024-06-18 14:00:00', 3, '2024-06-17 13:00:00', '2024-06-17 13:30:00', 1680000.00, '2024-06-17 13:30:00', 'pending', 9, 6),  -- Corporate bulk reservation
(6, '2024-06-16 20:00:00', 1, '2024-06-16 19:00:00', '2024-06-16 19:10:00', 600000.00, '2024-06-16 21:00:00', 'cancelled', 4, 9),  -- Cancelled before expiry
(7, NULL, 1, '2024-06-14 10:00:00', '2024-06-14 10:15:00', 1800000.00, '2024-06-14 11:00:00', 'confirmed', 2, 6),  -- Confirmed, no expiry (already paid)
(8, '2024-06-17 16:30:00', 2, '2024-06-17 15:30:00', '2024-06-17 15:45:00', 560000.00, '2024-06-17 15:45:00', 'pending', 4, 10),  -- Recent pending
(9, '2024-06-13 19:00:00', 1, '2024-06-13 18:00:00', '2024-06-13 18:20:00', 280000.00, '2024-06-13 20:00:00', 'cancelled', 5, 2),  -- Inactive user's cancelled reservation
(10, '2024-06-19 12:00:00', 4, '2024-06-17 11:00:00', '2024-06-17 11:20:00', 1800000.00, '2024-06-17 11:20:00', 'pending', 9, 3);  -- Large group pending

-- TABLE: report_about_ticket (Level 6)
-- Why: Various types of ticket-related issues with different statuses
-- Edge Cases: New reports, resolved, in-progress, different issue types
INSERT INTO `report_about_ticket` (report_id, description, `status`, created_at, updated_at, respond, respoder_id, ticket_id, reporter_id) VALUES
(1, 'Ticket price seems higher than advertised price on website', 'pending', '2024-06-16 14:00:00', '2024-06-16 14:00:00', NULL, NULL, 1, 1),  -- Price discrepancy
(2, 'Seat location does not match the ticket description', 'in_progress', '2024-06-15 10:30:00', '2024-06-17 08:00:00', 'We are investigating the seating chart mismatch', 6, 3, 2),  -- Seating issue (in progress)
(3, 'Event was suddenly cancelled but no refund issued', 'resolved', '2024-06-10 09:00:00', '2024-06-13 16:30:00', 'Full refund has been processed to your account', 6, 8, 3),  -- Resolved refund issue
(4, 'Website crashed during checkout, payment charged twice', 'in_progress', '2024-06-14 11:45:00', '2024-06-17 07:00:00', 'Investigating duplicate charge, investigating payment records', 6, 4, 8),  -- Duplicate charge (serious)
(5, 'Cannot access ticket after purchase, only QR code broken', 'pending', '2024-06-17 09:15:00', '2024-06-17 09:15:00', NULL, NULL, 6, 9),  -- Recent technical issue
(6, 'Accessibility features mentioned in ticket not available at venue', 'resolved', '2024-06-12 13:20:00', '2024-06-14 10:00:00', 'Venue manager contacted, facilities confirmed available. Please contact venue staff upon arrival.', 6, 5, 4),  -- Accessibility issue
(7, 'Discount code not applied to my purchase', 'pending', '2024-06-16 15:45:00', '2024-06-16 15:45:00', NULL, NULL, 2, 1),  -- Discount issue
(8, 'Event rescheduled but I was not informed', 'in_progress', '2024-06-11 16:00:00', '2024-06-15 12:00:00', 'Checking notification system for why alert was not sent', 6, 9, 3),  -- Communication failure
(9, 'Ticket is counterfeit according to venue security', 'in_progress', '2024-06-17 17:00:00', '2024-06-17 17:00:00', 'Urgent investigation initiated, contacting payment processor', 6, 7, 2),  -- Fraud case (critical)
(10, 'Minor printing error on ticket, not affecting usability', 'resolved', '2024-06-13 12:30:00', '2024-06-13 14:00:00', 'Printing error confirmed but ticket is valid. No action needed.', 6, 10, 4);  -- Minor issue

-- ====================================================================
-- LEVEL 7: Payment and Reporting Tables
-- ====================================================================

-- TABLE: payment (Level 7)
-- Why: Various payment scenarios covering different methods and statuses
-- Edge Cases: Successful, failed, pending, different payment methods
INSERT INTO `payment` (payment_id, amount, payment_status, payment_metod, transection_id, paied_at, reservation_id) VALUES
(1, 450000.00, 'completed', 'credit_card', 'TXN20240615001234', '2024-06-15 14:30:00', 1),  -- Successful credit card
(2, 700000.00, 'pending', 'bank_transfer', NULL, NULL, 2),  -- Bank transfer pending (should be urgent)
(3, 1200000.00, 'completed', 'credit_card', 'TXN20240614005678', '2024-06-14 18:45:00', 3),  -- VIP ticket payment completed
(4, 180000.00, 'failed', 'credit_card', 'TXN20240610002341', NULL, 4),  -- Failed transaction (card declined)
(5, 1680000.00, 'pending', 'paypal', 'PP20240617CORP999', NULL, 5),  -- Corporate PayPal payment pending
(6, 600000.00, 'failed', 'bank_transfer', 'BANK20240616999', NULL, 6),  -- Bank transfer failed (wrong account?)
(7, 1800000.00, 'completed', 'credit_card', 'TXN20240614011111', '2024-06-14 11:00:00', 7),  -- International match payment
(8, 280000.00, 'completed', 'credit_card', 'TXN20240617000111', '2024-06-17 00:30:00', 8),  -- Last-minute payment
(9, 280000.00, 'pending', 'credit_card', 'TXN20240617003333', NULL, 10),  -- Pending recent payment
(10, 360000.00, 'completed', 'credit_card', 'TXN20240613004444', '2024-06-13 19:15:00', NULL);  -- Payment without associated reservation (orphan record)

-- TABLE: report_about_reserve (Level 7)
-- Why: Issues related to reservations with various statuses
-- Edge Cases: Expiration issues, system errors, cancellation disputes
INSERT INTO `report_about_reserve` (report_id, description, `status`, created_at, updated_at, respond, responder_id, reserv_id, reporter_id) VALUES
(1, 'Reservation expired without giving me enough time to pay', 'pending', '2024-06-17 11:30:00', '2024-06-17 11:30:00', NULL, NULL, 2, 2),  -- Time limit complaint (CRITICAL)
(2, 'System cancelled my reservation unexpectedly', 'in_progress', '2024-06-15 15:00:00', '2024-06-16 10:00:00', 'Reviewing system logs for the cancellation trigger', 6, 4, 3),  -- System error investigation
(3, 'Cannot cancel my reservation through the app', 'resolved', '2024-06-13 12:45:00', '2024-06-13 14:30:00', 'Cancellation processed successfully. Refund will be issued within 3-5 business days.', 6, 6, 4),  -- Technical issue resolved
(4, 'Price changed after I reserved the tickets', 'pending', '2024-06-16 16:20:00', '2024-06-16 16:20:00', NULL, NULL, 3, 8),  -- Price change complaint
(5, 'Reservation shows as confirmed but payment shows as pending', 'in_progress', '2024-06-14 13:15:00', '2024-06-17 09:00:00', 'Data mismatch investigation in progress, payment verification underway', 6, 3, 2),  -- Data inconsistency (serious)
(6, 'Got charged twice for the same reservation', 'in_progress', '2024-06-11 10:00:00', '2024-06-15 14:00:00', 'Investigating duplicate charge, credit card company contacted', 6, 5, 9),  -- Duplicate charge
(7, 'Received no confirmation email after reserving', 'resolved', '2024-06-17 08:00:00', '2024-06-17 08:30:00', 'Confirmation email resent. Please check spam folder if not received.', 6, 1, 1),  -- Email delivery issue
(8, 'Cannot proceed to payment, stuck at confirmation page', 'pending', '2024-06-17 09:45:00', '2024-06-17 09:45:00', NULL, NULL, 10, 9),  -- Checkout flow issue
(9, 'Colleague says reservation never existed but I got charged', 'in_progress', '2024-06-12 11:00:00', '2024-06-16 15:00:00', 'Database mismatch detected, investigating payment and reservation records', 6, 5, 9),  -- Account synchronization issue
(10, 'Reservation shows different amount than what I agreed to pay', 'pending', '2024-06-16 17:30:00', '2024-06-16 17:30:00', NULL, NULL, 5, 9);  -- Price dispute

-- ====================================================================
-- LEVEL 8: Final Tables
-- ====================================================================

-- TABLE: refund (Level 8)
-- Why: Various refund scenarios with different statuses and reasons
-- Edge Cases: Approved refunds, declined refunds, different amounts
INSERT INTO `refund` (refund_id, amount, `status`, reson, refunded_at, payment_id) VALUES
(1, 450000.00, 'processed', 'User cancelled reservation 6 days before event', '2024-06-16 10:30:00', 1),  -- Processed refund
(2, 350000.00, 'requested', 'User requesting refund due to schedule conflict', NULL, 4),  -- Pending review
(3, 600000.00, 'processed', 'Event cancelled by organizer due to bad weather', '2024-06-17 09:00:00', 6),  -- Event cancellation refund
(4, 1800000.00, 'declined', 'Refund request outside 24-hour policy window', NULL, 7),  -- Policy violation
(5, 280000.00, 'processed', 'Payment method error, duplicate charge correction', '2024-06-17 08:30:00', 8),  -- Error correction
(6, 0.00, 'requested', 'Requesting exchange instead of refund for different event', NULL, 3),  -- Exchange instead of refund
(7, 180000.00, 'processed', 'Disability accessibility not available at venue', '2024-06-15 14:00:00', 4),  -- Accessibility issue refund
(8, 360000.00, 'processed', 'Customer error - booked wrong date, refunded minus 10% fee', '2024-06-14 16:45:00', 10),  -- Partial refund with fee
(9, 1680000.00, 'requested', 'Corporate client requesting group refund due to scheduling', NULL, 5),  -- Group refund request
(10, 700000.00, 'declined', 'Bank transfer refund request outside deadline', NULL, 2);  -- Declined old request

