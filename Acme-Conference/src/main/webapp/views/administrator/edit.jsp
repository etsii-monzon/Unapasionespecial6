<%--
 * action-1.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>




<form:form action="administrator/administrator/edit.do"
	modelAttribute="administrator">

	<form:hidden path="id" />
	<form:hidden path="version" />

	<form:hidden path="userAccount.id" />
	<form:hidden path="userAccount.version" />
	<form:hidden path="userAccount.Authorities" />
	<form:hidden path="messages" />
	<form:hidden path="conferences" />

	<jstl:if test="${author.id != 0}">
		<form:hidden path="userAccount.username" />
		<form:hidden path="userAccount.password" />
	</jstl:if>



	<%-- Name --%>
	<form:label path="name">
		<spring:message code="administrator.name" />
	</form:label>
	<form:input path="name" />
	<form:errors class="error" path="name" />
	<br>
	<br>

	<%-- Middlename --%>
	<form:label path="middleName">
		<spring:message code="administrator.middleName" />
	</form:label>
	<form:input path="middleName" />
	<form:errors class="error" path="middleName" />
	<br>
	<br>

	<%-- Surname --%>
	<form:label path="surname">
		<spring:message code="administrator.surname" />
	</form:label>
	<form:input path="surname" />
	<form:errors class="error" path="surname" />
	<br>
	<br>

	<%-- optionalPhoto --%>
	<form:label path="optionalPhoto">
		<spring:message code="administrator.optionalPhoto" />
	</form:label>
	<form:input path="optionalPhoto" />
	<form:errors class="error" path="optionalPhoto" />
	<br>
	<br>

	<%-- Phone --%>
	<form:label path="phoneNumber">
		<spring:message code="administrator.phoneNumber" />
	</form:label>
	<form:input path="phoneNumber" />
	<form:errors class="error" path="phoneNumber" />
	<br>
	<br>

	<%-- Email --%>
	<form:label path="email">
		<spring:message code="administrator.email" />
	</form:label>
	<form:input path="email" />
	<form:errors class="error" path="email" />
	<br>
	<br>

	<%-- Address --%>
	<form:label path="address">
		<spring:message code="administrator.address" />
	</form:label>
	<form:input path="address" />
	<form:errors class="error" path="address" />
	<br>
	<br>


	<%-- Buttons --%>
	<input type="submit" name="save"
		value="<spring:message code="administrator.save"/>" />

	<input type="button" name="cancel"
		value="<spring:message code="administrator.cancel" />"
		onClick="javascript: window.location.replace('welcome/index.do');" />
</form:form>
