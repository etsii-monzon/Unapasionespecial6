
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.MessageRepository;
import domain.Actor;
import domain.Message;

@Service
@Transactional
public class MessageService {

	//Managed repository
	@Autowired
	private MessageRepository		messageRepository;

	@Autowired
	private ActorService			actorService;

	@Autowired
	private AdministratorService	administratorService;


	//Supporting services

	// SIMPLE CRUD METHODS

	public Message create() {
		Message m;

		m = new Message();

		final java.util.Date fechaActual = new java.util.Date();

		m.setDate(fechaActual);
		m.setSender(this.actorService.findByPrincipal());

		return m;
	}
	public Collection<Message> findAll() {
		Collection<Message> messages;
		messages = this.messageRepository.findAll();
		Assert.notNull(messages);
		return messages;

	}
	public Message findOne(final int messageId) {
		Assert.notNull(messageId);
		Message c;
		c = this.messageRepository.findOne(messageId);
		return c;
	}
	public Message save(final Message a) {

		Assert.notNull(a);
		final Message res;

		final Actor b = this.actorService.findByPrincipal();
		final Collection<Message> f = b.getMessages();
		res = this.messageRepository.save(a);
		if (!f.contains(res))
			f.add(res);

		return res;
	}
	public void delete(final Message p) {

		Assert.notNull(p);
		Assert.isTrue(p.getId() != 0);

		final Actor dir = this.actorService.findByPrincipal();

		dir.getMessages().remove(p);

		this.messageRepository.delete(p);
	}

	public Message broadcast() {
		this.administratorService.checkPrincipal();
		Message m;

		m = new Message();

		final java.util.Date fechaActual = new java.util.Date();

		m.setDate(fechaActual);
		m.setSender(this.actorService.findByPrincipal());
		final Collection<Actor> recipients = this.actorService.findAll();
		recipients.remove(this.actorService.findByPrincipal());
		m.setRecipients(recipients);

		return m;
	}

}
