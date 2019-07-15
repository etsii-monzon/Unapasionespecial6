
package controllers;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.AuthorService;
import services.ConferenceService;
import services.ReportService;
import services.SubmissionService;
import domain.Submission;

@Controller
@RequestMapping("/submission/administrator")
public class SubmissionAdministratorController extends AbstractController {

	@Autowired
	private SubmissionService	submissionService;
	@Autowired
	private AuthorService		authorService;
	@Autowired
	private ConferenceService	conferenceService;
	@Autowired
	private ReportService		reportService;
	@Autowired
	private ReviewerService		revService;


	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Submission> submissions;
		submissions = this.submissionService.findAll();
		boolean allowed = false;
		for (final Submission s : submissions)
			if (s.getConference().getSubmissionDeadline().before(new Date()) && s.getConference().getNotificationDeadline().after(new Date()))
				allowed = true;

		result = new ModelAndView("submission/list");

		result.addObject("submissions", submissions);
		result.addObject("allowed", allowed);

		result.addObject("requestURI", "submission/administrator/list.do");

		return result;
	}
	@RequestMapping(value = "/decisionMaking", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam final int submissionId) {
		ModelAndView result;

		this.submissionService.submissionStatus(submissionId);

		result = new ModelAndView("redirect:list.do");
		return result;
	}

}
