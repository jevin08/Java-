package entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Filters")
public class Filter
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String filterType;
	@OneToMany(mappedBy="filterType")
	private List<FilterValue> filterValues = new ArrayList<>();
	public Filter() {
		super();
	}
	public Filter(String filterType, List<FilterValue> filterValues) {
		super();
		this.filterType = filterType;
		this.filterValues = filterValues;
	}
	public Long getId() {
		return id;
	}
	public String getFilterType() {
		return filterType;
	}
	public void setFilterType(String filterType) {
		this.filterType = filterType;
	}
	public List<FilterValue> getFilterValues() {
		return filterValues;
	}
	public void setFilterValues(List<FilterValue> filterValues) {
		this.filterValues = filterValues;
	}
	public void setId(Long id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Filter [id=" + id + ", filterType=" + filterType + "]";
	}
}