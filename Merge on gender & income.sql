use Exceliq;

select * from hra;
--create table
create table hras (EmpNo int,Gender varchar(20),Income_of_Month money);
--use merge for insert
merge hras as target
using hra as source
on source.employeenumber=target.empno
 WHEN NOT MATCHED BY Target THEN
        INSERT (empno,gender,Income_of_Month)
		values (source.employeenumber,source.gender,source.monthlyincome);

select *from hras;

--use merge for update
merge hras as target
using hra as source
on source.employeenumber=target.empno
WHEN MATCHED THEN UPDATE SET
Target.gender=source.gender;

--use for delete 
insert into hras(empno,gender,income_of_month) 
values(100,'Male',50000)

merge hras as target
using hra as source
on source.employeenumber=target.empno
WHEN not matched by source then 
delete;