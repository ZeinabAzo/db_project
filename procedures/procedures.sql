DELIMITER //

-- 1. Retrieve purchased tickets for a specific user
CREATE PROCEDURE GetPurchasedTicketsByUser(IN p_user_id INT)
BEGIN
    SELECT ticket.ticket_id, ticket.price, `match`.start_time, stadium.name AS stadium_name
    FROM ticket
    JOIN reserve ON ticket.ticket_id = reserve.ticket_id
    JOIN `match` ON ticket.match_id = `match`.match_id
    JOIN stadium ON `match`.staduim_id = stadium.staduim_id
    WHERE reserve.user_id = p_user_id AND reserve.status = 'confirmed';
END //

-- 2. Retrieve cancelled reservations
CREATE PROCEDURE GetCancelledReservations(OUT p_total_cancelled INT)
BEGIN
    -- Using SET is often much safer and prevents syntax errors in some SQL editors
    SET p_total_cancelled = (SELECT COUNT(*) FROM reserve WHERE `status` = 'cancelled');
    
    SELECT reserve.reserve_id, reserve.created_at, `User`.first_name, `User`.last_name
    FROM reserve
    JOIN `User` ON reserve.user_id = `User`.user_id
    WHERE reserve.`status` = 'cancelled';
END //

-- 3. Search for information based on given criteria
CREATE PROCEDURE SearchUsersCriteria(IN p_first_name VARCHAR(255), IN p_email VARCHAR(255))
BEGIN
    IF p_first_name IS NOT NULL AND p_email IS NOT NULL THEN
        SELECT * FROM `User` WHERE first_name = p_first_name AND email = p_email;
    ELSEIF p_first_name IS NOT NULL THEN
        SELECT * FROM `User` WHERE first_name = p_first_name;
    ELSEIF p_email IS NOT NULL THEN
        SELECT * FROM `User` WHERE email = p_email;
    ELSE
        SELECT * FROM `User`;
    END IF;
END //

-- 4. Find users from the same city
CREATE PROCEDURE GetUsersByCity(IN p_city_name VARCHAR(255))
BEGIN
    SELECT `User`.first_name, `User`.last_name, `User`.email, city.name AS city_name
    FROM `User`
    JOIN city ON `User`.city_id = city.city_id
    WHERE city.name = p_city_name;
END //

-- 5. Retrieve tickets associated with a specific city
CREATE PROCEDURE GetTicketsByCity(IN p_city_name VARCHAR(255))
BEGIN
    SELECT ticket.ticket_id, ticket.price, `match`.match_data, venue.name AS venue_name
    FROM ticket
    JOIN `match` ON ticket.match_id = `match`.match_id
    JOIN stadium ON `match`.staduim_id = stadium.staduim_id
    JOIN venue ON stadium.venue_id = venue.venue_id
    JOIN city ON venue.city_id = city.city_id
    WHERE city.name = p_city_name;
END //

-- 6. Identify top buyers 
CREATE PROCEDURE IdentifyTopBuyers(OUT p_top_buyers_summary TEXT)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_user_name VARCHAR(500);
    DECLARE v_total_spent DECIMAL(10,2);
    
    DECLARE buyer_cursor CURSOR FOR
        SELECT CONCAT(`User`.first_name, ' ', `User`.last_name), SUM(payment.amount) AS total_spent
        FROM `User`
        JOIN reserve ON `User`.user_id = reserve.user_id
        JOIN payment ON reserve.reserve_id = payment.reservation_id
        WHERE payment.payment_status = 'completed'
        GROUP BY `User`.user_id
        ORDER BY total_spent DESC
        LIMIT 5;
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    SET p_top_buyers_summary = 'Top Buyers: ';

    OPEN buyer_cursor;

    buyer_loop: LOOP
        FETCH buyer_cursor INTO v_user_name, v_total_spent;
        
        IF done THEN
            LEAVE buyer_loop;
        END IF;
        
        SET p_top_buyers_summary = CONCAT(p_top_buyers_summary, v_user_name, ' ($', v_total_spent, ') | ');
    END LOOP;

    CLOSE buyer_cursor;
END //

-- 7. Retrieve cancelled tickets for a specific sport
CREATE PROCEDURE GetCancelledTicketsBySport(IN p_sport_name VARCHAR(255))
BEGIN
    SELECT ticket.ticket_id, ticket.price, `match`.match_data, sport_type.name AS sport_name
    FROM ticket
    JOIN `match` ON ticket.match_id = `match`.match_id
    JOIN sport_type ON `match`.sport_type_id = sport_type.sport_type_id
    WHERE sport_type.name = p_sport_name AND ticket.status = 'cancelled';
END //

-- 8. Find users with the highest number of reports
CREATE PROCEDURE GetTopReporters()
BEGIN
    SELECT `User`.user_id, `User`.first_name, `User`.last_name, 
           (SELECT COUNT(*) FROM report_about_ticket WHERE report_about_ticket.reporter_id = `User`.user_id) +
           (SELECT COUNT(*) FROM report_about_reserve WHERE report_about_reserve.reporter_id = `User`.user_id) AS total_reports
    FROM `User`
    HAVING total_reports > 0
    ORDER BY total_reports DESC;
END //

DELIMITER ;