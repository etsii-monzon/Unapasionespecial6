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




<display:table pagesize="5" class="displaytag" name="comments"
	requestURI="${requestURI}" id="row">

	<!-- Action links -->

	<!-- Attributes -->


	<display:column property="title"
		titleKey="comment.title" sortable="false" />
	<display:column property="moment"
		titleKey="comment.moment" sortable="false" />
	<display:column property="author"
		titleKey="comment.author" sortable="false" />
	<display:column property="text"
		titleKey="comment.text" sortable="false" />
	<jstl:if test="${creat=='conf' }">
	<display:column property="conference.title"
		titleKey="comment.conference" sortable="false" />
	</jstl:if>
	<jstl:if test="${creat=='act' }">
	<display:column property="activity.title"
		titleKey="comment.activity" sortable="false" />
	</jstl:if>


</display:table>

	<div>
		<jstl:if test="${creat == 'conf' }">
			<button type="button"
				onclick="javascript: relativeRedir('conference/comment/create.do?conferenceId='+${id})">
				<spring:message code="comment.create" />
			</button>
			<security:authorize access="hasRole('ADMIN') ">
				<button type="button"
					onclick="javascript: relativeRedir('conference/administrator/list.do')">
					<spring:message code="comment.return" />
				</button>
			</security:authorize>
			<security:authorize access="!hasRole('ADMIN')">
				<button type="button"
					onclick="javascript: relativeRedir('conference/list.do')">
					<spring:message code="comment.return" />
				</button>
			</security:authorize>
		</jstl:if>


			<jstl:if test="${creat == 'pan' }">
				<button type="button"
					onclick="javascript: relativeRedir('panel/comment/create.do?activityId='+${id})">
					<spring:message code="comment.create" />
				</button>
				<security:authorize access="!hasRole('ADMIN')">
					<button type="button"
						onclick="javascript: relativeRedir('activity/list.do?conferenceId='+${conferenceId})">
						<spring:message code="comment.return" />
					</button>
				</security:authorize>
				<security:authorize access="hasRole('ADMIN')">
					<button type="button"
						onclick="javascript: relativeRedir('activity/administrator/list.do?conferenceId='+${conferenceId})">
						<spring:message code="comment.return" />
					</button>
				</security:authorize>
		</jstl:if>

	<jstl:if test="${creat == 'tut' }">
				<button type="button"
					onclick="javascript: relativeRedir('tutorial/comment/create.do?activityId='+${id})">
					<spring:message code="comment.create" />
				</button>
				<security:authorize access="!hasRole('ADMIN')">
					<button type="button"
						onclick="javascript: relativeRedir('activity/list.do?conferenceId='+${conferenceId})">
						<spring:message code="comment.return" />
					</button>
				</security:authorize>
				<security:authorize access="hasRole('ADMIN')">
					<button type="button"
						onclick="javascript: relativeRedir('activity/administrator/list.do?conferenceId='+${conferenceId})">
						<spring:message code="comment.return" />
					</button>
				</security:authorize>
		</jstl:if>
	<jstl:if test="${creat == 'pres' }">
				<button type="button"
					onclick="javascript: relativeRedir('presentation/comment/create.do?activityId='+${id})">
					<spring:message code="comment.create" />
				</button>
				<security:authorize access="!hasRole('ADMIN')">
					<button type="button"
						onclick="javascript: relativeRedir('activity/list.do?conferenceId='+${conferenceId})">
						<spring:message code="comment.return" />
					</button>
				</security:authorize>
				<security:authorize access="hasRole('ADMIN')">
					<button type="button"
						onclick="javascript: relativeRedir('activity/administrator/list.do?conferenceId='+${conferenceId})">
						<spring:message code="comment.return" />
					</button>
				</security:authorize>
		</jstl:if>
	
	</div>