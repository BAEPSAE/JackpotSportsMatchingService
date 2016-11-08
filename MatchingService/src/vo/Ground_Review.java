package vo;

public class Ground_Review {
	
	int rvnum;	//pk 리뷰넘버
	int ground_Id;	//그라운드id
	String content;	//내용
	String user_Id;	//작성자

	public int getRvnum() {
		return rvnum;
	}
	public void setRvnum(int rvnum) {
		this.rvnum = rvnum;
	}
	public int getGround_Id() {
		return ground_Id;
	}
	public void setGround_Id(int ground_Id) {
		this.ground_Id = ground_Id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	@Override
	public String toString() {
		return "Ground_Review [rvnum=" + rvnum + ", ground_Id=" + ground_Id + ", content=" + content + ", user_Id="
				+ user_Id + "]";
	}
}
