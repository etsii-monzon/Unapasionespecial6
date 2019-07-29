
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

import services.AdministratorService;
import services.ConferenceService;
import services.PanelService;
import services.PresentationService;
import services.SubmissionService;
import services.TutorialService;
import domain.Conference;
import domain.Panel;
import domain.Presentation;
import domain.Submission;
import domain.Tutorial;

@Controller
@RequestMapping("/activity/administrator")
public class ActivityAdministratorController extends AbstractController {

	@Autowired
	private TutorialService			tutorialService;

	@Autowired
	private PanelService			panelService;

	@Autowired
	private PresentationService		presentationService;

	@Autowired
	private ConferenceService		confService;

	@Autowired
	private SubmissionService		submissionService;

	@Autowired
	private AdministratorService	adminService;


	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam final int conferenceId) {
		final Conference conf = this.confService.findOne(conferenceId);
		final Collection<Tutorial> tutorials = this.tutorialService.findAllTutorialsByConference(conf);
		final Collection<Panel> panels = this.panelService.findAllPanelsByConference(conf);
		final Collection<Presentation> presents = this.presentationService.findAllPresentationsByConference(conf);
		ModelAndView result;

		final Collection<Submission> subms = this.submissionService.findAllCameraReadyVersion(conferenceId);
		final Boolean allowed = !subms.isEmpty();

		System.out.println(panels);

		result = new ModelAndView("activity/list");
		result.addObject("conferenceId", conferenceId);
		result.addObject("tutorials", tutorials);
		result.addObject("panels", panels);
		result.addObject("presentations", presents);
		result.addObject("allowed", allowed);
		result.addObject("requestURI", "activity/administrator/list.do");

		return result;

	}

	@RequestMapping(value = "tutorial/delete", method = RequestMethod.GET)
	public ModelAndView deleteTut(@RequestParam final int tutorialId) {
		ModelAndView result;
		try {
			final Tutorial tut = this.tutorialService.findOne(tutorialId);
			Assert.isTrue(this.adminService.findByPrincipal().getConferences().contains(tut.getConference()), "hacking");
			final int id = tut.getConference().getId();
			this.tutorialService.delete(tut);
			result = new ModelAndView("redirect:/activity/administrator/list.do?conferenceId=" + id);
			return result;
		} catch (final Throwable oops) {
			// TODO: handle exception
			if (oops.getMessage().equals("hacking"))
				result = new ModelAndView("misc/403");
			else
				result = new ModelAndView("redirect:/");
		}
		return result;
	}

	@RequestMapping(value = "/tutorial/edit", method = RequestMethod.GET)
	public ModelAndView editTut(@RequestParam final int tutorialId) {
		ModelAndView result;
		Tutorial tut;

		tut = this.tutorialService.findOne(tutorialId);
		Assert.notNull(tut);

		result = this.createEditTutModelAndView(tut);
		result.addObject("requestURI", "activity/administrator/tutorial/edit.do");

		return result;
	}

	@RequestMapping(value = "/tutorial/create", method = RequestMethod.GET)
	public ModelAndView createTut(@RequestParam final int conferenceId) {
		ModelAndView result;
		Tutorial tut;

		tut = this.tutorialService.create(conferenceId);

		result = this.createEditTutModelAndView(tut);
		result.addObject("requestURI", "activity/administrator/tutorial/create.do");

		return result;
	}

	protected ModelAndView createEditTutModelAndView(final Tutorial tutorial) {
		ModelAndView result;

		result = this.createEditTutModelAndView(tutorial, null);

		return result;
	}

	protected ModelAndView createEditTutModelAndView(final Tutorial tutorial, final String messageCode) {
		final ModelAndView result;

		result = new ModelAndView("tutorial/edit");
		result.addObject("tutorial", tutorial);

		result.addObject("message", messageCode);

		return result;
	}

	@RequestMapping(value = "tutorial/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Tutorial tutorial, final BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			System.out.print(binding);
			result = this.createEditTutModelAndView(tutorial);

		} else
			try {
				System.out.print("Entra");
				Assert.isTrue(this.adminService.findByPrincipal().getConferences().contains(tutorial.getConference()), "hacking");
				Assert.isTrue(
					!tutorial.getEndMoment().equals(null) && !tutorial.getRoom().equals(null) && !tutorial.getSpeakers().isEmpty() && !tutorial.getStartMoment().equals(null) && !tutorial.getSummary().equals(null) && !tutorial.getTitle().equals(null),
					"vacio");
				final Tutorial tut = this.tutorialService.save(tutorial);
				result = new ModelAndView("redirect:/activity/administrator/list.do?conferenceId=" + tut.getConference().getId());
			} catch (final Throwable oops) {
				System.out.print(oops);
				if (oops.getMessage() == "hacking")
					result = new ModelAndView("misc/403");
				else if (oops.getMessage() == "vacio")
					result = this.createEditTutModelAndView(tutorial, "activity.empty.error");
				else
					result = this.createEditTutModelAndView(tutorial, "tutorial.commit.error");
			}
		return result;
	}

	@RequestMapping(value = "panel/delete", method = RequestMethod.GET)
	public ModelAndView deletePa(@RequestParam final int panelId) {
		ModelAndView result;
		try {
			final Panel pa = this.panelService.findOne(panelId);
			Assert.isTrue(this.adminService.findByPrincipal().getConferences().contains(pa.getConference()), "hacking");
			final int id = pa.getConference().getId();
			this.panelService.delete(pa);
			result = new ModelAndView("redirect:/activity/administrator/list.do?conferenceId=" + id);
			return result;
		} catch (final Throwable oops) {
			// TODO: handle exception
			if (oops.getMessage().equals("hacking"))
				result = new ModelAndView("misc/403");
			else
				result = new ModelAndView("redirect:/");
		}
		return result;
	}

	@RequestMapping(value = "/panel/edit", method = RequestMethod.GET)
	public ModelAndView editPa(@RequestParam final int panelId) {
		ModelAndView result;
		Panel panel;

		panel = this.panelService.findOne(panelId);
		Assert.notNull(panel);

		result = this.createEditPaModelAndView(panel);
		result.addObject("requestURI", "activity/administrator/panel/edit.do");

		return result;
	}

	@RequestMapping(value = "/panel/create", method = RequestMethod.GET)
	public ModelAndView createPa(@RequestParam final int conferenceId) {
		ModelAndView result;
		Panel panel;

		panel = this.panelService.create(conferenceId);

		result = this.createEditPaModelAndView(panel);
		result.addObject("requestURI", "activity/administrator/panel/create.do");

		return result;
	}

	protected ModelAndView createEditPaModelAndView(final Panel panel) {
		ModelAndView result;

		result = this.createEditPaModelAndView(panel, null);

		return result;
	}

	protected ModelAndView createEditPaModelAndView(final Panel panel, final String messageCode) {
		final ModelAndView result;

		result = new ModelAndView("panel/edit");
		result.addObject("panel", panel);

		result.addObject("message", messageCode);

		return result;
	}

	@RequestMapping(value = "panel/edit", method = RequestMethod.POST, params = "savepanel")
	public ModelAndView save(@Valid final Panel panel, final BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			System.out.println("PASA X AQU�");
			System.out.print(binding);
			result = this.createEditPaModelAndView(panel);

		} else
			try {
				System.out.print("Entra");
				Assert.isTrue(!panel.getEndMoment().equals(null) && !panel.getRoom().equals(null) && !panel.getSpeakers().isEmpty() && !panel.getStartMoment().equals(null) && !panel.getSummary().equals(null) && !panel.getTitle().equals(null), "vacio");
				final Panel pa = this.panelService.save(panel);
				Assert.isTrue(this.adminService.findByPrincipal().getConferences().contains(pa.getConference()), "hacking");
				result = new ModelAndView("redirect:/activity/administrator/list.do?conferenceId=" + pa.getConference().getId());
			} catch (final Throwable oops) {
				if (oops.getMessage() == "hacking")
					result = new ModelAndView("misc/403");
				else if (oops.getMessage() == "vacio")
					result = this.createEditPaModelAndView(panel, "activity.empty.error");
				else
					result = this.createEditPaModelAndView(panel, "panel.commit.error");
			}
		return result;
	}

	@RequestMapping(value = "presentation/delete", method = RequestMethod.GET)
	public ModelAndView deletePr(@RequestParam final int presentationId) {
		ModelAndView result;
		try {
			final Presentation pr = this.presentationService.findOne(presentationId);
			Assert.isTrue(this.adminService.findByPrincipal().getConferences().contains(pr.getConference()), "hacking");
			final int id = pr.getConference().getId();
			this.presentationService.delete(pr);
			result = new ModelAndView("redirect:/activity/administrator/list.do?conferenceId=" + id);
			return result;
		} catch (final Throwable oops) {
			// TODO: handle exception
			if (oops.getMessage().equals("hacking"))
				result = new ModelAndView("misc/403");
			else
				result = new ModelAndView("redirect:/");
		}
		return result;
	}

	@RequestMapping(value = "/presentation/edit", method = RequestMethod.GET)
	public ModelAndView editPres(@RequestParam final int presentationId) {
		ModelAndView result;
		Presentation pr;

		pr = this.presentationService.findOne(presentationId);
		Assert.notNull(pr);
		final Collection<Submission> subms = this.submissionService.findAllCameraReadyVersion(pr.getConference().getId());

		result = this.createEditPrModelAndView(pr);
		result.addObject("requestURI", "activity/administrator/presentation/edit.do");
		result.addObject("submissions", subms);

		return result;
	}
	@RequestMapping(value = "/presentation/create", method = RequestMethod.GET)
	public ModelAndView createPr(@RequestParam final int conferenceId) {
		ModelAndView result;
		Presentation pr;

		pr = this.presentationService.create(conferenceId);
		final Collection<Submission> subms = this.submissionService.findAllCameraReadyVersion(conferenceId);

		result = this.createEditPrModelAndView(pr);
		result.addObject("requestURI", "activity/administrator/presentation/create.do");
		result.addObject("submissions", subms);

		return result;
	}

	protected ModelAndView createEditPrModelAndView(final Presentation pr) {
		ModelAndView result;

		result = this.createEditPrModelAndView(pr, null);

		return result;
	}

	protected ModelAndView createEditPrModelAndView(final Presentation pr, final String messageCode) {
		final ModelAndView result;

		final Collection<Submission> subms = this.submissionService.findAllCameraReadyVersion(pr.getConference().getId());

		result = new ModelAndView("presentation/edit");
		result.addObject("presentation", pr);
		result.addObject("submissions", subms);

		result.addObject("message", messageCode);

		return result;
	}

	@RequestMapping(value = "presentation/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Presentation pres, final BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			System.out.print(binding);
			result = this.createEditPrModelAndView(pres);

		} else
			try {
				System.out.print("Entra");
				Assert.isTrue(!pres.getEndMoment().equals(null) && !pres.getRoom().equals(null) && !pres.getSpeakers().isEmpty() && !pres.getStartMoment().equals(null) && !pres.getSummary().equals(null) && !pres.getTitle().equals(null)
					&& !pres.getSubmission().equals(null), "vacio");
				final Presentation pre = this.presentationService.save(pres);
				Assert.isTrue(this.adminService.findByPrincipal().getConferences().contains(pres.getConference()), "hacking");
				result = new ModelAndView("redirect:/activity/administrator/list.do?conferenceId=" + pre.getConference().getId());
			} catch (final Throwable oops) {
				System.out.print(oops);
				if (oops.getMessage() == "hacking")
					result = new ModelAndView("misc/403");
				else if (oops.getMessage() == "vacio")
					result = this.createEditPrModelAndView(pres, "activity.empty.error");
				else
					result = this.createEditPrModelAndView(pres, "presentation.commit.error");
			}
		return result;
	}

}
