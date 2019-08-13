
package services;

import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ConferenceCommentRepository;
import domain.Conference;
import domain.ConferenceComment;

@Service
@Transactional
public class ConferenceCommentService {

	@Autowired
	private ConferenceCommentRepository	conferenceCommentRepository;

	@Autowired
	private ActorService				actorService;

	@Autowired
	private ConferenceService			conferenceService;


	public ConferenceComment create(final int conferenceId) {
		ConferenceComment com;
		final Conference conf;

		com = new ConferenceComment();
		conf = this.conferenceService.findOne(conferenceId);
		final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication instanceof AnonymousAuthenticationToken)
			com.setAuthor("anonymous");
		else
			com.setAuthor(this.actorService.findByPrincipal().getName() + " " + this.actorService.findByPrincipal().getSurname());

		final Date fecha = new GregorianCalendar().getTime();

		com.setConference(conf);
		com.setMoment(fecha);
		return com;

	}

	public ConferenceComment save(final ConferenceComment com) {
		final ConferenceComment res;

		res = this.conferenceCommentRepository.save(com);
		Assert.notNull(com.getConference(), "comment sin clase");
		return res;

	}

	public Collection<ConferenceComment> findCommentsOfConference(final int conferenceId) {
		//Assert.notNull(this.actService.findOne(activityId));
		return this.conferenceCommentRepository.findCommentsOfConference(conferenceId);
	}

	public Double avgCommentsPerConference() {
		return this.conferenceCommentRepository.avgCommentsPerConference();
	}

	public Double stdDevCommentsPerConference() {
		return this.conferenceCommentRepository.stdDevCommentsPerConference();
	}

	public Integer maxCommentsPerConference() {
		return this.conferenceCommentRepository.maxCommentsPerConference();
	}

	public Integer minCommentsPerConference() {
		return this.conferenceCommentRepository.minCommentsPerConference();
	}
}
