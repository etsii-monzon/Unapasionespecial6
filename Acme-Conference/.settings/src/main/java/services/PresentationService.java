
package services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.PresentationRepository;
import domain.Conference;
import domain.Presentation;

@Service
@Transactional
public class PresentationService {

	@Autowired
	private PresentationRepository	presentRepository;

	@Autowired
	private AdministratorService	adminService;

	@Autowired
	private ConferenceService		confService;


	public Presentation create(final int conferenceId) {
		Assert.isTrue(this.adminService.checkPrincipal());
		Presentation res;
		Conference conf;

		conf = this.confService.findOne(conferenceId);
		res = new Presentation();
		res.setConference(conf);

		return res;
	}
}
