<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>


<form:form action="activity/administrator/tutorial/edit.do" modelAttribute="tutorial">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="conference" />

		<acme:textbox code="activity.title" path="title" />
		<acme:textbox code="activity.speakers" path="speakers"/>
		<acme:moment code="activity.startMoment" path="startMoment"/>
		<acme:moment code="activity.endMoment" path="endMoment"/>
		<acme:textbox code="activity.room" path="room" />
		<acme:textbox code="activity.summary" path="summary"/>
		<acme:textbox code="activity.optionalAttachments" path="optionalAttachments"/>
	<br />

	<acme:submit name="save" code="tutorial.save" />


	<acme:cancel url="activity/administrator/list.do?conferenceId=${panel.conference.id }" code="tutorial.cancel" />
	<br />



</form:form>