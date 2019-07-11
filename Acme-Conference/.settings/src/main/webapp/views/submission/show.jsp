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

	<p>
		<b><spring:message code="submission.ticker" />: </b>
		<jstl:out value="${submission.ticker }" />
	</p>
	
	<p>
		<b><spring:message code="submission.moment" />: </b>
		<jstl:out value="${submission.moment }" />
	</p>
	
	<p>
		<b><spring:message code="submission.document" />: </b>
		<jstl:out value="${submission.document }" />
	</p>
	
	<p>
		<b><spring:message code="submission.cameraPaper" />: </b>
		<jstl:out value="${submission.cameraPaper }" />
	</p>
	
	<p>
		<b><spring:message code="submission.status" />: </b>
		<jstl:out value="${submission.status }" />
	</p>
	


	

<br />


<acme:cancel url="submission/author/list.do"
	code="submission.cancel" /> 

<br />