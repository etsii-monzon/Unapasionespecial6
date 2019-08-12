
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
@Access(AccessType.PROPERTY)
public class PresentationComment extends Comment {

	private Presentation	presentation;


	@ManyToOne(optional = true)
	public Presentation getPresentation() {
		return this.presentation;
	}

	public void setPresentation(final Presentation presentation) {
		this.presentation = presentation;
	}

}
