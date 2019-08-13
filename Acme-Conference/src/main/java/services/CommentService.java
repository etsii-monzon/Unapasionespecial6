
package services;

import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import repositories.CommentRepository;
import repositories.PanelCommentRepository;
import repositories.PresentationCommentRepository;
import repositories.TutorialCommentRepository;
import domain.Comment;

@Service
@Transactional
public class CommentService {

	@Autowired
	private CommentRepository				commentRepository;

	@Autowired
	private ActorService					actorService;

	@Autowired
	private PanelCommentRepository			panelCommentRepository;

	@Autowired
	private PresentationCommentRepository	presCommentRepository;

	@Autowired
	private TutorialCommentRepository		tutorialCommentRepository;


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

	public Double avgCommentsPerActivity() {
		final Double a = this.panelCommentRepository.avgCommentsPerPanel();
		final Double b = this.presCommentRepository.avgCommentsPerPresentation();
		final Double c = this.tutorialCommentRepository.avgCommentsPerTutorial();

		final Double res = (a + b + c) / 3;

		return res;
	}

	public Integer minCommentsPerActivity() {
		final Integer panel = this.panelCommentRepository.minCommentsPerPanel();
		final Integer pres = this.presCommentRepository.minCommentsPerPresentation();
		final Integer tutor = this.tutorialCommentRepository.minCommentsPerTutorial();
		Integer res = panel;

		if (res > tutor)
			res = tutor;
		if (res > pres)
			res = pres;

		return res;
	}

	public Integer maxCommentsPerActivity() {
		final Integer panel = this.panelCommentRepository.maxCommentsPerPanel();
		final Integer pres = this.presCommentRepository.maxCommentsPerPresentation();
		final Integer tutor = this.tutorialCommentRepository.maxCommentsPerTutorial();
		Integer res = panel;

		if (res < tutor)
			res = tutor;
		if (res < pres)
			res = pres;

		return res;
	}

	public Double stdDevCommentsPerActivity() {
		Double res = 0.0;
		Double a = 0.0;
		Double b = 0.0;
		final Collection<Double> datos = this.panelCommentRepository.getCommentsPerPanel();
		final Collection<Double> datos1 = this.presCommentRepository.getCommentsPerPresentation();
		final Collection<Double> datos2 = this.tutorialCommentRepository.getCommentsPerTutorial();
		datos.addAll(datos1);
		datos.addAll(datos2);

		final Integer num = datos.size();
		final Double avg = this.avgCommentsPerActivity();

		for (final Double x : datos) {
			a = Math.abs(x - avg);
			b = b + Math.pow(a, 2);
		}

		res = Math.sqrt(b / num);

		return res;
	}

}
