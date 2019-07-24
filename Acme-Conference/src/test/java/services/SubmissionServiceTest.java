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

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import utilities.AbstractTest;
import domain.Author;
import domain.Conference;
import domain.Paper;
import domain.Submission;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class SubmissionServiceTest extends AbstractTest {

	// System under test ------------------------------------------------------

	@Autowired
	private SubmissionService	submissionService;

	@Autowired
	private AuthorService		authorService;

	@Autowired
	private ConferenceService	conferenceService;
	@Autowired
	private PaperService		paperService;


	// Tests ------------------------------------------------------------------

	// The following are fictitious test cases that are intended to check that 
	// JUnit works well in this project.  Just righ-click this class and run 
	// it using JUnit.

	/*
	 * Test comprobación un author lista sus submissions.
	 * Req Funcional:
	 */
	@Test
	public void testListSubmissions() {
		super.authenticate("author1");

		final Collection<Submission> res = this.authorService.findByPrincipal().getSubmissions();

		Assert.notNull(res);

		super.unauthenticate();

	}
	/*
	 * Test comprobación un author crea un submission.
	 * Req Funcional:
	 */
	@Test
	public void testCreateSubmission() {
		super.authenticate("author1");

		final Submission res = this.submissionService.create();
		Assert.notNull(res);
		final Conference conference = this.conferenceService.findOne(37);
		final Paper paper = this.paperService.create();
		paper.setDocument("document");
		paper.setSummary("summary");
		paper.setTitle("title");
		final Collection<Author> authors = new ArrayList<>();
		authors.add(this.authorService.findByPrincipal());
		paper.setAuthors(authors);

		res.setConference(conference);
		res.setCameraPaper("cameraPaper");
		res.setCameraReady(false);
		res.setMoment(new Date());
		res.setPaper(paper);
		//	res.setReviewers(reviewers);
		res.setStatus("UNDER-REVIEW");
		res.setTicker("MSE-1231");

		final Submission result = this.submissionService.save(res);

		Assert.notNull(result);
		Assert.isTrue(this.submissionService.findAll().contains(result));
		Assert.isTrue(this.authorService.findByPrincipal().getSubmissions().contains(result));

		super.unauthenticate();

	}

}
