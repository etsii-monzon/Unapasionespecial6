
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

import services.SectionService;
import services.TutorialService;
import domain.Section;

@Controller
@RequestMapping("/section/administrator")
public class SectionAdministratorController extends AbstractController {

	@Autowired
	private SectionService	secService;

	@Autowired
	private TutorialService	tutService;


	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int sectionId) {
		ModelAndView result;
		Section sect;

		sect = this.secService.findOne(sectionId);
		Assert.notNull(sect);

		result = this.createEditModelAndView(sect);

		return result;
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int tutorialId) {
		ModelAndView result;
		Section sect;

		sect = this.secService.create(tutorialId);

		result = this.createEditModelAndView(sect);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Section section) {
		ModelAndView result;

		result = this.createEditModelAndView(section, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Section section, final String messageCode) {
		final ModelAndView result;

		result = new ModelAndView("section/edit");
		result.addObject("section", section);

		result.addObject("message", messageCode);

		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Section section, final BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			System.out.print(binding);
			result = this.createEditModelAndView(section);

		} else
			try {
				System.out.print("Entra");
				Assert.isTrue(section.getTitle() != "" && section.getSummary() != "", "vacio");
				final Section sect = this.secService.save(section);
				result = new ModelAndView("redirect:/section/list.do?tutorialId=" + sect.getTutorial().getId());
			} catch (final Throwable oops) {
				System.out.print(oops);

				if (oops.getMessage() == "vacio")
					result = this.createEditModelAndView(section, "section.empty.error");
				else if (oops.getMessage() == "url")
					result = this.createEditModelAndView(section, "section.url.error");
				else
					result = this.createEditModelAndView(section, "section.commit.error");
			}
		return result;
	}

}
