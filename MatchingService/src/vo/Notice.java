package vo;

public class Notice {
	int noticenum;
	String user_Id;
	int game_Id;
	int n_Type;
	
	
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(String user_Id, int n_Type) {
		super();
		this.user_Id = user_Id;
		this.n_Type = n_Type;
	}


	public int getNoticenum() {
		return noticenum;
	}

	public void setNoticenum(int noticenum) {
		this.noticenum = noticenum;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public int getGame_Id() {
		return game_Id;
	}

	public void setGame_Id(int game_Id) {
		this.game_Id = game_Id;
	}

	public int getN_Type() {
		return n_Type;
	}

	public void setN_Type(int n_Type) {
		this.n_Type = n_Type;
	}

	@Override
	public String toString() {
		return "Notice [noticenum=" + noticenum + ", user_Id=" + user_Id + ", game_Id=" + game_Id + ", n_Type=" + n_Type
				+ "]";
	}
	
	
}
