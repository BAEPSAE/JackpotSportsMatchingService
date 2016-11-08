package vo;

public class Events {
	String title;
	String start;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	@Override
	public String toString() {
		return "Events [title=" + title + ", start=" + start + "]";
	}
	
	
}
