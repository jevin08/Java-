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

@Entity
public class Cart
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@OneToOne(cascade = CascadeType.ALL)
	private Customer customer;
	@OneToMany(cascade = CascadeType.ALL)
	private List<Item> items = new ArrayList<>();
	private Timestamp lastUpdated;
	public Cart() {
		super();
	}
	public Cart(List<Item> items, Customer customer) {
		super();
		this.items = items;
		this.customer = customer;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Timestamp getLastUpdated() {
		return this.lastUpdated;
	}
	public void setLastUpdated(Timestamp lastUpdated) {
		this.lastUpdated = lastUpdated;
	}
	public void setLastUpdated() {
		this.lastUpdated = Timestamp.valueOf(LocalDateTime.now());
	}
	@Override
	public String toString() {
		return "Cart [id=" + id + ", customer=" + customer + "]";
	}
}