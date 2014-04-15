--
-- Type: VIEW; Owner: BIOMART; Name: CTD_EXPR_SOURCE_VIEW
--
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_EXPR_SOURCE_VIEW" ("ID", "REF_ARTICLE_PROTOCOL_ID", "EXPR_CHG_SOURCE_TYPE", "EXPR_CHG_TECHNIQUE", "EXPR_CHG_DESCRIPTION") AS 
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."EXPR_CHG_SOURCE_TYPE",v."EXPR_CHG_TECHNIQUE",v."EXPR_CHG_DESCRIPTION"
from 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
      			EXPR_CHG_SOURCE_TYPE,
			EXPR_CHG_TECHNIQUE,
			EXPR_CHG_DESCRIPTION
from ctd_full
where EXPR_CHG_SOURCE_TYPE is not null or EXPR_CHG_DESCRIPTION is not null
order by REF_ARTICLE_PROTOCOL_ID, EXPR_CHG_SOURCE_TYPE
) v
 
 
 
 
 
 ;
