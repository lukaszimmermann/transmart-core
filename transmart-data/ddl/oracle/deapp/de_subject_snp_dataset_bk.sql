--
-- Type: TABLE; Owner: DEAPP; Name: DE_SUBJECT_SNP_DATASET_BK
--
 CREATE TABLE "DEAPP"."DE_SUBJECT_SNP_DATASET_BK" 
  (	"SUBJECT_SNP_DATASET_ID" NUMBER(22,0), 
"DATASET_NAME" VARCHAR2(255 BYTE), 
"CONCEPT_CD" VARCHAR2(255 BYTE), 
"PLATFORM_NAME" VARCHAR2(255 BYTE), 
"TRIAL_NAME" VARCHAR2(255 BYTE), 
"PATIENT_NUM" NUMBER, 
"TIMEPOINT" VARCHAR2(255 BYTE), 
"SUBJECT_ID" VARCHAR2(255 BYTE), 
"SAMPLE_TYPE" VARCHAR2(255 BYTE), 
"PAIRED_DATASET_ID" NUMBER(22,0), 
"PATIENT_GENDER" VARCHAR2(1 BYTE)
  ) SEGMENT CREATION IMMEDIATE
 TABLESPACE "TRANSMART" ;
