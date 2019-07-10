
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
@Access(AccessType.PROPERTY)
public class Presentation extends Activity {

	private Submission	submission;


	@OneToOne
	public Submission getSubmission() {
		return this.submission;
	}

	public void setSubmission(final Submission submission) {
		this.submission = submission;
	}

}
