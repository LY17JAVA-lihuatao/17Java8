--��Ʒ������
insert into Category (Cname,Description) values ('ʳƷ��','����')
insert into Category (Cname,Description) values ('�ջ���Ʒ','')
insert into Category (Cname,Description) values ('��װ��','')
insert into Category (Cname,Description) values ('�ҵ���','')
select*from Category

--��Ʒ��Ϣ���
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('������',1,'1','2','200')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('��Ƭ',1,'1','2','150')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('���',1,'1.5','3','200')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('�ɰ�˹����',2,'6','10','20')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('��è����',2,'10','20','30')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('ȥмϴ��ˮ',2,'12','18','30')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('����',3,'70','200','200')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('�ް�',3,'80','230','150')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('��ů��',3,'10','60','200')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('����',4,'2000','3000','20')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('Һ������',4,'1500','3000','20')
insert into Ware(Wnmae,Cid,PurchasePrice,SalesPrice,Amount) values ('����',4,'1600','4000','20')
select*from Ware
delete from Employee

--Ա����Ϣ���
insert into Employee(Enmae,Epassword,Remark) values ('��ġ','12345678','����')
insert into Employee(Enmae,Epassword,Remark) values (' ����','11122212','����')
insert into Employee(Enmae,Epassword,Remark) values ('����','87654321','����')
insert into Employee(Enmae,Epassword,Remark) values ('���','123123123','����')
select*from Employee

--��Ʒ�������(Wid����Ʒ���,Eid��Ա�����)(SalesDate����ʱ��,SalesAmount��������)
insert into SalesInfo(Wid,SalesDate,SalesAmount,Eid) values (2,'2017-01-24','5','1001')
insert into SalesInfo(Wid,SalesDate,SalesAmount,Eid) values (5,'2017-01-23','6','1002')
insert into SalesInfo(Wid,SalesDate,SalesAmount,Eid) values (6,'2017-01-22','8','1004')
insert into SalesInfo(Wid,SalesDate,SalesAmount,Eid) values (11,'2017-01-24','10','1002')
insert into SalesInfo(Wid,SalesDate,SalesAmount,Eid) values (7,'2017-01-25','11','1003')
insert into SalesInfo(Wid,SalesDate,SalesAmount,Eid) values (9,'2017-01-19','5','1001')
select*from SalesInfo

--��ѯÿ����Ʒ�ı��,����,��Ʒ���󣬲����յ�Ʒ��������
select wid as ���,Wnmae as ��Ʒ����,SalesPrice-PurchasePrice as ���� 
from Ware order by ���� desc

--ͳ��ÿ����Ʒ��������,��ʾ��Ʒ���Ƽ�������,���������Ӹߵ�������
select w.wnmae as ��Ʒ����,sum(s.SalesAmount) as ������ 
from  ,SalesInfo s where w.wid=s.Wid  
group by wnmae order by ������ desc

--ͳ��ÿ����Ʒ��������,��ʾ��Ʒ���������
select c.Cname as ��Ʒ���,sum(s.SalesAmount) as ������ 
from Category c,Ware w,SalesInfo s 
where c.cid=w.cid and w.wid=s.wid group by cname


--ͳ��ÿ����Ʒ��Ŀǰ��ӯ���ܶ�
select w.wnmae as ��Ʒ����,sum((w.SalesPrice-w.PurchasePrice)*s.SalesAmount) asӯ���ܶ� 
from Ware w,SalesInfo s 
where w.wid=s.wid 
group by wnmae

--����Ա2������5��1����Ʒ
update ware set Amount=Amount-5 where wid=1
insert into SalesInfo(wid,SalesDate,SalesAmount,Eid) values (1,2012-06-30,5,1002)
select*from SalesInfo


--���������ܶ������Ա����
select e.Enmae as Ա������,sum((w.SalesPrice-w.PurchasePrice)*s.SalesAmount) as �����ܶ� 
from Employee e,Ware w,SalesInfo s 
where e.eid=s.eid and w.wid=s.wid 
group by e.Enmae order by �����ܶ� desc


--��ѯ��Ʒ����������ǰ��������Ʒ���Ƽ�����(�Ӹߵ����ų�����������desc)
select top 5 w.wnmae as ��Ʒ����, sum(s.SalesAmount) as ���� 
from Ware w,SalesInfo s where w.wid=s.wid
group by w.wnmae order by ���� desc

--ͳ��2017�����Ʒ����������ǰ��������Ʒ�����Ƽ�����(ע��ʱ��ĸ�ʽyyyy-xx-tt)
select top 5 w.wnmae as ��Ʒ����, sum(s.SalesAmount) as ���� 
from Ware w,SalesInfo s where w.wid=s.wid and s.SalesDate between '2017-01-01' and '2017-12-31'
group by w.wnmae order by ���� desc

--ͳ��ÿ��Ա����2017�����������ʾԱ�����Ƽ���������
select  e.enmae as Ա������, sum(s.SalesAmount) ���� 
from Employee e,SalesInfo s where e.eid=s.eid and s.SalesDate between '2017-01-01' and '2017-12-31'
group by e.enmae order by ���� desc

--ͳ��2010���������
select sum((w.SalesPrice-w.PurchasePrice)*s.SalesAmount) as ������
from Ware w,SalesInfo s where w.wid=s.wid  and s.SalesDate between '2017-01-01' and '2017-12-31'
