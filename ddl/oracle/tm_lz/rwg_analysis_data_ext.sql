--
-- Type: TABLE; Owner: TM_LZ; Name: RWG_ANALYSIS_DATA_EXT
--
 CREATE TABLE "TM_LZ"."RWG_ANALYSIS_DATA_EXT" 
  (	"ANALYSIS_ID" VARCHAR2(100 BYTE), 
"PROBESET" VARCHAR2(100 BYTE), 
"PREFERRED_PVALUE" VARCHAR2(100 BYTE), 
"RAW_PVALUE" VARCHAR2(100 BYTE), 
"ADJUSTED_PVALUE" VARCHAR2(100 BYTE), 
"FOLD_CHANGE" VARCHAR2(100 BYTE), 
"LSMEAN_1" VARCHAR2(100 BYTE), 
"LSMEAN_2" VARCHAR2(100 BYTE)
  ) SEGMENT CREATION DEFERRED
 TABLESPACE "TRANSMART" ;

