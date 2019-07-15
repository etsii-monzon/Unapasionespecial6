
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>


<!-- Listing grid -->




<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="registrations" requestURI="${requestURI}" id="row">



	<!-- Action links -->
	
	<security:authorize access="hasRole('AUTHOR')">
		<display:column title="Edit">
		

			<a href="registration/author/edit.do?registrationId=${row.id}">
				<spring:message code="registration.edit" />
			</a>
	
		</display:column>
	</security:authorize>
	<!-- Attributes -->


	<display:column property="conference.title" titleKey="registration.conference"
		sortable="false" />

	<security:authorize access="hasRole('AUTHOR')">
		<display:column title="Show the conference details">
			<a href="registration/author/show.do?registrationId=${row.id}">
				<spring:message code="registration.show" />
			</a>
		</display:column>
	</security:authorize>









</display:table>
<security:authorize access="hasRole('AUTHOR')">
	<div>
		
		<button type="button"
			onclick="javascript: relativeRedir('registration/author/create.do')">
			<spring:message code="registration.create" />
		</button>
	</div>
</security:authorize>