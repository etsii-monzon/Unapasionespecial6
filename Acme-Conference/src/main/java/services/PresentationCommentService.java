
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

import repositories.PresentationCommentRepository;
import domain.PresentationComment;

@Service
@Transactional
public class PresentationCommentService {

	@Autowired
	private PresentationCommentRepository	activityCommentRepository;

	@Autowired
	private ActorService					actorService;

	@Autowired
	private AuthorService					authorService;

	@Autowired
	private ReviewerService					revService;

	@Autowired
	private AdministratorService			adminService;

	@Autowired
	private PresentationService				presentationService;


	public PresentationComment create(final int activityId) {
		PresentationComment com;

		System.out.println(activityId);
		com = new PresentationComment();

		if (this.presentationService.findOne(activityId).getId() == activityId) {
			System.out.println(this.presentationService.findOne(activityId));
			com.setPresentation(this.presentationService.findOne(activityId));
		}
		final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication instanceof AnonymousAuthenticationToken)
			com.setAuthor("anonymous");
		else
			com.setAuthor(this.actorService.findByPrincipal().getName() + " " + this.actorService.findByPrincipal().getSurname());

		final Date fecha = new GregorianCalendar().getTime();

		com.setMoment(fecha);
		return com;

	}

	public PresentationComment save(final PresentationComment com) {
		final PresentationComment res;

		res = this.activityCommentRepository.save(com);
		Assert.notNull(res.getPresentation(), "comment sin clase");
		return res;

	}

	public Collection<PresentationComment> findCommentsOfPresentation(final int activityId) {
		//Assert.notNull(this.actService.findOne(activityId));
		return this.activityCommentRepository.findCommentsOfPresentation(activityId);
	}
}
