package mini.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mini.dto.MemberDto;

@Repository
public class MemberDao {

	@Autowired
	private SqlSession session;
	
	private String nameSpace="mini.dao.MemberDao.";
	
	public int getTotalCount()
	{
		return session.selectOne(nameSpace+"totalCountOfMember");
	}
	
	public void insertMember(MemberDto dto)
	{
		session.insert(nameSpace+"insertMember", dto);
	}
	
	public List<MemberDto> getSearchMember(String field,String word)
	{
		//word 에 검색단어가 안들어있을경우 null 값을 보내야 where 문이 실행안된다
		word=word==null || word.length()==0?null:word;
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("searchfield",field);
		map.put("searchword", word);
		
		return session.selectList(nameSpace+"selectAllMembers", map);		
	}
	
	public int searchIdCount(String myid)
	{
		return session.selectOne(nameSpace+"searchIdCount",myid);
	}
	
	public void deleteMember(int num)
	{
		session.delete(nameSpace+"deleteMember",num);
	}
}