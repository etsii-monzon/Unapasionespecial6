
package controllers;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.AdministratorService;
import services.ConfigurationService;
import domain.Configuration;

@Controller
@RequestMapping(value = "/configuration/administrator")
public class ConfigurationAdministratorController extends AbstractController {

	@Autowired
	private ConfigurationService	configurationService;

	@Autowired
	private AdministratorService	administratorService;


	//To open the view to edit-----------------

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit() {

		ModelAndView result;
		Configuration configuration;

		configuration = (Configuration) this.configurationService.findAll().toArray()[0];

		result = this.createEditModelAndView(configuration);

		return result;

	}

	//To save what has been edited-----------------

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Configuration configuration, final BindingResult binding) {

		ModelAndView result = new ModelAndView("configuration/edit");

		if (binding.hasErrors())
			//result = this.createEditModelAndView(configurationParameters);
			result.addObject("errors", binding.getFieldErrors());
		else
			try {
				this.configurationService.save(configuration);
				result = new ModelAndView("redirect:show.do");
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(configuration, "configuration.commit.error");
			}

		return result;

	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "notify")
	public ModelAndView reBrand(@Valid final Configuration configuration, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			//result = this.createEditModelAndView(configurationParameters);
			System.out.println(binding.getAllErrors());
			result = this.createEditModelAndView(configuration);
		} else
			try {
				this.configurationService.save(configuration);
				result = new ModelAndView("redirect:/welcome/index.do");
			} catch (final Throwable oops) {
				System.out.println(oops);
				result = this.createEditModelAndView(configuration, "configuration.commit.error");
			}

		return result;

	}

	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public ModelAndView show() {
		ModelAndView result;
		final Configuration configuration;

		try {
			configuration = this.configurationService.find();
			Assert.isTrue(this.administratorService.checkPrincipal());

			result = new ModelAndView("configuration/show");
			result.addObject("requestURI", "configuration/administrator/show.do");
			result.addObject("configuration", configuration);
		} catch (final IllegalArgumentException e) {
			// TODO: handle exception
			result = new ModelAndView("misc/403");
		}

		return result;
	}
	//Ancillary methods------------------

	protected ModelAndView createEditModelAndView(final Configuration configuration) {

		Assert.notNull(configuration);
		ModelAndView result;
		result = this.createEditModelAndView(configuration, null);
		return result;
	}

	protected ModelAndView createEditModelAndView(final Configuration configuration, final String messageCode) {
		Assert.notNull(configuration);

		ModelAndView result;

		result = new ModelAndView("configuration/edit");
		result.addObject("configuration", configuration);
		result.addObject("message", messageCode);
		result.addObject("RequestURI", "configuration/administrator/edit.do");

		return result;

	}

	//Topics

	@RequestMapping(value = "/topic/list", method = RequestMethod.GET)
	public ModelAndView listTopic() {
		ModelAndView result;

		final Collection<String> topics = this.configurationService.find().getTopics();

		result = new ModelAndView("configuration/topic/list");
		result.addObject("topics", topics);
		result.addObject("requestURI", "configuration/administrator/topic/list.do");

		return result;
	}

	@RequestMapping(value = "/topic/create", method = RequestMethod.GET)
	public ModelAndView createTopic() {
		ModelAndView result;

		result = new ModelAndView("configuration/topic/create");
		result.addObject("requestURI", "configuration/administrator/topic/create.do");

		return result;
	}
	@RequestMapping(value = "/topic/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@ModelAttribute("topic") final String topic, final BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			System.out.print(binding);
			result = this.createEditModelAndView(topic);

		} else
			try {
				System.out.print("Entra");

				this.configurationService.find().getTopics().add(topic);
				this.configurationService.save(this.configurationService.find());
				result = new ModelAndView("redirect:list.do");

			} catch (final Throwable oops) {
				System.out.print(oops);

				result = this.createEditModelAndView(topic, "message.commit.error");
			}
		return result;
	}

	@RequestMapping(value = "/topic/delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam final String topic) {
		ModelAndView result;
		try {

			this.configurationService.find().getTopics().remove(topic);
			this.configurationService.save(this.configurationService.find());
			result = new ModelAndView("redirect:list.do");
			return result;
		} catch (final IllegalArgumentException e) {
			// TODO: handle exception
			result = new ModelAndView("misc/403");
		}
		return result;
	}
	//Ancillary methods------------------

	protected ModelAndView createEditModelAndView(final String topic) {

		Assert.notNull(topic);
		ModelAndView result;
		System.out.println(topic);
		result = this.createEditModelAndView(topic, null);
		return result;
	}

	protected ModelAndView createEditModelAndView(final String topic, final String messageCode) {
		Assert.notNull(topic);

		ModelAndView result;

		result = new ModelAndView("configuration/topic/edit");
		result.addObject("topic", topic);
		result.addObject("message", messageCode);
		result.addObject("RequestURI", "configuration/administrator/edit.do");

		return result;

	}

	//Makes

	@RequestMapping(value = "/brandName/list", method = RequestMethod.GET)
	public ModelAndView listB() {
		ModelAndView result;

		final Collection<String> brandNames = this.configurationService.find().getMakes();

		result = new ModelAndView("configuration/brandName/list");
		result.addObject("brandNames", brandNames);
		result.addObject("requestURI", "configuration/administrator/brandName/list.do");

		return result;
	}

	@RequestMapping(value = "/brandName/create", method = RequestMethod.GET)
	public ModelAndView createBrandName() {
		ModelAndView result;

		result = new ModelAndView("configuration/brandName/create");
		result.addObject("requestURI", "configuration/administrator/brandName/create.do");

		return result;
	}
	@RequestMapping(value = "/brandName/create", method = RequestMethod.POST, params = "save")
	public ModelAndView saveB(@ModelAttribute("brandName") final String brandName, final BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			System.out.print(binding);
			result = this.createEditModelAndView(brandName);

		} else
			try {
				System.out.print("Entra");

				this.configurationService.find().getMakes().add(brandName);
				this.configurationService.save(this.configurationService.find());
				result = new ModelAndView("redirect:list.do");

			} catch (final Throwable oops) {
				System.out.print(oops);

				result = this.createEditModelAndView(brandName, "message.commit.error");
			}
		return result;
	}

	@RequestMapping(value = "/brandName/delete", method = RequestMethod.GET)
	public ModelAndView deleteB(@RequestParam final String brandName) {
		ModelAndView result;
		try {

			this.configurationService.find().getMakes().remove(brandName);
			this.configurationService.save(this.configurationService.find());
			result = new ModelAndView("redirect:list.do");
			return result;
		} catch (final IllegalArgumentException e) {
			// TODO: handle exception
			result = new ModelAndView("misc/403");
		}
		return result;
	}

	//Ancillary methods------------------

	protected ModelAndView createEditModelAndViewB(final String brandName) {

		Assert.notNull(brandName);
		ModelAndView result;
		System.out.println(brandName);
		result = this.createEditModelAndView(brandName, null);
		return result;
	}

	protected ModelAndView createEditModelAndViewB(final String brandName, final String messageCode) {
		Assert.notNull(brandName);

		ModelAndView result;

		result = new ModelAndView("configuration/brandName/edit");
		result.addObject("brandName", brandName);
		result.addObject("message", messageCode);
		result.addObject("RequestURI", "configuration/administrator/edit.do");

		return result;

	}
}
