-- سوال 1
select u.first_name, u.last_name
from user u
left join reserve r
on u.user_id = r.user_id
where r.user_id is null;


-- سوال 2
select distinct
    u.first_name,
    u.last_name
from user u
join reserve r
    on r.user_id=u.user_id
join payment p
    on p.reservation_id=r.reserve_id
where
    r.status='confirmed'
    and p.payment_status='completed';


-- سوال 3
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
where
    r.status = 'confirmed'
    and p.payment_status = 'completed'
group by
    u.user_id,
    u.first_name,
    u.last_name,
    month(p.paied_at),
    year(p.paied_at);
    
    
-- سوال 5
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
where
    r.status = 'confirmed'
    and p.payment_status = 'completed'
order by p.paied_at desc
limit 1;


-- سوال 6
select
    u.phone,
    u.email
from user u
inner join reserve r
    on r.user_id = u.user_id
inner join payment p
    on r.reserve_id = p.reservation_id
where
    r.status = 'confirmed'
    and p.payment_status = 'completed'
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
        where
            r2.status = 'confirmed'
            and p2.payment_status = 'completed'
        group by r2.user_id
    ) t
);

-- سوال 8
select
    u.first_name,
    u.last_name,
    count(p.payment_id) as total
from user u
inner join reserve r
    on u.user_id = r.user_id
inner join payment p
    on p.reservation_id = r.reserve_id
where
    p.paied_at >= now() - interval 7 day
    and r.status = 'confirmed'
    and p.payment_status = 'completed'
group by
    u.user_id,
    u.first_name,
    u.last_name
order by total desc
limit 3;


-- سوال 10
select
    c.name as city
from user u
inner join city c
    on u.city_id = c.city_id
inner join reserve r
    on r.user_id = u.user_id
inner join payment p
    on p.reservation_id = r.reserve_id
where
    r.status = 'confirmed'
    and p.payment_status = 'completed'
order by
    u.created_at asc,
    u.user_id asc
limit 1;

-- سوال 12 
select
    u.first_name,
    u.last_name
from user u
join reserve r
    on r.user_id=u.user_id
join payment p
    on p.reservation_id=r.reserve_id
where
    r.status='confirmed'
    and p.payment_status='completed'
group by
    u.user_id,
    u.first_name,
    u.last_name
having count(*)>=2;


-- سوال 13
select
    u.first_name,
    u.last_name
from user u
join reserve r
    on r.user_id=u.user_id
join payment p
    on p.reservation_id=r.reserve_id
join ticket t
    on t.ticket_id=r.ticket_id
join `match` m
    on m.match_id=t.match_id
join sport_type st
    on st.sport_type_id=m.sport_type_id
where
    st.name='Football'
    and r.status='confirmed'
    and p.payment_status='completed'
group by
    u.user_id,
    u.first_name,
    u.last_name
having count(*)<=2;


-- سوال 14
select
    u.email,
    u.phone
from user u
join reserve r
    on r.user_id=u.user_id
join payment p
    on p.reservation_id=r.reserve_id
join ticket t
    on t.ticket_id=r.ticket_id
join `match` m
    on m.match_id=t.match_id
where
    r.status='confirmed'
    and p.payment_status='completed'
group by
    u.user_id,
    u.email,
    u.phone
having count(distinct m.sport_type_id)=(
    select count(*)
    from sport_type
);


-- سوال 4
select
    c.name,
    u.first_name,
    u.last_name
from user u
join city c
    on c.city_id=u.city_id
join reserve r
    on r.user_id=u.user_id
join payment p
    on p.reservation_id=r.reserve_id
where
    r.status='confirmed'
    and p.payment_status='completed'
group by
    c.city_id,
    c.name,
    u.user_id,
    u.first_name,
    u.last_name
having count(*)=1;


-- سوال 7
select
    st.name,
    count(*) as sold_ticket
from payment p
join reserve r
    on r.reserve_id=p.reservation_id
join ticket t
    on t.ticket_id=r.ticket_id
join `match` m
    on m.match_id=t.match_id
join sport_type st
    on st.sport_type_id=m.sport_type_id
where
    r.status='confirmed'
    and p.payment_status='completed'
group by
    st.sport_type_id,
    st.name;


-- سوال 9
select
    c.name,
    count(*) as sold_ticket
from payment p
join reserve r
    on r.reserve_id=p.reservation_id
join ticket t
    on t.ticket_id=r.ticket_id
join `match` m
    on m.match_id=t.match_id
join stadium s
    on s.staduim_id=m.staduim_id
join venue v
    on v.venue_id=s.venue_id
join city c
    on c.city_id=v.city_id
where
    c.province='Tehran'
    and r.status='confirmed'
    and p.payment_status='completed'
group by
    c.city_id,
    c.name;


-- سوال 15
select
    t.*,
    p.paied_at
from ticket t
inner join reserve r
    on t.ticket_id = r.ticket_id
inner join payment p
    on r.reserve_id = p.reservation_id
where
    date(p.paied_at) = curdate()
    and r.status = 'confirmed'
    and p.payment_status = 'completed'
order by p.paied_at;


-- سوال 16
select
    t.ticket_id,
    count(*) as sold_count
from payment p
join reserve r
    on r.reserve_id=p.reservation_id
join ticket t
    on t.ticket_id=r.ticket_id
where
    r.status='confirmed'
    and p.payment_status='completed'
group by
    t.ticket_id
order by
    sold_count desc
limit 1 offset 1;

-- سوال 11
select
    u.first_name,
    u.last_name
from user u
inner join role r
on u.role_id = r.role_id
where r.role_name = 'support';