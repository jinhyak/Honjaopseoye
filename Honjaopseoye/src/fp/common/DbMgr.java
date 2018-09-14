package fp.common;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DbMgr {
	String connection = "zDB/mybatis/MapperConfig.xml";
	List<Map<String,Object>> list = null;
	Map<String, Object> rMap = null;
	SqlSessionFactory sqlf = null;
	SqlSession sqls = null;
	Reader reader = null;
	
	public SqlSession connection() throws IOException 
	{
		reader = Resources.getResourceAsReader(connection);
		sqlf = new SqlSessionFactoryBuilder().build(reader);
		reader.close();
		sqls = sqlf.openSession();
		return sqls;
	}
}
