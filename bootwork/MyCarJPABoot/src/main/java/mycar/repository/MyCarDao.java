package mycar.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import mycar.data.MyCarDto;

@Repository
@AllArgsConstructor
public class MyCarDao {

	//JpaRepository 를 상속받을경우 기본적인 SQL을 실행해주는 각종 메서드 호출 가능
	MyCarDaoInter daoInter;

	//전체갯수구하기
	public Long getTotalCount()
	{
		return daoInter.count();
	}

	//db저장
	public void insertMyCar(MyCarDto dto)
	{
		daoInter.save(dto);//save 는 dto 에 num값이 포함되어있으면 update,없으면 insert 를 실행한다
	}

	//전체출력
	public List<MyCarDto> getAllCars()
	{
		return daoInter.findAll();//전체 데이타 반환
		//return daoInter.findAll(Sort.by(Sort.Direction.DESC,"carprice"));//가격이 비싼거부터 출력
		//return daoInter.findAll(Sort.by(Sort.Direction.ASC,"carprice"));//가격이 싼거부터 출력
	}

	//페이지출력
	public Page<MyCarDto> getAllCars(Pageable pageable)
	{
		return daoInter.findAll(pageable);//페이지에 필요한만큼 데이타 반환
	}
	
	//num 에 해당하는 dto반환
	public MyCarDto getData(Long num)
	{
		return daoInter.getReferenceById(num);
	}
}