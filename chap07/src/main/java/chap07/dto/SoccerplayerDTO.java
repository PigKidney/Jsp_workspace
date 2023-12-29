package chap07.dto;

public class SoccerplayerDTO {
	Integer PLAYER_ID;
	String PLAYER_KOR_NAME;
	String PLAYER_POSITION;
	Integer PLAYER_BACK_NUMBER;
	String COUNTRY_ID;
	Integer TEAM_ID;
	
	
	public SoccerplayerDTO() {
	}
	
	public SoccerplayerDTO(Integer pLAYER_ID, String pLAYER_KOR_NAME, String pLAYER_POSITION, Integer pLAYER_BACK_NUMBER,
			String cOUNTRY_ID, Integer tEAM_ID) {
		super();
		PLAYER_ID = pLAYER_ID;
		PLAYER_KOR_NAME = pLAYER_KOR_NAME;
		PLAYER_POSITION = pLAYER_POSITION;
		PLAYER_BACK_NUMBER = pLAYER_BACK_NUMBER;
		COUNTRY_ID = cOUNTRY_ID;
		TEAM_ID = tEAM_ID;
	}
	
	public String getDivRow() {
		return String.format(
				"<div>%d</div>"
				+ "<div>%s</div>"
				+ "<div>%s</div>"
				+ "<div>%d</div>"
				+ "<div>%s</div>"
				+ "<div>%d</div>", 
				PLAYER_ID,
				PLAYER_KOR_NAME,
				PLAYER_POSITION,
				PLAYER_BACK_NUMBER,
				COUNTRY_ID,
				TEAM_ID);
	}
	
	public Integer getPLAYER_ID() {
		return PLAYER_ID;
	}
	public void setPLAYER_ID(Integer pLAYER_ID) {
		PLAYER_ID = pLAYER_ID;
	}
	public String getPLAYER_KOR_NAME() {
		return PLAYER_KOR_NAME;
	}
	public void setPLAYER_KOR_NAME(String pLAYER_KOR_NAME) {
		PLAYER_KOR_NAME = pLAYER_KOR_NAME;
	}
	public String getPLAYER_POSITION() {
		return PLAYER_POSITION;
	}
	public void setPLAYER_POSITION(String pLAYER_POSITION) {
		PLAYER_POSITION = pLAYER_POSITION;
	}
	public Integer getPLAYER_BACK_NUMBER() {
		return PLAYER_BACK_NUMBER;
	}
	public void setPLAYER_BACK_NUMBER(Integer pLAYER_BACK_NUMBER) {
		PLAYER_BACK_NUMBER = pLAYER_BACK_NUMBER;
	}
	public String getCOUNTRY_ID() {
		return COUNTRY_ID;
	}
	public void setCOUNTRY_ID(String cOUNTRY_ID) {
		COUNTRY_ID = cOUNTRY_ID;
	}
	public Integer getTEAM_ID() {
		return TEAM_ID;
	}
	public void setTEAM_ID(Integer tEAM_ID) {
		TEAM_ID = tEAM_ID;
	}
	
	
}
