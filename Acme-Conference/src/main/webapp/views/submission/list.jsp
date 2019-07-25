
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

<script type="text/javascript">
	function confirmNotify() {

		return confirm("<spring:message code="submission.confirm"/>");

	}
</script>


<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="submissions" requestURI="${requestURI}" id="row">



	<!-- Action links -->
	<security:authorize access="hasRole('AUTHOR')">
		<display:column titleKey="submission.show">
			<a href="submission/author/show.do?submissionId=${row.id}"> <spring:message
					code="submission.show" />
			</a>
		</display:column>
	</security:authorize>

	<security:authorize access="hasRole('ADMIN')">
		<display:column titleKey="submission.show">
			<a href="submission/administrator/show.do?submissionId=${row.id}">
				<spring:message code="submission.show" />
			</a>
		</display:column>
	</security:authorize>
	<security:authorize access="hasRole('AUTHOR')">
		<display:column titleKey="submission.edit">

			<jstl:if test="${row.status=='ACCEPTED'}">
				<jstl:if test="${row.conference.cameraDeadline < fecha }">
					<a href="submission/author/upload.do?submissionId=${row.id}"> <spring:message
							code="submission.upload" />
					</a>
				</jstl:if>
			</jstl:if>
		</display:column>
	</security:authorize>

	<!-- Attributes -->


	<display:column property="conference.title"
		titleKey="submission.conference" sortable="false" />
	<display:column property="ticker" titleKey="submission.ticker"
		sortable="false" />
	<display:column property="moment" titleKey="submission.moment"
		sortable="false" />
	<display:column property="status" titleKey="submission.status"
		sortable="true" />
	<display:column property="cameraPaper" titleKey="submission.camera"
		sortable="false" />

	<security:authorize access="hasRole('ADMIN')">
		<display:column titleKey="submission.reports">
			<a href="report/administrator/list.do?submissionId=${row.id}"> <spring:message
					code="reports.show" />
			</a>
		</display:column>
	</security:authorize>

	<jstl:if test="${row.status != 'UNDER-REVIEW' }">
		<security:authorize access="hasRole('AUTHOR')">
			<display:column titleKey="submission.reports">
				<a href="report/author/list.do?submissionId=${row.id}"> <spring:message
						code="reports.show" />
				</a>
			</display:column>
		</security:authorize>
	</jstl:if>
	<security:authorize access="hasRole('ADMIN')">
		<display:column titleKey="submission.decission">
			<jstl:if test="${row.status == 'UNDER-REVIEW' }">

				<jstl:if test="${allowed }">
					<a onclick="return confirmNotify()"
						href="submission/administrator/decisionMaking.do?submissionId=${row.id}">
						<spring:message code="submission.decision" />
					</a>
				</jstl:if>
			</jstl:if>

		</display:column>
	</security:authorize>
	</br>

	<security:authorize access="hasRole('AUTHOR')">
		<display:column titleKey="submission.paper">
			<a href="paper/author/showp.do?submissionId=${row.id}"> <spring:message
					code="paper.show" />
			</a>
		</display:column>
	</security:authorize>

	<security:authorize access="hasRole('REVIEWER')">
		<display:column titleKey="submission.paper">
			<a href="paper/reviewer/showp.do?submissionId=${row.id}"> <spring:message
					code="paper.show" />
			</a>
		</display:column>
	</security:authorize>
	</br>

	<security:authorize access="hasRole('REVIEWER')">

		<display:column titleKey="report.create">
			<a href="report/reviewer/create.do?subId=${row.id}"> <spring:message
					code="report.create" />
			</a>
		</display:column>


	</security:authorize>

	</br>

	<security:authorize access="hasRole('ADMIN')">
		<display:column titleKey="submission.assign">
		<jstl:if test="${row.status == 'UNDER-REVIEW' }">
			<a href="submission/administrator/assign.do?submissionId=${row.id}">
				<spring:message code="submission.assign" />
			</a>
		</jstl:if>
		</display:column>
	</security:authorize>


</display:table>

<security:authorize access="hasRole('ADMIN')">
	<div>

		<button type="button"
			onclick="javascript: relativeRedir('submission/administrator/assignReviewers.do')">
			<spring:message code="submission.assignAuto" />
		</button>
	</div>
</security:authorize>

<security:authorize access="hasRole('AUTHOR')">
	<div>

		<button type="button"
			onclick="javascript: relativeRedir('submission/author/create.do')">
			<spring:message code="submission.create" />
		</button>
	</div>
</security:authorize>