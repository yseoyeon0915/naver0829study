--angel ��������
--��ü ������ ��ȸ
select * from seq;
--sequence ����
create SEQUENCE seq1 start with 1 INCREMENT by 1; --1���� 1�� �����Ǵ� ������ ����
create SEQUENCE seq2 start with 5 INCREMENT by 3 nocache; --5���� 3�� ����, cache ���� 0
create SEQUENCE seq3 maxvalue 100 nocache; --start with�� increment ������ 1�� �ʱⰪ ����

--�� �߻���Ű��
select seq1.nextval,seq2.nextval,seq3.nextval from dual;

--������ ����
drop SEQUENCE seq1;
drop SEQUENCE seq2;
drop SEQUENCE seq3;

--���ο� ������ �ϳ� ����
create SEQUENCE seq_test nocache;

--table ����
create table test(
    num number(3) primary key,
    name varchar2(20) not null,
    blood char(2) default 'A',
    weight number(5,2),
    birthday date);

--������ �߰�
--�Ϻε����͸� �ִ� ��� �÷����� �ݵ�� ǥ���Ѵ�
insert into test (num,name) values (seq_test.nextval,'ĵ��');

--������� ��� Į������ �ִ� ��� Į���� ���� ����
insert into test values (seq_test.nextval,'ĳ����','AB',67.89,sysdate);

--�������ǿ� �� �´� ��� ���� Ȯ��
insert into test (num,blood) values (seq_test.nextval, 'O');
insert into test (num,name,blood) values (2,'Lee','O');

--����� �� ������ 3�������� �߰��ϱ�
insert into test values (seq_test.nextval,'��ȣ��','B',78.9,'2000-10-10');
insert into test values (seq_test.nextval,'���缮','A',76.45,'1979-12-25');
insert into test values (seq_test.nextval,'�̿���','O',77.77,'1969-09-09');


--rollback; --������ commit�� ���� sql��(DML:insert,delete,update) ��� ���
commit; --�� �̻� rollback �ȵ�

insert into test values (seq_test.nextval,'������','AB',55.55,'1999-09-15');

--�̻��¿��� rollback �ϸ� ���� ��ҵɱ�?
rollback;

--���� , ��ȣ���� �������� 'AB'������ ����
update test set blood='AB' where name='��ȣ��';

--�ΰ��� �÷� ����
update test set weight=80.8,birthday=sysdate where num=7;

--����
delete from test; --��� �����Ͱ� �����ǹǷ� �����Ѵ�.
rollback;

--num �� 7,9,10�� �����Ϸ���
delete from test where num in (7,9,10);

--table ����
drop table test;
--������ ����
drop SEQUENCE seq_test;
rollback; --DML(insert,delete,update �ΰ�츸 �ѹ��� �ǰ� drop�� �ȵ�)
----------------------------------------------------------------------
create table person (
    num number(3) CONSTRAINT person_pk_num primary key,
    blood char(2));
    
--���� �������� ����
alter table person drop constraint person_pk_num;

--�ٽ� primary key�� ���� �������� �߰�
alter table person add constraint person_num_pk primary key(num);

--blood�� ���ؼ� check �������� �߰�
alter table person add CONSTRAINT person_ck_blood check (blood in ('A','B','O','AB'));

--������ �߰�
INSERT INTO PERSON VALUES (1,'A');
INSERT INTO PERSON VALUES (1,'B'); --����:���Ἲ ���� ����(ANGEL.PERSON_NUM_PK)�� ����˴ϴ�
INSERT INTO PEROSON VALUES (2,'b');--����:üũ �������� (ANGEL.PERSON_CK_BLOOD)�� ����Ǿ����ϴ�
INSERT INTO PERSON VALUES(2,'O');

--�÷��� �߰�(add)
alter table person add name varchar2(20);
alter table person add score number(5,1) default 30.5;

--�÷��� ���� (drop column)
alter table person drop column num;

--java ��� Į���� number Ÿ������ �߰� �� 1~100 ���̰��� �������� �������ǵ� �߰�
alter table person add java number(3) default 0;
alter table person add constraint person_ck_java check (java>=0 and java<=100);

--�÷��� ���� rename column
alter table person rename COLUMN java to spring;

--������ �߰��� Į�� ������� �ֱ���� ��� �÷��� �ָ� �ȴ�
insert into person (name,blood,spring,score) values ('lee','O',90,35);

drop table person;














