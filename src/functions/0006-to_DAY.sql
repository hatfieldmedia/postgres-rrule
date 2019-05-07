CREATE OR REPLACE FUNCTION _rrule.to_DAY("ts" TIMESTAMP) RETURNS _rrule.DAY AS $$
  SELECT CAST(CASE to_char("ts", 'DY')
    WHEN 'MON' THEN 'MO'
    WHEN 'TUE' THEN 'TU'
    WHEN 'WED' THEN 'WE'
    WHEN 'THU' THEN 'TH'
    WHEN 'FRI' THEN 'FR'
    WHEN 'SAT' THEN 'SA'
    WHEN 'SUN' THEN 'SU'
  END as _rrule.DAY);
$$ LANGUAGE SQL IMMUTABLE;

CREATE CAST (TIMESTAMP AS _rrule.DAY)
  WITH FUNCTION _rrule.to_DAY(TIMESTAMP)
  AS IMPLICIT;