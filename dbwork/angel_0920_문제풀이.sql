--문제
--테이블 생성 (student) : num 숫자(5),name 문자열(10),height 숫자(5,1),
--  java 숫자(3) 기본값 10,spring 숫자(3) 기본값 10, ban 문자열(20)
create table student (
    num number(5),
    name varchar2(10),
    height number(5,1),
    java number(3) default 10,
    spring number(3) default 10,
    ban varchar2(20));

--시퀀스 생성  seq_stu  기본(1부터 1씩증가), nocache 추가
create SEQUENCE seq_stu nocache;

--제약조건들 추가
--num  에 primary key 추가(student_pk_nu)
alter table student add CONSTRAINT student_pk_num primary key(num);

--java,spring 은 1~100 만 가능하도록 check 제약조건 추가
alter table student add CONSTRAINT student_ck_java check (java>=1 and java<=100);
alter table student add CONSTRAINT student_ck_spring check (spring>=1 and spring<=100);

--ban 은 '햇님반','달님반','별님반' 만 추가할수 있도록 check 추가
alter table student add CONSTRAINT studnet_ck_ban check (ban in ('햇님반','달님반','별님반'));

--5개 정도만 데이타를 추가해보자
insert into student (num,name,java,height,ban) values (seq_stu.nextval,'김진아',89,167.5,'햇님반');
insert into student values (seq_stu.nextval,'이효리',178.6,67,88,'달님반');
insert into student values (seq_stu.nextval,'김말자',155.6,100,90,'별님반');
insert into student values (seq_stu.nextval,'이진',165.9,55,67,'달님반');
insert into student values (seq_stu.nextval,'이철수',179.1,90,86,'햇님반');

--커밋하기
commit;

--num>=4 이상 모두 삭제
delete from student where num>=4;

-- num 이 3인 사람의 java점수를 99로 ,ban을 '달님반' 으로 수정
update student set java=99,ban='달님반' where num=3;

--num=2 인사람의 키를 188.9 로 수정
update student set height=188.9 where num=2;

--num=2 인 데이타 삭제
delete from student where num=2;

--데이타 3개정도 더 추가
insert into student values (seq_stu.nextval,'영숙',179.1,90,86,'햇님반');
insert into student values (seq_stu.nextval,'광수',179.1,90,86,'별님반');
insert into student values (seq_stu.nextval,'영자',179.1,90,86,'햇님반');
commit;

--조회 : 이름  반 자바  스프링  총점  평균 -총점이 높은 사람부터 출력
select name,ban,java,spring,java+spring total,(java+spring)/2 avg from student order by total desc;