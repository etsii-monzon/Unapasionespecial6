
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class Section extends DomainEntity {

	private String				title;
	private String				summary;
	private Collection<String>	optionalPictures;


	@NotBlank
	public String getTitle() {
		return this.title;
	}

	public void setTitle(final String title) {
		this.title = title;
	}

	@NotBlank
	public String getSummary() {
		return this.summary;
	}

	public void setSummary(final String summary) {
		this.summary = summary;
	}

	@ElementCollection
	public Collection<String> getOptionalPictures() {
		return this.optionalPictures;
	}

	public void setOptionalPictures(final Collection<String> optionalPictures) {
		this.optionalPictures = optionalPictures;
	}

}
