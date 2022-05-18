package mission;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("missionservice")
public class MissionServiceImpl implements MissionService {

	@Autowired
	@Qualifier("missiondao")
	public MissionDAO dao;
	
	@Override
	public List<MissionDTO> missionlist_group_ing() {//모집중인 단체미션	목록
			return dao.missionlist_group_ing();
	    
		}
	@Override
	public List<MissionDTO> missionlist_group_end() {//마감된 단체미션	목록
		return dao.missionlist_group_end();
		
	}
	@Override
	public List<MissionDTO> missionlist_solo_ing() {//모집중인 싱시미션	목록	
		return dao.missionlist_solo_ing();
		
	}
	@Override
	public List<MissionDTO> missionlist_solo_end() {//마감된 상시미션 목록	
		return dao.missionlist_solo_end();
		
	}
	@Override
    public MissionDTO missiongroup(int m_code) {//미션 상세페이지
        return dao.missiongroup(m_code);    
    }
	@Override
	public List<MissionDTO> missionreview(String m_name) {//리뷰 목록
		return dao.missionreview(m_name);    
	}
	@Override
	public List<MissionDTO> missionreview2(String m_name) {//리뷰 목록2
		return dao.missionreview2(m_name);    
	}
	@Override
	public List<MissionDTO> missioncheck(String m_name) {//미션 체크
		return dao.missioncheck(m_name);    
	}
	
	//제로웨이스트샵 인증 미션 불러오기
	@Override
	public MissionDTO missionlist_zero() {
		return dao.missionlist_zero();  
	}
	
	//OCR Document 영수증 인식하기
	@SuppressWarnings("unchecked")
	public String test(String fontfile) {
		StringBuffer response = new StringBuffer();
		String apiURL = "https://7s2xksian5.apigw.ntruss.com/custom/v1/15736/175b50fa2856ddfecde058ac4bdc6c3fba076c35fa181d7edee2dcf7bf182593/document/receipt";
		String secretKey = "TmN4QmF6dXFQZGRaUFRHblVOV3lnTlFJZ2JhclZ1VFU=";
		Path currentPath = Paths.get("");
		String imageFile = currentPath.toAbsolutePath().toString() + "/src/main/resources/static/img/" + fontfile;

		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setReadTimeout(30000);
			con.setRequestMethod("POST");
			String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
			con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
			con.setRequestProperty("X-OCR-SECRET", secretKey);

			JSONObject json = new JSONObject();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			image.put("name", "demo");
			JSONArray images = new JSONArray();
			images.add(image);
			json.put("images", images);
			String postParams = json.toString();

			con.connect();
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			long start = System.currentTimeMillis();
			File file = new File(imageFile);
			writeMultiPart(wr, postParams, file, boundary);
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

			System.out.println(response);
		} catch (Exception e) {
			System.out.println(e);
		}
		return response.toString();
	}

	private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary)
			throws IOException {
		StringBuilder sb = new StringBuilder();
		sb.append("--").append(boundary).append("\r\n");
		sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
		sb.append(jsonMessage);
		sb.append("\r\n");

		out.write(sb.toString().getBytes("UTF-8"));
		out.flush();

		if (file != null && file.isFile()) {
			out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
			StringBuilder fileString = new StringBuilder();
			fileString.append("Content-Disposition:form-data; name=\"file\"; filename=");
			fileString.append("\"" + file.getName() + "\"\r\n");
			fileString.append("Content-Type: application/octet-stream\r\n\r\n");
			out.write(fileString.toString().getBytes("UTF-8"));
			out.flush();

			try (FileInputStream fis = new FileInputStream(file)) {
				byte[] buffer = new byte[8192];
				int count;
				while ((count = fis.read(buffer)) != -1) {
					out.write(buffer, 0, count);
				}
				out.write("\r\n".getBytes());
			}

			out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
		}
		out.flush();
	}

	
}//ServiceImpl Class end
	 


