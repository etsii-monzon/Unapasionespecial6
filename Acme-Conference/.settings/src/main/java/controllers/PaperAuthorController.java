
package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.AuthorService;
import services.PaperService;
import services.SubmissionService;
import domain.Paper;

@Controller
@RequestMapping("/paper/author")
public class PaperAuthorController extends AbstractController {

	@Autowired
	PaperService		paperService;

	@Autowired
	AuthorService		authorService;
	@Autowired
	SubmissionService	submissionService;


	@RequestMapping(value = "/showp", method = RequestMethod.GET)
	public ModelAndView show(@RequestParam final int submissionId) {
		final ModelAndView result;
		final Paper paper;

		paper = this.submissionService.findOne(submissionId).getPaper();
		result = new ModelAndView("paper/showp");
		result.addObject("requestURI", "paper/author/showp.do");
		result.addObject("paper", paper);
		return result;
	}

}
