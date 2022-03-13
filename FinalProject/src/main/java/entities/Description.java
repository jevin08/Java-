package entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Description
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String container;
	@OneToMany(cascade = CascadeType.ALL)
	private List<DescriptionLine> descriptionLine = new ArrayList<>();
	@ManyToMany(cascade = CascadeType.ALL)
	private List<Property> properties = new ArrayList<>();
	public Description() {
		super();
	}
	public Description(String container, List<DescriptionLine> descriptionLine, List<Property> properties) {
		super();
		this.container = container;
		this.descriptionLine = descriptionLine;
		this.properties = properties;
	}

	public Long getId() {
		return id;
	}
	public String getContainer() {
		return container;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public List<DescriptionLine> getDescriptionLine() {
		return descriptionLine;
	}
	public void setDescriptionLine(List<DescriptionLine> descriptionLine) {
		this.descriptionLine = descriptionLine;
	}
	public List<Property> getProperties() {
		return properties;
	}
	public void setProperties(List<Property> properties) {
		this.properties = properties;
	}
	public void setContainer(String container) {
		this.container = container;
	}
	@Override
	public String toString() {
		return "Description [id=" + id + ", container=" + container + "]";
	}
}