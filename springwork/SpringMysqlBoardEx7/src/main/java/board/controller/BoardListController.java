package board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import board.data.AnswerDao;
import board.data.BoardDao;
import board.data.BoardDto;
import lombok.AllArgsConstructor;

@Controller
//@AllArgsConstructor
public class BoardListController {
    @Autowired
    private BoardDao boardDao;
    @Autowired
    private AnswerDao answerDao;
    
    @GetMapping("/simple/list")
    public String list(Model model)
    {
    	//��ü ���� ��������
    	int totalCount=boardDao.getTotalCount();
    	//��ü ������ ��������
    	List<BoardDto> list=boardDao.getAllDatas();
    	//list�� acount�� �� �ۿ� ���� ��� ���� �����ϱ�
    	for(BoardDto dto:list)
    	{
    		dto.setAcount(answerDao.getAnswers(dto.getNum()).size());
    	}
    	
    	//model �� ����
    	model.addAttribute("totalCount", totalCount);
    	model.addAttribute("list",list);
    	return "list";
    }
    
}
