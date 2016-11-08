package vo;

public class Reply {
	int replyNum;	//리플테이블 주키
	int boardNum;	//보드테이블 주키 참조하는 외래키
	String user_Id;	// 유저아이디
	String content;	//리플 내용
	String inputDate;	//입력시간
	
	@Override
	public String toString() {
		return "Reply [replyNum=" + replyNum + ", boardNum=" + boardNum + ", user_Id=" + user_Id + ", content="
				+ content + ", inputDate=" + inputDate + "]";
	}
	
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getInputDate() {
		return inputDate;
	}
	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}
}
