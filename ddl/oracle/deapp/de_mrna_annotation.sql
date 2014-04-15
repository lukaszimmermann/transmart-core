--
-- Type: TABLE; Owner: DEAPP; Name: DE_MRNA_ANNOTATION
--
 CREATE TABLE "DEAPP"."DE_MRNA_ANNOTATION" 
  (	"GPL_ID" VARCHAR2(100 BYTE), 
"PROBE_ID" VARCHAR2(100 BYTE), 
"GENE_SYMBOL" VARCHAR2(100 BYTE), 
"PROBESET_ID" NUMBER(38,0), 
"GENE_ID" NUMBER(18,0), 
"ORGANISM" VARCHAR2(200 BYTE), 
"DE_MRNA_ANNOTATION_ID" NUMBER(22,0)
  ) SEGMENT CREATION IMMEDIATE
 TABLESPACE "DEAPP" ;
--
-- Type: INDEX; Owner: DEAPP; Name: DE_MRNA_ANNOTATION_IDX1
--
CREATE INDEX "DEAPP"."DE_MRNA_ANNOTATION_IDX1" ON "DEAPP"."DE_MRNA_ANNOTATION" ("GPL_ID", "PROBE_ID")
TABLESPACE "INDX" ;
--
-- Type: INDEX; Owner: DEAPP; Name: DE_MRNA_ANNOTATION_IDX2
--
CREATE INDEX "DEAPP"."DE_MRNA_ANNOTATION_IDX2" ON "DEAPP"."DE_MRNA_ANNOTATION" ("GENE_ID", "PROBESET_ID")
TABLESPACE "DEAPP" ;
--
-- Type: SEQUENCE; Owner: DEAPP; Name: SEQ_DE_MRNA_ANNOTATION_ID
--
CREATE SEQUENCE  "DEAPP"."SEQ_DE_MRNA_ANNOTATION_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 263161 CACHE 20 NOORDER  NOCYCLE ;
--
-- Type: TRIGGER; Owner: DEAPP; Name: TRG_DE_MRNA_ANNOTATION_ID
--
  CREATE OR REPLACE TRIGGER "DEAPP"."TRG_DE_MRNA_ANNOTATION_ID" 
BEFORE INSERT ON de_mrna_annotation
FOR EACH ROW
BEGIN
SELECT seq_de_mrna_annotation_id.nextval
INTO :new.de_mrna_annotation_id
FROM dual;
END;
/
ALTER TRIGGER "DEAPP"."TRG_DE_MRNA_ANNOTATION_ID" ENABLE;
--
-- Type: INDEX; Owner: DEAPP; Name: DE_MRNA_ANNOTATION_INDEX1
--
CREATE INDEX "DEAPP"."DE_MRNA_ANNOTATION_INDEX1" ON "DEAPP"."DE_MRNA_ANNOTATION" ("PROBESET_ID")
TABLESPACE "DEAPP" ;
