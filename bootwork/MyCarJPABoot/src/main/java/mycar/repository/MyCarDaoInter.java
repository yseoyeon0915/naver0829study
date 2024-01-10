package mycar.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import mycar.data.MyCarDto;

public interface MyCarDaoInter extends JpaRepository<MyCarDto,Long>{

}