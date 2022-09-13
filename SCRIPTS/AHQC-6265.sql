--// ------------------------------------------------------------------------------------------------------- //
--//             Copyright © 2008-2022 PharmApps, LLc.                                                       //
--//             All Rights Reserved.                                                                        //
--//             This software is the confidential and proprietary information of PharmApps, LLC.            //
--//             (Confidential Information).                                                                 //
--// ------------------------------------------------------------------------------------------------------- //
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////
--// ------------------------------------------------------------------------------------------------------- //
--// ------------------------------------------------------------------------------------------------------- //
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- FILE          : AHQC-6265.SQL								              								 //
-- PURPOSE       : Script is to update distribution rules                                             		 //
-- DATE CREATED  : 04-AUG-2022										      									 //
-- CREATED BY    : Karthik AS																		         
-- Reviewd DATE	 : 04-AUG-2022	                                                                            //
-- Reviewd By 	 : Dharmaraj							      											     //									
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////

SET SERVEROUTPUT ON SIZE 500000
SET TIMING ON
SET ECHO ON
SET DEFINE ON
SET SQLBLANKLINES ON
SET ESCAPE ON


SPOOL ./LOGS/AHQC-6265.LOG

BEGIN
    DLIST_DISTR_AUDIT_TRAIL.m_ARIS_VERSION  := GETARISVERSION;
    DLIST_DISTR_AUDIT_TRAIL.m_SESSION_FLAG  := 0;
    DLIST_DISTR_AUDIT_TRAIL.m_USER_ID       := 'DR_DIST_CONT';
	DLIST_DISTR_AUDIT_TRAIL.m_CONTEXT       := 'Updated as part of AHQC-6265';
END;
/


update  dlist_distribute_contacts 
set CONTACT_EMAIL_ID =DECODE((sys_context('USERENV','DB_NAME')),'JNJPRDDB','safety@yuhan.co.kr;8228280398@fax.graphnet.com;8228280725@fax.graphnet.com','JnJ_Build@arisglobal.com'),
user_id = 'DR_DIST_CONT',
date_modified = sysdate
 where contact_name in ('JJPRD_YUH');

COMMIT;

SPOOL OFF;


EXIT;

