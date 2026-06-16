-- 1
select u.first_name, u.last_name
from User u
left join Reserve r
on u.user_id = r.user_id
where r.user_id is null;

-- 2
select u.first_name, u.last_name
from User u 
inner join Reserve r 
on u.user_id = r.user_id;


--3
select u.user_id, u.first_name, u.last_name, MONTH(p.paied_at) as month, YEAR(p.paied_at) as year , 
sum(p.amount) as total_price
from User u 
inner join Reserve r 
on r.user_id = u.user_id
inner join Payment p
on r.reserve_id = p.reservation_id
group by u.user_id, MONTH(p.paied_at), YEAR(p.paied_at), u.first_name,u.last_name;


-- 4
select u.first_name , u.last_name, u.email, u.phone, u.profile_image, u.city_id
from User u
inner join Reserve r 
on r.user_id = u.user_id
order by r.reserve_at desc 
limit 1;

-- 5
select u.phone as phone, u.email as email 
from User u
inner join Reserve r 
on r.user_id = u.user_id
inner join Payment p 
on r.reserve_id = p.reservation_id
group by u.user_id , u.phone, u.email
having sum(p.amount) > (
    select avg(total)
    from (
        select sum(p2.amount) as total
        from Reserve r2
        inner join Payment p2
        on r2.reserve_id = p2.reservation_id
        group by r2.user_id
    )t 
)


-- 6
select u.first_name as name, u.last_name as last_name , count(r.reserve_id) as total
from User u 
inner join Reserve r
on u.user_id = r.user_id
where r.reserve_at >= now() - interval 7 day 
group by 
u.user_id, u.first_name,u.last_name
order by total desc
limit 3;

-- 7
select DISTINCT c.name as city , u.user_id, u.first_name, u.last_name
from City c 
inner join Venue v
on c.city_id = v.city_id
inner join Stadium s 
on v.venue_id = s.venue_id
inner join Match m 
on s.stadium_id = m.stadium_id
inner join Ticket t 
on m.match_id = t.match_id
inner join Reserve r 
on t.ticket_id = r.ticket_id
inner join User u 
on u.user_id = r.user_id
where u.created_at =(
    select min(u2.created_at)
    from User u2
);

-- 8
select u.first_name as first_name , u.last_name as last_name
from User u
inner join Reserve r 
on r.user_id = u.user_id
group by u.user_id
having count(r.reserve_id) >= 2;

-- 9
select u.user_id, u.first_name, u.last_name
from User u
inner join Reserve r 
on r.user_id = u.user_id
inner join Ticket t 
on t.ticket_id = r.ticket_id
inner join Match m
on m.match_id = t.match_id
inner join sport_type s 
on s.sport_type_id = m.sport_type_id
where s.name = 'Football'
group by u.user_id, u.first_name, u.last_name
having count(t.ticket_id) <= 2;



select u.email, u.phone 
from User u 
inner join Reserve r 
on r.user_id = u.user_id
inner join Ticket t 
on t.ticket_id = r.ticket_id
inner join Match m
on m.match_id = t.match_id
group by u.user_id, u.email, u.phone
having count(DISTINCT m.sport_type_id) = (
    select count(*)
    from sport_type
);