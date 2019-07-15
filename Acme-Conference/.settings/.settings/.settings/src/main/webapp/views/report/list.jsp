
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



<!-- Hay que a�adir el Search -->



<display:table pagesize="5" class="displaytag" keepStatus="true"
	name="reports" requestURI="${requestURI}" id="row">



	<!-- Action links -->
	
	<!-- Attributes -->


	<display:column property="originality" titleKey="report.originality"
		sortable="true" />



	<display:column property="quality" titleKey="report.quality"
		sortable="false" />


	<display:column property="readability" titleKey="report.readability" sortable="false" />

	<display:column property="decision" titleKey="report.decision" sortable="false" />

	<display:column property="comment" titleKey="report.comment" sortable="false" />



	




</display:table>
