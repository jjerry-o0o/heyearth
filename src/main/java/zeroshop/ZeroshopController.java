package zeroshop;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ZeroshopController {
	
	@Autowired
	@Qualifier("locationservice")
	LocationService loc_service = new LocationServiceImpl();
	
	@Autowired
	@Qualifier("zeroshopservice")
	ZeroshopService zero_service = new ZeroshopServiceImpl();
	
	
	// 제로샵메인페이지 이동
	@GetMapping("/zeroshop")
	public String zeroshoplist() {
		return "zeroshop/zeroshop";
	}
	
	// location에 저장된 광역시/도 이름 리스트 리턴
	@RequestMapping("/bigloc")
	@ResponseBody
	public List<String> bigloc() {
		List<String> result = loc_service.biglocation();
		return result;
	}
	
	// 주어진 광역시/도에 맞는 시/군/구 이름 리스트 리턴
	@RequestMapping("/smallloc")
	@ResponseBody
	public List<String> smallloc(String bigloc) {
		List<String> result = loc_service.smalllocation(bigloc);
		return result;
	}
	
	// 주어진 주소에 있는 제로샵 리스트 리턴
	@RequestMapping("/loczeroshop")
	@ResponseBody
	public List<ZeroshopDTO> loczeroshop(String bigloc,String smallloc){
		List<ZeroshopDTO> dto = new ArrayList<ZeroshopDTO>();
		if(smallloc.equals("전체")) {
			List<Integer> l_codelist = zero_service.locidall(bigloc);
			for(int l : l_codelist) {
				List<ZeroshopDTO> tmp = zero_service.loczero(l);
				for(ZeroshopDTO tmpdto : tmp) {
					dto.add(tmpdto);
				}
			}
			
			Collections.sort(dto,new Comparator<ZeroshopDTO>() {

				@Override
				public int compare(ZeroshopDTO o1, ZeroshopDTO o2) {
					return o1.s_name.compareTo(o2.s_name);
				}
				
			});
			
		}else {			
			int l_code = zero_service.locid(bigloc, smallloc);
			dto = zero_service.loczero(l_code);
		}
		if(dto.isEmpty()) {
			ZeroshopDTO tmpdto = new ZeroshopDTO();
			tmpdto.setS_name("none");
			dto.add(tmpdto);
		}
		
		return dto;
	}
	
	// 해당 제로샵 상세정보 리턴
	@RequestMapping("/zeroshopdetail")
	@ResponseBody
	public ZeroshopDTO zeroshopdetail(int scode) {
		return zero_service.zeroshop(scode);
	}
	
	// 내 주변에서 검색 눌렀을때 주소를 통한 위경도값 저장
	@RequestMapping("/mapfirst")
	@ResponseBody
	public void mapfirst() {
		List<ZeroshopDTO> noll = zero_service.noll();
		if(!noll.isEmpty()) {
			for(ZeroshopDTO dto : noll) {
				String[] result = addresstoll(dto.s_location);
				ZeroshopDTO newdto = new ZeroshopDTO();
				newdto.setS_code(dto.s_code);
				newdto.setLatitude(Double.parseDouble(result[0]));
				newdto.setLongitude(Double.parseDouble(result[1]));
				zero_service.setlatlong(newdto);
			}
		}
		
	}
	
	// 모든 제로샵 정보 리턴
	@RequestMapping("/zeroshoplist")
	@ResponseBody
	public List<ZeroshopDTO> zeroshoplist(double latitude, double longitude){
		List<ZeroshopDTO> zeroshop = zero_service.allzeroshop();
		return zeroshop;
	}
	
	// 주소를 위경도로 바꾸는 함수(네이버 geocode API 이용)
	public String[] addresstoll(String address) {
		String[] result = new String[2];
		String addr = address;
		try {
			addr = URLEncoder.encode(address,"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String api = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query="+addr;
		StringBuffer sb = new StringBuffer();
		try {
			URL url = new URL(api);
			HttpsURLConnection http = (HttpsURLConnection)url.openConnection();
			http.setRequestProperty("Content-Type", "application/json");
			http.setRequestProperty("X-NCP-APIGW-API-KEY-ID", "27lk7yjxzo");
			http.setRequestProperty("X-NCP-APIGW-API-KEY", "S26LOtanI88FJu2rvlMl65j1qrCTGAxaxdaGPqGI");
			http.setRequestMethod("GET");
			http.connect();
			
			InputStreamReader in = new InputStreamReader(http.getInputStream(),"utf-8");
			BufferedReader br = new BufferedReader(in);
			String line;
			while((line = br.readLine()) != null) {
				sb.append(line).append("\n");
			}
			
			JSONParser parser = new JSONParser();
			JSONObject jsonObject;
			JSONObject jsonObject2;
			JSONArray jsonArray;
			String s1 = "";
			String s2 = "";
			
			jsonObject = (JSONObject)parser.parse(sb.toString());
			jsonArray = (JSONArray)jsonObject.get("addresses");
			for(int i=0;i<jsonArray.size();i++) {
				jsonObject2 = (JSONObject)jsonArray.get(i);
				if(null != jsonObject2.get("x")) {
					s1 = (String)jsonObject2.get("x").toString();
				}
				if(null != jsonObject2.get("y")) {
					s2 = (String)jsonObject2.get("y").toString();
				}
			}
			br.close();
			in.close();
			http.disconnect();
			//System.out.println("Latitude> " + s2 + "  Longitude> " +s1);
			
			result[0] = s2;
			result[1] = s1;
			
		}catch(Exception e){
			
		}
		return result;
	}  // addresstoll end
	
	// 위경도를 통해 두 지점 사이에 거리를 계산하는 함수
	public double getDistanceFromLatLonInKm(double lat1,double lng1,double lat2,double lng2) {
		double R = 6371; // Radius of the earth in km 
		double dLat = deg2rad(lat2-lat1); // deg2rad below 
		double dLon = deg2rad(lng2-lng1); 
		double a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2); 
		double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
		double d = R * c; // Distance in km 
		return d; 
	}
	
	public double deg2rad(double deg) { 
		return deg * (Math.PI/180); 
	} 
	
}
