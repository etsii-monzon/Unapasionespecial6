
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


<display:table pagesize="5" class="displaytag" name="sections"
	requestURI="${requestURI}" id="row4">

	<!-- Action links -->


	<security:authorize access="hasRole('ADMIN')">
		<display:column titleKey="section.edit">
			<a href="section/administrator/edit.do?sectionId=${row4.id}"> <spring:message
					code="section.edit" />
			</a>
		</display:column>
	</security:authorize>

	<!-- Attributes -->


	<display:column property="title" titleKey="section.title"
		sortable="false" />
	<display:column property="summary" titleKey="section.summary"
		sortable="false" />
	<display:column property="optionalPictures"
		titleKey="section.optionalPictures" sortable="false" />

</display:table>

<!--CREAR PANEL  -->
<security:authorize access="hasRole('ADMIN')">
	<div>

		<button type="button"
			onclick="javascript: relativeRedir('activity/administrator/list.do?conferenceId=${conferenceId}')">
			<spring:message code="section.return" />
		</button>
	</div>
</security:authorize>

