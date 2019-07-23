
package controllers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.AdministratorService;
import services.ConferenceService;
import domain.Conference;

@Controller
@RequestMapping("/conference")
public class ConferenceController extends AbstractController {

	@Autowired
	ConferenceService		conferenceService;

	@Autowired
	AdministratorService	administratorService;


	@RequestMapping(value = "/listProx", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Conference> conferencesAll;
		final Collection<Conference> conferences = new ArrayList<>();

		conferencesAll = this.conferenceService.findAll();
		for (final Conference c : conferencesAll)
			if (c.getStartDate().after(new Date()) && c.isDraftMode() == false)
				conferences.add(c);

		result = new ModelAndView("conference/listProx");
		result.addObject("conferences", conferences);
		result.addObject("requestURI", "conference/listProx.do");

		return result;
	}

	@RequestMapping(value = "/listPast", method = RequestMethod.GET)
	public ModelAndView listp() {
		ModelAndView result;
		Collection<Conference> conferencesAll;
		final Collection<Conference> conferences = new ArrayList<>();

		conferencesAll = this.conferenceService.findAll();
		for (final Conference c : conferencesAll)
			if (c.getEndDate().before(new Date()) && c.isDraftMode() == false)
				conferences.add(c);

		result = new ModelAndView("conference/listPast");
		result.addObject("conferences", conferences);
		result.addObject("requestURI", "conference/listPast.do");

		return result;
	}

	@RequestMapping(value = "/listEjec", method = RequestMethod.GET)
	public ModelAndView liste() {
		ModelAndView result;
		Collection<Conference> conferencesAll;
		final Collection<Conference> conferences = new ArrayList<>();

		conferencesAll = this.conferenceService.findAll();
		for (final Conference c : conferencesAll)
			if (c.getStartDate().before(new Date()) && c.getEndDate().after(new Date()) && c.isDraftMode() == false)
				conferences.add(c);

		result = new ModelAndView("conference/listEjec");
		result.addObject("conferences", conferences);
		result.addObject("requestURI", "conference/listEjec.do");

		return result;
	}

}
