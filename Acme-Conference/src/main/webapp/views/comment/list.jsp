
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
<div>
	<button type="button"
		onclick="javascript: relativeRedir('comment/create.do?commentEntityId=${commentEntityId}')">
		<spring:message code="comment.create" />
	</button>

</div>
<display:table pagesize="20" class="displaytag" name="comments"
	requestURI="${requestURI}" id="row">



	<!-- Action links -->

	<!-- Title -->
	<display:column property="title" titleKey="comment.title" />

	<!-- Moment -->
	<display:column property="moment" titleKey="comment.moment" />

	<!-- Author -->
	<display:column property="author" titleKey="comment.author" />

	<!-- Text -->
	<display:column property="text" titleKey="comment.text" />

	<!-- Attributes -->



</display:table>

<div>
	<button type="button" onclick="javascript: history.back()">
		<spring:message code="comment.return" />
	</button>
</div>
