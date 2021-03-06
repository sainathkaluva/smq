select
  domain(url) domain,
  count(url) count_url,
  sum(score) sum_score,
  avg(score) avg_score,
  stddev(score) stddev_score,
  min(score) min_score,
  nth(11, quantiles(score, 21)) median_score,
  max(score) max_score
from
  [fh-bigquery:hackernews.full_201510]
where
  type = 'story' and
  id is not null and
  url != '' and
  score >= 0
group by
  domain
order by
  sum_score desc
limit
  100
