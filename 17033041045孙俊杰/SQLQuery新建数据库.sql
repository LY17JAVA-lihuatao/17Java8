--�½����ݿ�
create database Studen on(
     --�½����ݿ����ļ���
     name='Studen',
     --�������ݿ����ļ�·��
     filename='c:\Studen.mdf',
     --�����ʼ����
     size=3MB,
     --�����������
     maxsize=50MB,
     --������������
     filegrowth=2MB
)

--�½���־�ļ�
log on(
     --������־�ļ���
     name='Studen_loog',
     --������־�ļ�·��
     filename='c:\Studen_loog.ldf',
     --�����ʼ����
     size=2MB,
     --�����������
     maxsize=50MB,
     --������������
     filegrowth=10%
)

--ɾ�����ݿ�
drop database Studen