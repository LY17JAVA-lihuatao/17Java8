--��ѯ��Ʒ���
Select*from Category
--��ѯ��Ʒ��Ϣ
Select*from Ware
--��ѯԱ����Ϣ
Select*from Employee
--��ѯ���ۼ�¼
Select*from SalesInfo

--�����Ʒ����
insert into Category(Cname)values('��װ��')
insert into Category(Cname)values('ʳƷ��')
insert into Category(Cname)values('�ջ���')
insert into Category(Cname)values('�ҵ���')

--�����Ʒ��Ϣ��(Cid��ʾ����)
insert into Ware(Wnam,Cid,PurchasePrice,SalesPrice,Amount)values('����Ь',1,'10','19','50')
insert into Ware(Wnam,Cid,PurchasePrice,SalesPrice,Amount)values('���޷�',1,'100','199','50')
insert into Ware(Wnam,Cid,PurchasePrice,SalesPrice,Amount)values('��Ƭ',2,'2','3.5','30')
insert into Ware(Wnam,Cid,PurchasePrice,SalesPrice,Amount)values('һ��ƻ��',2,'40','60','20')
insert into Ware(Wnam,Cid,PurchasePrice,SalesPrice,Amount)values('��������',3,'5','7','20')
insert into Ware(Wnam,Cid,PurchasePrice,SalesPrice,Amount)values('����˿ϴ��ˮ',3,'20','30','30')
insert into Ware(Wnam,Cid,PurchasePrice,SalesPrice,Amount)values('����',4,'1000','1700','10')
insert into Ware(Wnam,Cid,PurchasePrice,SalesPrice,Amount)values('ϴ�»�',4,'1500','2100','10')

--���Ա����Ϣ��Employee��
insert into Employee(Ename,Epassword)values('����','11100011')
insert into Employee(Ename,Epassword)values('����','10101010')
insert into Employee(Ename,Epassword)values('�ֺ���','10110111')
insert into Employee(Ename,Epassword)values('����·','10102131')

--���ۼ�¼��
update Ware set Amount=Amount-1 where Wnam='����Ь'
insert into SalesInfo(wid,SalesDate,SalesAmount,eid)values(1,'2017-01-02','2','1001')
update Ware set Amount=Amount-1 where Wnam='��Ƭ'
insert into SalesInfo(wid,SalesDate,SalesAmount,eid)values(3,'2017-02-03','10','1002')
update Ware set Amount=Amount-1 where Wnam='��������'
insert into SalesInfo(wid,SalesDate,SalesAmount,eid)values(5,'2017-05-06','10','1003')
update Ware set Amount=Amount-1 where Wnam='ϴ�»�'
insert into SalesInfo(wid,SalesDate,SalesAmount,eid)values(8,'2017-06-02','5','1004')


--��ѯ��ʾÿ����Ʒ�ı�ţ����ƣ�����(����=�ۼ�-����)��������Ӹߵ�������
select wid,Wnam,SalesPrice-PurchasePrice as���� from Ware order by SalesPrice-PurchasePrice desc
--ͳ��ÿ����Ʒ������������ʾ��Ʒ���Ƽ������������������Ӹߵ�������
--��Ʒ������Ware���У���������SalesInfo���У����������������������н������Ӳ�ѯ��Ȼ���ٷ���ͳ��
select a.Wnam,sum(b.SalesAmount)as������from Ware a,SalesInfo bwhere a.wid=b.wid group by Wnam order by sum(b.SalesAmount) desc
--ͳ��ÿ����Ʒ������������ʾ��Ʒ���������
--�������漰��Category��Ware��SalesInfo�������������ٷ���ͳ��
select C.cname,sum(b.SalesAmount)as ������from Category C,Ware a,SalesInfo bwhere C.cid=a.cid and a.wid=b.wid group by cname
--ͳ��ÿ����Ʒ��Ŀǰ��ӯ���ܶ�--������Ware��SalesInfo�����еõ���Ʒ���ơ����ۡ��ۼۼ�����������
--�����ÿ����¼�����۶�Ӧ��ʾΪ��
SalesPrice-PurchasePrice)*SalesAmount
--������ͳ��
select Wnam,sum(SalesAmount*( SalesPrice-PurchasePrice)) as ӯ���ܶ�from Ware a,SalesInfo bwhere a.wid=b.wid group by Wnam