--------------------------------------------------------
--  Arquivo criado - Quinta-feira-Novembro-17-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table AMBIENTE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AMBIENTE" 
   (	"ID_AMB" NUMBER(*,0), 
	"NOME_AMB" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.AMBIENTE
SET DEFINE OFF;
Insert into SYSTEM.AMBIENTE (ID_AMB,NOME_AMB) values ('1','Interno');
Insert into SYSTEM.AMBIENTE (ID_AMB,NOME_AMB) values ('2','Externo');
Insert into SYSTEM.AMBIENTE (ID_AMB,NOME_AMB) values ('3','H�brido');
Insert into SYSTEM.AMBIENTE (ID_AMB,NOME_AMB) values ('4','Aqu�tico');
--------------------------------------------------------
--  DDL for Index AMBIENTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."AMBIENTE_PK" ON "SYSTEM"."AMBIENTE" ("ID_AMB") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table AMBIENTE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."AMBIENTE" ADD CONSTRAINT "AMBIENTE_PK" PRIMARY KEY ("ID_AMB")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."AMBIENTE" MODIFY ("NOME_AMB" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."AMBIENTE" MODIFY ("ID_AMB" NOT NULL ENABLE);