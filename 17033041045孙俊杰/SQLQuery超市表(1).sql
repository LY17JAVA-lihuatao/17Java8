--�½���Ʒ����
create table Category(
--�������������ͣ�Լ��
--primary key����
--identity(1,1)�Զ�����
Cid int primary key identity(1,1),
--�������������ͣ�Լ��
--not null ������Ϊ��
Cname nvarchar(20) not null unique,
Description nvarchar(20)
)
--unique������ΨһԼ�����涨���е�ֵ�����ظ���--��Ʒ���ʳƷ�ࡢ�ջ���Ʒ����װ�ࡢ�ҵ���

--�½���Ʒ��Ϣ��
create table Ware(
Wid int primary key identity(1,1),
Wnmae varchar(10) not null unique,
Cid int not null foreign key references Category(Cid),
--����
PurchasePrice decimal(10,2) not null,
--�ۼ�
SalesPrice decimal(10,2) not null,--����Amount decimal(10,2) not null
)


--�½�Ա����
create table Employee(
Eid int primary key identity(1001,1),
--����
Enmae varchar(50) not null,
--Ա������Epassword varchar(10) check(len(Epassword)>6),--Ա����ע
Remark varchar(20)
)


--�½����ۼ�¼��
create table SalesInfo(
Sid int primary key identity(1,1),
--�����۵���Ʒ�ı�ţ������������
Wid int not null foreign key references Ware(Wid),
--����ʱ��
SalesDate nvarchar(20) not null,
--��������
SalesAmount smallint check(len(SalesAmount)>0),--����Ա�ı�ţ������������Eid int not null foreign key references Employee(Eid),
)


--ɾ�����ݱ�
drop table Employee

--�½����ݱ���������, Լ��(����)