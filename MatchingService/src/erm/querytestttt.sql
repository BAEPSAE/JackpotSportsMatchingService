  

select * from player
select * from team

update team set team_leader='aaa' where team_id=1

select team_leader from team where team_id=1

alter table player add user_manner number(10);



select MIN(calcscore) from (select ABS(100-score) as calcscore from matching)

select score, ABS(100-score) as calcscore from matching

select score 
from (select score, ABS(100-score) as calcscore from matching) 
where calcscore=(select MIN(calcscore) from (select ABS(100-score) as calcscore from matching))

select score, ABS(100-score) as calcscore from matching order by calcscore

select * 
from matching 
where score=(select score 
			 from (select score, ABS(100-score) as calcscore 
			 	   from matching)
			 where calcscore=(select MIN(calcscore) 
			 				  from (select ABS(100-score) as calcscore 
			 				  		from matching))
)