
package services;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.ConferenceRepository;
import domain.Administrator;
import domain.Conference;
import domain.Registration;
import domain.Submission;

@Service
@Transactional
public class ConferenceService {

	//Managed repository
	@Autowired
	private ConferenceRepository	conferenceRepository;

	//Supporting services

	@Autowired
	private AdministratorService	administratorService;
	@Autowired
	private AuthorService			authorService;
	@Autowired
	private SubmissionService		submissionService;


	// SIMPLE CRUD METHODS

	public Conference create() {
		this.administratorService.checkPrincipal();

		Conference con;
		con = new Conference();

		return con;
	}

	public Collection<Conference> findAll() {

		Collection<Conference> fms;
		fms = this.conferenceRepository.findAll();

		return fms;

	}
	public Conference findOne(final int conferenceId) {

		Assert.notNull(conferenceId);
		Conference fm;
		fm = this.conferenceRepository.findOne(conferenceId);

		return fm;
	}
	public Conference save(final Conference a) {

		Assert.notNull(a);
		Conference res;
		final Administrator b = this.administratorService.findByPrincipal();
		final Collection<Conference> f = b.getConferences();
		res = this.conferenceRepository.save(a);
		if (!f.contains(res))
			f.add(res);

		return res;
	}

	public void delete(final Conference a) {
		Assert.notNull(a);
		Assert.isTrue(a.getId() != 0);

		final Administrator adm = this.administratorService.findByPrincipal();
		adm.getConferences().remove(a);
		this.conferenceRepository.delete(a);

	}
	public Date variarFecha(final Date fecha, final int campo, final int valor) {
		if (valor == 0)
			return fecha;
		final Calendar calendar = Calendar.getInstance();
		calendar.setTime(fecha);
		calendar.add(campo, valor);
		return calendar.getTime();
	}

	public Collection<Conference> conferencesToRegist() {

		final Collection<Conference> conferences = new ArrayList<>();
		final Collection<Conference> conferencesAll = this.findAll();
		final Collection<Registration> registrations = this.authorService.findByPrincipal().getRegistrations();

		for (final Conference c : conferencesAll)
			if (c.isDraftMode() == false && c.getStartDate().after(new java.util.Date()))
				conferences.add(c);
		for (final Registration r : registrations)
			if (conferences.contains(r.getConference()))
				conferences.remove(r.getConference());

		return conferences;
	}
	public Collection<Conference> conferencesToSubmission() {

		final Collection<Conference> conferences = new ArrayList<>();
		final Collection<Conference> conferencesAll = this.findAll();
		final Collection<Submission> submissions = this.authorService.findByPrincipal().getSubmissions();

		for (final Conference c : conferencesAll)
			if (c.isDraftMode() == false && c.getSubmissionDeadline().after(new java.util.Date()))
				conferences.add(c);
		for (final Submission s : submissions)
			if (conferences.contains(s.getConference()))
				conferences.remove(s.getConference());

		return conferences;
	}

	public Collection<Conference> searchConferenceByKeyword(final String keyword) {
		return this.conferenceRepository.searchConferenceByKeyword(keyword);
	}

}
