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
	<b><spring:message code="message.sender" />: </b>
	<jstl:out value="${message.sender.email}" />
</p>

<p>
	<b><spring:message code="message.recipients" />: </b>
	<jstl:forEach items="${message.recipients }" var="actor">
		<jstl:out value="${actor.email},"></jstl:out>
	</jstl:forEach>
</p>
<p>
	<b><spring:message code="message.subject" />: </b>
	<jstl:out value="${message.subject }" />

</p>
<p>
	<b><spring:message code="message.body" />: </b>
	<jstl:out value="${message.body }" />
</p>
<p>
	<b><spring:message code="message.date" />: </b>
	<jstl:out value="${message.date }" />
</p>
<p>
	<b><spring:message code="message.priority" />: </b>
	<jstl:out value="${message.priority}" />
</p>





<br />


<acme:cancel url="${requestURI}" code="message.return" />
 
<br />