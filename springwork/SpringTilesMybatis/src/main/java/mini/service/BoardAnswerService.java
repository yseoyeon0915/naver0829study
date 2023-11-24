package mini.service;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import mini.dao.BoardAnswerDao;

@Service
@AllArgsConstructor
public class BoardAnswerService {
	private BoardAnswerDao answerDao;
	
}
