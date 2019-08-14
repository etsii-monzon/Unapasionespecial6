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




<form:form action="${requestURI}" modelAttribute="comment">
	<%-- Hidden properties from category--%>
	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="moment" />

	<td><input type="hidden" name="commentEntityId"
		value="${commentEntityId}"></td>







	<%-- Title --%>
	<form:label path="title">
		<spring:message code="comment.title" />
	</form:label>
	<form:input path="title" />
	<form:errors class="error" path="title" />
	<br>
	<br>

	<%-- Author --%>
	<form:label path="author">
		<spring:message code="comment.author" />
	</form:label>
	<form:input path="author" />
	<form:errors class="error" path="author" />
	<br>
	<br>

	<%-- Text --%>
	<form:label path="text">
		<spring:message code="comment.text" />
	</form:label>
	<form:input path="text" />
	<form:errors class="error" path="text" />
	<br>
	<br>



	<%-- Buttons --%>

	<input type="submit" name="save"
		value="<spring:message code="comment.save"/>" />

	<input type="button" name="cancel"
		value="<spring:message code="comment.cancel" />"
		onClick="javascript: window.location.replace('conference/comment/list.do?conferenceId=${conferenceId}')" />


	<br>
	<br>


</form:form>