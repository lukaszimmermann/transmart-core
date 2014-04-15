--
-- Type: TABLE; Owner: TM_LZ; Name: LZ_SRC_CLINICAL_DATA
--
 CREATE TABLE "TM_LZ"."LZ_SRC_CLINICAL_DATA" 
  (	"STUDY_ID" VARCHAR2(25 BYTE), 
"SITE_ID" VARCHAR2(50 BYTE), 
"SUBJECT_ID" VARCHAR2(20 BYTE), 
"VISIT_NAME" VARCHAR2(100 BYTE), 
"SAMPLE_TYPE" VARCHAR2(100 BYTE), 
"DATA_LABEL" VARCHAR2(500 BYTE), 
"DATA_VALUE" VARCHAR2(500 BYTE), 
"CATEGORY_CD" VARCHAR2(250 BYTE), 
"ETL_JOB_ID" NUMBER(22,0), 
"ETL_DATE" DATE, 
"CTRL_VOCAB_CODE" VARCHAR2(200 BYTE), 
"VISIT_DATE" VARCHAR2(200 BYTE)
  ) SEGMENT CREATION IMMEDIATE
 TABLESPACE "TRANSMART" ;
