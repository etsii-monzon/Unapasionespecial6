
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




<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="submissions" requestURI="${requestURI}" id="row">



	<!-- Action links -->
	<security:authorize access="hasRole('AUTHOR')">
		<display:column title="Show">
			<a href="submission/author/show.do?submissionId=${row.id}">
				<spring:message code="submission.show" />
			</a>
		</display:column>
	</security:authorize>
	<security:authorize access="hasRole('AUTHOR')">
		<display:column>
		

			<a href="submission/author/edit.do?submissionId=${row.id}">
				<spring:message code="submission.edit" />
			</a>
	
		</display:column>
	</security:authorize>
	
	<!-- Attributes -->


	<display:column property="conference.title" titleKey="submission.conference"
		sortable="false" />
	<display:column property="ticker" titleKey="submission.ticker"
		sortable="false" />
	<display:column property="moment" titleKey="submission.moment"
		sortable="false" />
	<display:column property="document" titleKey="submission.document"
		sortable="false" />
	<display:column property="status" titleKey="submission.status"
		sortable="true" />
	<display:column property="cameraPaper" titleKey="submission.camera"
		sortable="false" />
				<security:authorize access="hasRole('ADMIN')">
		
		<display:column title="Reports">
			<a href="report/administrator/list.do?submissionId=${row.id}">
				<spring:message code="reports.show" />
			</a>
		</display:column>
		</security:authorize>
		
		<security:authorize access="hasRole('ADMIN')">
		
		<display:column title="Decision making">
			<jstl:if test="${allowed }">
		
			<a href="submission/administrator/decisionMaking.do?submissionId=${row.id}">
				<spring:message code="submission.decision" />
			</a>
			</jstl:if>
		</display:column>
		</security:authorize>
		
		<security:authorize access="hasRole('AUTHOR')">
		<display:column title="Paper to Review">
			<a href="paper/author/showp.do?submissionId=${row.id}">
				<spring:message code="paper.show" />
			</a>
		</display:column>
	</security:authorize>

<security:authorize access="hasRole('REVIEWER')">
		<display:column title="Paper to Review">
			<a href="paper/reviewer/showp.do?submissionId=${row.id}">
				<spring:message code="paper.show" />
			</a>
		</display:column>
	</security:authorize>
	
	<security:authorize access="hasRole('REVIEWER')">
		<display:column>
		

			<a href="report/reviewer/create.do?subId=${row.id}">
				<spring:message code="report.create" />
			</a>
		</display:column>
	</security:authorize>
	









</display:table>
<security:authorize access="hasRole('AUTHOR')">
	<div>
		
		<button type="button"
			onclick="javascript: relativeRedir('submission/author/create.do')">
			<spring:message code="submission.create" />
		</button>
	</div>
</security:authorize>