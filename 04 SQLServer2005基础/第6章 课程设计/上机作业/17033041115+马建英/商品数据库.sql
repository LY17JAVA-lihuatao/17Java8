--�½����ݿ�
create database SuperMarket on(
name='SuperMarket',
filename='D:\SuperMarket',
size=3MB,
maxsize=20,
filegrowth=3MB
)
--�½���־�ļ�
log on(
name='SuperMarket_log',
filename='D:\SuperMarket_log.mdf',
size=3MB,
maxsize=20,
filegrowth=10%
)
--ɾ�����ݿ�
drop database SuperMarket