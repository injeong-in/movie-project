package Movie;

public class MovieDTO {

	private String title;
	private String filmingLocation;
	private Long figures;
	private int releasedYear;
	private int audienceNumber;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFilmingLocation() {
		return filmingLocation;
	}
	public void setFilmingLocation(String filmingLocation) {
		this.filmingLocation = filmingLocation;
	}
	public Long getFigures() {
		return figures;
	}
	public void setFigures(Long figures) {
		this.figures = figures;
	}
	public int getReleasedYear() {
		return releasedYear;
	}
	public void setReleasedYear(int releasedYear) {
		this.releasedYear = releasedYear;
	}
	public int getAudienceNumber() {
		return audienceNumber;
	}
	public void setAudienceNumber(int audienceNumber) {
		this.audienceNumber = audienceNumber;
	}
	
	
	
}
