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
	<b><spring:message code="submission.cameraPaper" />: </b>
	<jstl:out value="${submission.cameraPaper }" />
</p>

<p>
	<b><spring:message code="submission.status" />: </b>
	<jstl:out value="${submission.status }" />
</p>


<p>
	<b><spring:message code="submission.reviewers" /> :</b>
</p>
<td><jstl:out value="${submission.reviewers}" /></td>



<br />

<security:authorize access="hasRole('AUTHOR')">
	<acme:cancel url="submission/author/list.do" code="submission.cancel" />
</security:authorize>

<security:authorize access="hasRole('ADMIN')">
	<acme:cancel url="submission/administrator/list.do"
		code="submission.cancel" />
</security:authorize>

<br />