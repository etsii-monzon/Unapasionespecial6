
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


<!-- Search -->
<form:form action="conference/searchList.do" method="GET">

	<label for="keyword"> <spring:message code="conference.keyword" />
	</label>
	<input type="text" name="keyword" id="keyword"
		placeholder="Search by TITLE, VENUE OR DESCRIPTION" />
	<acme:submit name="search" code="conference.search" />
	<br />


</form:form>

<input type="button" name="cancel"
	value="<spring:message code="conference.return" />"
	onClick="javascript: window.location.replace('welcome/index.do');" />