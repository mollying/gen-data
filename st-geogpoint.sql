SELECT
  voterbase_id,
  ST_GEOGPOINT(vb_reg_longitude, vb_reg_latitude) AS voter_coord
FROM `prod-generation-data-176bffe6.viewers_dataset.GA_targetsmart_voter_base'
WHERE
  vb_voterbase_age <= 25.0 AND
  vb_tsmart_county_name = 'CLARKE';
