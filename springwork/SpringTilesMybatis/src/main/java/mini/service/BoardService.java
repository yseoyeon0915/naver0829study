package mini.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import mini.dao.BoardDao;
import mini.dto.BoardDto;

@Service
@AllArgsConstructor
public class BoardService {
	
	private BoardDao boardDao;
    
	public int getTotalCount()
	{
		return boardDao.getTotalCount();
	}
	
	public List<BoardDto> getList(int start, int perpage)
	{
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		
		return boardDao.getList(map);
	}
	
	public int getMaxNum()
	{
		return boardDao.getMaxNum();
	}
	
	public void updateRestep(int regroup, int restep)
	{
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("regroup", regroup);
		map.put("restep", restep);
		
		boardDao.updateRestep(map);
	}
	
	public void insertBoard(BoardDto dto)
	{
		int num=dto.getNum();//�����ϰ�� 0, ����ϰ�� 0���� ū ���� ����ִ�
		int regroup=dto.getRegroup(); //����� �� ���� regroup
		int restep=dto.getRestep(); //����� �� ���� restep
		int relevel=dto.getRelevel(); //����� �� ���� relevel
		
		if(num==0) {
			//������ ���
			regroup=boardDao.getMaxNum()+1;
			restep=0;
			relevel=0;
		} else {
			//����� ��� �׷��� �״�� ����ϹǷ� regroup�� ���� �ȱ��Ѵ�
			//����� ���
			this.updateRestep(regroup, restep); //���� �׷��� ���޹��� restep���� ū ���� �ִ� �۵��� ��� +1�� ���ش�
			//�׸��� ���� ������ ���� 1�� ���Ѵ�
			restep=restep+1;
			relevel=relevel+1;
		}
		
		//���� ���� ���Ѱ����� �ٽ� dto�� ��´�
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		//db insert
		boardDao.insertBoard(dto);
	}
	
	public void updateReadCount(int num)
	{
		boardDao.updateReadCount(num);
	}
	
	public BoardDto getData(int num)
	{
		return boardDao.getData(num);
	}
	
	public void updateBoard(BoardDto dto)
	{
		boardDao.updateBoard(dto);
	}
	
	public void deleteBoard(int num)
	{
		boardDao.deleteBoard(num);
	}
	
}

















