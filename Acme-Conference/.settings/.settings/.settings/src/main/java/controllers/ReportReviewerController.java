
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


	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int subId) {
		ModelAndView result;
		Report report;

		report = this.reportService.create(subId);
		result = this.createEditModelAndView(report);

		return result;
	}

	//Edit

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int hola) {
		ModelAndView result;
		final Report report;

		report = this.reportService.findOne(hola);
		Assert.notNull(report);

		result = this.createEditModelAndView(report);

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
	//delete

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(final Report report, final BindingResult binding) {
		ModelAndView result;
		try {
			this.reportService.delete(report);
			result = new ModelAndView("redirect:list.do");
		} catch (final Throwable oops) {
			System.out.println(oops);
			result = this.createEditModelAndView(report, "report.commit.error");
		}
		return result;
	}

	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public ModelAndView show(@RequestParam final int reportId) {
		final ModelAndView result;
		final Report report;

		report = this.reportService.findOne(reportId);

		result = new ModelAndView("report/show");
		result.addObject("requestURI", "report/reviewer/show.do");
		result.addObject("report", report);
		return result;
	}

}
