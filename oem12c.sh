#!/bin/sh

#Check oms status
oracle@emcc:~> $OMS_HOME/bin/emctl status oms
Oracle Enterprise Manager Cloud Control 12c Release 4  
Copyright (c) 1996, 2014 Oracle Corporation.  All rights reserved.
WebTier is Up
Oracle Management Server is Up
oracle@emcc:~> 


#Check agent status
oracle@emcc:~> $AGENT_HOME/bin/emctl status agent
Oracle Enterprise Manager Cloud Control 12c Release 4  
Copyright (c) 1996, 2014 Oracle Corporation.  All rights reserved.
---------------------------------------------------------------
Agent Version          : 12.1.0.4.0
OMS Version            : 12.1.0.4.0
Protocol Version       : 12.1.0.1.0
Agent Home             : /u01/OracleHomes/agent12c/agent_inst
Agent Log Directory    : /u01/OracleHomes/agent12c/agent_inst/sysman/log
Agent Binaries         : /u01/OracleHomes/agent12c/core/12.1.0.4.0
Agent Process ID       : 3438
Parent Process ID      : 3383
Agent URL              : https://emcc.example.com:3872/emd/main/
Local Agent URL in NAT : https://emcc.example.com:3872/emd/main/
Repository URL         : https://emcc.example.com:4900/empbs/upload
Started at             : 2015-08-02 09:08:15
Started by user        : oracle
Operating System       : Linux version 2.6.32-400.36.9.el5uek (amd64)
Last Reload            : (none)
Last successful upload                       : 2015-08-04 17:11:01
Last attempted upload                        : 2015-08-04 17:11:01
Total Megabytes of XML files uploaded so far : 2.26
Number of XML files pending upload           : 0
Size of XML files pending upload(MB)         : 0
Available disk space on upload filesystem    : 60.32%
Collection Status                            : Collections enabled
Heartbeat Status                             : Ok
Last attempted heartbeat to OMS              : 2015-08-04 17:15:10
Last successful heartbeat to OMS             : 2015-08-04 17:15:10
Next scheduled heartbeat to OMS              : 2015-08-04 17:16:10

---------------------------------------------------------------
Agent is Running and Ready
oracle@emcc:~> $AGENT_HOME/bin/emctl upload agent
Oracle Enterprise Manager Cloud Control 12c Release 4  
Copyright (c) 1996, 2014 Oracle Corporation.  All rights reserved.
---------------------------------------------------------------
EMD upload completed successfully
oracle@emcc:~> 

