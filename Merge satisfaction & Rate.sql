use exceliq;

select *from HRA;

create table Rate(EmpNo int,Satisfaction int,Rate_for_hour money);

select *from Rate;

merge into Rate target
using HRA source
on (source.employeenumber=target.empno)
when not matched by target then
insert (EmpNo,Satisfaction,Rate_for_hour)
values(source.employeenumber,source.environmentsatisfaction,source.hourlyrate)
when matched then update
set target.Satisfaction=source.environmentsatisfaction,target.Rate_for_hour=source.hourlyrate
when not matched by source 
then delete ;


insert into rate values(2111,5,500);
update rate set Rate_for_hour=500 where EmpNo between 100 and 200;