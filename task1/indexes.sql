CREATE INDEX user_email_idx ON User(email);

CREATE INDEX user_phone_idx ON User(phone);

CREATE INDEX user_city_idx ON User(city_id);


CREATE INDEX match_sport_time_idx ON `match`(sport_type_id, start_time);

CREATE INDEX match_home_team_time_idx ON `match`(home_team_id, start_time);

CREATE INDEX match_away_team_time_idx ON `match`(away_team_id, start_time);


CREATE INDEX match_stadium_time_idx ON `match`(staduim_id, start_time);


CREATE INDEX ticket_type_idx ON ticket(ticket_type_id);

CREATE INDEX ticket_price_idx ON ticket(price);

CREATE INDEX ticket_seat_idx ON ticket(seat_id);

CREATE INDEX ticket_refund_policy_idx ON ticket(refund_policy_id);


CREATE INDEX ticket_match_status_type_idx ON ticket(match_id, status, ticket_type_id);

CREATE INDEX seat_section_idx ON seat(section_id);


CREATE INDEX section_remaining_capacity_idx ON section(remaining_capacity);



CREATE INDEX reserve_status_expire_idx ON reserve(status, expire_at);


CREATE INDEX reserve_user_created_idx ON reserve(user_id, created_at);


CREATE INDEX reserve_ticket_status_idx ON reserve(ticket_id, status);


CREATE INDEX payment_status_idx ON payment(payment_status);

CREATE INDEX payment_paid_at_idx ON payment(paied_at);


CREATE INDEX payment_reservation_idx ON payment(reservation_id);

CREATE INDEX payment_transaction_idx ON payment(transection_id);


CREATE INDEX report_ticket_ticket_idx ON report_about_ticket(ticket_id);

CREATE INDEX report_ticket_reporter_idx ON report_about_ticket(reporter_id);

CREATE INDEX report_ticket_responder_idx ON report_about_ticket(respoder_id);

CREATE INDEX report_ticket_status_created_idx ON report_about_ticket(status, created_at);