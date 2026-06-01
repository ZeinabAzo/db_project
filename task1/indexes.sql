CREATE INDEX user_email_idx ON User(email);
CREATE INDEX user_phone_idx ON User(phone);
CREATE INDEX user_city_idx ON User(city_id);

CREATE INDEX match_sport_time_idx ON `match`(sport_type_id, start_time);
CREATE INDEX match_home_team_time_idx ON `match`(home_team_id, start_time);
CREATE INDEX match_away_team_time_idx ON `match`(away_team_id, start_time);
CREATE INDEX match_stadium_time_idx ON `match`(staduim_id, start_time);