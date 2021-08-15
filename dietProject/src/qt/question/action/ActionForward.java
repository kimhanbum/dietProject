package qt.question.action;
//ActionForward Ŭ������ Action �������̽����� ����� �����ϰ� ��� ����
//������ �̵� �Ҷ� ���Ǵ� Ŭ���� �Դϴ�.
//�� Ŭ������ Redirect ���� ���� �������� �������� ��ġ�� ������ �ֽ��ϴ�.
//�� ������ FrontController���� ActionForward Ŭ���� Ÿ������ ��ȯ����
//�������� �� ���� Ȯ���Ͽ� �ش��ϴ� ��û �������� �̵��մϴ�.
public class ActionForward{
	private boolean redirect=false;
	private String path=null;
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
