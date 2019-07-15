
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

import services.ActorService;
import services.MessageService;
import domain.Actor;
import domain.Message;

@Controller
@RequestMapping("/message/actor")
public class MessageActorController extends AbstractController {

	@Autowired
	MessageService	messageService;

	@Autowired
	ActorService	actorService;


	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;

		final Collection<Message> messages = this.actorService.findByPrincipal().getMessages();

		result = new ModelAndView("message/list");
		result.addObject("messages", messages);
		result.addObject("requestURI", "message/actor/list.do");

		return result;
	}

	@RequestMapping(value = "/send", method = RequestMethod.GET)
	public ModelAndView send() {
		ModelAndView result;
		Message m;

		m = this.messageService.create();
		result = this.createEditModelAndView(m);
		//		result.addObject("m", m);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Message m) {
		ModelAndView result;

		result = this.createEditModelAndView(m, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Message m, final String messageCode) {
		final ModelAndView result;
		final Collection<Actor> recipients = this.actorService.findAll();
		recipients.remove(this.actorService.findByPrincipal());

		result = new ModelAndView("message/create");
		result.addObject("recipients", recipients);
		result.addObject("m", m);
		result.addObject("message", messageCode);
		result.addObject("requestURI", "message/actor/send.do");

		return result;
	}
	@RequestMapping(value = "/send", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@ModelAttribute("m") @Valid final Message m, final BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			System.out.print(binding);
			result = this.createEditModelAndView(m);

		} else
			try {
				System.out.print("Entra");

				this.messageService.save(m);
				result = new ModelAndView("redirect:list.do");

			} catch (final Throwable oops) {
				System.out.print(oops);

				result = this.createEditModelAndView(m, "message.commit.error");
			}
		return result;
	}

	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public ModelAndView show(@RequestParam final int messageId) {
		ModelAndView result;
		final Message m;

		try {
			m = this.messageService.findOne(messageId);
			Assert.isTrue(this.actorService.findByPrincipal().getMessages().contains(m));

			result = new ModelAndView("message/show");
			result.addObject("requestURI", "message/actor/show.do");
			result.addObject("m", m);
		} catch (final IllegalArgumentException e) {
			// TODO: handle exception
			result = new ModelAndView("misc/403");
		}

		return result;
	}
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam final int messageId) {
		ModelAndView result;
		try {
			final Message m = this.messageService.findOne(messageId);
			Assert.isTrue(this.actorService.findByPrincipal().getMessages().contains(m));

			this.messageService.delete(m);
			result = new ModelAndView("redirect:list.do");
			return result;
		} catch (final IllegalArgumentException e) {
			// TODO: handle exception
			result = new ModelAndView("misc/403");
		}
		return result;
	}
}
