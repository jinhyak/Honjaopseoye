package fp.common;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface DaoForm {
	
	public List<Map<String, Object>> select(Map<String, Object> pMap) throws IOException;
	
	public int insert(Map<String, Object> pMap) throws IOException;
	
	public int update(Map<String, Object> pMap) throws IOException;
	
	public int delete(Map<String, Object> pMap) throws IOException;

}
