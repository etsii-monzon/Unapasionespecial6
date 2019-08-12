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


<form:form action="${requestURI}" modelAttribute="comment">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<jstl:if test="${requestURI =='conference/comment/create.do' }">
	<form:hidden path="conference" />
	</jstl:if> 
	<jstl:if test="${requestURI =='activity/comment/create.do' }">
		<form:hidden path="activity"/>
	</jstl:if> 
	<form:hidden path="moment"/>
	
	<security:authorize access="!hasRole('NONE')">
		<form:hidden path="author"/>
	</security:authorize>

	
		<acme:textbox code="comment.title" path="title" />
		<acme:textbox code="comment.text" path="text"/>
		<security:authorize access="hasRole('NONE')">
			<acme:textbox code="comment.author" path="author" />
		</security:authorize>

	<br />



	<jstl:if test="${requestURI == 'activity/comment/create.do' }">
		<acme:submit name="save" code="comment.save" />
		<acme:cancel url="comment/activity/list.do?activityId=${comment.activity.id }" code="comment.cancel" />
	</jstl:if> 
	<jstl:if test="${requestURI == 'conference/comment/create.do' }">
		<acme:submit name="save" code="comment.save" />
		<acme:cancel url="conference/comment/list.do?conferenceId=${comment.conference.id }" code="comment.cancel" />
	</jstl:if>
	
	<br />



</form:form>