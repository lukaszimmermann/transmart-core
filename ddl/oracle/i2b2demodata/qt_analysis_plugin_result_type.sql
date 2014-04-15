--
-- Type: TABLE; Owner: I2B2DEMODATA; Name: QT_ANALYSIS_PLUGIN_RESULT_TYPE
--
 CREATE TABLE "I2B2DEMODATA"."QT_ANALYSIS_PLUGIN_RESULT_TYPE" 
  (	"PLUGIN_ID" NUMBER(10,0), 
"RESULT_TYPE_ID" NUMBER(10,0), 
 CONSTRAINT "ANALYSIS_PLUGIN_RESULT_PK" PRIMARY KEY ("PLUGIN_ID", "RESULT_TYPE_ID")
 USING INDEX
 TABLESPACE "I2B2_DATA"  ENABLE
  ) SEGMENT CREATION DEFERRED
 TABLESPACE "I2B2_DATA" ;
