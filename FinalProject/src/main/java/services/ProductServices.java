package services;

//import java.util.List;

//import javax.persistence.TypedQuery;

import org.hibernate.Session;
//import org.hibernate.query.Query;

import entities.Product;
import utilites.HibernateUtil;

public class ProductServices {
	public static Long addProduct(Product product) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.getTransaction().begin();
		Long productId = (Long) session.save(product);
		session.getTransaction().commit();
		session.close();
		return productId;		
	}
	public static boolean deleteById(String productId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Product persistence = session.load(Product.class, productId);
		if(persistence!=null) {
			session.delete(persistence);
		}
		return false;
	}
	public static Product getCustomer(Long productId) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Product cust = session.get(Product.class, productId);
		session.close();
		return cust;
	}
//	@SuppressWarnings("unchecked")
//	public static List<Product> productByPrice(double min, double max){
//		Session session = HibernateUtil.getSessionFactory().openSession();
//		TypedQuery<Product> query = (TypedQuery<Product>) session.createQuery("SELECT * FROM `Product` WHERE price<="+max+" and price>="+min+";").list();
//		 List<Product> products = query.getResultList();
//		 session.close();
//		return products;
//	}
//
//	public static double maxPrice() {
//		Session session = HibernateUtil.getSessionFactory().openSession();
//		 Query<?> q =  (Query<?>) session.createQuery("SELECT Max(price) FROM `Product`;").list();
//		 double price = q.getFirstResult();
//		 session.close();
//		return price;
//	}
}
