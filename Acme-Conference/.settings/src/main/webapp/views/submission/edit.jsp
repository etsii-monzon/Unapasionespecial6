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


<form:form action="submission/author/edit.do" modelAttribute="submission">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="ticker" />
	<form:hidden path="moment" />
	<form:hidden path="cameraReady"/>
	<form:hidden path="reviewers"/>
	<form:hidden path="status"/>
		
	<security:authorize access="hasRole('AUTHOR')">
	
	
	<script type="text/javascript">
	function alertName() {
		alert('<spring:message code="submission.author.alert" />');

	}
	</script>

	<%-- <p><spring:message code="submission.status" />: </p>
		<form:select path="status">
			<form:option value="-" label="-" selected="selected"/>
			<form:option value="ACCEPTED" label="ACCEPTED" />
			<form:option value="REJECTED" label="REJECTED" />
		</form:select>
		<form:errors cssClass="error" path="status" />
 --%>
	<jstl:if test="${submission.id==0 }">
		<form:label path="conference">
			<spring:message code="submission.conference" />
		</form:label>	
		<form:select id="conference" path="conference">
			<form:option value="0" label="----" />		
			<form:options items="${conferences}" itemValue="id" itemLabel="title" />
		</form:select>
		<form:errors path="conference" cssClass="error" />
	</jstl:if>	

	<form:label path="document">
		<spring:message code="submission.document" />
	</form:label>	
	<form:input path="document" readonly="false" />	
	<form:errors path="document" cssClass="error" />
	
	
	<form:label path="cameraPaper">
		<spring:message code="submission.cameraPaper" />
	</form:label>	
	<form:input path="cameraPaper" readonly="false" />	
	<form:errors path="cameraPaper" cssClass="error" />	
		<fieldset>
		<legend>
			<strong><spring:message code="author.paper" /></strong>
		</legend>

		
	<form:label path="paper.title">
		<spring:message code="paper.title" />
	</form:label>	
	<form:input path="paper.title" readonly="false" />	
	<form:errors path="paper.title" cssClass="error" />	
		
		
	<form:label path="paper.authors">
		<spring:message code="paper.authors" />
	</form:label>	
	<form:input path="paper.authors" readonly="false" />	
	<form:errors path="paper.authors" cssClass="error" />
		
	<form:label path="paper.summary">
		<spring:message code="paper.summary" />
	</form:label>	
	<form:input path="paper.summary" readonly="false" />	
	<form:errors path="paper.summary" cssClass="error" />
		
	<form:label path="paper.document">
		<spring:message code="paper.document" />
	</form:label>	
	<form:input path="paper.document" readonly="false" />	
	<form:errors path="paper.document" cssClass="error" />
		
	</fieldset>
	
	<br />

	</security:authorize>

	<%-- <acme:submit name="save" code="submission.save" /> --%>
	<button type="submit" name="save" class="btn btn-primary">
	<spring:message code="submission.save" />
</button>
	
	<%-- <jstl:if test="${submission.id != 0}">
		<acme:submit name="delete" code="submission.delete" />

	</jstl:if> --%>

	<button type="button" onclick="javascript: relativeRedir('submission/author/list.do')" >
		<spring:message code="submission.cancel" />
	</button>



</form:form>