
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
import domain.Author;
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
		result.addObject("requestURI", "submission/author/list.do");
		result.addObject("fecha", fechaActual);

		return result;
	}

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public ModelAndView upload(@RequestParam final int submissionId) {
		ModelAndView result;
		Submission submission;

		submission = this.submissionService.findOne(submissionId);

		result = this.createEditModelAndView(submission);
		result.addObject("submission", submission);

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

	protected ModelAndView createEditModelAndView(final Submission submission) {
		ModelAndView result;

		result = this.createEditModelAndView(submission, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Submission submission, final String messageCode) {
		final ModelAndView result;
		final Collection<Conference> conferences = this.conferenceService.conferencesToSubmission();
		final Collection<Author> othersAuthors = this.authorService.findAll();
		result = new ModelAndView("submission/edit");

		result.addObject("submission", submission);
		result.addObject("conferences", conferences);
		result.addObject("authors", othersAuthors);

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
				Assert.isTrue(submission.getPaper().getAuthors().contains(this.authorService.findByPrincipal()), "Actor logueado debe ser autor del paper");
				if (submission.getId() != 0 && !submission.isCameraReady())
					submission.setCameraReady(true);
				this.submissionService.save(submission);
				result = new ModelAndView("redirect:list.do");
			} catch (final Throwable oops) {
				if (oops.getMessage().equals("Actor logueado debe ser autor del paper"))
					result = this.createEditModelAndView(submission, "submission.author.error");
				else

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
			Assert.isTrue(submission.getPaper().getAuthors().contains(this.authorService.findByPrincipal()), "Actor logueado debe ser autor del paper");
			result = new ModelAndView("redirect:list.do");
		} catch (final Throwable oops) {
			System.out.println(oops);
			if (oops.getMessage().equals("Actor logueado debe ser autor del paper"))
				result = new ModelAndView("misc/403");
			result = this.createEditModelAndView(submission, "submission.commit.error");
		}
		return result;
	}

	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public ModelAndView show(@RequestParam final int submissionId) {
		ModelAndView result;
		final Submission submission;
		try {
			submission = this.submissionService.findOne(submissionId);
			Assert.isTrue(submission.getPaper().getAuthors().contains(this.authorService.findByPrincipal()), "Actor logueado debe ser autor del paper");
			result = new ModelAndView("submission/show");
			result.addObject("requestURI", "submission/author/show.do");
			result.addObject("submission", submission);
		} catch (final Throwable oops) {
			if (oops.getMessage().equals("Actor logueado debe ser autor del paper"))
				result = new ModelAndView("misc/403");
			else
				result = new ModelAndView("submission/list");
		}

		return result;
	}

}
