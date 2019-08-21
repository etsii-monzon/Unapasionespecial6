
package controllers;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ConferenceCommentService;
import domain.ConferenceComment;

@Controller
@RequestMapping("/conference/comment")
public class ConferenceCommentController {

	@Autowired
	private ConferenceCommentService	commentService;


	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int conferenceId) {
		final ModelAndView result;
		ConferenceComment com;

		com = this.commentService.create(conferenceId);
		Assert.notNull(com);

		result = this.createModelAndView(com);
		result.addObject("requestURI", "conference/comment/create.do");
		return result;
	}

	protected ModelAndView createModelAndView(final ConferenceComment comment) {
		ModelAndView result;

		result = this.createModelAndView(comment, null);

		return result;
	}

	protected ModelAndView createModelAndView(final ConferenceComment comment, final String messageCode) {
		final ModelAndView result;

		result = new ModelAndView("comment/create");
		result.addObject("comment", comment);

		result.addObject("message", messageCode);

		return result;
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final ConferenceComment comment, final BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			System.out.print(binding);
			result = this.createModelAndView(comment);
			//			System.out.println(binding.getAllErrors());
		} else
			try {
				System.out.print("Entra");

				final ConferenceComment com = this.commentService.save(comment);

				result = new ModelAndView("redirect:list.do?conferenceId=" + com.getConference().getId());

			} catch (final Throwable oops) {
				System.out.print(oops);
				if (oops.getMessage() == "comment sin clase")
					result = this.createModelAndView(comment, "comment.class.error");
				else
					result = this.createModelAndView(comment, "comment.commit.error");

			}
		return result;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(final int conferenceId) {
		ModelAndView result;
		Collection<ConferenceComment> comments;

		comments = this.commentService.findCommentsOfConference(conferenceId);

		result = new ModelAndView("comment/list");
		result.addObject("comments", comments);
		result.addObject("requestURI", "conference/comment/list.do");
		result.addObject("id", conferenceId);
		result.addObject("creat", "conf");
		return result;

	}

}
