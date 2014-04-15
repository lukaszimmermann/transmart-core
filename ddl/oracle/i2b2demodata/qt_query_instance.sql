--
-- Type: TABLE; Owner: I2B2DEMODATA; Name: QT_QUERY_INSTANCE
--
 CREATE TABLE "I2B2DEMODATA"."QT_QUERY_INSTANCE" 
  (	"QUERY_INSTANCE_ID" NUMBER(5,0), 
"QUERY_MASTER_ID" NUMBER(5,0), 
"USER_ID" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
"GROUP_ID" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
"BATCH_MODE" VARCHAR2(50 BYTE), 
"START_DATE" DATE NOT NULL ENABLE, 
"END_DATE" DATE, 
"STATUS_TYPE_ID" NUMBER(5,0), 
"DELETE_FLAG" VARCHAR2(3 BYTE), 
"MESSAGE" CLOB
  ) SEGMENT CREATION IMMEDIATE
 TABLESPACE "I2B2_DATA" 
LOB ("MESSAGE") STORE AS BASICFILE (
 TABLESPACE "I2B2_DATA" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
 NOCACHE LOGGING ) ;
--
-- Type: INDEX; Owner: I2B2DEMODATA; Name: QT_IDX_QI_UGID
--
CREATE INDEX "I2B2DEMODATA"."QT_IDX_QI_UGID" ON "I2B2DEMODATA"."QT_QUERY_INSTANCE" ("USER_ID", "GROUP_ID")
TABLESPACE "I2B2_DATA" ;
--
-- Type: INDEX; Owner: I2B2DEMODATA; Name: QT_IDX_QI_MSTARTID
--
CREATE INDEX "I2B2DEMODATA"."QT_IDX_QI_MSTARTID" ON "I2B2DEMODATA"."QT_QUERY_INSTANCE" ("QUERY_MASTER_ID", "START_DATE")
TABLESPACE "I2B2_DATA" ;
