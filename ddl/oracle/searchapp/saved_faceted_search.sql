--
-- Type: SEQUENCE; Owner: SEARCHAPP; Name: SEQ_SAVED_FACETED_SEARCH_ID
--
CREATE SEQUENCE  "SEARCHAPP"."SEQ_SAVED_FACETED_SEARCH_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 278 CACHE 20 NOORDER  NOCYCLE ;

--
-- Type: TABLE; Owner: SEARCHAPP; Name: SAVED_FACETED_SEARCH
--
 CREATE TABLE "SEARCHAPP"."SAVED_FACETED_SEARCH" 
  (	"SAVED_FACETED_SEARCH_ID" NUMBER NOT NULL ENABLE, 
"USER_ID" NUMBER NOT NULL ENABLE, 
"NAME" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
"KEYWORDS" VARCHAR2(4000 BYTE) NOT NULL ENABLE, 
"CREATE_DT" DATE DEFAULT sysdate, 
"MODIFIED_DT" DATE, 
"SEARCH_TYPE" VARCHAR2(50 BYTE) DEFAULT 'FACETED_SEARCH' NOT NULL ENABLE, 
"ANALYSIS_IDS" VARCHAR2(4000 BYTE), 
 CONSTRAINT "SAVED_FACETED_SEARCH_PKEY" PRIMARY KEY ("SAVED_FACETED_SEARCH_ID")
 USING INDEX
 TABLESPACE "BIOMART"  ENABLE, 
 CONSTRAINT "U_SAVED_SEARCH__USER_ID_NAME" UNIQUE ("USER_ID", "NAME")
 USING INDEX
 TABLESPACE "BIOMART"  ENABLE
  ) SEGMENT CREATION DEFERRED
 TABLESPACE "BIOMART" ;

--
-- Type: REF_CONSTRAINT; Owner: SEARCHAPP; Name: SAVED_FACETED_SEARCH_USER_ID
--
ALTER TABLE "SEARCHAPP"."SAVED_FACETED_SEARCH" ADD CONSTRAINT "SAVED_FACETED_SEARCH_USER_ID" FOREIGN KEY ("USER_ID")
 REFERENCES "SEARCHAPP"."SEARCH_AUTH_USER" ("ID") ENABLE;

--
-- Type: TRIGGER; Owner: SEARCHAPP; Name: TRG_SAVED_FACETED_SEARCH_ID
--
  CREATE OR REPLACE TRIGGER "SEARCHAPP"."TRG_SAVED_FACETED_SEARCH_ID" 
before insert on searchapp.saved_faceted_search
for each row begin
       	if inserting then
               	if :NEW.saved_faceted_search_id is null then
                       	select seq_saved_faceted_search_id.nextval into :NEW.saved_faceted_search_id from dual;
               	end if;
       	end if;
end;
/
ALTER TRIGGER "SEARCHAPP"."TRG_SAVED_FACETED_SEARCH_ID" ENABLE;
 
--
-- Type: TRIGGER; Owner: SEARCHAPP; Name: TRG_UPD_SAVED_FACETED_SEARCH
--
  CREATE OR REPLACE TRIGGER "SEARCHAPP"."TRG_UPD_SAVED_FACETED_SEARCH" 
before insert on searchapp.saved_faceted_search
for each row begin
       	if inserting then
               	if :NEW.modified_dt is null then
                       	NEW.modified_dt = sysdate;
               	end if;
       	end if;
end;
/
ALTER TRIGGER "SEARCHAPP"."TRG_UPD_SAVED_FACETED_SEARCH" ENABLE;
 
