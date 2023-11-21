package naver.storage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import lombok.Getter;
import lombok.Setter;

@Configuration
@Setter
@Getter
public class NaverConfig {
	
	@Value("https://kr.object.ncloudstorage.com")
	private String endPoint;
	
	@Value ("kr-standard")
	private String regionName;
	
	@Value("8yt6c0uo9is9HLAN1BZH")    //∞≠ªÁ≈∞
	private String accessKey;
	
	@Value("tmFGzatUiqw0C91hSR9Cx9jwPX5DWSzwLFRn3XC0")
	private String secretKey;


//	@Value("xrnSmaHvprB8BEd3HWuK")
//	private String accessKey;
//
//	@Value("VgFA9sMpXPpGCE5KbDjovdIDKX8f2ya2VOy6yoF9")
//	private String secretKey;
}
