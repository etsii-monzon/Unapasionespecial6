
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
@Access(AccessType.PROPERTY)
public class PanelComment extends Comment {

	private Panel	panel;


	@ManyToOne(optional = true)
	public Panel getPanel() {
		return this.panel;
	}

	public void setPanel(final Panel panel) {
		this.panel = panel;
	}

}
