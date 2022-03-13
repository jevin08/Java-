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
import javax.servlet.http.Cookie;

@Entity
public class AnonymousCart
{
//	private final static int timeLimit = 30*60*2400;// 30 Days
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;	
	private Cookie cookie;
	@OneToMany(cascade = CascadeType.ALL)
	private List<Item> items = new ArrayList<>();
	private Timestamp lastUpdated;

	public AnonymousCart() {
		super();
	}
	public AnonymousCart(Cookie cookie, List<Item> items, Timestamp lastUpdated) {
		super();
		this.cookie = cookie;
		this.items = items;
		this.lastUpdated = lastUpdated;
	}
	public void setLastUpdated() {
		this.lastUpdated = Timestamp.valueOf(LocalDateTime.now());
	}
	public void setLastUpdated(Timestamp lastUpdated) {
		this.lastUpdated = lastUpdated;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Cookie getCookie() {
		return cookie;
	}
	public void setCookie(Cookie cookie) {
		this.cookie = cookie;
	}
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	public Timestamp getLastUpdated() {
		return lastUpdated;
	}
	@Override
	public String toString() {
		return "AnonymousCart [id=" + id + ", cookie=" + cookie + ", items=" + items + ", lastUpdated=" + lastUpdated
				+ "]";
	}
}