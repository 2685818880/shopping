package com.Bean.java;

public class MovieInfo {
	private int id;
	private String file ;
	private float price ;
	private String intro ;
	private String day ;
	public MovieInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MovieInfo(int id, String file, float price, String intro, String day) {
		super();
		this.id = id;
		this.file = file;
		this.price = price;
		this.intro = intro;
		this.day = day;
	}
	public MovieInfo(String file, float price, String intro, String day) {
		super();
		this.file = file;
		this.price = price;
		this.intro = intro;
		this.day = day;
	}
	@Override
	public String toString() {
		return "MovieInfo [id=" + id + ", file=" + file + ", price=" + price
				+ ", intro=" + intro + ", Day=" + day + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		day = day;
	}
	
}
