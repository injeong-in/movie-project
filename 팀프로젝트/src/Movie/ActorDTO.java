package Movie;

public class ActorDTO {
	
	private int actorID;
	private String name;
	private char gender;
	private String country;
	private String movie;
	private String deleteName;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getMovie() {
		return movie;
	}
	public void setMovie(String movie) {
		this.movie = movie;
	}
	public int getActorID() {
		return actorID;
	}
	public void setActorID(int actorID) {
		this.actorID = actorID;
	}
	public String getDeleteName() {
		return deleteName;
	}
	public void setDeleteName(String deleteName) {
		this.deleteName = deleteName;
	}
}
