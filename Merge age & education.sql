use Exceliq;

select * from hra;

create table Age (EmpNo int,Age int,Education varchar(20));

--use merge for insert
merge age as target
using hra as source
on source.employeenumber=target.empno
 WHEN NOT MATCHED BY Target THEN
        INSERT (empno,age,education)
		values (source.employeenumber,source.age,source.educationfield);

select*from age where Education='medical';

--use merge for update
merge age as target
using hra as source
on source.employeenumber=target.empno
WHEN MATCHED THEN UPDATE SET
Target.age=source.age;

update hra set age=55 where EducationField='medical'

--use for delete 
merge age as target
using hra as source
on source.employeenumber=target.empno
WHEN not matched by source then 
delete;

insert into age values(5000,65,'HR')

select*from age;