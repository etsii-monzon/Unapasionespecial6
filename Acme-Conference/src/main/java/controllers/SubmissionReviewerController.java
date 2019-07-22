
package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.AuthorService;
import services.ConferenceService;
import services.ReportService;
import services.ReviewerService;
import services.SubmissionService;
import domain.Report;
import domain.Submission;

@Controller
@RequestMapping("/submission/reviewer")
public class SubmissionReviewerController extends AbstractController {

	@Autowired
	SubmissionService	submissionService;
	@Autowired
	ReviewerService		reviewerService;
	@Autowired
	AuthorService		authorService;
	@Autowired
	ConferenceService	conferenceService;
	@Autowired
	ReportService		reportService;


	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		final Collection<Submission> submissions;

		submissions = this.submissionService.findAll();

		final Collection<Report> reps = this.reviewerService.findByPrincipal().getReports();

		for (final Report r : reps)
			if (submissions.contains(r.getSubmission()))
				submissions.remove(r.getSubmission());
		System.out.println(submissions);

		result = new ModelAndView("submission/list");

		result.addObject("submissions", submissions);
		result.addObject("requestURI", "submission/reviewer/list.do");
		return result;
	}
}
