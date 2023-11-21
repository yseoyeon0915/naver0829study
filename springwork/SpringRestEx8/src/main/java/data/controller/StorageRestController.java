package data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import data.dao.PhotoDao;
import data.dto.PhotoDto;
import naver.storage.NcpObjectStorageService;

@RestController
public class StorageRestController {
	@Autowired
	private NcpObjectStorageService storageService;
	
	@Autowired
	PhotoDao photoDao;

	private String bucketName="bitcamp-lmh";//���� �ڱ��� ���ϸ�-���� ���丮��
	private String bucketFolder="photo";//���Ͽ� ��ϵ� ���ε��� ������

	String fileName;

	@PostMapping("/storage/addphoto")
	public String addPhoto(@RequestParam MultipartFile upload)
	{
		//���丮���� ���ε�
		fileName=storageService.uploadFile(bucketName, bucketFolder, upload);
		String photo80="https://fr2k01411649.edge.naverncp.com/82uyvvqSQa/photo/"+fileName+"?type=f&w=80&h=80&faceopt=true&ttype=jpg";

		return photo80;
	}

	@PostMapping("/storage/adddb")
	public void insertPhoto(@RequestParam String title)
	{
		PhotoDto dto=new PhotoDto();
		dto.setTitle(title);

		//�����������
		String photo="https://kr.object.ncloudstorage.com/bitcamp-lmh/photo/"+fileName;
		//150*150
		String photo150="https://fr2k01411649.edge.naverncp.com/82uyvvqSQa/photo/"+fileName+"?type=f&w=150&h=150&faceopt=true&ttype=jpg";
		//80*80
		String photo80="https://fr2k01411649.edge.naverncp.com/82uyvvqSQa/photo/"+fileName+"?type=f&w=80&h=80&faceopt=true&ttype=jpg";

		dto.setPhoto(photo);
		dto.setPhoto80(photo80);
		dto.setPhoto150(photo150);
		
		//db insert
		photoDao.insertPhoto(dto);
		
		fileName=null;
	}
	
	@GetMapping("/storage/list")
	public List<PhotoDto> getAllStorage()
	{
		return photoDao.getAllPhotos();
	}
	
	@GetMapping("/storage/delete")
	public void deletePhoto(@RequestParam int num)
	{
		photoDao.deletePhoto(num);
	}
	
}