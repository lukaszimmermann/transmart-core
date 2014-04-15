--
-- Type: TABLE; Owner: TM_LZ; Name: LT_METABOLOMIC_ANNOTATION
--
 CREATE TABLE "TM_LZ"."LT_METABOLOMIC_ANNOTATION" 
  (	"GPL_ID" VARCHAR2(20 BYTE), 
"BIOCHEMICAL_NAME" VARCHAR2(200 BYTE), 
"HMDB_ID" VARCHAR2(20 BYTE), 
"SUPER_PATHWAY" VARCHAR2(200 BYTE), 
"SUB_PATHWAY" VARCHAR2(200 BYTE)
  ) SEGMENT CREATION IMMEDIATE
 TABLESPACE "TRANSMART" ;
