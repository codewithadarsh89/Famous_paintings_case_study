-- Solve the below SQL problems using the Famous Paintings & Museum dataset:
-- ---------------------------------
-- ---------------------------------
create database case_study_questions;
use case_study_questions;
-- ---------------------------------
-- ---------------------------------
select * from artist;
select * from canvas_size;
select * from image_link;
select * from museum;
select * from museum_hours;
select * from product_size;
select * from subject;
select * from work;

# questions 

-- 1) Fetch all the paintings which are not displayed on any museums?
select work_id ,name  as paintings_with_no_museum from work
where museum_id is null;

-- 2) Are there museuems without any paintings?
select m.museum_name , w.work_id from museum as m
left join work as w
on m.museum_id = w.museum_id
where w.museum_id is null;
# there are no museums with no paintings

-- 3) How many paintings have an asking price of more than their regular price? 
select w.name  , count(distinct w.work_id) as total_paintings from work as w
join product_size as ps 
on w.work_id = ps.work_id
where ps.sale_price > ps.regular_price
group by w.name , w.work_id;

-- 4) Identify the paintings whose asking price is less than 50% of its regular price
select w.name,ps.sale_price , ps.regular_price , count(distinct w.work_id) as total_paintings from work as w
join product_size as ps
on w.work_id = ps.work_id 
where (ps.sale_price < (0.5*ps.regular_price))
group by w.name , w.work_id , ps.sale_price , ps.regular_price;

-- 5) Which canva size costs the most?
select cs.size_id , cs.label as name , ps.sale_price 
from canvas_size as cs
join product_size as ps
on cs.size_id = ps.size_id
where sale_price = (
select sale_price from product_size
order by sale_price desc
limit 1
);
-- 6) Identify the museums with invalid city information in the given dataset
select museum_name , city 
from museum
where city REGEXP '^[0-9]+$';

-- 7) Fetch the top 10 most famous painting subject
select subject , count(work_id) as total_paintings
from subject 
group by subject
order by total_paintings desc
limit 10;

-- 8) Identify the museums which are open on both Sunday and Monday. Display museum name, city.
select m.museum_name , m.city , mh.day from museum as m 
join museum_hours as mh 
on m.museum_id = mh.museum_id
where mh.day in ('Sunday','Monday')
group by m.museum_name , m.city , mh.day;

-- 9) How many museums are open every single day?
select * from museum;
select * from museum_hours;
select count(museum_id) as total_museum
from (
select museum_id 
from museum_hours
group by museum_id 
having count(distinct day) = 7
) as daily_museums;



-- 10) Which are the top 5 most popular museum? (Popularity is defined based on most no of paintings in a museum)

SELECT 
    m.museum_name,
    COUNT(w.work_id) AS total_paintings
FROM museum AS m
JOIN work AS w
    ON m.museum_id = w.museum_id
GROUP BY m.museum_id, m.museum_name
ORDER BY total_paintings DESC
LIMIT 5;

-- 11) Who are the top 5 most popular artist? (Popularity is defined based on most no of paintings done by an artist)

select artist.full_name , count(work_id) as total_paintings from artist 
join  work 
on artist.artist_id = work.artist_id
group by artist.artist_id , artist.full_name
order by total_paintings desc
limit 5;

-- 12) Display the 3 least popular canva sizes

select c.label,c.size_id , count(ps.work_id) as total_work from canvas_size as c
join product_size as ps
on c.size_id = ps.size_id
group by c.label , c.size_id
order by total_work desc;

-- 13) Which museum is open for the longest during a day. Dispay museum name, state and hours open and which day?
# creating a new column 'Duration'
set SQL_SAFE_UPDATES = 0;
UPDATE museum_hours
set duration = ABS(
time_to_sec(
timediff(
str_to_date(`open`,'%h:%i:%p'),
str_to_date(`close`,'%h:%i:%p')
)
)/3600
);
select m.museum_id , m.museum_name , m.city , m.state , mh.day ,mh.duration from museum as m
join museum_hours as mh
on m.museum_id = mh.museum_id
order by mh.duration desc
limit 1;

-- 14) Which museum has the most no of most popular painting style?

select m.museum_name , w.style , count(work_id) as total_paintings  from museum as m
join work as w
on m.museum_id = w.museum_id
where w.museum_id is not null
and style = 
(
select style from work
where style is not null
group by style 
order by count(work_id) desc
limit 1
)
group by m.museum_name , w.style
order by total_paintings desc
limit 1;

-- 25) Which are the 3 most popular and 3 least popular painting styles?
# top 3
select style , count(work_id) as total_paintings from work
where style is not null
group by style 
order by total_paintings desc
limit 3;
# bottom 3
select style , count(work_id) as total_paintings from work
where style is not null
group by style 
order by total_paintings asc
limit 3;
-- 22) Which artist has the most no of Portraits paintings outside USA?. Display artist_id, no of paintings and the artist nationality.
select w.artist_id,
count(distinct w.work_id) as total_portraits , m.country , 
s.subject from work as w
join subject as s
on w.work_id = s.work_id
join museum as m
on m.museum_id = w.museum_id
where s.subject = 'Portraits'
and m.country <> 'USA'
group by w.artist_id , s.subject , m.country
order by total_portraits desc;



