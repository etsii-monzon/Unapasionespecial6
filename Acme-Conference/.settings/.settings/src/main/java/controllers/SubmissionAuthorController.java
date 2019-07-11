
package controllers;

import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;

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
import services.SubmissionService;
import domain.Conference;
import domain.Submission;

@Controller
@RequestMapping("/submission/author")
public class SubmissionAuthorController extends AbstractController {

	@Autowired
	SubmissionService	submissionService;

	@Autowired
	AuthorService		authorService;
	@Autowired
	ConferenceService	conferenceService;


	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Submission> submissions;

		final Date fechaActual = new GregorianCalendar().getTime();
		submissions = this.authorService.findByPrincipal().getSubmissions();

		result = new ModelAndView("submission/list");
		result.addObject("submissions", submissions);
		result.addObject("fechaActual", fechaActual);
		result.addObject("requestURI", "submission/author/list.do");

		return result;
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		Submission submission;

		submission = this.submissionService.create();
		result = this.createEditModelAndView(submission);

		return result;
	}

	//Edit

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int submissionId) {
		ModelAndView result;
		final Submission submission;

		submission = this.submissionService.findOne(submissionId);
		Assert.notNull(submission);

		result = this.createEditModelAndView(submission);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Submission submission) {
		ModelAndView result;

		result = this.createEditModelAndView(submission, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Submission submission, final String messageCode) {
		final ModelAndView result;
		final Collection<Conference> conferences = this.conferenceService.conferencesToSubmission();

		result = new ModelAndView("submission/edit");

		if (submission.getStatus() == "ACCEPTED")
			submission.setCameraReady(true);
		result.addObject("submission", submission);
		result.addObject("conferences", conferences);

		result.addObject("message", messageCode);

		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Submission submission, final BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			System.out.print(binding);
			result = this.createEditModelAndView(submission);

		} else
			try {
				System.out.print("Entra");

				this.submissionService.save(submission);
				result = new ModelAndView("redirect:list.do");
			} catch (final Throwable oops) {
				System.out.print(oops);

				result = this.createEditModelAndView(submission, "submission.commit.error");
			}
		return result;
	}
	//delete

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(final Submission submission, final BindingResult binding) {
		ModelAndView result;
		try {
			this.submissionService.delete(submission);
			result = new ModelAndView("redirect:list.do");
		} catch (final Throwable oops) {
			System.out.println(oops);
			result = this.createEditModelAndView(submission, "submission.commit.error");
		}
		return result;
	}

	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public ModelAndView show(@RequestParam final int submissionId) {
		final ModelAndView result;
		final Submission submission;

		submission = this.submissionService.findOne(submissionId);

		result = new ModelAndView("submission/show");
		result.addObject("requestURI", "submission/author/show.do");
		result.addObject("submission", submission);
		return result;
	}

}
