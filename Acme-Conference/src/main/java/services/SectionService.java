
package services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.SectionRepository;
import domain.Section;
import domain.Tutorial;

@Service
@Transactional
public class SectionService {

	@Autowired
	private SectionRepository		sectionRepository;

	@Autowired
	private AdministratorService	adminService;


	//	@Autowired
	//	private TutorialService tutorialService;

	public Section create(final int tutorialId) {
		Assert.isTrue(this.adminService.checkPrincipal());
		Section res;
		final Tutorial tut;

		res = new Section();
		//tut = this.tutorialService.findOne(tutorialId);
		return res;
	}

	public Section save(final Section s) {
		Assert.isTrue(this.adminService.checkPrincipal());
		final Section res;

		res = this.sectionRepository.save(s);
		return res;
	}

	public Section findOne(final int sectionId) {
		Assert.isTrue(this.adminService.checkPrincipal());
		return this.sectionRepository.findOne(sectionId);
	}

}
