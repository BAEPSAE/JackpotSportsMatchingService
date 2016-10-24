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
	private Map<String, Object> session;
	BoardDAO DAO = new BoardDAO();
	private ArrayList<Board> boardlist;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;

	}

	public String insertBoard() throws Exception {
		System.out.println("인서트실행");
		System.out.println(board);

		int result = DAO.insertBoard(board);

		if (result > 0)
			return SUCCESS;
		else
			return ERROR;
	}

	public String boardView() throws Exception {
		System.out.println("select실행");
		boardlist = (ArrayList<Board>) DAO.getBoardList();
		System.out.println(boardlist);
		return SUCCESS;
	}

	public String readboard() throws Exception {
		System.out.println("selectboard실행");
		System.out.println(board.getboardNum());
		board = DAO.getBoard(board.getboardNum());
		return SUCCESS;
	}
	public String deleteboard() throws Exception {
		System.out.println("deleteboard실행");
		System.out.println(board.getboardNum());
		int result = DAO.deleteBoard(board.getboardNum());
		if (result > 0)
			return SUCCESS;
		else
			return ERROR;
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
