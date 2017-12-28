--��Ʒ����
create table Category(
cid int primary key identity(1,1),
--�������ֲ�Ϊ��
cname nvarchar(10)not null unique,
--�������������Ϊ��
Description nvarchar(10) null
)
--��Ʒ��Ϣ��
create table Ware(
wid int primary key identity(1,1),
--������Ʒ���ֲ�Ϊ���Ҳ��ظ�
Wnam nvarchar(10)not null unique,
--����������һ����
Cid int foreign key references Category(cid),
--������Ʒ���ۣ��������0
PurchasePrice decimal(10,2) not null,--������Ʒ�ۼۣ��������0SalesPrice decimal(10,2) not null,
--������Ʒ��������������0Amount decimal(10,2)not null
)
--Ա����
create table Employee(
Eid int primary key identity(1001,1),
--����Ա�����ֲ�Ϊ��
Ename nvarchar(10)not null,
--����Ա�����룬��������λ(����)
Epassword varchar(10) check(len(Epassword)>6),--��עRemark nvarchar(10) null
)
--���ۼ�¼��
create table SalesInfo(
Sid int primary key identity(1,1),
--�����۵���Ʒ�ı��wid int foreign key references Ware(Wid),--��Ʒ���۵�ʱ��SalesDate nvarchar(10)not null,--��Ʒ���۵������������ұ������0SalesAmount decimal(10,2)not null ,--����Ա�ı�ţ������eid int foreign key references Employee(Eid),
)
--ɾ��
drop table Category
drop table Ware
drop table Employee
drop table SalesInfo
