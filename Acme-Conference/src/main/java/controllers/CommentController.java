
package controllers;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.CommentService;
import services.ConferenceService;
import services.PanelService;
import services.PresentationService;
import services.TutorialService;
import domain.Comment;

@Controller
@RequestMapping("/comment")
public class CommentController extends AbstractController {

	@Autowired
	ConferenceService	conferenceService;

	@Autowired
	PanelService		panelService;
	@Autowired
	PresentationService	presentationService;
	@Autowired
	TutorialService		tutorialService;

	@Autowired
	CommentService		commentService;


	@RequestMapping(value = "/conference/list", method = RequestMethod.GET)
	public ModelAndView listConference(@RequestParam final int conferenceId) {
		ModelAndView result;
		Collection<Comment> comments;

		comments = this.conferenceService.findOne(conferenceId).getComments();

		result = new ModelAndView("comment/list");
		result.addObject("comments", comments);

		result.addObject("requestURI", "comment/conference/list.do");
		result.addObject("commentEntityId", conferenceId);

		return result;
	}

	@RequestMapping(value = "/panel/list", method = RequestMethod.GET)
	public ModelAndView listActivity(@RequestParam final int panelId) {
		ModelAndView result;
		Collection<Comment> comments;

		comments = this.panelService.findOne(panelId).getComments();

		result = new ModelAndView("comment/list");
		result.addObject("comments", comments);

		result.addObject("requestURI", "comment/panel/list.do");
		result.addObject("commentEntityId", panelId);

		return result;
	}
	@RequestMapping(value = "/presentation/list", method = RequestMethod.GET)
	public ModelAndView listPresentation(@RequestParam final int presentationId) {
		ModelAndView result;
		Collection<Comment> comments;

		comments = this.presentationService.findOne(presentationId).getComments();

		result = new ModelAndView("comment/list");
		result.addObject("comments", comments);

		result.addObject("requestURI", "comment/presentation/list.do");
		result.addObject("commentEntityId", presentationId);

		return result;
	}
	@RequestMapping(value = "/tutorial/list", method = RequestMethod.GET)
	public ModelAndView listTutorial(@RequestParam final int tutorialId) {
		ModelAndView result;
		Collection<Comment> comments;

		comments = this.tutorialService.findOne(tutorialId).getComments();

		result = new ModelAndView("comment/list");
		result.addObject("comments", comments);

		result.addObject("requestURI", "comment/tutorial/list.do");
		result.addObject("commentEntityId", tutorialId);

		return result;
	}
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int commentEntityId) {
		ModelAndView result;
		Comment comment;

		comment = this.commentService.create();

		result = this.createEditModelAndView(comment, commentEntityId);

		result.addObject("commentEntityId", commentEntityId);

		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView save(@Valid final Comment comment, final BindingResult binding, final HttpServletRequest req) {
		ModelAndView result;

		final int id = Integer.parseInt(req.getParameter("commentEntityId"));

		System.out.println(id);

		if (binding.hasErrors()) {
			System.out.println(binding);
			result = this.createEditModelAndView(comment, id);
		} else
			try {
				final Comment res = this.commentService.save(comment);
				System.out.println(this.conferenceService.findOne(id));
				if (this.conferenceService.findOne(id) != null) {
					this.conferenceService.findOne(id).getComments().add(res);
					System.out.println(this.conferenceService.findOne(id).getComments());
				} else if (this.panelService.findOne(id) != null) {
					this.panelService.findOne(id).getComments().add(res);
					System.out.println(this.panelService.findOne(id).getComments());
				} else if (this.presentationService.findOne(id) != null) {
					this.presentationService.findOne(id).getComments().add(res);
					System.out.println(this.presentationService.findOne(id).getComments());
				} else if (this.tutorialService.findOne(id) != null) {
					this.tutorialService.findOne(id).getComments().add(res);
					System.out.println(this.tutorialService.findOne(id).getComments());
				}

				result = new ModelAndView("redirect:/");

			} catch (final Throwable oops) {
				System.out.println(oops.getMessage());
				result = this.createEditModelAndView(comment, "comment.commit.error", id);
			}
		return result;
	}
	protected ModelAndView createEditModelAndView(final Comment comment, final int commentEntityId) {
		ModelAndView result;

		result = this.createEditModelAndView(comment, null, commentEntityId);

		result.addObject("commentEntityId", commentEntityId);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Comment comment, final String messageCode, final int commentEntityId) {
		final ModelAndView result;

		result = new ModelAndView("comment/edit");
		result.addObject("comment", comment);
		result.addObject("message", messageCode);

		result.addObject("requestURI", "comment/edit.do");

		result.addObject("commentEntityId", commentEntityId);

		return result;
	}

}
