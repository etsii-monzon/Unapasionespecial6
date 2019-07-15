<%@page language="java" contentType="text/html; charset=ISO-8859-1"
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


<form:form action="message/administrator/broadcast.do"
	modelAttribute="message2">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<%-- 	<form:hidden path="sender" />
	<form:hidden path="date" /> --%>






	<acme:textbox code="message.subject" path="subject" />
	<acme:textarea code="message.body" path="body" />
	<acme:textbox code="message.optionalTags" path="optionalTags" />


	<spring:message code="message.priority" />
	<form:select path="priority">
		<form:option value="-" label="-" selected="selected" />
		<form:option value="LOW" label="LOW" />
		<form:option value="NEUTRAL" label="NEUTRAL" />
		<form:option value="HIGH" label="HIGH" />

	</form:select>
	<form:errors cssClass="error" path="priority" />

	<br />




	<acme:submit name="save" code="message.save" />
	<acme:cancel url="messageBox/actor/list.do" code="message.cancel" />
	<br />



</form:form>