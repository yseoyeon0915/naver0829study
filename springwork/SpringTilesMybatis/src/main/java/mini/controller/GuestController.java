package mini.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import mini.dto.GuestDto;
import mini.service.GuestService;
import naver.storage.NcpObjectStorageService;

//네이버 Papago Text Translation API 예제
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.io.*;
import java.util.Date;

@Controller
public class GuestController {

	@Autowired
	private GuestService guestService;
	
	@Autowired
	private NcpObjectStorageService storageService;
	
	private String bucketName="guest-ysy";
	private String folderName="guest";
	
	//번역후 반환하는 메서드
	public String translate(String text1,String nara)
	{
		 	String clientId = "0bpfj68ris";//애플리케이션 클라이언트 아이디값";
	        String clientSecret = "eaamIqS5FiOOcz27Tf7oSRJNdXHqYVCqYIj1xMx1";//애플리케이션 클라이언트 시크릿값";
	        String returnValue="";
	        
	        try {
				String text = URLEncoder.encode(text1, "UTF-8");
				String apiURL = "https://naveropenapi.apigw.ntruss.com/nmt/v1/translation";
				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				con.setRequestMethod("POST");
				con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
				con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
				// post request
				String postParams = "source=ko&target="+nara+"&text=" + text;
				con.setDoOutput(true);
				DataOutputStream wr = new DataOutputStream(con.getOutputStream());
				wr.writeBytes(postParams);
				wr.flush();
				wr.close();
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if(responseCode==200) { // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream(),StandardCharsets.UTF_8));
				} else {  // 오류 발생
					br = new BufferedReader(new InputStreamReader(con.getErrorStream(),StandardCharsets.UTF_8));
				}
				String inputLine;
				StringBuffer response = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				br.close();
				//System.out.println(response.toString());
				//returnValue=response.toString();

				//message.result.translatedText  : json 데이타 추출
				JSONObject ob=new JSONObject(response.toString());
				JSONObject result=ob.getJSONObject("message").getJSONObject("result");

				returnValue=result.getString("translatedText");
	            
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	        return returnValue;//번역된 내용
	}
	@GetMapping("/guest/list")
	public String login(Model model, @RequestParam(defaultValue = "en") String nara)//nara: 기본 번역언어는 영어
	{
		int totalCount=guestService.getAllGuest().size();
		List<GuestDto> glist=guestService.getAllGuest();
		//dto에 번역내용도 저장
		for(GuestDto dto:glist)
		{
			//해당 나라 언어로 번역해서 반환
			String trans=translate(dto.getGuest_content(), nara);
			dto.setTrans_lang(trans);
		}
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("glist", glist);
		
		return "guest/guestlist";
	}
	
	@PostMapping("/guest/insert")
	public String insertGuest(@	ModelAttribute GuestDto dto, @RequestParam MultipartFile upload,
			@RequestParam String nara)
	{
		//네이버 스토리지에 업로드후 랜덤 파일명 반환
		String guest_photo=storageService.uploadFile(bucketName, folderName, upload);
		//dto에 사진 파일명 저장
		dto.setGuest_photo(guest_photo);
		
		//db 에 insert
		guestService.insertGuest(dto);
		
		//목록으로 리다이렉트
		return "redirect:./list?nara="+nara;
	}
	
	//목소리 반환하는 메서드
	@GetMapping("/guest/voice")
	@ResponseBody public String getVoice(String message, String lang,HttpServletRequest request)
	{
		//목소리파일을 업로드할 경로구하기
		String path=request.getSession().getServletContext().getRealPath("/resources/voice");
		
		String clientId = "0bpfj68ris";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "eaamIqS5FiOOcz27Tf7oSRJNdXHqYVCqYIj1xMx1";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode(message, "UTF-8"); // 13자
            String apiURL = "https://naveropenapi.apigw.ntruss.com/tts-premium/v1/tts";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            // post request
            //나라별 목소리 지정하기
            String naraVoice="";
            if(lang.equals("ko")) //한국어
            	naraVoice="neunseo";
            else if(lang.equals("en")) //영어
            	naraVoice="matt";
            else if(lang.equals("ja")) //일본어
            	naraVoice="ddaiki";
            else if(lang.equals("zh-CN")) //중국어
            	naraVoice="liangliang";
            else if(lang.equals("es")) //스페인어
            	naraVoice="jose";
            
            String postParams = "speaker="+naraVoice+"&volume=0&speed=0&pitch=0&format=mp3&text=" + text;
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                InputStream is = con.getInputStream();
                int read = 0;
                byte[] bytes = new byte[1024];
                // 랜덤한 이름으로 mp3 파일 생성
                //String tempname = Long.valueOf(new Date().getTime()).toString();
                SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmss");
                String tempname = sdf.format(new Date());
                //File f = new File(path+ "/"+tempname+"mp3");
                File f = new File(path+ "/"+tempname+"mp3");
                f.createNewFile();
                OutputStream outputStream = new FileOutputStream(f);
                while ((read =is.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
                is.close();
                return tempname+".mp3";
            } else {  // 오류 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                String inputLine;
                StringBuffer response = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                System.out.println(response.toString());
            }
        } catch (Exception e) {
            System.out.println(e);
        }
		
		return "";
	}
}

