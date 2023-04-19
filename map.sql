WITH county_under_25 AS (
  SELECT
    vb_tsmart_county_code,
    COUNT(DISTINCT CASE WHEN vb_voterbase_age <= 25.0 THEN voterbase_id ELSE NULL END) AS voters_under_25
  FROM
    `prod-generation-data-176bffe6.viewers_dataset.GA_targetsmart_voter_base`
  GROUP BY 1  
)
SELECT
  cb.state_fips_code,
  cb.county_fips_code,
  cb.county_name,
  cb.geo_id,
  cb.county_geom,
  co.voters_under_25
FROM
  county_under_25 co
LEFT JOIN
  `bigquery-public-data.geo_us_boundaries.counties` cb
  ON ('13' || co.vb_tsmart_county_code) = cb.county_fips_code
WHERE
  cb.county_fips_code IS NOT NULL;
