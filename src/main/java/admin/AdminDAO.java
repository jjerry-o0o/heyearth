package admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import zeroshop.LocationDTO;
import zeroshop.ZeroshopDTO;

@Mapper
@Repository("admindao")
public interface AdminDAO {
	public List<ZeroshopDTO> adminzeroshoplist();
	public void adminzeroshopdel(int s_code);
	public ZeroshopDTO adminzeroshopinfo(int s_code);
	public int checkloccode(LocationDTO dto);
	public int loccode(LocationDTO dto);
	public void insertloc(LocationDTO dto);
	public void updatezeroshop(ZeroshopDTO dto);
}
