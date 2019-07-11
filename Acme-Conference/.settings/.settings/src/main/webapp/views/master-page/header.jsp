<%--
 * header.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<div>
	<a href="#"><img src="${bannerURL}"
		alt="Acme Conference Co., Inc." /></a>
</div>

<div>
	<ul id="jMenu">
		<!-- Do not forget the "fNiv" class for the first level links !! -->
		<security:authorize access="hasRole('ADMIN')">
			<li><a class="fNiv"><spring:message	code="master.page.administrator" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="configuration/administrator/edit.do"><spring:message
								code="master.page.configuration.edit" /></a></li>
					<li><a href="conference/administrator/list.do"><spring:message
								code="master.page.conference.list" /></a></li>
								<li><a href="submission/administrator/list.do"><spring:message
								code="master.page.submissionad.list" /></a></li>
								<%-- 	<li><a href="conference/administrator/listst.do"><spring:message
								code="master.page.conferencest.list" /></a></li>
					<li><a href="conference/administrator/listnot.do"><spring:message
								code="master.page.conferencestnot.list" /></a></li>
					<li><a href="conference/administrator/listcam.do"><spring:message
								code="master.page.conferencestcam.list" /></a></li>
								<li><a href="conference/administrator/listsub.do"><spring:message
								code="master.page.conferencestcam.list" /></a></li> --%>
					
					
					</ul>
			</li>
		</security:authorize>
		
		<security:authorize access="hasRole('AUTHOR')">
			<li><a class="fNiv"><spring:message	code="master.page.author" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="registration/author/list.do"><spring:message
								code="master.page.registration.list" /></a></li>
			<li><a href="submission/author/list.do"><spring:message
								code="master.page.submission.list" /></a></li>
				</ul>
		</li>
			
		</security:authorize>
		
		<security:authorize access="hasRole('REVIEWER')">
			<li><a class="fNiv"><spring:message	code="master.page.reviewer" /></a>
				<ul>
					<li class="arrow"></li>
					
			<li><a href="submission/reviewer/list.do"><spring:message
								code="master.page.submissionre.list" /></a></li>
				</ul>
		</li>
			
		</security:authorize>
			<security:authorize access="isAnonymous()">
			<li><a class="fNiv" href="security/login.do"><spring:message code="master.page.login" /></a></li>
		</security:authorize>
		
		<security:authorize access="permitAll">
			<li><a class="fNiv" href="conference/listProx.do"><spring:message
						code="master.page.conference.prox" /></a></li>
		</security:authorize>
		<security:authorize access="permitAll">
			<li><a class="fNiv" href="conference/listPast.do"><spring:message
						code="master.page.conference.past" /></a></li>
		</security:authorize>
		<security:authorize access="permitAll">
			<li><a class="fNiv" href="conference/listEjec.do"><spring:message
						code="master.page.conference.ejec" /></a></li>
		</security:authorize>
		
	<security:authorize access="isAuthenticated()">

			<li><a href="message/actor/list.do"><spring:message
						code="master.page.message" /></a></li>
		</security:authorize>
		
		<security:authorize access="isAuthenticated()">
			<li>
				<a class="fNiv"> 
					<spring:message code="master.page.profile" /> 
			        (<security:authentication property="principal.username" />)
				</a>
				<ul>
					<li class="arrow"></li>
					<li><a href="profile/action-1.do"><spring:message code="master.page.profile.action.1" /></a></li>
					<li><a href="profile/action-2.do"><spring:message code="master.page.profile.action.2" /></a></li>
					<li><a href="profile/action-3.do"><spring:message code="master.page.profile.action.3" /></a></li>					
					<li><a href="j_spring_security_logout"><spring:message code="master.page.logout" /> </a></li>
				</ul>
			</li>
		</security:authorize>
	</ul>
</div>

<div>
	<a href="?language=en">en</a> | <a href="?language=es">es</a>
</div>

