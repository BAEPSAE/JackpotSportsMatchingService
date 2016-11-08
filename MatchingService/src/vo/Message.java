package vo;

public class Message {

	int msgNum;	//메세지테이블 주키
	String content;	//메세지 내용
	String user_Id;	//유저테이블 주키 참조하는 외래키
	String game_Id;	//게임테이블 주키 참조하는 외래키
	String inputDate;	//메세지 입력한 시간
	
	@Override
	public String toString() {
		return "Message [msgNum=" + msgNum + ", content=" + content + ", user_Id=" + user_Id + ", game_Id=" + game_Id
				+ ", inputDate=" + inputDate + "]";
	}
	public int getMsgNum() {
		return msgNum;
	}
	public void setMsgNum(int msgNum) {
		this.msgNum = msgNum;
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
	public String getGame_Id() {
		return game_Id;
	}
	public void setGame_Id(String game_Id) {
		this.game_Id = game_Id;
	}
	public String getInputDate() {
		return inputDate;
	}
	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}
	
}
