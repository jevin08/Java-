package entities;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class FilterValue
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne(cascade = CascadeType.ALL)
	private Filter filterType;
	private String value;
	public FilterValue() {
		super();
	}
	public FilterValue(String value, Filter filterType) {
		super();
		this.value = value;
		this.filterType = filterType;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public Filter getFilterType() {
		return filterType;
	}
	public void setFilterType(Filter filterType) {
		this.filterType = filterType;
	}
	@Override
	public String toString() {
		return "FilterValue [id=" + id + ", value=" + value + ", filterType=" + filterType + "]";
	}
}