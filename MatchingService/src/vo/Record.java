package vo;

public class Record {

	int record_Id;	//레코드 테이블 주키
	int fb_Total; //축구 총경기
	int fb_Win;	  //축구경기중 이긴경기수
	int fb_Draw;  //축구 무승부
	int bb_Total; //야구 총경기
	int bb_Win;	  //야구경기중 이긴경기수
	int bb_Draw;  //야구 무승부
	int pp_Total; //탁구 총경기
	int pp_Win;	  //탁구경기중 이긴경기수
	int pp_Draw;  //탁구 무승부
	int bl_Total; //볼링 총경기
	int bl_Win;	  //볼링경기중 이긴경기수
	int bl_Draw;  //볼링 무승부
	
	public int getRecord_Id() {
		return record_Id;
	}
	public void setRecord_Id(int record_Id) {
		this.record_Id = record_Id;
	}
	public int getFb_Total() {
		return fb_Total;
	}
	public void setFb_Total(int fb_Total) {
		this.fb_Total = fb_Total;
	}
	public int getFb_Win() {
		return fb_Win;
	}
	public void setFb_Win(int fb_Win) {
		this.fb_Win = fb_Win;
	}
	public int getFb_Draw() {
		return fb_Draw;
	}
	public void setFb_Draw(int fb_Draw) {
		this.fb_Draw = fb_Draw;
	}
	public int getBb_Total() {
		return bb_Total;
	}
	public void setBb_Total(int bb_Total) {
		this.bb_Total = bb_Total;
	}
	public int getBb_Win() {
		return bb_Win;
	}
	public void setBb_Win(int bb_Win) {
		this.bb_Win = bb_Win;
	}
	public int getBb_Draw() {
		return bb_Draw;
	}
	public void setBb_Draw(int bb_Draw) {
		this.bb_Draw = bb_Draw;
	}
	public int getPp_Total() {
		return pp_Total;
	}
	public void setPp_Total(int pp_Total) {
		this.pp_Total = pp_Total;
	}
	public int getPp_Win() {
		return pp_Win;
	}
	public void setPp_Win(int pp_Win) {
		this.pp_Win = pp_Win;
	}
	public int getPp_Draw() {
		return pp_Draw;
	}
	public void setPp_Draw(int pp_Draw) {
		this.pp_Draw = pp_Draw;
	}
	public int getBl_Total() {
		return bl_Total;
	}
	public void setBl_Total(int bl_Total) {
		this.bl_Total = bl_Total;
	}
	public int getBl_Win() {
		return bl_Win;
	}
	public void setBl_Win(int bl_Win) {
		this.bl_Win = bl_Win;
	}
	public int getBl_Draw() {
		return bl_Draw;
	}
	public void setBl_Draw(int bl_Draw) {
		this.bl_Draw = bl_Draw;
	}
	@Override
	public String toString() {
		return "Record [record_Id=" + record_Id + ", fb_Total=" + fb_Total + ", fb_Win=" + fb_Win + ", fb_Draw="
				+ fb_Draw + ", bb_Total=" + bb_Total + ", bb_Win=" + bb_Win + ", bb_Draw=" + bb_Draw + ", pp_Total="
				+ pp_Total + ", pp_Win=" + pp_Win + ", pp_Draw=" + pp_Draw + ", bl_Total=" + bl_Total + ", bl_Win="
				+ bl_Win + ", bl_Draw=" + bl_Draw + "]";
	}
	
}
