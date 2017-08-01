package board;

import java.sql.Timestamp;

public class Board {
	private int bId;
	private String bTitle;
	private String bContent;
	private Timestamp bTime_Make;
	private Timestamp bTime_Modi;
	
	public Board(int bId, String bTitle, String bContent, Timestamp bTime_Make, Timestamp bTime_Modi) {
		this.bId = bId;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bTime_Make = bTime_Make;
		this.bTime_Modi = bTime_Modi;
		System.out.println(bId+" "+bTitle+" "+bContent+" "+bTime_Make+" "+bTime_Modi);
	}
	
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public Timestamp getbTime_Make() {
		return bTime_Make;
	}
	public void setbTime_Make(Timestamp bTime_Make) {
		this.bTime_Make = bTime_Make;
	}
	public Timestamp getbTime_Modi() {
		return bTime_Modi;
	}
	public void setbTime_Modi(Timestamp bTime_Modi) {
		this.bTime_Modi = bTime_Modi;
	}
	
	
}
