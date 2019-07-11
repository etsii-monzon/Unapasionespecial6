
package domain;

import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
public class Conference extends DomainEntity {

	public String	title;
	public String	summary;
	public String	acronym;
	public String	venue;
	public Date		submissionDeadline;
	public Date		notificationDeadline;
	public Date		cameraDeadline;
	public Date		startDate;
	public Date		endDate;
	public Double	fee;
	private boolean	draftMode;


	@NotBlank
	public String getTitle() {
		return this.title;
	}

	public void setTitle(final String title) {
		this.title = title;
	}
	@NotBlank
	public String getAcronym() {
		return this.acronym;
	}

	public void setAcronym(final String acronym) {
		this.acronym = acronym;
	}
	@NotBlank
	public String getVenue() {
		return this.venue;
	}

	public void setVenue(final String venue) {
		this.venue = venue;
	}
	@NotNull
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
	public Date getSubmissionDeadline() {
		return this.submissionDeadline;
	}

	public void setSubmissionDeadline(final Date submissionDeadline) {
		this.submissionDeadline = submissionDeadline;
	}
	@NotNull
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
	public Date getNotificationDeadline() {
		return this.notificationDeadline;
	}

	public void setNotificationDeadline(final Date notificationDeadline) {
		this.notificationDeadline = notificationDeadline;
	}
	@NotNull
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
	public Date getCameraDeadline() {
		return this.cameraDeadline;
	}

	public void setCameraDeadline(final Date cameraDeadline) {
		this.cameraDeadline = cameraDeadline;
	}
	@NotNull
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(final Date startDate) {
		this.startDate = startDate;
	}
	@NotNull
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(final Date endDate) {
		this.endDate = endDate;
	}
	@NotNull
	public Double getFee() {
		return this.fee;
	}

	public void setFee(final Double fee) {
		this.fee = fee;
	}

	@NotNull
	public boolean isDraftMode() {
		return this.draftMode;
	}

	public void setDraftMode(final boolean draftMode) {
		this.draftMode = draftMode;
	}

	@NotBlank
	public String getSummary() {
		return this.summary;
	}

	public void setSummary(final String summary) {
		this.summary = summary;
	}

}
