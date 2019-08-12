
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

import services.PanelCommentService;
import services.PanelService;
import domain.PanelComment;

@Controller
@RequestMapping("/panel/comment")
public class PanelCommentController extends AbstractController {

	@Autowired
	private PanelCommentService	commentService;

	@Autowired
	private PanelService		panelService;


	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int activityId) {
		final ModelAndView result;
		PanelComment com;

		com = this.commentService.create(activityId);

		Assert.notNull(com);

		result = this.createModelAndView(com);
		result.addObject("requestURI", "panel/comment/create.do");
		return result;
	}

	protected ModelAndView createModelAndView(final PanelComment comment) {
		ModelAndView result;

		result = this.createModelAndView(comment, null);

		return result;
	}

	protected ModelAndView createModelAndView(final PanelComment comment, final String messageCode) {
		final ModelAndView result;

		result = new ModelAndView("comment/create");
		result.addObject("comment", comment);

		result.addObject("message", messageCode);

		return result;
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final PanelComment comment, final BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			System.out.print(binding);
			result = this.createModelAndView(comment);
			//			System.out.println(binding.getAllErrors());
		} else
			try {
				System.out.print("Entra");
				System.out.println(comment.getPanel());
				final PanelComment com = this.commentService.save(comment);

				result = new ModelAndView("redirect:list.do?activityId=" + com.getPanel().getId());

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
	public ModelAndView list(@RequestParam final int activityId) {
		ModelAndView result;
		Collection<PanelComment> comments;
		final int conferenceId = this.panelService.findOne(activityId).getConference().getId();

		comments = this.commentService.findCommentsOfPanel(activityId);

		result = new ModelAndView("comment/list");
		result.addObject("comments", comments);
		result.addObject("requestURI", "panel/comment/list.do");
		result.addObject("id", activityId);
		result.addObject("creat", "pan");
		result.addObject("conferenceId", conferenceId);
		return result;

	}
}
