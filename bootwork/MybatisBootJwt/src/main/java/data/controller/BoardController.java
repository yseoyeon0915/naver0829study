package data.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import data.dto.BoardDto;
import data.service.BoardService;
import data.service.MemberService;
import lombok.RequiredArgsConstructor;
import naver.storage.NcpObjectStorageService;
import security.setting.JwtTokenProvider;

@RestController
@RequiredArgsConstructor
@CrossOrigin
public class BoardController {
	private final BoardService boardService;
	private final MemberService memberService;

	//스토리지 변수
	private final NcpObjectStorageService storageService;
	

	private String bucketName="bitcamp-ysy";
	private String folderName="reactboot";
	
	@PostMapping("/board/insert")
	public void insertBoard(@RequestParam(value = "upload",required = false) MultipartFile upload,@ModelAttribute BoardDto dto)
	{
		//로그인한 아이디
		String myid=JwtTokenProvider.getUserIdFromJWT(dto.getToken());
		System.out.println("myid:"+myid);
		System.out.println("subject:"+dto.getSubject());
		
		//사진 업로드하고 dto 의 photo 변경
		if(upload!=null) {
			String photo=storageService.uploadFile(bucketName, folderName, upload);
			dto.setPhoto(photo);
		}else {
			dto.setPhoto("");//업로드 안했을경우
		}
		
		//아이디에 해당하는 이름 얻어서 writer 에 넣기
		String writer=memberService.getLogin(myid).getName();
		dto.setWriter(writer);
		
		//아이디도 dto에 저장
		dto.setMyid(myid);
		
		//db insert
		boardService.insertBoard(dto);		
	}
	
	@GetMapping("/board/list")
	public Map<String, Object> boardList(
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "search",defaultValue =  "") String search
			)
	{
		System.out.println("currentPage="+currentPage);
		System.out.println("search="+search);
        //페이징처리
        int totalCount;//총갯수
        int perPage=3;//한페이지당 출력할 글갯수
        int perBlock=5;//출력할 페이지갯수
        int startNum;//db에서 가져올 시작번호
        int startPage;//출력할 시작페이지
        int endPage;//출력할 끝페이지
        int totalPage;//총 페이지수
        int no;//출력할 시작번호

        //총갯수
        totalCount=boardService.getTotalCount(search);
        //총 페이지수
        totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
        //시작페이지
        startPage=(currentPage-1)/perBlock*perBlock+1;
        //끝페이지
        endPage=startPage+perBlock-1;
        if(endPage>totalPage)
            endPage=totalPage;

        //시작번호
        startNum=(currentPage-1)*perPage;
        //각페이지당 출력할 번호
        no=totalCount-(currentPage-1)*perPage;
       
        List<BoardDto> list=boardService.getAllDatas(search, startNum, perPage);

        //출력할 페이지번호들을 Vector에 담아서 보내기
        Vector<Integer> parr=new Vector<>();
        for(int i=startPage;i<=endPage;i++){
            parr.add(i);
        }

        //리액트로 필요한 변수들을 Map 에 담아서 보낸다
        Map<String,Object> smap=new HashMap<>();
        smap.put("totalCount",totalCount);
        smap.put("list",list);
        smap.put("parr",parr);
        smap.put("startPage",startPage);
        smap.put("endPage",endPage);
        smap.put("no",no);
        smap.put("totalPage",totalPage);

        return  smap;
	}

	@GetMapping("/board/detail")
	public BoardDto selectPage(@RequestParam("num") int num)
	{
		boardService.updateReadcount(num);
		return boardService.getSelectPage(num);
	}
}