package vo;

public class Board {
	private int boardNum; // ���� pk(sequence)
	private String title; //������
	private String content;	//�۳���
	private String user_Id;	//�ۼ���ID
	private String inputDate;	//�ۼ���
	private String category;	//ī�װ�(���Ӹ�)
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public int getboardNum() {
		return boardNum;
	}

	public void setboardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getuser_Id() {
		return user_Id;
	}

	public void setuser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public String getinputDate() {
		return inputDate;
	}

	public void setinputDate(String inputDate) {
		this.inputDate = inputDate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Board [boardNum=" + boardNum + ", title=" + title + ", content=" + content + ", user_Id=" + user_Id
				+ ", inputDate=" + inputDate + ", category=" + category + "]";
	}
	
	
	
}
