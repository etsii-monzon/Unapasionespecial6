
package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ConferenceService;
import services.ReportService;
import services.ReviewerService;
import services.SubmissionService;
import domain.Report;

@Controller
@RequestMapping("/report/reviewer")
public class ReportReviewerController extends AbstractController {

	@Autowired
	ReportService		reportService;

	@Autowired
	ReviewerService		reviewerService;
	@Autowired
	ConferenceService	conferenceService;

	@Autowired
	SubmissionService	submissionService;


	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int subId) {
		ModelAndView result;
		Report report;
		try {
			Assert.isTrue(this.submissionService.findSubmissionsOfReviewer(this.reviewerService.findByPrincipal()).contains(this.submissionService.findOne(subId)), "hacking");
			Assert.isTrue(!this.reportService.reportDone(subId, this.reviewerService.findByPrincipal()), "HA HECHO YA UN REPORT");
			report = this.reportService.create(subId);
			result = this.createEditModelAndView(report);
		} catch (final Throwable oops) {
			// TODO: handle exception
			if (oops.getMessage().equals("hacking"))
				result = new ModelAndView("misc/403");
			else if (oops.getMessage().equals("HA HECHO YA UN REPORT"))
				result = new ModelAndView("misc/403");
			else
				result = new ModelAndView("redirect:/");
		}

		return result;
	}
	protected ModelAndView createEditModelAndView(final Report report) {
		ModelAndView result;

		result = this.createEditModelAndView(report, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Report report, final String messageCode) {
		final ModelAndView result;

		result = new ModelAndView("report/edit");

		result.addObject("report", report);

		result.addObject("message", messageCode);

		return result;
	}
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Report report, final BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			System.out.print(binding);
			result = this.createEditModelAndView(report);

		} else
			try {
				System.out.print("Entra");

				this.reportService.save(report);
				result = new ModelAndView("report/show");
			} catch (final Throwable oops) {
				System.out.print(oops);

				result = this.createEditModelAndView(report, "report.commit.error");
			}
		return result;
	}

}
