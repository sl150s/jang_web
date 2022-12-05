package test.coment.Dto;

public class ComentDto {
	private int num;
	private String name;
	private String coment;
	private String comentDate;
	
	public ComentDto() {}

	public ComentDto(int num, String name, String coment, String comentDate) {
		super();
		this.num = num;
		this.name = name;
		this.coment = coment;
		this.comentDate = comentDate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getComent() {
		return coment;
	}

	public void setComent(String coment) {
		this.coment = coment;
	}

	public String getComentDate() {
		return comentDate;
	}

	public void setComentDate(String comentDate) {
		this.comentDate = comentDate;
	};
	
	
}


