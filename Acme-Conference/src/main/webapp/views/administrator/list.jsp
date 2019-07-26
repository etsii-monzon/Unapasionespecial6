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


<h3>
	<spring:message code="administrator.submissionsPerConference" />
</h3>
<p>
	<spring:message code="administrator.avgSubs" />
	:
	<fmt:formatNumber value="${avgSubs}" />
</p>

<p>
	<spring:message code="administrator.minSubs" />
	:
	<fmt:formatNumber value="${minSubs}" />
</p>

<p>
	<spring:message code="administrator.maxSubs" />
	:
	<fmt:formatNumber value="${maxSubs}" />
</p>

<p>
	<spring:message code="administrator.stdSubs" />
	:
	<fmt:formatNumber value="${stdSubs}" />
</p>
</br>


<h3>
	<spring:message code="administrator.registrationsPerConference" />
</h3>
<p>
	<spring:message code="administrator.avgRegs" />
	:
	<fmt:formatNumber value="${avgRegs}" />
</p>

<p>
	<spring:message code="administrator.minRegs" />
	:
	<fmt:formatNumber value="${minRegs}" />
</p>

<p>
	<spring:message code="administrator.maxRegs" />
	:
	<fmt:formatNumber value="${maxRegs}" />
</p>

<p>
	<spring:message code="administrator.stdRegs" />
	:
	<fmt:formatNumber value="${stdRegs}" />
</p>

</br>


<h3>
	<spring:message code="administrator.feesConference" />
</h3>
<p>
	<spring:message code="administrator.avgFees" />
	:
	<fmt:formatNumber value="${avgFees}" />
</p>

<p>
	<spring:message code="administrator.minFees" />
	:
	<fmt:formatNumber value="${minFees}" />
</p>
<p>
	<spring:message code="administrator.maxFees" />
	:
	<fmt:formatNumber value="${maxFees}" />
</p>

<p>
	<spring:message code="administrator.stdFees" />
	:
	<fmt:formatNumber value="${stdFees}" />
</p>
</br>

<h3>
	<spring:message code="administrator.daysPerConference" />
</h3>
<p>
	<spring:message code="administrator.avgDays" />
	:
	<fmt:formatNumber value="${avgDays}" />
</p>

<p>
	<spring:message code="administrator.minDays" />
	:
	<fmt:formatNumber value="${minDays}" />
</p>

<p>
	<spring:message code="administrator.maxDays" />
	:
	<fmt:formatNumber value="${maxDays}" />
</p>

<p>
	<spring:message code="administrator.stdDevDays" />
	:
	<fmt:formatNumber value="${stdDevDays}" />
</p>
<br />
<input type="button" name="cancel"
	value="<spring:message code="submission.return" />"
	onClick="javascript: window.location.replace('welcome/index.do');" />