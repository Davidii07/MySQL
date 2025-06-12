SELECT * FROM instagram_data.`instagram-data-1`;


select  count(*) AS total_post,
avg(impressions) AS avg_impressions,
MAX(likes) AS max_likes,
MIN(likes) AS min_likes
from instagram_data.`instagram-data-1`;

select
sum
(CASE
 WHEN follows is null THEN 1 ELSE 0 
 END) 
 AS missing_follows,
 sum
 (case
 when plays is null then 1 else 0 end) AS missing_plays,
 sum
 (case when data_comment is null then 1 else 0 end) AS missing_data_comment
 from instagram_data.`instagram-data-1`;
 

SELECT post_type, count(*) AS post_count,
AVG (likes + saves + comments ) AS avg_engagement
from instagram_data.`instagram-data-1`
group by post_type
order by avg_engagement desc;

select post_id, likes, saves, impressions, round(likes / impressions, 2) AS like_ratio,
round(saves / impressions, 2) AS save_ratio
from instagram_data.`instagram-data-1`;

select date(Publish_time) AS post_date,
SUM(impressions) AS total_impressions,
SUM(likes) AS total_likes
from instagram_data.`instagram-data-1`
group by post_date
order by total_impressions desc;

select *
from instagram_data.`instagram-data-1`
where impressions > ( select avg(impressions) = 2 * stddev(impressions) from instagram_data.`instagram-data-1`)
or impressions < ( select avg(Impressions) -2 * stddev(Impressions) from instagram_data.`instagram-data-1`);
