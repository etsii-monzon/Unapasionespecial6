/*
 * CustomerController.java
 * 
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the
 * TDG Licence, a copy of which you may download from
 * http://www.tdg-seville.info/License.html
 */

package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.AdministratorService;
import domain.Administrator;

@Controller
@RequestMapping("/administrator/administrator")
public class AdministratorAdministratorController extends AbstractController {

	// Services ---------------------------------------------------------------

	@Autowired
	private AdministratorService	administratorService;


	// Constructors -----------------------------------------------------------

	public AdministratorAdministratorController() {
		super();
	}

	//Edición: Obtener los datos del admin-----------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit() {
		final ModelAndView result;
		final Administrator administrator;

		administrator = this.administratorService.findByPrincipal();
		System.out.println(administrator.getPhoneNumber());
		result = this.createEditModelAndView(administrator);

		return result;
	}
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Administrator adminsitrator, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			System.out.println(binding);
			result = this.createEditModelAndView(adminsitrator);
		} else
			try {
				System.out.println(adminsitrator.getPhoneNumber());
				this.administratorService.save(adminsitrator);
				result = new ModelAndView("redirect:/welcome/index.do");
			} catch (final DataIntegrityViolationException oops) {
				result = this.createEditModelAndView(adminsitrator, "administrator.username.error");
			} catch (final Throwable oops) {
				System.out.println(oops);
				result = this.createEditModelAndView(adminsitrator, "administrator.commit.error");
			}
		return result;
	}
	protected ModelAndView createEditModelAndView(final Administrator administrator) {
		ModelAndView result;
		result = this.createEditModelAndView(administrator, null);
		return result;
	}

	protected ModelAndView createEditModelAndView(final Administrator administrator, final String messageCode) {
		final ModelAndView result;

		result = new ModelAndView("administrator/edit");

		result.addObject("administrator", administrator);
		result.addObject("message", messageCode);
		return result;
	}

}
