
package services;

import java.util.ArrayList;
import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.TutorialRepository;
import domain.Conference;
import domain.Section;
import domain.Tutorial;

@Service
@Transactional
public class TutorialService {

	@Autowired
	private TutorialRepository		tutorialRepository;

	@Autowired
	private AdministratorService	adminService;

	@Autowired
	private ConferenceService		confService;


	public Tutorial create(final int conferenceId) {
		Assert.isTrue(this.adminService.checkPrincipal());
		Tutorial res;
		Conference conf;
		Collection<Section> sections;

		conf = this.confService.findOne(conferenceId);
		res = new Tutorial();
		sections = new ArrayList<Section>();

		res.setConference(conf);
		res.setSection(sections);

		return res;
	}

	public Tutorial save(final Tutorial s) {
		Assert.isTrue(this.adminService.checkPrincipal());
		final Tutorial res;

		res = this.tutorialRepository.save(s);
		return res;
	}

	public Tutorial findOne(final int tutorialId) {
		Assert.isTrue(this.adminService.checkPrincipal());
		return this.tutorialRepository.findOne(tutorialId);
	}

	public Collection<Tutorial> findAll() {
		Assert.isTrue(this.adminService.checkPrincipal());
		return this.tutorialRepository.findAll();
	}

	public void delete(final Tutorial t) {
		Assert.isTrue(this.adminService.checkPrincipal());
		Assert.notNull(t);
		this.tutorialRepository.delete(t);

	}

}
