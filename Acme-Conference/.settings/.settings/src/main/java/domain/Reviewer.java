
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
@Access(AccessType.PROPERTY)
public class Reviewer extends Actor {

	private Collection<Report>	reports;
	private Collection<String>	experience;


	@ElementCollection
	public Collection<String> getExperience() {
		return this.experience;
	}

	public void setExperience(final Collection<String> experience) {
		this.experience = experience;
	}

	@OneToMany
	public Collection<Report> getReports() {
		return this.reports;
	}

	public void setReports(final Collection<Report> reports) {
		this.reports = reports;
	}

}
