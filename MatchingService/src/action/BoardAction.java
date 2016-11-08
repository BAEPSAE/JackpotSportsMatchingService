package action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import vo.Board;
import dao.BoardDAO;

public class BoardAction extends ActionSupport implements SessionAware {
	
	private Board board;
	private String num;
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	private Map<String, Object> session;
	BoardDAO DAO = new BoardDAO();
	private ArrayList<Board> boardlist;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;

	}

	public String insertBoard() throws Exception {
		board.setUser_Id((String) session.get("user_Id") );
		int result = DAO.insertBoard(board);

		if (result > 0)
			return SUCCESS;
		else
			return ERROR;
	}

	public String boardView() throws Exception {
		boardlist = (ArrayList<Board>) DAO.getBoardList();
		return SUCCESS;
	}

	public String readBoard() throws Exception {
		board = DAO.getBoard(Integer.parseInt(num));
		return SUCCESS;
	}
	public String deleteBoard() throws Exception {
		System.out.println("삭제");
		System.out.println(board.getBoardNum());
		DAO.deleteBoard(board.getBoardNum());
		return SUCCESS;
	}

	//  get,set method
	public ArrayList<Board> getBoardlist() {

		return boardlist;
	}

	public void setBoardlist(ArrayList<Board> boardlist) {
		this.boardlist = boardlist;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}
}
