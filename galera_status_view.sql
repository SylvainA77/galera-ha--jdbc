create definer='root'@'%' sql security definer view galera_status.connection as
select (select if ( MOD(VARIABLE_VALUE,2)= 0,1,0)from information_schema.global_status where VARIABLE_NAME='WSREP_LOCAL_STATE') * (select decode_oracle(VARIABLE_VALUE,'TOI',1,'RSU',0) from information_schema.global_variables WHERE VARIABLE_NAME like 'WSREP_OSU_METHOD') as status ;


