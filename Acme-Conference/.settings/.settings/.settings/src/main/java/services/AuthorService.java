
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.AuthorRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import domain.Author;

@Service
@Transactional
public class AuthorService {

	//Managed repository
	@Autowired
	private AuthorRepository	authorRepository;


	//Supporting services
	//
	//	@Autowired
	//	private ActorService		actorService;

	// SIMPLE CRUD METHODS

	//	public Director create() {
	//		this.administratorService.checkPrincipal();
	//		Assert.notNull(this.administratorService.findByPrincipal());
	//		Director d;
	//		UserAccount userAccount;
	//		Authority auth;
	//		CreditCard cCard;
	//
	//		//Authority
	//		d = new Director();
	//		userAccount = new UserAccount();
	//		auth = new Authority();
	//		cCard = new CreditCard();
	//
	//		auth.setAuthority("DIRECTOR");
	//		userAccount.addAuthority(auth);
	//		d.setUserAccount(userAccount);
	//		d.setCreditCard(cCard);
	//
	//		//Relationships
	//		final Collection<Position> positions = new ArrayList<Position>();
	//		final Collection<AdditionalService> adServices = new ArrayList<AdditionalService>();
	//		final Collection<Room> rooms = new ArrayList<Room>();
	//		final Collection<MessageBox> messageBoxes = this.messageBoxService.defaultMessageBoxes();
	//
	//		d.setPositions(positions);
	//		d.setRooms(rooms);
	//		d.setAdditionalServices(adServices);
	//		d.setMessageBoxes(messageBoxes);
	//
	//		return d;
	//	}
	//
	//	public Collection<Director> findAll() {
	//		Collection<Director> directors;
	//		directors = this.authorRepository.findAll();
	//		Assert.notNull(directors);
	//		return directors;
	//
	//	}
	//	public Director findOne(final int directorId) {
	//		Assert.notNull(directorId);
	//		Director d;
	//		d = this.authorRepository.findOne(directorId);
	//		return d;
	//	}
	//	public Director save(final Director d) {
	//		Assert.notNull(d);
	//		Assert.isTrue(this.actorService.checkUserEmail(d.getEmail()));
	//
	//		Assert.isTrue(!d.getUserAccount().getUsername().isEmpty());
	//		Assert.isTrue(!d.getUserAccount().getPassword().isEmpty());
	//
	//		if (d.getId() == 0) {
	//			final Md5PasswordEncoder encoder = new Md5PasswordEncoder();
	//			final String hash = encoder.encodePassword(d.getUserAccount().getPassword(), null);
	//			d.getUserAccount().setPassword(hash);
	//		}
	//		if (d.getPhoneNumber() != null)
	//			if (!(d.getPhoneNumber().startsWith("+")))
	//				d.setPhoneNumber("+" + this.configurationService.find().getCountryCode() + " " + d.getPhoneNumber());
	//		Director res;
	//		res = this.authorRepository.save(d);
	//		return res;
	//	}
	//	public void delete(final Director d) {
	//		Assert.notNull(d);
	//		Assert.isTrue(d.getId() != 0);
	//		Assert.notNull(this.authorRepository.findOne(d.getId()));
	//
	//		//Eliminamos la creditCard asociada
	//		this.creditCardService.delete(d.getCreditCard());
	//
	//		//Eliminamos MessageBoxes
	//		for (final MessageBox mB : d.getMessageBoxes())
	//			this.messageBoxService.deleteGDPR(mB);
	//
	//		this.authorRepository.delete(d);
	//	}
	public Author findByUserAccountId(final int userAccountId) {
		Assert.isTrue(userAccountId != 0);
		final Author res = this.authorRepository.findByUserAccountId(userAccountId);
		return res;
	}

	public Author findByPrincipal() {
		final UserAccount u = LoginService.getPrincipal();
		final Author res = this.authorRepository.findByUserAccountId(u.getId());
		return res;
	}

	public Boolean checkPrincipal() {

		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		final Collection<Authority> authorities = userAccount.getAuthorities();
		Assert.notNull(authorities);

		final Authority auth = new Authority();
		auth.setAuthority(Authority.AUTHOR);

		return authorities.contains(auth);
	}
}
//	public void flush() {
//		this.authorRepository.flush();
//	}
//
//
//	@Autowired
//	private Validator	validator;
//
//
//	public Director reconstruct(final DirectorForm directorForm, final BindingResult binding) {
//		Director res;
//		if (directorForm.getId() == 0) {
//			res = this.create();
//			res.setName(directorForm.getName());
//			res.setSurname(directorForm.getSurname());
//			res.setBirthDate(directorForm.getBirthDate());
//			res.setOptionalPhoto(directorForm.getOptionalPhoto());
//			res.setPhoneNumber(directorForm.getPhoneNumber());
//			res.setEmail(directorForm.getEmail());
//			res.setNif(directorForm.getNif());
//			res.setAddress(directorForm.getAddress());
//			res.getCreditCard().setHolderName(directorForm.getCreditCard().getHolderName());
//			res.getCreditCard().setBrandName(directorForm.getCreditCard().getBrandName());
//			res.getCreditCard().setNumber(directorForm.getCreditCard().getNumber());
//			res.getCreditCard().setExpMonth(directorForm.getCreditCard().getExpMonth());
//			res.getCreditCard().setExpYear(directorForm.getCreditCard().getExpYear());
//			res.getCreditCard().setCvv(directorForm.getCreditCard().getCvv());
//			res.getUserAccount().setUsername(directorForm.getUserAccount().getUsername());
//			res.getUserAccount().setPassword(directorForm.getUserAccount().getPassword());
//
//		} else {
//			System.out.println("LLega");
//
//			res = this.authorRepository.findOne(directorForm.getId());
//			res.setName(directorForm.getName());
//			res.setSurname(directorForm.getSurname());
//			res.setOptionalPhoto(directorForm.getOptionalPhoto());
//			res.setPhoneNumber(directorForm.getPhoneNumber());
//			res.setEmail(directorForm.getEmail());
//			res.setNif(directorForm.getNif());
//			res.setAddress(directorForm.getAddress());
//			res.setBirthDate(directorForm.getBirthDate());
//
//			res.getCreditCard().setHolderName(directorForm.getCreditCard().getHolderName());
//			res.getCreditCard().setBrandName(directorForm.getCreditCard().getBrandName());
//			res.getCreditCard().setNumber(directorForm.getCreditCard().getNumber());
//			res.getCreditCard().setExpMonth(directorForm.getCreditCard().getExpMonth());
//			res.getCreditCard().setExpYear(directorForm.getCreditCard().getExpYear());
//			res.getCreditCard().setCvv(directorForm.getCreditCard().getCvv());
//			//			res.getUserAccount().setUsername(memberForm.getUserAccount().getUsername());
//			//			res.getUserAccount().setPassword(memberForm.getUserAccount().getPassword());
//		}
//
//		this.validator.validate(res, binding);
//		return res;
//	}
//	public DirectorForm deconstruct(final Director director) {
//		System.out.println("LLega");
//		final DirectorForm res = new DirectorForm();
//
//		res.setId(director.getId());
//		res.setName(director.getName());
//		res.setSurname(director.getSurname());
//		res.setBirthDate(director.getBirthDate());
//		res.setOptionalPhoto(director.getOptionalPhoto());
//		res.setPhoneNumber(director.getPhoneNumber());
//		res.setEmail(director.getEmail());
//		res.setAddress(director.getAddress());
//		res.setNif(director.getNif());
//
//		res.setCreditCard(director.getCreditCard());
//
//		//		res.getUserAccount().setUsername(member.getUserAccount().getUsername());
//		//		System.out.println("Pasa8");
//		//
//		//		res.getUserAccount().setPassword(member.getUserAccount().getPassword());
//		//		System.out.println("Pasa9");
//
//		//		this.validator.validate(res, binding);
//		return res;
//	}
//
//}
