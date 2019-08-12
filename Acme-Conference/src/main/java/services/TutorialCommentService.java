
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

import repositories.TutorialCommentRepository;
import domain.TutorialComment;

@Service
@Transactional
public class TutorialCommentService {

	@Autowired
	private TutorialCommentRepository	activityCommentRepository;

	@Autowired
	private ActorService				actorService;

	@Autowired
	private AuthorService				authorService;

	@Autowired
	private ReviewerService				revService;

	@Autowired
	private AdministratorService		adminService;

	@Autowired
	private TutorialService				tutorialService;


	public TutorialComment create(final int activityId) {
		TutorialComment com;

		System.out.println(activityId);
		com = new TutorialComment();

		if (this.tutorialService.findOne(activityId).getId() == activityId) {
			System.out.println(this.tutorialService.findOne(activityId));
			com.setTutorial(this.tutorialService.findOne(activityId));
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

	public TutorialComment save(final TutorialComment com) {
		final TutorialComment res;

		res = this.activityCommentRepository.save(com);
		Assert.notNull(res.getTutorial(), "comment sin clase");
		return res;

	}

	public Collection<TutorialComment> findCommentsOfTutorial(final int activityId) {
		//Assert.notNull(this.actService.findOne(activityId));
		return this.activityCommentRepository.findCommentsOfTutorial(activityId);
	}

}
