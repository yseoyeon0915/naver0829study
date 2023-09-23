--PL-SQL이란?
-- SQL 언어에 절차적 언어요소를 추가해서 프로그래밍한것을 PL-SQL 이라고 한다
--예제 1
DECLARE
    -- 변수 선언하는 영역
    v_no number(4,1); --4자리에 소숫점이하 1자리 값을 넣는 변수 선언
BEGIN
   -- sql구문이나 pl-sql 문으로 코딩하는 영역(:=:대입, =:비교,동등)
   v_no:=12.7;
   DBMS_Output.put_line(v_no);--출력
end;
/

--예제 2
DECLARE
   vname varchar2(20);
   vban varchar2(20);
BEGIN
   select
      name,ban
      into vname,vban
    from student where num=6;
   DBMS_Output.put_line(vname||'님은 '||vban||'입니다');
end;
/

--person과 food 테이블을 조인하여 person_num 이 9 인사람의 이름,주문한 메뉴,가격을 출력하시오
--예제 3
DECLARE
   vname varchar2(20);
   vfood varchar2(20);
   vprice number(7);
BEGIN
  select person_name,fname,fprice
  into vname,vfood,vprice
  from food f,person p
  where f.food_num=p.food_num and person_num=9;
  
   DBMS_Output.put_line('주문자:'||vname);
   DBMS_Output.put_line('메뉴명:'||vfood);
   DBMS_Output.put_line('가  격:'||vprice||'원');   
end;
/

--예제4
-- 상품명을 변수에 지정한후 해당 상품명의 가격과 색상을 출력
DECLARE
   vsangpum varchar2(20) := '청바지';
   vcolor varchar2(20);
   vprice number(7);
   vprice2 varchar2(20);
BEGIN
  select sang_price,sang_color,ltrim(to_char(sang_price,'L999,999'))
  into vprice,vcolor,vprice2
  from shop where sang_name=vsangpum;
  
   DBMS_Output.put_line('상품명:'||vsangpum);
   DBMS_Output.put_line('색  상:'||vcolor);
   DBMS_Output.put_line('단  가:'||vprice);  
   DBMS_Output.put_line('단  가:'||vprice2);  
end;
/

/*
if  조건식 then
    문장1;
else
    문장2;
end if;

다중 if문
if 조건식1 then
   문장1;
elsif 조건2 then
   문장2;
   ...
end if;

*/

--예제5
--년도에 맞는 띠구하기

--키보드로 년도를 입력받고자 할경우
accept year prompt '태어난 년도를 입력하세요';
DECLARE
   --v_year number(4) := 1989;
   v_year number(4) := '&year'; --입력한값을 대입
   v_mod number(2) := mod(v_year,12); --년도를 12로 나눈 나머지를 구한다
   v_ddi varchar2(10); --띠 저장할 변수   
BEGIN
   if v_mod=0 then v_ddi:='원숭이';
   elsif v_mod=1 then v_ddi:='닭';
   elsif v_mod=2 then v_ddi:='개';
   elsif v_mod=3 then v_ddi:='돼지';
   elsif v_mod=4 then v_ddi:='쥐';
   elsif v_mod=5 then v_ddi:='소';
   elsif v_mod=6 then v_ddi:='호랑이';
   elsif v_mod=7 then v_ddi:='토끼';
   elsif v_mod=8 then v_ddi:='용';   
   elsif v_mod=9 then v_ddi:='뱀';   
   elsif v_mod=10 then v_ddi:='말';
   elsif v_mod=11 then v_ddi:='양';
   end if;
   DBMS_Output.put_line(v_year||'년생은 '||v_ddi||'띠입니다');
end;
/

--예제 6
--db 컬럼의 타입을 가져오는 방법 TYPE
accept iname prompt 'name?';
DECLARE
   v_name student.name%TYPE :='&iname';
   v_height student.height%TYPE;
   v_java student.java%TYPE;
   v_spring student.spring%TYPE;   
BEGIN
  select height,java,spring
  into v_height,v_java,v_spring
  from student where name=v_name;
 
  DBMS_Output.put_line('학생명:'||v_name);
  DBMS_Output.put_line('키:'||v_height);
  DBMS_Output.put_line('자바점수:'||v_java);
  DBMS_Output.put_line('스프링점수:'||v_spring); 
  DBMS_Output.put_line('총점:'||(v_java+v_spring));  
end;
/

/*
  반복문 : loop
  loop
     문장들;
     exit when 조건;
   end loop;
*/
--1부터 10까지 반복해서 출력
--예제 7
DECLARE
   v_no number(2) := 0;   
BEGIN
   loop
       v_no := v_no+1;
       DBMS_Output.put_line('no='||v_no);
       exit when v_no=10; --10일경우 반복문을 빠져나간다
   end loop;   
end;
/

--문제: 단을 입력하면 해당단을 출력하시오
--예제 8
accept dan prompt 'dan?';
DECLARE
   v_dan number(2) := '&dan';
   v_idx number(1) := 1;
BEGIN    
   DBMS_Output.put_line('** '||v_dan||' 단 **');
   loop       
       DBMS_Output.put_line(v_dan || 'X' || v_idx || '=' || v_dan*v_idx);
       v_idx := v_idx+1;
       exit when v_idx=10;
   end loop;
end;
/

-- 상품명을 변수에 지정한후 해당 상품명의 가격과 색상을 출력
--예제 9 - Exception 처리(예제 4 복사)
accept sangpum prompt 'sangpum?';
DECLARE
   vsangpum varchar2(20) := '&sangpum';
   vcolor varchar2(20);
   vprice number(7);
   vprice2 varchar2(20);
BEGIN
  select sang_price,sang_color,ltrim(to_char(sang_price,'L999,999'))
  into vprice,vcolor,vprice2
  from shop where sang_name=vsangpum;
  
   DBMS_Output.put_line('상품명:'||vsangpum);
   DBMS_Output.put_line('색  상:'||vcolor);
   DBMS_Output.put_line('단  가:'||vprice);  
   DBMS_Output.put_line('단  가:'||vprice2);  
   
   --결과가 2개 이상이거나 없으면 오류발생
   --오라클에서 예외처리하는 방법
   EXCEPTION
      when NO_DATA_FOUND then
         DBMS_Output.put_line(vsangpum||' 상품은 DB 에 없습니다');
      when TOO_MANY_ROWS then
         DBMS_Output.put_line(vsangpum||' 상품이 DB 에 두개이상 존재합니다');
      when OTHERS then
        DBMS_Output.put_line(vsangpum||' 상품에 대한 오류 발생-뭔지 모름');   
end;
/

/*
    반복문
    for 변수 in [reverse]시작값..최종값 loop
       문장들;
    end loop;
*/

--예제10, 예제8 구구단 복사후 for문으로  변경하기
accept dan prompt 'dan?';
DECLARE
   v_dan number(2) := '&dan';
   v_idx number(1);
BEGIN    
   DBMS_Output.put_line('** '||v_dan||' 단 **');
    
   for v_idx in 1..9 loop
       DBMS_Output.put_line(v_dan || 'X' || v_idx || '=' || v_dan*v_idx);
    end loop;   
end;
/

--레코드 단위로 데이타 가져오기
--예제 11
DECLARE
   v_num student.num%TYPE :=6;
   v_stu angel.student%rowtype; --레코드단위로 읽어올경우
BEGIN
   select * into v_stu
   from student where num=v_num;
   
   DBMS_Output.put_line('이름:'||v_stu.name);
   DBMS_Output.put_line('키:'||v_stu.height);
   DBMS_Output.put_line('자바:'||v_stu.java);
   DBMS_Output.put_line('스프링:'||v_stu.spring);
   DBMS_Output.put_line('반:'||v_stu.ban);   
end;
/

-- db 의 여러데이타를 조회할경우
/*
    Cursor : sql 문을 실행할때마다 명령이 분석되고 실행되어 결과를 보관하기 위한
    특별한 메모리 영역을 사용하는데 이영역을 참조하는것이 커서이다
    
    select 문에서 여러 데이타 조회시 사용하는 객체이다
    
    커서 속성
    sql%rowcount : 실행된 갯수 반환
    sql%found : 가장 최근의 sql문이 하나 이상의 행에 영향을 준경우 true
    sql%notfound : 결과행이 없는경우
    sql%isopen : 항상 false(항상 close 를 하기때문에 항상 false)
*/

--예제 12
DECLARE
   v_sno number(3) :=20;
   v_shop angel.shop%rowtype;
BEGIN
  select * into v_shop
  from shop where sang_no=v_sno;
  
   DBMS_Output.put_line('상품명:'||v_shop.sang_name);
   DBMS_Output.put_line('조회된 실행갯수:'||sql%rowcount); -- 1
   
   --student 의 java 점수 변경하기
   update student set java=99;
   DBMS_Output.put_line('수정된 실행갯수:'||sql%rowcount); --3
end;
/

--여러 레코드 조회
--예제 13
DECLARE
   Cursor s1
   is
   select * from shop;
BEGIN  
   DBMS_Output.put_line('상품번호   상품명   색상   가격');
   DBMS_Output.put_line('------------------------------');
   for s in s1 loop
       exit when s1%notfound;-- 더이상 데이타가 없으면 빠져나간다
       DBMS_Output.put_line(s.sang_no||'  '||s.sang_name||'  '
         ||s.sang_color||'  '||s.sang_price);
   end loop;
end;
/

--예제 14
--상품명,색상,가격을 입력하면 shop db 에 추가하기
accept isang prompt 'sangpum?';
accept icolor prompt 'color?';
accept iprice prompt 'price?';
DECLARE
   v_sang shop.sang_name%TYPE:='&isang';
   v_color shop.sang_color%TYPE:='&icolor';
   v_price shop.sang_price%TYPE:='&iprice';   
BEGIN
  insert into shop values (seq_shop.nextval,v_sang,v_price,v_color);
  commit;
  DBMS_Output.put_line('상품정보를 추가했습니다');
end;
/

--문제 : food 테이블
/*
  fname,fprice, no 입력을 받아서
  no 가 1 이면 fname,fprice 로 데이타 추가를 하고
  no 가 2면 food 전체 데이타 출력
*/
accept iname prompt 'food name?';
accept iprice prompt 'food price?';
accept ino prompt 'no?';
DECLARE
   v_no number(1) := '&ino';
   v_fname food.fname%TYPE := '&iname';
   v_fprice food.fprice%TYPE := '&iprice';
   
   Cursor s1
   is
   select * from food;
BEGIN
  if v_no=1 then
      insert into food values (seq_food.nextval,v_fname,v_fprice);
      commit;
      DBMS_Output.put_line('메뉴를 추가했습니다');
  else
      DBMS_Output.put_line('메뉴번호  메뉴명   가격');
      DBMS_Output.put_line('---------------------');
      for s in s1 loop
          DBMS_Output.put_line(s.food_num||'  '||s.fname||'  '||s.fprice);
         exit when s1%notfound;
      end loop;
  end if;
end;
/