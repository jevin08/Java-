package entities;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Entity
@Component
public class ImgColor
{
	@Id
	private String color;
	@Autowired
	public ImgColor() {
		super();
	}
	public ImgColor(String color) {
		super();
		this.color = color;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	@Override
	public String toString() {
		return "ImgColor [color=" + color + "]";
	}
}