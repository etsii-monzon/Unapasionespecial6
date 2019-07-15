
package controllers;

import java.util.Collection;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.AuthorService;
import services.ConferenceService;
import services.ReportService;
import services.ReviewerService;
import services.SubmissionService;
import domain.Reviewer;
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
			if (s.getConference().getSubmissionDeadline().before(new Date()))
				allowed = true;

		result = new ModelAndView("submission/list");

		result.addObject("submissions", submissions);
		result.addObject("allowed", allowed);

		result.addObject("requestURI", "submission/administrator/list.do");

		return result;
	}

	@RequestMapping(value = "/assignReviewers", method = RequestMethod.GET)
	public ModelAndView assignReviewers() {
		ModelAndView result;

		this.submissionService.assignReviewers();

		result = new ModelAndView("redirect:list.do");

		return result;
	}

	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public ModelAndView show(@RequestParam final int submissionId) {
		final ModelAndView result;
		final Submission submission;

		submission = this.submissionService.findOne(submissionId);
		result = new ModelAndView("submission/show");
		result.addObject("requestURI", "submission/administrator/show.do");
		result.addObject("submission", submission);
		return result;
	}

	@RequestMapping(value = "/assign", method = RequestMethod.GET)
	public ModelAndView assignManually(@RequestParam final int submissionId) {
		ModelAndView result;

		final Submission sub = this.submissionService.findOne(submissionId);

		result = this.createAssignModelAndView(sub);

		return result;
	}

	protected ModelAndView createAssignModelAndView(final Submission submission) {
		ModelAndView result;

		result = this.createAssignModelAndView(submission, null);

		return result;
	}

	protected ModelAndView createAssignModelAndView(final Submission submission, final String messageCode) {
		final ModelAndView result;
		final Collection<Reviewer> reviewers = this.revService.findAll();
		//		final Collection<Reviewer> existentes = submission.getReviewers();

		//		for (final Reviewer r : submission.getReviewers()) {
		//			reviewers.remove(r);
		//			existentes.add(r);
		//		}

		result = new ModelAndView("submission/assign");

		result.addObject("submission", submission);
		result.addObject("reviewers", reviewers);
		//		result.addObject("existentes", existentes);

		result.addObject("message", messageCode);

		return result;
	}

	@RequestMapping(value = "/assign", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Submission submission, final BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			System.out.print(binding);
			result = this.createAssignModelAndView(submission);

		} else
			try {
				System.out.print("Entra");
				Assert.isTrue(submission.getReviewers().size() <= 3);
				this.submissionService.save(submission);
				result = new ModelAndView("redirect:list.do");
			} catch (final Throwable oops) {
				System.out.print(oops);

				result = this.createAssignModelAndView(submission, "submission.commit.error");
			}
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
