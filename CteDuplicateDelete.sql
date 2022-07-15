
with cte as 
(

	select *, Row_number() over(Partition by "Date","Expiry","Strike","Time" order by "Date") as RowNumber
	from tablename
	
	
)
select * from cte where RowNumber > 1

Delete from cte where RowNumber >1
;


--Note : It works in Mysql but not in Postgresql