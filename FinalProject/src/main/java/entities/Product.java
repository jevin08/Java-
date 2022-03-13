package entities;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope(value="prototype")
@Entity
public class Product
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String name;
	@OneToMany(cascade = CascadeType.ALL)
	private List<Filter> filters = new ArrayList<>();
	@OneToOne(cascade = CascadeType.ALL)
	private Description description;
	private double price;
	private double discount;
	private Timestamp lastUpdated;
	@OneToMany(mappedBy="product")
	private List<Item> items = new ArrayList<>();
	@OneToMany(mappedBy="product")
	private List<ProductPicture> picture = new ArrayList<>();
	public Product() {
		super();
	}
	public Product(String name, List<Filter> filters, Description description, double price, double discount,
			List<Item> items, List<ProductPicture> picture) {
		super();
		this.name = name;
		this.filters = filters;
		this.description = description;
		this.price = price;
		this.discount = discount;
		this.lastUpdated = Timestamp.valueOf(LocalDateTime.now());
		this.items = items;
		this.picture = picture;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Filter> getFilters() {
		return filters;
	}
	public void setFilters(List<Filter> filters) {
		this.filters = filters;
	}
	public Description getDescription() {
		return description;
	}
	public void setDescription(Description description) {
		this.description = description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public List<Item> getItems() {
		return items;
	}
	public int getCurrentItems() {
		return items.size();
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	public List<ProductPicture> getPicture() {
		return picture;
	}
	public void setPicture(List<ProductPicture> picture) {
		this.picture = picture;
	}
	public void setId(Long id) {
		this.id=id;
	}
	public Long getId() {
		return id;
	}
	public Timestamp getLastUpdated() {
		return lastUpdated;
	}
	public void setLastUpdated(Timestamp lastUpdated) {
		this.lastUpdated = lastUpdated;
	}
	public void setLastUpdated() {
		this.lastUpdated = Timestamp.valueOf(LocalDateTime.now());
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", description=" + description
				+ ", price=" + price + ", discount=" + discount + "]";
	}	
}