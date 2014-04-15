--
-- Type: VIEW; Owner: BIOMART; Name: CTD_EXPR_AFTER_VIEW
--
  CREATE OR REPLACE FORCE VIEW "BIOMART"."CTD_EXPR_AFTER_VIEW" ("ID", "REF_ARTICLE_PROTOCOL_ID", "BIOMOLECULE_NAME", "EXPR_AFTER_TRTMT_PCT", "EXPR_AFTER_TRTMT_NUMBER", "EXPR_AFTERTRTMT_VALUEFOLD_MEAN", "EXPR_AFTER_TRTMT_SD", "EXPR_AFTER_TRTMT_SEM", "EXPR_AFTER_TRTMT_UNIT") AS 
  select rownum as ID, v."REF_ARTICLE_PROTOCOL_ID",v."BIOMOLECULE_NAME",v."EXPR_AFTER_TRTMT_PCT",v."EXPR_AFTER_TRTMT_NUMBER",v."EXPR_AFTERTRTMT_VALUEFOLD_MEAN",v."EXPR_AFTER_TRTMT_SD",v."EXPR_AFTER_TRTMT_SEM",v."EXPR_AFTER_TRTMT_UNIT"
from 
(
select distinct REF_ARTICLE_PROTOCOL_ID,
			BIOMOLECULE_NAME,
			EXPR_AFTER_TRTMT_PCT,
			EXPR_AFTER_TRTMT_NUMBER,
			EXPR_AFTERTRTMT_VALUEFOLD_MEAN,
			EXPR_AFTER_TRTMT_SD,
			EXPR_AFTER_TRTMT_SEM,
			EXPR_AFTER_TRTMT_UNIT
from ctd_full
where BIOMOLECULE_NAME is not null or EXPR_AFTERTRTMT_VALUEFOLD_MEAN is not null
order by REF_ARTICLE_PROTOCOL_ID, BIOMOLECULE_NAME
) v
 
 
 
 
 
 ;
