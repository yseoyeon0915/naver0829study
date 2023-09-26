--scott 연습용 테이블로 조회 연습하기
select * from emp; --전체 테이블의 데이타 조회
select * from emp order by ename asc; --ename 의 오름차순으로 조회(asc는 생략해도됨)
select * from emp order by ename desc; --ename 의 내름차순으로 조회(desc는 생략안됨)
select empno,ename from emp; --일부 컬럼만 조회
select job from emp; --job 컬럼만 조회

--같은 직업일경우 한번씩만 출력,오름차순 정렬 조회
select DISTINCT job from emp order by 1; -- 컬럼이 한개이므로 job 대신 1이라고 써도된다

--sal 이 3000 이상인것만 조회
select * from emp where sal>=3000;

--sal 이 2천 이상이면서 deptno 가 20인사람 조회(and) - ename,sal,deptno
select ename,sal,deptno from emp where sal>=2000 and deptno=20;

--SMITH 의 데이타 조회
select * from emp where ename='SMITH';

-- A로 시작하는 사람들만 조회
select * from emp where ename like 'A%'; -- %:모든..글자길이 상관없음

--두번째 글자가 A인사람만 조회
select * from emp where ename like '_A%';  -- _는 임의의 한글자를 의미

--세번째 글자가 A인사람만 조회
select * from emp where ename like '__A%'; -- _ 두번

-- S 로 시작하거나 J 로 시작하는 모든 사람 조회
select * from emp where ename like 'S%' or ename like 'J%';

-- sal 이 2천 이상인 사람중에 S로 시작하는 사람 조회
select * from emp where sal>=2000 and ename like 'S%';