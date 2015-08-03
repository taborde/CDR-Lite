select  'drop table '||table_name||' cascade constraints;' as cmd 
from user_tables
union
select 'drop sequence '||sequence_name||';' as cmd 
from user_sequences
