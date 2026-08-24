-- Xom Data · Showtime count and average ticket price per film
-- Problem: https://xomdata.com/practice/medium-join-076
-- Solved: 2026-08-24

with pre as (
select movie_name, genres,
count(s.id) as showtime_count,
round(avg(ticket_price), 0) as avg_ticket_price,
DENSE_RANK() over(PARTITION BY genres order by avg(ticket_price) desc) as rank_in_genre,
max(movie_name) as top_movie_in_genre
from movies m
join showtimes s on m.id = s.movie_id
group by movie_name, genres
)

select movie_name, genres, showtime_count, avg_ticket_price, rank_in_genre,
FIRST_VALUE(movie_name) OVER (PARTITION BY genres ORDER BY avg_ticket_price DESC) AS top_movie_in_genre
from pre
order by genres, rank_in_genre, movie_name;
