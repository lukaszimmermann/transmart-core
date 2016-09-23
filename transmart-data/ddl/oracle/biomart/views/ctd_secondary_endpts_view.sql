--
-- Type: VIEW; Owner: BIOMART; Name: CTD_SECONDARY_ENDPTS_VIEW
--
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_SECONDARY_ENDPTS_VIEW" ("ID", "REF_ARTICLE_PROTOCOL_ID", "SECONDARY_TYPE", "SECONDARY_TYPE_DEFINITION", "SECONDARY_TYPE_CHANGE", "SECONDARY_TYPE_TIME_PERIOD", "SECONDARY_TYPE_P_VALUE", "SECONDARY_TYPE_STAT_TEST") AS 
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."SECONDARY_TYPE",v."SECONDARY_TYPE_DEFINITION",v."SECONDARY_TYPE_CHANGE",v."SECONDARY_TYPE_TIME_PERIOD",v."SECONDARY_TYPE_P_VALUE",v."SECONDARY_TYPE_STAT_TEST"
from 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			SECONDARY_TYPE,
			SECONDARY_TYPE_DEFINITION,
			SECONDARY_TYPE_CHANGE,
			SECONDARY_TYPE_TIME_PERIOD,
			SECONDARY_TYPE_P_VALUE,
			SECONDARY_TYPE_STAT_TEST
from CTD_FULL
where SECONDARY_TYPE is not null or SECONDARY_TYPE_DEFINITION is not null
order by REF_ARTICLE_PROTOCOL_ID, SECONDARY_TYPE
) v
 
 
 
 
 
;
 