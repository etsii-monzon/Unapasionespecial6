
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.validation.Valid;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class Category extends DomainEntity {

	private String					englishTitle;
	private String					spanishName;

	private Collection<Category>	parents;
	private Collection<Category>	children;


	@NotBlank
	public String getEnglishTitle() {
		return this.englishTitle;
	}

	public void setEnglishTitle(final String englishTitle) {
		this.englishTitle = englishTitle;
	}
	@NotBlank
	public String getSpanishName() {
		return this.spanishName;
	}

	public void setSpanishName(final String spanishName) {
		this.spanishName = spanishName;
	}

	@OneToMany
	@Valid
	public Collection<Category> getChildren() {
		return this.children;
	}

	public void setChildren(final Collection<Category> children) {
		this.children = children;
	}

	@ManyToMany
	@Valid
	public Collection<Category> getParents() {
		return this.parents;
	}

	public void setParents(final Collection<Category> parents) {
		this.parents = parents;
	}

}
