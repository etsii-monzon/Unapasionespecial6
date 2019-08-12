
package services;

import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repositories.CommentRepository;
import domain.Comment;

@Service
@Transactional
public class CommentService {

	@Autowired
	private CommentRepository	commentRepository;

	@Autowired
	private ActorService		actorService;


	public Comment create(final int id) {
		Comment com;

		com = new Comment();
		if (this.actorService.findByPrincipal() != null)
			com.setAuthor(this.actorService.findByPrincipal().getName() + " " + this.actorService.findByPrincipal().getSurname());
		else
			com.setAuthor("anonimo");
		final Date fecha = new GregorianCalendar().getTime();

		com.setMoment(fecha);
		return com;

	}

	public Comment save(final Comment com) {
		final Comment res;
		final Boolean aux = true;

		//Compruebo que cada comment sea solo para una conference o para una activity siempre
		//		Assert.isTrue(!com.getActivity().equals(null) && com.getConference().equals(null), "comment sin clase");
		//
		//		Assert.isTrue(com.getActivity().equals(null) && !com.getConference().equals(null), "comment sin clase");

		res = this.commentRepository.save(com);

		return res;

	}

	public Collection<Comment> findCommentsOfConference(final int conferenceId) {
		//Assert.notNull(this.confService.findOne(conferenceId));
		return this.commentRepository.findCommentsOfConference(conferenceId);
	}
	public Collection<Comment> findCommentsOfActivity(final int activityId) {
		//Assert.notNull(this.actService.findOne(activityId));
		return this.commentRepository.findCommentsOfActivity(activityId);
	}
}
