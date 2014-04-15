--
-- Type: TABLE; Owner: BIOMART; Name: BIO_DISEASE
--
 CREATE TABLE "BIOMART"."BIO_DISEASE" 
  (	"BIO_DISEASE_ID" NUMBER(18,0) NOT NULL ENABLE, 
"DISEASE" NVARCHAR2(510) NOT NULL ENABLE, 
"CCS_CATEGORY" NVARCHAR2(510), 
"ICD10_CODE" NVARCHAR2(510), 
"MESH_CODE" NVARCHAR2(510), 
"ICD9_CODE" NVARCHAR2(510), 
"PREFERED_NAME" NVARCHAR2(510), 
"ETL_ID_RETIRED" NUMBER(18,0), 
"PRIMARY_SOURCE_CD" VARCHAR2(30 BYTE), 
"ETL_ID" VARCHAR2(50 BYTE), 
 CONSTRAINT "DISEASEDIM_PK" PRIMARY KEY ("BIO_DISEASE_ID")
 USING INDEX
 TABLESPACE "INDX"  ENABLE
  ) SEGMENT CREATION IMMEDIATE
 TABLESPACE "BIOMART" ;
--
-- Type: TRIGGER; Owner: BIOMART; Name: TRG_BIO_DISEASE_ID
--
  CREATE OR REPLACE TRIGGER "BIOMART"."TRG_BIO_DISEASE_ID" before insert on "BIO_DISEASE"    for each row begin     if inserting then       if :NEW."BIO_DISEASE_ID" is null then          select SEQ_BIO_DATA_ID.nextval into :NEW."BIO_DISEASE_ID" from dual;       end if;    end if; end;













/
ALTER TRIGGER "BIOMART"."TRG_BIO_DISEASE_ID" ENABLE;
