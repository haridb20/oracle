#!/bin/bash
#################################
#The program generates syntax with various options
# bash
# dmesg /var/log/messages
# grid home
# agent home
# crsctl
# srvctl
# rman
# dataguard
# sqltuning
# plsql
# 
#################################
PS3="Choose your option:"
select OPTION in `cat options.txt`;
do
  case $OPTION in
        QUIT)
          echo "Exiting."
          break
          ;;
        dataguard)
         echo "Displaying various commands";
         cat dataguard.txt
         ;;
        bash)
         echo "Displaying various commands";
         cat bash.txt
         ;;
        srvctl)
         echo "Displaying various commands";
         cat srvctl.txt
         ;;
        stats)
         echo "Displaying various commands";
         cat stats.txt
         ;;
        sqlplus)
         echo "Displaying various commands";
         cat sqlplus.txt
         ;;
        _rman)
         echo "Displaying various commands";
         cat _rman.txt
         ;;
        plsql)
         echo "Displaying various commands";
         cat plsql.txt
         ;;
        oem12c_oms)
         echo "Displaying various commands";
         cat oem12c_oms.txt
         ;;
        oem12c_agent)
         echo "Displaying various commands";
         cat oem12c_agent.txt
         ;;
        **)
          echo "You chose $OPTION ($REPLY)"
          ;;
  esac
done
