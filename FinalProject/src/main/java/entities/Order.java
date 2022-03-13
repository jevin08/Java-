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
import javax.persistence.Table;

@Entity
@Table(name = "Orders")
public class Order
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@OneToMany(cascade = CascadeType.ALL)
	private List<Item> items = new ArrayList<>();
	@OneToOne(cascade = CascadeType.ALL)
	private Customer customer;
	private Timestamp transictionTime;
	public Order() {
		super();
	}
	public Order(List<Item> items, Customer customer) {
		super();
		this.items = items;
		this.customer = customer;
		this.transictionTime = Timestamp.valueOf(LocalDateTime.now());
		
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
	public Timestamp getTransictionTime() {
		return transictionTime;
	}
	public void setTransictionTime(Timestamp transictionTime) {
		this.transictionTime = transictionTime;
	}
	public void setLastUpdated() {
		this.transictionTime = Timestamp.valueOf(LocalDateTime.now());
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", customer=" + customer + ", transictionTime=" + transictionTime + "]";
	}
	
}