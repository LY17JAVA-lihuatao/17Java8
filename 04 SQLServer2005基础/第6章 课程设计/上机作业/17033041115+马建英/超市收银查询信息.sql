--1.��ѯ���������70����Ʒ��Ϣ
   select *from ware where Amount<70
--2.��ѯ��ʾÿ����Ʒ�ı��,����,�Լ�����
   select wid ,wname, SalesPrice- PurchasePrice as  ����
   from  Ware
   order by ���� desc  

--3.��ѯ�����������3����Ʒ���,����,����,�ۼ�,����
   select wid ,wname,PurchasePrice,SalesPrice,SalesPrice- PurchasePrice
   from ware where SalesPrice- PurchasePrice>3
--4.ͳ��ÿ����Ʒ��������,��ʾ��Ʒ���������
  select c.cnam ,sum(s.SalesAmount)
  from Category c,Ware w ,SalesInfo s
  where c.cid =w.cid and w.wid =s.wid  group by cnam
--5.ͳ��ÿ����Ʒ��Ŀǰ��ӯ���ܶ���۶��SalesPrice- PurchasePrice��*SalesAmount��
  select w.wname ,sum(s.SalesAmount*(w.SalesPrice- w.PurchasePrice))  as ӯ���ܶ�
  from ware w,SalesInfo s
  where w.wid=s.wid group by wname 
--6.ͳ��ÿ����Ʒ��������,��ʾ��Ʒ���Ƽ�������,���������Ӹߵ�������
  select w.wname,sum(s.salesAmount) as ������
  from	ware w,SalesInfo s 
  where w.wid=s.wid group by wname  order by ������ desc
--7.
update ware set   Amount=Amount-5 where wid=1
insert into SalesInfo (wid,SalesDate, SalesAmount,eid) values(1,'2018-1-1',1,1001)
--8.��ѯ��Ʒ����������ǰ�����Ʒ���Ƽ�����
 select top 5 w.wname ,sum(s.SalesAmount) ����
 from ware w,SalesInfo s where w.wid = s.sid
 group by w.wname order by ���� desc
