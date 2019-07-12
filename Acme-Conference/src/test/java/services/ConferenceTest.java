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

import java.util.Collection;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import utilities.AbstractTest;
import domain.Conference;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class ConferenceTest extends AbstractTest {

	// System under test ------------------------------------------------------

	@Autowired
	private ConferenceService	conferenceService;


	// Tests ------------------------------------------------------------------

	// The following are fictitious test cases that are intended to check that 
	// JUnit works well in this project.  Just righ-click this class and run 
	// it using JUnit.

	/*
	 * Test comprobación búsqueda de conferencia introduciendo una palabra clave
	 * Req Funcional: 11.4
	 */
	@Test
	public void testSearchConferenceByKeyword() {
		super.authenticate(null);

		final String keyword = "ETSII";

		final Collection<Conference> res = this.conferenceService.searchConferenceByKeyword(keyword);

		Assert.notNull(res);
		Assert.isTrue(this.conferenceService.findAll().containsAll(res));

	}
}
