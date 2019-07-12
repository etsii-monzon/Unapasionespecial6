/*
 * SampleTest.java
 * 
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the
 * TDG Licence, a copy of which you may download from
 * http://www.tdg-seville.info/License.html
 */

package services;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import utilities.AbstractTest;
import domain.Administrator;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class AdministratorTest extends AbstractTest {

	// System under test ------------------------------------------------------

	@Autowired
	private AdministratorService	administratorService;


	// Tests ------------------------------------------------------------------

	// The following are fictitious test cases that are intended to check that 
	// JUnit works well in this project.  Just righ-click this class and run 
	// it using JUnit.

	/*
	 * Test comprobación edición datos personales usuario autenticado como Admin
	 * Req Funcional: 12.2
	 */
	@Test
	public void testEditAndSaveAdministrator() {
		super.authenticate("admin");
		final Administrator res = this.administratorService.findByPrincipal();

		res.setName("Rodrigo");

		final Administrator result = this.administratorService.save(res);
		Assert.isTrue(this.administratorService.findAll().contains(result));
		Assert.isTrue(result.equals(res));

	}
}
