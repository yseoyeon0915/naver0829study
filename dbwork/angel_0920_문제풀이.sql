--����
--���̺� ���� (student) : num ����(5),name ���ڿ�(10),height ����(5,1),
--  java ����(3) �⺻�� 10,spring ����(3) �⺻�� 10, ban ���ڿ�(20)
create table student (
    num number(5),
    name varchar2(10),
    height number(5,1),
    java number(3) default 10,
    spring number(3) default 10,
    ban varchar2(20));

--������ ����  seq_stu  �⺻(1���� 1������), nocache �߰�
create SEQUENCE seq_stu nocache;

--�������ǵ� �߰�
--num  �� primary key �߰�(student_pk_nu)
alter table student add CONSTRAINT student_pk_num primary key(num);

--java,spring �� 1~100 �� �����ϵ��� check �������� �߰�
alter table student add CONSTRAINT student_ck_java check (java>=1 and java<=100);
alter table student add CONSTRAINT student_ck_spring check (spring>=1 and spring<=100);

--ban �� '�޴Թ�','�޴Թ�','���Թ�' �� �߰��Ҽ� �ֵ��� check �߰�
alter table student add CONSTRAINT studnet_ck_ban check (ban in ('�޴Թ�','�޴Թ�','���Թ�'));

--5�� ������ ����Ÿ�� �߰��غ���
insert into student (num,name,java,height,ban) values (seq_stu.nextval,'������',89,167.5,'�޴Թ�');
insert into student values (seq_stu.nextval,'��ȿ��',178.6,67,88,'�޴Թ�');
insert into student values (seq_stu.nextval,'�踻��',155.6,100,90,'���Թ�');
insert into student values (seq_stu.nextval,'����',165.9,55,67,'�޴Թ�');
insert into student values (seq_stu.nextval,'��ö��',179.1,90,86,'�޴Թ�');

--Ŀ���ϱ�
commit;

--num>=4 �̻� ��� ����
delete from student where num>=4;

-- num �� 3�� ����� java������ 99�� ,ban�� '�޴Թ�' ���� ����
update student set java=99,ban='�޴Թ�' where num=3;

--num=2 �λ���� Ű�� 188.9 �� ����
update student set height=188.9 where num=2;

--num=2 �� ����Ÿ ����
delete from student where num=2;

--����Ÿ 3������ �� �߰�
insert into student values (seq_stu.nextval,'����',179.1,90,86,'�޴Թ�');
insert into student values (seq_stu.nextval,'����',179.1,90,86,'���Թ�');
insert into student values (seq_stu.nextval,'����',179.1,90,86,'�޴Թ�');
commit;

--��ȸ : �̸�  �� �ڹ�  ������  ����  ��� -������ ���� ������� ���
select name,ban,java,spring,java+spring total,(java+spring)/2 avg from student order by total desc;