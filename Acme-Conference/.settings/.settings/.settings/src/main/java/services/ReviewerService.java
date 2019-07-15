
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.ReviewerRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import domain.Reviewer;

;

@Service
@Transactional
public class ReviewerService {

	//Managed repository
	@Autowired
	private ReviewerRepository	reviewerRepository;


	//	//Supporting services

	//	// SIMPLE CRUD METHODS

	//	public Employee create() {
	//
	//		Employee e;
	//		UserAccount userAccount;
	//		Authority auth;
	//		CreditCard cCard;
	//
	//		//Authority
	//		e = new Employee();
	//		userAccount = new UserAccount();
	//		auth = new Authority();
	//		cCard = new CreditCard();
	//
	//		auth.setAuthority("EMPLOYEE");
	//		userAccount.addAuthority(auth);
	//		e.setUserAccount(userAccount);
	//		e.setCreditCard(cCard);
	//
	//		//Relationships
	//		final Collection<Incidence> incidences = new ArrayList<Incidence>();
	//		final Collection<Enrolment> enrolments = new ArrayList<Enrolment>();
	//		final Collection<MessageBox> messageBoxes = this.messageBoxService.defaultMessageBoxes();
	//
	//		e.setIncidences(incidences);
	//		e.setEnrolments(enrolments);
	//		e.setMessageBoxes(messageBoxes);
	//
	//		return e;
	//	}
	//
	public Collection<Reviewer> findAll() {
		Collection<Reviewer> revs;
		revs = this.reviewerRepository.findAll();
		Assert.notNull(revs);
		return revs;

	}
	//	public Employee findOne(final int employeeId) {
	//		Assert.notNull(employeeId);
	//		Employee d;
	//		d = this.reviewerRepository.findOne(employeeId);
	//		return d;
	//	}
	//	public Employee save(final Employee e) {
	//		Assert.notNull(e);
	//		Assert.isTrue(this.actorService.checkUserEmail(e.getEmail()));
	//
	//		Assert.isTrue(!e.getUserAccount().getUsername().isEmpty());
	//		Assert.isTrue(!e.getUserAccount().getPassword().isEmpty());
	//
	//		if (e.getId() == 0) {
	//			final Md5PasswordEncoder encoder = new Md5PasswordEncoder();
	//			final String hash = encoder.encodePassword(e.getUserAccount().getPassword(), null);
	//			e.getUserAccount().setPassword(hash);
	//		}
	//		if (e.getPhoneNumber() != null)
	//			if (!(e.getPhoneNumber().startsWith("+")))
	//				e.setPhoneNumber("+" + this.configurationService.find().getCountryCode() + " " + e.getPhoneNumber());
	//		Employee res;
	//		res = this.reviewerRepository.save(e);
	//		return res;
	//	}
	//	public void delete(final Employee e) {
	//		Assert.notNull(e);
	//		Assert.isTrue(e.getId() != 0);
	//		Assert.notNull(this.reviewerRepository.findOne(e.getId()));
	//
	//		//Eliminamos la creditCard asociada
	//		this.creditCardService.delete(e.getCreditCard());
	//
	//		//Eliminamos MessageBoxes
	//		for (final MessageBox mB : e.getMessageBoxes())
	//			this.messageBoxService.deleteGDPR(mB);
	//
	//		//Eliminamos Incidences
	//		final Collection<Incidence> toDelete = new ArrayList<>();
	//		for (final Incidence i : e.getIncidences())
	//			toDelete.add(i);
	//		for (final Incidence d : toDelete)
	//			this.incidenceService.delete(d);
	//
	//		//Eliminamos Enrolments
	//		final Collection<Enrolment> toDeleteEnrol = new ArrayList<>();
	//
	//		for (final Enrolment en : e.getEnrolments())
	//			toDeleteEnrol.add(en);
	//		for (final Enrolment en2 : toDeleteEnrol)
	//			this.enrolmentService.delete(en2);
	//
	//		this.reviewerRepository.delete(e);
	//	}
	public Reviewer findByUserAccountId(final int userAccountId) {
		Assert.isTrue(userAccountId != 0);
		final Reviewer res = this.reviewerRepository.findByUserAccountId(userAccountId);
		return res;
	}

	public Reviewer findByPrincipal() {
		final UserAccount u = LoginService.getPrincipal();
		final Reviewer res = this.reviewerRepository.findByUserAccountId(u.getId());
		return res;
	}

	public void checkPrincipal() {

		final UserAccount userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		final Collection<Authority> authorities = userAccount.getAuthorities();
		Assert.notNull(authorities);

		final Authority auth = new Authority();
		auth.setAuthority(Authority.REVIEWER);

		Assert.isTrue(authorities.contains(auth));
	}
}
//
//	//	public void flush() {
//	//		this.employeeRepository.flush();
//	//	}
//	//
//	//
//	@Autowired
//	private Validator	validator;
//
//
//	public Employee reconstruct(final EmployeeForm employeeForm, final BindingResult binding) {
//		Employee res;
//		if (employeeForm.getId() == 0) {
//			res = this.create();
//			res.setName(employeeForm.getName());
//			res.setSurname(employeeForm.getSurname());
//			res.setBirthDate(employeeForm.getBirthDate());
//			res.setOptionalPhoto(employeeForm.getOptionalPhoto());
//			res.setPhoneNumber(employeeForm.getPhoneNumber());
//			res.setEmail(employeeForm.getEmail());
//			res.setNif(employeeForm.getNif());
//			res.setAddress(employeeForm.getAddress());
//			res.getCreditCard().setHolderName(employeeForm.getCreditCard().getHolderName());
//			res.getCreditCard().setBrandName(employeeForm.getCreditCard().getBrandName());
//			res.getCreditCard().setNumber(employeeForm.getCreditCard().getNumber());
//			res.getCreditCard().setExpMonth(employeeForm.getCreditCard().getExpMonth());
//			res.getCreditCard().setExpYear(employeeForm.getCreditCard().getExpYear());
//			res.getCreditCard().setCvv(employeeForm.getCreditCard().getCvv());
//			res.getUserAccount().setUsername(employeeForm.getUserAccount().getUsername());
//			res.getUserAccount().setPassword(employeeForm.getUserAccount().getPassword());
//
//		} else {
//			System.out.println("LLega");
//
//			res = this.reviewerRepository.findOne(employeeForm.getId());
//			res.setName(employeeForm.getName());
//			res.setSurname(employeeForm.getSurname());
//			res.setOptionalPhoto(employeeForm.getOptionalPhoto());
//			res.setPhoneNumber(employeeForm.getPhoneNumber());
//			res.setEmail(employeeForm.getEmail());
//			res.setNif(employeeForm.getNif());
//			res.setAddress(employeeForm.getAddress());
//			res.setBirthDate(employeeForm.getBirthDate());
//
//			res.getCreditCard().setHolderName(employeeForm.getCreditCard().getHolderName());
//			res.getCreditCard().setBrandName(employeeForm.getCreditCard().getBrandName());
//			res.getCreditCard().setNumber(employeeForm.getCreditCard().getNumber());
//			res.getCreditCard().setExpMonth(employeeForm.getCreditCard().getExpMonth());
//			res.getCreditCard().setExpYear(employeeForm.getCreditCard().getExpYear());
//			res.getCreditCard().setCvv(employeeForm.getCreditCard().getCvv());
//
//		}
//
//		this.validator.validate(res, binding);
//		return res;
//	}
//	public EmployeeForm deconstruct(final Employee employee) {
//
//		final EmployeeForm res = new EmployeeForm();
//
//		res.setId(employee.getId());
//		res.setName(employee.getName());
//		res.setSurname(employee.getSurname());
//		res.setBirthDate(employee.getBirthDate());
//		res.setOptionalPhoto(employee.getOptionalPhoto());
//		res.setPhoneNumber(employee.getPhoneNumber());
//		res.setEmail(employee.getEmail());
//		res.setAddress(employee.getAddress());
//		res.setNif(employee.getNif());
//
//		res.setCreditCard(employee.getCreditCard());
//
//		return res;
//	}
//
//	public Integer maxIncidencesByEmployee() {
//		this.administratorService.checkPrincipal();
//		return this.reviewerRepository.maxIncidencesByEmployee();
//	}
//
//	public Integer minIncidencesByEmployee() {
//		this.administratorService.checkPrincipal();
//
//		return this.reviewerRepository.minIncidencesByEmployee();
//	}
//
//	public Double avgIncidencesByEmployee() {
//		this.administratorService.checkPrincipal();
//
//		return this.reviewerRepository.avgIncidencesByEmployee();
//	}
//
//	public Double stdDevIncidencesByEmployee() {
//		this.administratorService.checkPrincipal();
//
//		return this.reviewerRepository.stdDevIncidencesByEmployee();
//	}
//
//	public void flush() {
//		this.reviewerRepository.flush();
//	}
//}
