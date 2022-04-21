package admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import mission.MissionDTO;
import recycling.RecyclingDTO;
import zeroshop.LocationDTO;
import zeroshop.ZeroshopDTO;

@Mapper
@Repository("admindao")
public interface AdminDAO {
	/*제로샵 관리*/
	public List<ZeroshopDTO> adminzeroshoplist();
	public void adminzeroshopdel(int s_code);
	public ZeroshopDTO adminzeroshopinfo(int s_code);
	public int checkloccode(LocationDTO dto);
	public int loccode(LocationDTO dto);
	public void insertloc(LocationDTO dto);
	public void updatezeroshop(ZeroshopDTO dto);
	public void insertzeroshop(ZeroshopDTO dto);
	
	/*미션 관리*/
	public List<MissionDTO> adminmissionlist(String m_type);
	public void adminmissiondel(int m_code);
	public MissionDTO adminmissioninfo(int m_code);
	public void updatemission(MissionDTO dto);
	public void insertmission(MissionDTO dto);
	public List<String> missionname(String m_type);

	
	/*가이드 관리*/
	public List<RecyclingDTO> adminguidelist();
}
