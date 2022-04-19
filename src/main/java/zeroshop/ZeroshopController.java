package zeroshop;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
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
	
	@GetMapping("/zeroshop")
	public String zeroshoplist() {
		return "zeroshop/zeroshop";
	}
	
	@RequestMapping("/bigloc")
	@ResponseBody
	public List<String> bigloc() {
		List<String> result = loc_service.biglocation();
		return result;
	}
	
	@RequestMapping("/smallloc")
	@ResponseBody
	public List<String> smallloc(String bigloc) {
		List<String> result = loc_service.smalllocation(bigloc);
		return result;
	}
	
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
	
	@RequestMapping("/zeroshopdetail")
	@ResponseBody
	public ZeroshopDTO zeroshopdetail(int scode) {
		return zero_service.zeroshop(scode);
	}
	
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
	
	@RequestMapping("/zeroshoplist")
	@ResponseBody
	public List<ZeroshopDTO> zeroshoplist(double latitude, double longitude){
		List<ZeroshopDTO> zeroshop = zero_service.allzeroshop();
		return zeroshop;
	}
	
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
