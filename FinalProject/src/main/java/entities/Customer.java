package entities;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Customer
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String firstName;
	private String lastName;
	private String userName;
	private String email;
	private String password;
	private String phone;
	private String secondaryPhone;
	private Date birthDate;
	private String photo;
	@OneToOne(cascade=CascadeType.ALL)
	private Cart cart;
	@OneToMany(cascade = CascadeType.ALL)
	private List<Order> orders = new ArrayList<>();
	@ManyToMany(cascade = CascadeType.ALL)
	private List<Address> address = new ArrayList<>();
	public Customer() {
		super();
	}
	
	public Customer(String firstName, String lastName, String userName, String email, String password,
			String phone, String secondaryPhone, Date birthDate, String photo) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.secondaryPhone = secondaryPhone;
		this.birthDate = birthDate;
		this.photo = photo;
	}

	public Customer(Long id, String firstName, String lastName, String userName, String email, String password,
			String phone, String secondaryPhone, Date birthDate, String photo, Cart cart, List<Order> orders,
			List<Address> address) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.secondaryPhone = secondaryPhone;
		this.birthDate = birthDate;
		this.photo = photo;
		this.cart = cart;
		this.orders = orders;
		this.address = address;
	}

	public Long getId() {
		return id;
	}
	public List<Order> getOrders() {
		return orders;
	}
	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public void setOrder(Order order) {
		this.orders.add(order);
	}
	public List<Address> getAddress() {
		return address;
	}
	public void setAddress(List<Address> address) {
		this.address = address;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSecondaryPhone() {
		return secondaryPhone;
	}

	public void setSecondaryPhone(String secondaryPhone) {
		this.secondaryPhone = secondaryPhone;
	}

	@Override
	public String toString() {
		return "Customer [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", userName=" + userName
				+ ", email=" + email + ", password=" + password + ", phone=" + phone + ", secondaryPhone="
				+ secondaryPhone + ", birthDate=" + birthDate + ", photo=" + photo + "]";
	}
}