
package services;

import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ActivityCommentRepository;
import domain.Activity;
import domain.ActivityComment;

@Service
@Transactional
public class ActivityCommentService {

	@Autowired
	private ActivityCommentRepository	activityCommentRepository;

	@Autowired
	private ActorService				actorService;

	@Autowired
	private ActivityService				activityService;

	@Autowired
	private PanelService				panelService;

	@Autowired
	private TutorialService				tutorialService;

	@Autowired
	private PresentationService			presebtationService;


	public ActivityComment create(final int activityId) {
		ActivityComment com;
		final Activity act;

		System.out.println(activityId);
		com = new ActivityComment();

		if (this.panelService.findOne(activityId).getId() == activityId) {
			System.out.println(this.panelService.findOne(activityId));
			com.setActivity(this.panelService.findOne(activityId));
		} else if (this.presebtationService.findOne(activityId).getId() == activityId) {
			System.out.println(this.presebtationService.findOne(activityId));
			com.setActivity(this.presebtationService.findOne(activityId));
		} else if (this.tutorialService.findOne(activityId).getId() == activityId) {
			System.out.println(this.tutorialService.findOne(activityId));
			com.setActivity(this.tutorialService.findOne(activityId));
		}
		if (this.actorService.findByPrincipal() != null)
			com.setAuthor(this.actorService.findByPrincipal().getName() + " " + this.actorService.findByPrincipal().getSurname());
		else
			com.setAuthor("anonimo");
		final Date fecha = new GregorianCalendar().getTime();

		com.setMoment(fecha);
		return com;

	}

	public ActivityComment save(final ActivityComment com) {
		final ActivityComment res;

		res = this.activityCommentRepository.save(com);
		Assert.notNull(res.getActivity(), "comment sin clase");
		return res;

	}

	public Collection<ActivityComment> findCommentsOfActivity(final int activityId) {
		//Assert.notNull(this.actService.findOne(activityId));
		return this.activityCommentRepository.findCommentsOfActivity(activityId);
	}
}
