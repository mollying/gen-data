SELECT
voterbase_id,
ST_DISTANCE(
    ST_GEOGPOINT(vb_reg_longitude, vb_reg_latitude),
    ST_GEOGPOINT(-83.3758595, 33.956717)
 ) AS ev_location_distance
FROM
`prod-generation-data-176bffe6.viewers_dataset.GA_targetsmart_voter_base`
WHERE
vb_voterbase_age <= 25.0 AND
vb_tsmart_county_name = 'CLARKE';
