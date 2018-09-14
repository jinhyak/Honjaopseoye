package fp.common;

public class Model {
	
	private boolean isRedirect = true;
	private String path = "error.jsp"; //error낫을때 가는 페이지
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;// path 줄때. logicname 주고 그 밑에 보내고 싶은  값 . jsps
	}
}
