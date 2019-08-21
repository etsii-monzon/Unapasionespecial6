
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

import repositories.PanelCommentRepository;
import domain.PanelComment;

@Service
@Transactional
public class PanelCommentService {

	@Autowired
	private PanelCommentRepository	activityCommentRepository;

	@Autowired
	private ActorService			actorService;

	@Autowired
	private PanelService			panelService;


	public PanelComment create(final int activityId) {
		PanelComment com;

		System.out.println(activityId);
		com = new PanelComment();

		if (this.panelService.findOne(activityId).getId() == activityId) {
			System.out.println(this.panelService.findOne(activityId));
			com.setPanel(this.panelService.findOne(activityId));
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
	public PanelComment save(final PanelComment com) {
		final PanelComment res;

		res = this.activityCommentRepository.save(com);
		Assert.notNull(res.getPanel(), "comment sin clase");
		return res;

	}

	public Collection<PanelComment> findCommentsOfPanel(final int activityId) {
		//Assert.notNull(this.actService.findOne(activityId));
		return this.activityCommentRepository.findCommentsOfPanel(activityId);
	}
}
