package services;

import java.sql.Date;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;

import entities.Customer;
import utilites.HibernateUtil;

public class CustomerServices {
	public static Long addCustomer(Customer customer) {
		System.out.println(customer.getUserName());
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.getTransaction().begin();
		Long custId = (Long) session.save(customer);
		session.getTransaction().commit();
		session.close();
		return custId;
	}
	public static boolean deleteById(String customerId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Customer persistence = session.load(Customer.class, customerId);
		if(persistence!=null) {
			session.delete(persistence);
		}
		return false;
	}
	public static long isCustomer(String uname, String pass) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<?> q = session.createQuery("SELECT id FROM Customer WHERE username='"+uname+"' and password='"+pass+"'").list();
		if(0==q.size()) {
			return (long) q.get(0);
		}
		return (long) 0;
	}
	@SuppressWarnings("unchecked")
	public static Customer getCustomer(String uname) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		TypedQuery<Customer> query = (TypedQuery<Customer>)  session.createQuery("SELECT id FROM Customer WHERE username='"+uname+"'").list();
		List<Customer> customers = query.getResultList();
		session.close();
		return customers.get(0);
	}
	public static Customer getCustomer(Long customerId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Customer cust = session.get(Customer.class, customerId);
		session.close();
		return cust;
	}
	@SuppressWarnings("unchecked")
	public static List<Customer> getCustomerByProduct(String productId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		TypedQuery<Customer> query = (TypedQuery<Customer>) session.createQuery("SELECT * FROM `CUSTOMER` WHERE ID=(SELECT customer_orders.Customer_id FROM customer_orders WHERE customer_orders.orders_id=(SELECT orders_item.Order_id FROM orders_item WHERE orders_item.items_id=(SELECT item.id FROM item WHERE item.product_id="+productId+")));");
		 List<Customer> customers = query.getResultList();
		 session.close();
		return customers;
	}
	@SuppressWarnings("unchecked")
	public static List<Customer> getCustomerByOrder(String orderId){
		Session session = HibernateUtil.getSessionFactory().openSession();
		TypedQuery<Customer> query = (TypedQuery<Customer>) session.createQuery("SELECT * FROM `CUSTOMER` WHERE ID=( SELECT customer_orders.Customer_id FROM customer_orders WHERE customer_orders.orders_id="+orderId+"'));");
		 List<Customer> customers = query.getResultList();
		 session.close();
		return customers;
	}
	@SuppressWarnings("unchecked")
	public static List<Customer> getCustomerByCity(String cityId){
		Session session = HibernateUtil.getSessionFactory().openSession();
		TypedQuery<Customer> query = (TypedQuery<Customer>) session.createQuery("SELECT * FROM `CUSTOMER` WHERE ID=(SELECT customer_address.Customer_id FROM customer_address WHERE customer_address.address_id=(SELECT address.id FROM address WHERE address.city_id="+cityId+"));");
		 List<Customer> customers = query.getResultList();
		 session.close();
		return customers;
	}
	@SuppressWarnings("unchecked")
	public static List<Customer> getCustomerByState(String state, String country){
		Session session = HibernateUtil.getSessionFactory().openSession();
		TypedQuery<Customer> query = (TypedQuery<Customer>) session.createQuery("SELECT * FROM `CUSTOMER` WHERE ID=(SELECT customer_address.Customer_id FROM customer_address WHERE customer_address.address_id=(SELECT address.id FROM address WHERE address.city_id=(SELECT city.id FROM city WHERE city.state="+state+" AND city.country="+country+")));");
		 List<Customer> customers = query.getResultList();
		 session.close();
		return customers;
	}
	@SuppressWarnings("unchecked")
	public static List<Customer> getCustomerByCountry(String country){
		Session session = HibernateUtil.getSessionFactory().openSession();
		TypedQuery<Customer> query = (TypedQuery<Customer>) session.createQuery("SELECT * FROM `CUSTOMER` WHERE ID=(SELECT customer_address.Customer_id FROM customer_address WHERE customer_address.address_id=(SELECT address.id FROM address WHERE address.city_id=(SELECT city.id FROM city WHERE city.country="+country+")));");
		 List<Customer> customers = query.getResultList();
		 session.close();
		return customers;
	}
	@SuppressWarnings("unchecked")
	public static List<Customer> getCustomerByOrderDate(Date date){
		Session session = HibernateUtil.getSessionFactory().openSession();
		TypedQuery<Customer> query = (TypedQuery<Customer>) session.createQuery("SELECT * FROM `CUSTOMER` WHERE ID=( SELECT customer_orders.Customer_id FROM customer_orders WHERE customer_orders.orders_id=( SELECT orders.id FROM orders WHERE CAST(orders.transictionTime AS DATE)='"+date+"'));");
		 List<Customer> customers = query.getResultList();
		 session.close();
		return customers;
	}
}

/*
 * --------------------------- Selecting customer by Product ----------------------------
SELECT * FROM `CUSTOMER` WHERE ID=(
	SELECT customer_orders.Customer_id FROM customer_orders WHERE customer_orders.orders_id=(
        SELECT orders_item.Order_id FROM orders_item WHERE orders_item.items_id=(
            SELECT item.id FROM item WHERE item.product_id=1
        )
    )
);
SELECT * FROM `CUSTOMER` WHERE ID=(
    SELECT orders.customer_id FROM orders WHERE orders.id=(
        SELECT orders_item.Order_id FROM orders_item WHERE orders_item.items_id=(
            SELECT item.id FROM item WHERE item.product_id=1
        )
    )
);
 */

/*
 * --------------------------- Selecting customer by City ----------------------------
 SELECT * FROM `CUSTOMER` WHERE ID=(
    SELECT customer_address.Customer_id FROM customer_address WHERE customer_address.address_id=(
        SELECT address.id FROM address WHERE address.city_id=(
            SELECT address.city_id FROM address WHERE address.city_id=1
        )
    )
);
*/

/* 
 * -------------------------- Selecting customer by state and country --------------------------
 SELECT * FROM `CUSTOMER` WHERE ID=(
    SELECT customer_address.Customer_id FROM customer_address WHERE customer_address.address_id=(
        SELECT address.id FROM address WHERE address.city_id=(
            SELECT city.id FROM city WHERE city.state=1 && city.country=1
        )
    )
);
*/
 
/* 
 * -------------------------- Selecting customer by country --------------------------
 SELECT * FROM `CUSTOMER` WHERE ID=(
    SELECT customer_address.Customer_id FROM customer_address WHERE customer_address.address_id=(
        SELECT address.id FROM address WHERE address.city_id=(
            SELECT city.id FROM city WHERE city.country=1
        )
    )
);
*/
/* -------------------------- Selecting customer by order date -----------------------
 SELECT * FROM `CUSTOMER` WHERE ID=(
    SELECT customer_orders.Customer_id FROM customer_orders WHERE customer_orders.orders_id=(
        SELECT orders.id FROM orders WHERE CAST(orders.transictionTime AS DATE)='2022-03-01'
    )
);
 */
 