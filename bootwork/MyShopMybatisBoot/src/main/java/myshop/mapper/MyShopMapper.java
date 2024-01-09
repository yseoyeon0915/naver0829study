package myshop.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MyShopMapper {

	//방법 1 : sql을 직접 정의
	//@Select("select count(*) from myshop")
	//public int getTotalCount();
	
	//방법 2: sql을 xml 에서 정의
	public int getTotalCount();
}
