#!/bin/bash
function setup()
{
sqlplus -s hari/hari@emrepus<<EOM
CREATE TABLE spm_test_tab (
  id           NUMBER,
  description  VARCHAR2(50)
);
DECLARE
  TYPE t_tab IS TABLE OF spm_test_tab%ROWTYPE;
  l_tab t_tab := t_TAB();
BEGIN
  FOR i IN 1 .. 10000 LOOP
    l_tab.extend;
    l_tab(l_tab.last).id := i;
    l_tab(l_tab.last).description := 'Description for ' || i;
  END LOOP;
  
  FORALL i IN l_tab.first .. l_tab.last
    INSERT INTO spm_test_tab VALUES l_tab(i);
  
  COMMIT;
END;
/

EXEC DBMS_STATS.gather_table_stats(USER, 'SPM_TEST_TAB', cascade=>TRUE);
exit;
EOM
}
function load_plans()
{
read answer
sqlplus hari/hari@emrepus<<EOM
define answer='$answer'
declare
  l_plans_loaded  PLS_INTEGER;
begin
l_plans_loaded:=dbms_spm.load_plans_from_cursor_cache('&answer');
end;
/
exit;
EOM
}
function teardown()
{
sqlplus -s hari/hari@emrepus<<EOM
drop TABLE spm_test_tab ;
exit;
EOM
}
function display_sqlid()
{
sqlplus hari/hari@emrepus<<EOM
SELECT sql_id,substr(sql_text,1,100)
FROM   v\$sql
WHERE  sql_text LIKE '%spm_test_tab%'
AND    sql_text NOT LIKE '%dba_sql_plan_baselines%';
exit;
EOM
}
function display_plans()
{
sqlplus hari/hari@emrepus<<EOM
SELECT sql_handle, plan_name, enabled, accepted 
FROM   dba_sql_plan_baselines
WHERE  sql_text LIKE '%spm_test_tab%'
AND    sql_text NOT LIKE '%dba_sql_plan_baselines%';
exit;
EOM
}

function run_sql_select()
{
sqlplus hari/hari@emrepus<<EOM
SET AUTOTRACE TRACE
SELECT description
FROM   spm_test_tab
WHERE  id = 99;
exit;
EOM
}

## Create index
function create_index()
{
sqlplus hari/hari@emrepus<<EOM
CREATE INDEX spm_test_tab_idx ON spm_test_tab(id);
EXEC DBMS_STATS.gather_table_stats(USER, 'SPM_TEST_TAB', cascade=>TRUE);

SET AUTOTRACE TRACE

SELECT description
FROM   spm_test_tab
WHERE  id = 99;
EOM
}
#show plan not changed
function create_index()
{
sqlplus hari/hari@emrepus<<EOM
CREATE INDEX spm_test_tab_idx ON spm_test_tab(id);
EXEC DBMS_STATS.gather_table_stats(USER, 'SPM_TEST_TAB', cascade=>TRUE);

SET AUTOTRACE TRACE

SELECT description
FROM   spm_test_tab
WHERE  id = 99;
SELECT sql_handle, plan_name, enabled, accepted 
FROM   dba_sql_plan_baselines;
EOM

echo "enter sql_handle value:"
read sql_handle
sqlplus hari/hari@emrepus<<EOM
define sql_handle='$sql_handle'
SET LONG 10000
SELECT DBMS_SPM.evolve_sql_plan_baseline(sql_handle => '$sql_handle')
FROM   dual;
EOM
}

#evolve sql plan

#accept new plan

#drop old plan

teardown
setup
run_sql_select
display_sqlid
load_plans
display_plans

create_index
