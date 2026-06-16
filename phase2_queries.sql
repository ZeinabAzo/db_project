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
select u.user_id, u.first_name, u.last_name, MONTH(p.paied_at) as month, YEAR(p.paied_at) as year  
sum(p.amount) as total_price
from User u 
inner join Reserve r 
on r.user_id = u.user_id
inner join Payment p
on r.reserve_id = p.reservation_id
group by u.user_id, MONTH(p.paied_at), YEAR(p.paied_at), u.first_name,u.last_name;