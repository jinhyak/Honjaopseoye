package fp.common;

public class Model {
	
	private boolean isRedirect = true;
	private String path = "error.jsp"; //error������ ���� ������
	
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
		this.path = path;// path �ٶ�. logicname �ְ� �� �ؿ� ������ ����  �� . jsps
	}
}
