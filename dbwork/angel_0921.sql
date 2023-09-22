--2023-09-21 DB ����ȭ
--DB ����ȭ(Normalization)
--����ȭ��? �Ѹ���� db ������ �޸𸮸� �������� �ʱ� ���ؼ�
--� ���̺��� �ĺ��ڸ� ������ �������� ���̺�� ������ ������ ����ȭ�� �Ѵ�
--����ȭ�� ����Ÿ���̽��� �ߺ��� �ּ�ȭ�ǵ��� ����� ����Ÿ���̽��̴�
--���� : �޸𸮸� �����Ҽ� �ִ�. 
--      ����ȭ�� �ý������� ���ؼ� ������ ���ϴ�
--���� : ��ȸ������ �ſ� ���� �ý����� ��쿡�� ���̺��� join ������ �ݺ�������
--       �̷����� ������ ���� ���� �ӵ��� ��¦ �ʾ����� �ִ�

--student �� num �� �ܺ�Ű�� ���� ���ο� ���̺� stuinfo �� ������
--�ܺ�Ű�� ���̺� �����ÿ� �����ص� �ǰ� ���߿� �����ص��ȴ�

create table stuinfo (
      idx number(5) CONSTRAINT stuinfo_pk_idx primary key,
      num number(5),
      addr varchar2(20),
      hp varchar2(20));

-- student �� num �� �ܺ�Ű�� ����(�̶� ����: student �� num �� �ݵ�� primary key ��� �Ѵ�)
--ppt 29�������� ����
alter table stuinfo add CONSTRAINT stuinfo_fk_num FOREIGN key(num) references student(num);

--stuinfo �� ����Ÿ�� �߰��غ���, ���¹�ȣ�� 9������ insert �� � ������ ������ Ȯ���ʿ�
-- �����޼���: ���Ἲ ��������(ANGEL.STUINFO_FK_NUM)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�
--student ���̺��� �θ����̺�: �ű⿡ num 9 �� ��� ������ ���°�
insert into stuinfo values (seq_stu.nextval,9,'����� ������','010-2323-4545');
--���� �踻���� �����ϰ�� �踻���� num �� 3 �̹Ƿ� 3���� �߰��ؾ߸� �Ѵ�
insert into stuinfo values (seq_stu.nextval,3,'����� ������','010-2323-4545');--�踻��
insert into stuinfo values (seq_stu.nextval,6,'���ֵ�','010-1234-1234');--����
insert into stuinfo values (seq_stu.nextval,8,'�λ�','010-8989-7878');--����

--stuinfo �� ��ȸ
select * from stuinfo;

--student �� ��ȸ
select * from student;

--���������� ��ϵ� �л��� ���ؼ� ��� ������ ����غ���(inner join,equi join)
select 
    stu.name,stu.java,stu.spring,stu.ban,info.addr,info.hp
from student stu,stuinfo info
where stu.num=info.num; 

--�÷���տ� ������ ������̺� �Ҽ����� �ٿ��µ�
-- ���ʿ� ���� �÷��� ���ٸ� �������� �ȴ�
select 
   stu.num, name,java,spring,ban,addr,hp
from student stu,stuinfo info
where stu.num=info.num; 

--���������� ��ϵǾ����� ���� �л����� ����غ��� (outer join)
--sub table dp (+) : ������ �ȵ� �÷��� null ������ ���
select 
    stu.name,stu.java,stu.spring,stu.ban,info.addr,info.hp
from student stu,stuinfo info
where stu.num=info.num(+);

--���� ����� null �� �л��� ����ϰ��� �Ұ��
select 
    stu.name,stu.java,stu.spring,stu.ban,info.addr,info.hp
from student stu,stuinfo info
where stu.num=info.num(+) and info.addr is null;

--sub ���̺� ����� ����Ÿ�� �ִµ� �θ����̺�(student) �� �شپ� ����Ÿ�� �����ϰ��� �Ұ��
--�����߻�: ���Ἲ ��������(ANGEL.STUINFO_FK_NUM)�� ����Ǿ����ϴ�- �ڽ� ���ڵ尡 �߰ߵǾ����ϴ�
delete from student where num=3; --����

delete from student where num=7; --������,stuinfo �� ����Ÿ�� ���

--student �� 3�� ����Ÿ�� ��������
--�ڽ� ���̺�(stuinfo �� num �� 3�� ����Ÿ�� ���� ������ student ����)
delete from stuinfo where num=3;--�ڽ� ���̺� ���� ����
delete from student where num=3;--�θ����̺� ����

--�θ� ���̺� drop
--���� �߻� : �ܷ� Ű�� ���� �����Ǵ� ����/�⺻ Ű�� ���̺� �ֽ��ϴ�
drop table student;

--�ڽ� ���̺��� ������ �ɱ��?�� �˴ϴ�
drop table stuinfo;

-----------------------------------------------------------------
-- ��ǰ������ ���� shop ���̺�
-- ��ٱ��Ͽ� ���� cart ���̺��� ����µ� ��ǰ���� ������ ���ؼ� shop �� num �� �ܺ�Ű�� ����
-- ��ǰ�� �����ϸ� ��ٱ����� �ش� ����Ÿ�� �ڵ����� �����ǵ��� on delele cascade �����غ���
-- �������� ���� �ϳ� ������
create SEQUENCE seq_shop start with 10 increment by 10 nocache;

--shop table ����
create table shop (
    sang_no number(5) constraint shop_pk_no primary key,
    sang_name varchar2(100),
    sang_price number(7),
    sang_color varchar2(20)
);

--�ܺ�Ű�� ����� cart ���̺��� ����-shop �� ��ǰ�� ����� ��ٱ��� ����� �ڵ����� ����������
-- cascade �� �����ؼ� �����غ���
create table cart (
    cart_no number(5) constraint cart_pk_no primary key,
    sang_no number(5),
    cnt number(5),
    cartday date
);

alter table cart add CONSTRAINT cart_fk_shopno FOREIGN key(sang_no) REFERENCES shop(sang_no) on delete cascade;

--model (ERD) Ȯ���غ�����

-- 5���� ��ǰ�� ����غ���
insert into shop values (seq_shop.nextval,'���콺',23000,'yellow');
insert into shop values (seq_shop.nextval,'û����',45000,'black');
insert into shop values (seq_shop.nextval,'���̳�Ƽ',11000,'white');
insert into shop values (seq_shop.nextval,'���̳�Ƽ',23000,'red');
insert into shop values (seq_shop.nextval,'üũ����',130000,'gray');
commit;

--cart �� ���콺,���̳�Ƽ(white),üũ���� 3���� ���ؼ� �߰�-��¥�� ���糯¥��(sysdate)
insert into cart values (seq_shop.nextval,10,2,sysdate);
insert into cart values (seq_shop.nextval,30,3,'2023-09-20');
insert into cart values (seq_shop.nextval,50,1,sysdate);
commit;

select * from cart;

--��ȸ(inner join)
-- ��ǰ��,����,����,����,������(yyyy-mm-dd hh24:mi) 
select s.sang_no, sang_name,sang_price,sang_color,cnt,to_char(cartday,'yyyy-mm-dd hh24:mi') cartday
from shop s,cart c
where s.sang_no=c.sang_no;

--�ƹ��� cart �� ���� ���� ��ǰ�� ��ȸ
-- ��ǰ��,����,������ ���
select sang_name,sang_price,sang_color
from shop s,cart c
where s.sang_no=c.sang_no(+) and c.cnt is null;

--cascade �� ���������Ƿ� cart �� ��� ��ǰ�� ������ �ȴ�(�̶� cart �� �ڵ����� ������)
delete from shop where sang_no=10;

--�θ� ���̺� drop ���Ѻ���
drop table shop;  --��������

--���̺� ������ sub ���̺� ���� ������ �θ� ���̺� ����
drop table cart;
drop table shop;

--�������� ��������
drop SEQUENCE seq_shop;

----------------------------------------------------
--����
-- ������:seq_food ����
-- ��������� �޴� ���̺� (���̺�� : food)
-- food_num ����(5) �⺻Ű, fname ���ڿ�(20) :�޴���, fprice ����(7) : ����
create SEQUENCE seq_food nocache;

create table food(
   food_num number(5) CONSTRAINT food_pk_foodnum primary key,
   fname varchar2(20),
   fprice number(7)
);

--sub ���̺��� : �� ���̺� (person)
-- person_num ����(5) �⺻Ű, food_num �ܺ�Ű ����(cascade ����)
-- person_name ���ڿ�(10) : ����
-- ������: bookingday : date Ÿ��
create table person(
   person_num number(5) CONSTRAINT person_pk_personnum primary key,
   food_num number(5),
   person_name varchar2(10),
   bookingday date
);

alter table person add constraint person_fk_foodnum FOREIGN key(food_num) REFERENCES food(food_num) on delete cascade;

--food �� 5���� �޴��� �������(���İ�Ƽ,������ ����..)
 insert into food values (seq_food.nextval,'���İ�Ƽ',16000);
 insert into food values (seq_food.nextval,'������������',25000);
 insert into food values (seq_food.nextval,'������',11000);
 insert into food values (seq_food.nextval,'�����',8000);
 insert into food values (seq_food.nextval,'�����',19000);
 insert into food values (seq_food.nextval,'�ػ깰����',21000);
 commit;
 
--�ֹ��� �������� �߰��غ���(���� �޴��� ������ �ֹ��ϱ⵵ ��..)
insert into person values (seq_food.nextval,1,'�̻��',sysdate);
insert into person values (seq_food.nextval,4,'��ȣ��',sysdate);
insert into person values (seq_food.nextval,1,'���缮',sysdate);
insert into person values (seq_food.nextval,3,'�̿���',sysdate);
insert into person values (seq_food.nextval,6,'ĳ����',sysdate);
commit;

--��ȸ : ������(food_num),�ֹ��ڸ�,���ĸ�, ����,������ (���� �ѱ۷� �ֱ�)
select
   f.food_num �޴���ȣ,person_name �ֹ��ڸ�,fname �޴���,fprice ����,
   to_char(bookingday,'yyyy-mm-dd') ������
from food f,person p
where f.food_num=p.food_num;

-- �޴��� ���İ�Ƽ�� ������ �ֹ��� ���̺����� ���������� Ȯ��
delete from food where food_num=1;

--�ٽ� �ѹ� Ȯ��
select
   f.food_num �޴���ȣ,person_name �ֹ��ڸ�,fname �޴���,fprice ����,
   to_char(bookingday,'yyyy-mm-dd') ������
from food f,person p
where f.food_num=p.food_num;