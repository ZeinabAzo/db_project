-- 1
select u.first_name, u.last_name
from user u
left join reserve r
on u.user_id = r.user_id
where r.user_id is null;


-- 2
select distinct u.first_name, u.last_name
from user u
inner join reserve r
on u.user_id = r.user_id;


-- 3
select
    u.user_id,
    u.first_name,
    u.last_name,
    month(p.paied_at) as month,
    year(p.paied_at) as year,
    sum(p.amount) as total_price
from user u
inner join reserve r
on r.user_id = u.user_id
inner join payment p
on r.reserve_id = p.reservation_id
group by
    u.user_id,
    u.first_name,
    u.last_name,
    month(p.paied_at),
    year(p.paied_at);


-- 4
select
    u.first_name,
    u.last_name,
    u.email,
    u.phone,
    u.profile_image,
    u.city_id
from user u
inner join reserve r
on r.user_id = u.user_id
inner join payment p
on p.reservation_id = r.reserve_id
order by p.paied_at desc
limit 1;


-- 5
select
    u.phone,
    u.email
from user u
inner join reserve r
on r.user_id = u.user_id
inner join payment p
on r.reserve_id = p.reservation_id
group by
    u.user_id,
    u.phone,
    u.email
having sum(p.amount) >
(
    select avg(total)
    from
    (
        select sum(p2.amount) as total
        from reserve r2
        inner join payment p2
        on r2.reserve_id = p2.reservation_id
        group by r2.user_id
    ) t
);


-- 6
select
    u.first_name,
    u.last_name,
    count(p.payment_id) as total
from user u
inner join reserve r
on u.user_id = r.user_id
inner join payment p
on p.reservation_id = r.reserve_id
where p.paied_at >= now() - interval 7 day
group by
    u.user_id,
    u.first_name,
    u.last_name
order by total desc
limit 3;


-- 7
select distinct
    c.name as city
from user u
inner join city c
on u.city_id = c.city_id
inner join reserve r
on r.user_id = u.user_id
where u.created_at =
(
    select min(u2.created_at)
    from user u2
    inner join reserve r2
    on r2.user_id = u2.user_id
);


-- 8
select
    u.first_name,
    u.last_name
from user u
inner join reserve r
on r.user_id = u.user_id
group by u.user_id
having count(r.reserve_id) >= 2;


-- 9
select
    u.user_id,
    u.first_name,
    u.last_name
from user u
inner join reserve r
    on r.user_id = u.user_id
inner join ticket t
    on t.ticket_id = r.ticket_id
inner join `match` m
    on m.match_id = t.match_id
inner join sport_type s
    on s.sport_type_id = m.sport_type_id
where s.name = 'Football'
group by
    u.user_id,
    u.first_name,
    u.last_name
having count(t.ticket_id) <= 2;


-- 10
select
    u.email,
    u.phone
from user u
inner join reserve r
    on r.user_id = u.user_id
inner join ticket t
    on t.ticket_id = r.ticket_id
inner join `match` m
    on m.match_id = t.match_id
group by
    u.user_id,
    u.email,
    u.phone
having count(distinct m.sport_type_id) =
(
    select count(*)
    from sport_type
);


-- 11
select
    c.name as city,
    u.user_id,
    u.first_name,
    u.last_name
from user u
inner join city c
on u.city_id = c.city_id
inner join reserve r
on r.user_id = u.user_id
group by
    c.city_id,
    c.name,
    u.user_id,
    u.first_name,
    u.last_name
having count(r.reserve_id) = 1;


-- 12
select
    st.name as sport,
    count(t.ticket_id) as sold_ticket
from sport_type st
inner join `match` m
    on st.sport_type_id = m.sport_type_id
inner join ticket t
    on m.match_id = t.match_id
inner join reserve r
    on t.ticket_id = r.ticket_id
group by
    st.sport_type_id,
    st.name;

-- 13
select
    c.name as city,
    count(t.ticket_id) as sold_ticket
from city c
inner join venue v
    on c.city_id = v.city_id
inner join stadium s
    on v.venue_id = s.venue_id
inner join `match` m
    on s.staduim_id = m.staduim_id
inner join ticket t
    on m.match_id = t.match_id
inner join reserve r
    on t.ticket_id = r.ticket_id
where c.province = 'tehran'
group by
    c.city_id,
    c.name;


-- 14
select
    t.*,
    p.paied_at
from ticket t
inner join reserve r
on t.ticket_id = r.ticket_id
inner join payment p
on r.reserve_id = p.reservation_id
where date(p.paied_at) = curdate()
order by p.paied_at;


-- 15
select
    description,
    count(*) as total_report
from report_about_ticket
where ticket_id =
(
    select ticket_id
    from report_about_ticket
    group by ticket_id
    order by count(*) desc
    limit 1
)
group by description;


-- 16
select
    t.ticket_id,
    count(*) as total_sale
from ticket t
inner join reserve r
on t.ticket_id = r.ticket_id
group by t.ticket_id
order by total_sale desc
limit 1 offset 1;


-- 17
select
    u.first_name,
    u.last_name
from user u
inner join role r
on u.role_id = r.role_id
where r.role_name = 'support';
