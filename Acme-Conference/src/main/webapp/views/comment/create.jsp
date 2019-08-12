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
	<jstl:if test="${requestURI =='panel/comment/create.do' }">
		<form:hidden path="panel"/>
	</jstl:if>
	<jstl:if test="${requestURI =='tutorial/comment/create.do' }">
		<form:hidden path="tutorial"/>
	</jstl:if>
	<jstl:if test="${requestURI =='presentation/comment/create.do' }">
		<form:hidden path="presentation"/>
	</jstl:if>
	<form:hidden path="moment"/>


		<acme:textbox code="comment.author" path="author" />	
		<acme:textbox code="comment.title" path="title" />
		<acme:textbox code="comment.text" path="text"/>



	<br />



	<jstl:if test="${requestURI == 'presentation/comment/create.do' }">
		<acme:submit name="save" code="comment.save" />
		<acme:cancel url="presentation/comment/list.do?activityId=${comment.presentation.id }" code="comment.cancel" />
	</jstl:if> 
	<jstl:if test="${requestURI == 'panel/comment/create.do' }">
		<acme:submit name="save" code="comment.save" />
		<acme:cancel url="panel/comment/panel/list.do?activityId=${comment.panel.id }" code="comment.cancel" />
	</jstl:if> 
	<jstl:if test="${requestURI == 'tutorial/comment/create.do' }">
		<acme:submit name="save" code="comment.save" />
		<acme:cancel url="tutorial/comment/list.do?activityId=${comment.tutorial.id }" code="comment.cancel" />
	</jstl:if> 
	<jstl:if test="${requestURI == 'conference/comment/create.do' }">
		<acme:submit name="save" code="comment.save" />
		<acme:cancel url="conference/comment/list.do?conferenceId=${comment.conference.id }" code="comment.cancel" />
	</jstl:if>
	
	<br />



</form:form>